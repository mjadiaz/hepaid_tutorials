Module EffectivePotential_BLSSM 
 
Use Control 
Use Settings 
Use Couplings_BLSSM 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_BLSSM 
Use StandardModel 
Use TreeLevelMasses_BLSSM 
Use EffPotFunctions
Use DerivativesEffPotFunctions
 
Contains 
 
Subroutine CalculateCorrectionsEffPot(ti_ep2L,pi_ep2L,vd,vu,x1,x2,g1,g2,              & 
& g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,             & 
& mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Integer , Intent(inout):: kont 
Integer :: iout 
Real(dp) :: err,h_start,vevs(4) 
Real(dp), Intent(out) :: ti_ep2L(4)  
Real(dp), Intent(out) :: pi_ep2L(4,4)


err2L = 0._dp 
If (.not.PurelyNumericalEffPot) Then 
epsM = 1.0E-8_dp 
epsD = 1.0E-8_dp 
! 2nd deriv. also calculates the 1st deriv. of V
Call SecondDerivativeEffPot2Loop(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,              & 
& Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,             & 
& mC12,mC22,MBBp,M1,M2,M3,MBp,kont,pi_ep2L,ti_ep2L)

Else 
epsM = 1.0E-6_dp 
epsD = 1.0E-6_dp 
vevs = (/vd,vu,x1,x2/) 
! Calculate 1st (ti_ep) and 2nd derivatives (pi_ep)
ti_ep2L(1) = partialDiff_Ridders(EffPotFunction2Loop,vevs,1,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(2) = partialDiff_Ridders(EffPotFunction2Loop,vevs,2,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(3) = partialDiff_Ridders(EffPotFunction2Loop,vevs,3,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(4) = partialDiff_Ridders(EffPotFunction2Loop,vevs,4,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,1,1,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,1,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,2,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,1,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,2,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,3,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,1,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,2,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,3,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,4) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,4,4,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,2)=pi_ep2L(2,1)
pi_ep2L(1,3)=pi_ep2L(3,1)
pi_ep2L(2,3)=pi_ep2L(3,2)
pi_ep2L(1,4)=pi_ep2L(4,1)
pi_ep2L(2,4)=pi_ep2L(4,2)
pi_ep2L(3,4)=pi_ep2L(4,3)
End If 
Contains 

Real(dp) Function EffPotFunction(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(4) 
  Real(dp) :: effPot 
Call CalculateEffPot(vevs(1),vevs(2),vevs(3),vevs(4),g1,g2,g3,gBL,gYB,gBY,            & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont,effPot)

  EffPotFunction = effPot 
  End Function 

Real(dp) Function EffPotFunction2Loop(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(4) 
  Real(dp) :: effPot2L 
Call CalculateEffPot2Loop(vevs(1),vevs(2),vevs(3),vevs(4),g1,g2,g3,gBL,               & 
& gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,               & 
& md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont,effPot2L)

  EffPotFunction2Loop = effPot2L 
  End Function 

End subroutine CalculateCorrectionsEffPot 


Subroutine CalculateEffPot(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,              & 
& Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,              & 
& mC22,MBBp,M1,M2,M3,MBp,kont,effPot)

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

Integer, Intent(inout):: kont
Integer :: i 
Real(dp) :: effpot,Qscale,result,temp


Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Qscale= getRenormalizationScale()
result=0._dp
temp=0._dp
! sum over real scalars (color *[2 if complex]) 
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSd2(i),Qscale) ! Sd
End Do
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSu2(i),Qscale) ! Su
End Do
Do i=1,6
temp=temp+(2)    * h_SMartin(MSe2(i),Qscale) ! Se
End Do
Do i=1,6
temp=temp+          h_SMartin(MSvIm2(i),Qscale) ! SvIm
End Do
Do i=1,6
temp=temp+          h_SMartin(MSvRe2(i),Qscale) ! SvRe
End Do
Do i=1,4
temp=temp+          h_SMartin(Mhh2(i),Qscale) ! hh
End Do
Do i=3,4
temp=temp+          h_SMartin(MAh2(i),Qscale) ! Ah
End Do
Do i=2,2
temp=temp+(2)    * h_SMartin(MHpm2(i),Qscale) ! Hpm
End Do
result=(+1)*temp !scalars

temp=0._dp
! sum over two-component fermions (*color [*2 if Dirac Fermion]) 
Do i=1,2
temp=temp+          h_SMartin(MCha2(i),Qscale)*2 ! Cha
End Do
Do i=1,7
temp=temp+          h_SMartin(MChi2(i),Qscale)*1 ! Chi
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFd2(i),Qscale)*2 ! Fd
End Do
Do i=1,3
temp=temp+          h_SMartin(MFe2(i),Qscale)*2 ! Fe
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFu2(i),Qscale)*2 ! Fu
End Do
Do i=1,6
temp=temp+          h_SMartin(MFv2(i),Qscale)*1 ! Fv
End Do
temp=temp+(8)   * h_SMartin(MGlu2,Qscale)*1 ! Glu
result=result+(-2)*temp ! fermions

temp=0._dp
! sum over real vectors (color *[2 if complex]) 
temp=temp+(8)   * h_SMartin(0._dp,Qscale) ! VG
temp=temp+          h_SMartin(0._dp,Qscale) ! VP
temp=temp+          h_SMartin(MVZ2,Qscale) ! VZ
temp=temp+          h_SMartin(MVZp2,Qscale) ! VZp
temp=temp+(2)    * h_SMartin(MVWm2,Qscale) ! VWm
result=result+(+3)*temp ! vectors

effPot = result * oo16pi2

End Subroutine CalculateEffPot 



 
 
Subroutine CalculateEffPot2Loop(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,               & 
& Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,             & 
& mC12,mC22,MBBp,M1,M2,M3,MBp,kont,effPot2L)

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

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: effpot2L
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Qscale,result,colorfactor,coeff,coeffbar
Complex(dp) :: temp,coupx,coupxbar,coup1,coup2,coup1L,coup1R,coup2L,coup2R
Complex(dp) :: dcoupx,dcoupxbar,dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R
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
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Real(dp) :: results1(43),results2(29)


Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Call CouplingsForEffPot3(Mu,Yd,Td,ZD,ZA,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,               & 
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

Call CouplingsForEffPot4(Yd,ZD,ZA,Ye,ZE,Yu,ZU,Yx,Yv,ZVI,ZVR,ZH,ZP,g3,cplAhAhSdcSd,    & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,   & 
& cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,          & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSuSucSucSu,           & 
& cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)


Qscale = getRenormalizationScale()
result=0._dp
results1=0._dp
results2=0._dp
temp=0._dp
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 15 ------ 
! ---- Ah,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(1)=temp
! ---- Ah,Se,conj[Se] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(2)=temp
! ---- Ah,Su,conj[Su] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(3)=temp
! ---- Ah,SvIm,SvIm ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
    End Do
  End Do
End Do
results1(4)=temp
! ---- Ah,SvIm,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
    End Do
  End Do
End Do
results1(5)=temp
! ---- Ah,SvRe,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
    End Do
  End Do
End Do
results1(6)=temp
! ---- hh,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(7)=temp
! ---- hh,Se,conj[Se] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(8)=temp
! ---- hh,Su,conj[Su] ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(9)=temp
! ---- hh,SvIm,SvIm ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
    End Do
  End Do
End Do
results1(10)=temp
! ---- hh,SvIm,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
    End Do
  End Do
End Do
results1(11)=temp
! ---- hh,SvRe,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
    End Do
  End Do
End Do
results1(12)=temp
! ---- Sd,conj[Hpm],conj[Su] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSd2(i1),MHpm2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
results1(13)=temp
! ---- Se,SvIm,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
colorfactor=1
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSe2(i1),MSvIm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(14)=temp
! ---- Se,SvRe,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
colorfactor=1
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSe2(i1),MSvRe2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(15)=temp
! ----- diagrams of type FFS, 22 ------ 
! ---- Ah,Fd,bar[Fd] ----
temp=0._dp
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i2)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(16)=temp
! ---- Ah,Fe,bar[Fe] ----
temp=0._dp
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i2)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(17)=temp
! ---- Ah,Fu,bar[Fu] ----
temp=0._dp
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(18)=temp
! ---- Ah,Fv,Fv ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MFv(i2)*MFv(i3)*Fep_FFSbar(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(19)=temp
! ---- Chi,Fv,SvIm ----
temp=0._dp
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MChi2(i1),MSvIm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
temp=temp+colorfactor*Real(coup1L**2,dp)*MChi(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MChi2(i1),MSvIm2(i3),Qscale)
    End Do
  End Do
End Do
results1(20)=temp
! ---- Chi,Fv,SvRe ----
temp=0._dp
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MChi2(i1),MSvRe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
temp=temp+colorfactor*Real(coup1L**2,dp)*MChi(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MChi2(i1),MSvRe2(i3),Qscale)
    End Do
  End Do
End Do
results1(21)=temp
! ---- Chi,Sd,bar[Fd] ----
temp=0._dp
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
    End Do
  End Do
End Do
results1(22)=temp
! ---- Chi,Se,bar[Fe] ----
temp=0._dp
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
    End Do
  End Do
End Do
results1(23)=temp
! ---- Chi,Su,bar[Fu] ----
temp=0._dp
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
    End Do
  End Do
End Do
results1(24)=temp
! ---- Fd,hh,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(25)=temp
! ---- Fd,bar[Cha],conj[Su] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MCha(i2)*Fep_FFSbar(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
    End Do
  End Do
End Do
results1(26)=temp
! ---- Fe,hh,bar[Fe] ----
temp=0._dp
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(27)=temp
! ---- Fe,SvIm,bar[Cha] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFe2(i1),MSvIm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFe2(i1),MSvIm2(i2),Qscale)
    End Do
  End Do
End Do
results1(28)=temp
! ---- Fe,SvRe,bar[Cha] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFe2(i1),MSvRe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFe2(i1),MSvRe2(i2),Qscale)
    End Do
  End Do
End Do
results1(29)=temp
! ---- Fu,hh,bar[Fu] ----
temp=0._dp
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(30)=temp
! ---- Fu,Hpm,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(31)=temp
! ---- Fv,Fv,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,4
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MFv2(i2),MFv2(i1),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MFv(i1)*MFv(i2)*Fep_FFSbar(MFv2(i2),MFv2(i1),Mhh2(i3),Qscale)
    End Do
  End Do
End Do
results1(32)=temp
! ---- Fv,Hpm,bar[Fe] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(33)=temp
! ---- Fv,Se,bar[Cha] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MFv2(i1),MSe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MFv2(i1),MSe2(i2),Qscale)
    End Do
  End Do
End Do
results1(34)=temp
! ---- Glu,Sd,bar[Fd] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MGlu2,MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFd(i3)*Fep_FFSbar(MFd2(i3),MGlu2,MSd2(i2),Qscale)
    End Do
  End Do
results1(35)=temp
! ---- Glu,Su,bar[Fu] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MGlu2,MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFu(i3)*Fep_FFSbar(MFu2(i3),MGlu2,MSu2(i2),Qscale)
    End Do
  End Do
results1(36)=temp
! ---- Sd,bar[Cha],bar[Fu] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
    End Do
  End Do
End Do
results1(37)=temp
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSd2(i3),MSd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
results1(38)=temp
! ---- Su,VG,conj[Su] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSu2(i3),MSu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
results1(39)=temp
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFd2(i3),MFd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFVbar(MFd2(i3),MFd2(i1),0._dp,Qscale)
    End Do
End Do
results1(40)=temp
! ---- Fu,VG,bar[Fu] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFu2(i3),MFu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFVbar(MFu2(i3),MFu2(i1),0._dp,Qscale)
    End Do
End Do
results1(41)=temp
! ---- Glu,Glu,VG ----
temp=0._dp
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
colorfactor=24
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFV(MGlu2,MGlu2,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MGlu*MGlu*Fep_FFVbar(MGlu2,MGlu2,0._dp,Qscale)
results1(42)=temp
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
temp=0._dp
coup1 = cplVGVGVG
coup2 = cplVGVGVG
colorfactor=24
temp=temp+colorfactor*1._dp/12._dp*(coup1)**2*Fep_gauge(0._dp,0._dp,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
results1(43)=temp
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 27 ------ 
! ---- Ah,Sd ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
results2(1)=temp
! ---- Ah,Se ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
results2(2)=temp
! ---- Ah,Su ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
results2(3)=temp
! ---- Ah,SvIm ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
  End Do
End Do
results2(4)=temp
! ---- Ah,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
  End Do
End Do
results2(5)=temp
! ---- hh,Sd ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
results2(6)=temp
! ---- hh,Se ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
results2(7)=temp
! ---- hh,Su ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
results2(8)=temp
! ---- hh,SvIm ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
  End Do
End Do
results2(9)=temp
! ---- hh,SvRe ----
temp=0._dp
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
  End Do
End Do
results2(10)=temp
! ---- Hpm,Sd ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
results2(11)=temp
! ---- Hpm,Se ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
results2(12)=temp
! ---- Hpm,Su ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
results2(13)=temp
! ---- Hpm,SvIm ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
  End Do
End Do
results2(14)=temp
! ---- Hpm,SvRe ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
  End Do
End Do
results2(15)=temp
! ---- Sd,Sd ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSd2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
results2(16)=temp
! ---- Sd,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
results2(17)=temp
! ---- Sd,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
results2(18)=temp
! ---- Se,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
results2(19)=temp
! ---- Se,SvIm ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
  End Do
End Do
results2(20)=temp
! ---- Se,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
  End Do
End Do
results2(21)=temp
! ---- Su,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
results2(22)=temp
! ---- Su,SvIm ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
  End Do
End Do
results2(23)=temp
! ---- Su,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
  End Do
End Do
results2(24)=temp
! ---- SvIm,SvIm ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MSvIm2(i1),MSvIm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
  End Do
End Do
results2(25)=temp
! ---- SvIm,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MSvIm2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
  End Do
End Do
results2(26)=temp
! ---- SvRe,SvRe ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MSvRe2(i1),MSvRe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 
  End Do
End Do
results2(27)=temp
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSd2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
results2(28)=temp
! ---- Su,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSu2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
results2(29)=temp
result = sum(results1)+sum(results2) 
effPot2L = result * oo16pi2 * oo16Pi2
End Subroutine CalculateEffPot2Loop


Subroutine SecondDerivativeEffPot2Loop(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,              & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont,pi2L,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: pi2L(4,4),ti2L(4)
Integer :: i,i1,i2,i3,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,result_ti,temp,temp_ti,temp_tj,tempbar,tempbar_ti,tempbar_tj
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: Di_coup1,Di_coup2,Di_coup1L,Di_coup1R,Di_coup2L,Di_coup2R,Di_coupx,Di_coupxbar
Complex(dp) :: Dj_coup1,Dj_coup2,Dj_coup1L,Dj_coup1R,Dj_coup2L,Dj_coup2R,Dj_coupx,Dj_coupxbar
Complex(dp) :: DDcoup1,DDcoup2,DDcoup1L,DDcoup1R,DDcoup2L,DDcoup2R,DDcoupx,DDcoupxbar
Complex(dp) :: results1(43),results2(29)
Complex(dp) :: results1_ti(43),results2_ti(29)
Real(dp) :: gout(58390) 
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
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhSdcSd(4,6,6,4),dcplAhSecSe(4,6,6,4),dcplAhSucSu(4,6,6,4),dcplAhSvImSvIm(4,6,6,4),& 
& dcplAhSvImSvRe(4,6,6,4),dcplAhSvReSvRe(4,6,6,4),dcplhhSdcSd(4,6,6,4),dcplhhSecSe(4,6,6,4),& 
& dcplhhSucSu(4,6,6,4),dcplhhSvImSvIm(4,6,6,4),dcplhhSvImSvRe(4,6,6,4),dcplhhSvReSvRe(4,6,6,4),& 
& dcplHpmSucSd(2,6,6,4),dcplHpmSvImcSe(2,6,6,4),dcplHpmSvRecSe(2,6,6,4),dcplSdcHpmcSu(6,2,6,4),& 
& dcplSeSvImcHpm(6,6,2,4),dcplSeSvRecHpm(6,6,2,4),dcplSdcSdVG(6,6,4),dcplSucSuVG(6,6,4), & 
& dcplVGVGVG(4),dcplcFdFdAhL(3,3,4,4),dcplcFdFdAhR(3,3,4,4),dcplcFeFeAhL(3,3,4,4),       & 
& dcplcFeFeAhR(3,3,4,4),dcplcFuFuAhL(3,3,4,4),dcplcFuFuAhR(3,3,4,4),dcplFvFvAhL(6,6,4,4),& 
& dcplFvFvAhR(6,6,4,4),dcplChaFucSdL(2,3,6,4),dcplChaFucSdR(2,3,6,4),dcplFvChacSeL(6,2,6,4),& 
& dcplFvChacSeR(6,2,6,4),dcplcFdChaSuL(3,2,6,4),dcplcFdChaSuR(3,2,6,4),dcplcFeChaSvImL(3,2,6,4),& 
& dcplcFeChaSvImR(3,2,6,4),dcplcFeChaSvReL(3,2,6,4),dcplcFeChaSvReR(3,2,6,4),            & 
& dcplChiFdcSdL(7,3,6,4),dcplChiFdcSdR(7,3,6,4),dcplChiFecSeL(7,3,6,4),dcplChiFecSeR(7,3,6,4),& 
& dcplChiFucSuL(7,3,6,4),dcplChiFucSuR(7,3,6,4),dcplChiFvSvImL(7,6,6,4),dcplChiFvSvImR(7,6,6,4),& 
& dcplChiFvSvReL(7,6,6,4),dcplChiFvSvReR(7,6,6,4),dcplcFdChiSdL(3,7,6,4),dcplcFdChiSdR(3,7,6,4),& 
& dcplcFeChiSeL(3,7,6,4),dcplcFeChiSeR(3,7,6,4),dcplcFuChiSuL(3,7,6,4),dcplcFuChiSuR(3,7,6,4),& 
& dcplGluFdcSdL(3,6,4),dcplGluFdcSdR(3,6,4),dcplcFdFdhhL(3,3,4,4),dcplcFdFdhhR(3,3,4,4), & 
& dcplcChaFdcSuL(2,3,6,4),dcplcChaFdcSuR(2,3,6,4),dcplcFuFdcHpmL(3,3,2,4),               & 
& dcplcFuFdcHpmR(3,3,2,4),dcplFvFecHpmL(6,3,2,4),dcplFvFecHpmR(6,3,2,4),dcplcFeFehhL(3,3,4,4),& 
& dcplcFeFehhR(3,3,4,4),dcplcChaFeSvImL(2,3,6,4),dcplcChaFeSvImR(2,3,6,4),               & 
& dcplcChaFeSvReL(2,3,6,4),dcplcChaFeSvReR(2,3,6,4),dcplGluFucSuL(3,6,4),dcplGluFucSuR(3,6,4),& 
& dcplcFuFuhhL(3,3,4,4),dcplcFuFuhhR(3,3,4,4),dcplcFdFuHpmL(3,3,2,4),dcplcFdFuHpmR(3,3,2,4),& 
& dcplFvFvhhL(6,6,4,4),dcplFvFvhhR(6,6,4,4),dcplcFeFvHpmL(3,6,2,4),dcplcFeFvHpmR(3,6,2,4),& 
& dcplcChaFvSeL(2,6,6,4),dcplcChaFvSeR(2,6,6,4),dcplcFdGluSdL(3,6,4),dcplcFdGluSdR(3,6,4),& 
& dcplcFuGluSuL(3,6,4),dcplcFuGluSuR(3,6,4),dcplcChacFuSdL(2,3,6,4),dcplcChacFuSdR(2,3,6,4),& 
& dcplcFdFdVGL(3,3,4),dcplcFdFdVGR(3,3,4),dcplcFuFuVGL(3,3,4),dcplcFuFuVGR(3,3,4),       & 
& dcplGluGluVGL(4),dcplGluGluVGR(4)

Complex(dp) :: dcplAhAhSdcSd(4,4,6,6,4),dcplAhAhSecSe(4,4,6,6,4),dcplAhAhSucSu(4,4,6,6,4),           & 
& dcplAhAhSvImSvIm(4,4,6,6,4),dcplAhAhSvReSvRe(4,4,6,6,4),dcplhhhhSdcSd(4,4,6,6,4),      & 
& dcplhhhhSecSe(4,4,6,6,4),dcplhhhhSucSu(4,4,6,6,4),dcplhhhhSvImSvIm(4,4,6,6,4),         & 
& dcplhhhhSvReSvRe(4,4,6,6,4),dcplHpmSdcHpmcSd(2,6,2,6,4),dcplHpmSecHpmcSe(2,6,2,6,4),   & 
& dcplHpmSucHpmcSu(2,6,2,6,4),dcplHpmSvImSvImcHpm(2,6,6,2,4),dcplHpmSvReSvRecHpm(2,6,6,2,4),& 
& dcplSdSdcSdcSd(6,6,6,6,4),dcplSdSecSdcSe(6,6,6,6,4),dcplSdSucSdcSu(6,6,6,6,4),         & 
& dcplSeSecSecSe(6,6,6,6,4),dcplSeSvImSvImcSe(6,6,6,6,4),dcplSeSvReSvRecSe(6,6,6,6,4),   & 
& dcplSuSucSucSu(6,6,6,6,4),dcplSuSvImSvImcSu(6,6,6,6,4),dcplSuSvReSvRecSu(6,6,6,6,4),   & 
& dcplSvImSvImSvImSvIm(6,6,6,6,4),dcplSvImSvImSvReSvRe(6,6,6,6,4),dcplSvReSvReSvReSvRe(6,6,6,6,4),& 
& dcplSdcSdVGVG(6,6,4),dcplSucSuVGVG(6,6,4)

Complex(dp) :: ddcplAhSdcSd(4,6,6,4,4),ddcplAhSecSe(4,6,6,4,4),ddcplAhSucSu(4,6,6,4,4),              & 
& ddcplAhSvImSvIm(4,6,6,4,4),ddcplAhSvImSvRe(4,6,6,4,4),ddcplAhSvReSvRe(4,6,6,4,4),      & 
& ddcplhhSdcSd(4,6,6,4,4),ddcplhhSecSe(4,6,6,4,4),ddcplhhSucSu(4,6,6,4,4),               & 
& ddcplhhSvImSvIm(4,6,6,4,4),ddcplhhSvImSvRe(4,6,6,4,4),ddcplhhSvReSvRe(4,6,6,4,4),      & 
& ddcplHpmSucSd(2,6,6,4,4),ddcplHpmSvImcSe(2,6,6,4,4),ddcplHpmSvRecSe(2,6,6,4,4),        & 
& ddcplSdcHpmcSu(6,2,6,4,4),ddcplSeSvImcHpm(6,6,2,4,4),ddcplSeSvRecHpm(6,6,2,4,4),       & 
& ddcplSdcSdVG(6,6,4,4),ddcplSucSuVG(6,6,4,4),ddcplVGVGVG(4,4),ddcplcFdFdAhL(3,3,4,4,4), & 
& ddcplcFdFdAhR(3,3,4,4,4),ddcplcFeFeAhL(3,3,4,4,4),ddcplcFeFeAhR(3,3,4,4,4),            & 
& ddcplcFuFuAhL(3,3,4,4,4),ddcplcFuFuAhR(3,3,4,4,4),ddcplFvFvAhL(6,6,4,4,4),             & 
& ddcplFvFvAhR(6,6,4,4,4),ddcplChaFucSdL(2,3,6,4,4),ddcplChaFucSdR(2,3,6,4,4),           & 
& ddcplFvChacSeL(6,2,6,4,4),ddcplFvChacSeR(6,2,6,4,4),ddcplcFdChaSuL(3,2,6,4,4),         & 
& ddcplcFdChaSuR(3,2,6,4,4),ddcplcFeChaSvImL(3,2,6,4,4),ddcplcFeChaSvImR(3,2,6,4,4),     & 
& ddcplcFeChaSvReL(3,2,6,4,4),ddcplcFeChaSvReR(3,2,6,4,4),ddcplChiFdcSdL(7,3,6,4,4),     & 
& ddcplChiFdcSdR(7,3,6,4,4),ddcplChiFecSeL(7,3,6,4,4),ddcplChiFecSeR(7,3,6,4,4),         & 
& ddcplChiFucSuL(7,3,6,4,4),ddcplChiFucSuR(7,3,6,4,4),ddcplChiFvSvImL(7,6,6,4,4),        & 
& ddcplChiFvSvImR(7,6,6,4,4),ddcplChiFvSvReL(7,6,6,4,4),ddcplChiFvSvReR(7,6,6,4,4),      & 
& ddcplcFdChiSdL(3,7,6,4,4),ddcplcFdChiSdR(3,7,6,4,4),ddcplcFeChiSeL(3,7,6,4,4),         & 
& ddcplcFeChiSeR(3,7,6,4,4),ddcplcFuChiSuL(3,7,6,4,4),ddcplcFuChiSuR(3,7,6,4,4),         & 
& ddcplGluFdcSdL(3,6,4,4),ddcplGluFdcSdR(3,6,4,4),ddcplcFdFdhhL(3,3,4,4,4),              & 
& ddcplcFdFdhhR(3,3,4,4,4),ddcplcChaFdcSuL(2,3,6,4,4),ddcplcChaFdcSuR(2,3,6,4,4),        & 
& ddcplcFuFdcHpmL(3,3,2,4,4),ddcplcFuFdcHpmR(3,3,2,4,4),ddcplFvFecHpmL(6,3,2,4,4),       & 
& ddcplFvFecHpmR(6,3,2,4,4),ddcplcFeFehhL(3,3,4,4,4),ddcplcFeFehhR(3,3,4,4,4),           & 
& ddcplcChaFeSvImL(2,3,6,4,4),ddcplcChaFeSvImR(2,3,6,4,4),ddcplcChaFeSvReL(2,3,6,4,4),   & 
& ddcplcChaFeSvReR(2,3,6,4,4),ddcplGluFucSuL(3,6,4,4),ddcplGluFucSuR(3,6,4,4),           & 
& ddcplcFuFuhhL(3,3,4,4,4),ddcplcFuFuhhR(3,3,4,4,4),ddcplcFdFuHpmL(3,3,2,4,4),           & 
& ddcplcFdFuHpmR(3,3,2,4,4),ddcplFvFvhhL(6,6,4,4,4),ddcplFvFvhhR(6,6,4,4,4),             & 
& ddcplcFeFvHpmL(3,6,2,4,4),ddcplcFeFvHpmR(3,6,2,4,4),ddcplcChaFvSeL(2,6,6,4,4),         & 
& ddcplcChaFvSeR(2,6,6,4,4),ddcplcFdGluSdL(3,6,4,4),ddcplcFdGluSdR(3,6,4,4),             & 
& ddcplcFuGluSuL(3,6,4,4),ddcplcFuGluSuR(3,6,4,4),ddcplcChacFuSdL(2,3,6,4,4),            & 
& ddcplcChacFuSdR(2,3,6,4,4),ddcplcFdFdVGL(3,3,4,4),ddcplcFdFdVGR(3,3,4,4),              & 
& ddcplcFuFuVGL(3,3,4,4),ddcplcFuFuVGR(3,3,4,4),ddcplGluGluVGL(4,4),ddcplGluGluVGR(4,4)

Complex(dp) :: ddcplAhAhSdcSd(4,4,6,6,4,4),ddcplAhAhSecSe(4,4,6,6,4,4),ddcplAhAhSucSu(4,4,6,6,4,4),  & 
& ddcplAhAhSvImSvIm(4,4,6,6,4,4),ddcplAhAhSvReSvRe(4,4,6,6,4,4),ddcplhhhhSdcSd(4,4,6,6,4,4),& 
& ddcplhhhhSecSe(4,4,6,6,4,4),ddcplhhhhSucSu(4,4,6,6,4,4),ddcplhhhhSvImSvIm(4,4,6,6,4,4),& 
& ddcplhhhhSvReSvRe(4,4,6,6,4,4),ddcplHpmSdcHpmcSd(2,6,2,6,4,4),ddcplHpmSecHpmcSe(2,6,2,6,4,4),& 
& ddcplHpmSucHpmcSu(2,6,2,6,4,4),ddcplHpmSvImSvImcHpm(2,6,6,2,4,4),ddcplHpmSvReSvRecHpm(2,6,6,2,4,4),& 
& ddcplSdSdcSdcSd(6,6,6,6,4,4),ddcplSdSecSdcSe(6,6,6,6,4,4),ddcplSdSucSdcSu(6,6,6,6,4,4),& 
& ddcplSeSecSecSe(6,6,6,6,4,4),ddcplSeSvImSvImcSe(6,6,6,6,4,4),ddcplSeSvReSvRecSe(6,6,6,6,4,4),& 
& ddcplSuSucSucSu(6,6,6,6,4,4),ddcplSuSvImSvImcSu(6,6,6,6,4,4),ddcplSuSvReSvRecSu(6,6,6,6,4,4),& 
& ddcplSvImSvImSvImSvIm(6,6,6,6,4,4),ddcplSvImSvImSvReSvRe(6,6,6,6,4,4),ddcplSvReSvReSvReSvRe(6,6,6,6,4,4),& 
& ddcplSdcSdVGVG(6,6,4,4),ddcplSucSuVGVG(6,6,4,4)

Real(dp) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),             & 
& MSvRe2(6),Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MChi(7),MChi2(7),             & 
& MCha(2),MCha2(2),MFv(6),MFv2(6),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2

Complex(dp) :: dMSd(6,4),dMSd2(6,4),dMSu(6,4),dMSu2(6,4),dMSe(6,4),dMSe2(6,4),dMSvIm(6,4),           & 
& dMSvIm2(6,4),dMSvRe(6,4),dMSvRe2(6,4),dMhh(4,4),dMhh2(4,4),dMAh(4,4),dMAh2(4,4),       & 
& dMHpm(2,4),dMHpm2(2,4),dMChi(7,4),dMChi2(7,4),dMCha(2,4),dMCha2(2,4),dMFv(6,4),        & 
& dMFv2(6,4),dMFe(3,4),dMFe2(3,4),dMFd(3,4),dMFd2(3,4),dMFu(3,4),dMFu2(3,4),             & 
& dMGlu(1,4),dMGlu2(1,4),dMVZ(1,4),dMVZp(1,4),dMVZ2(1,4),dMVZp2(1,4),dMVWm(1,4),         & 
& dMVWm2(1,4)

Complex(dp) :: ddMSd(6,4,4),ddMSd2(6,4,4),ddMSu(6,4,4),ddMSu2(6,4,4),ddMSe(6,4,4),ddMSe2(6,4,4),     & 
& ddMSvIm(6,4,4),ddMSvIm2(6,4,4),ddMSvRe(6,4,4),ddMSvRe2(6,4,4),ddMhh(4,4,4),            & 
& ddMhh2(4,4,4),ddMAh(4,4,4),ddMAh2(4,4,4),ddMHpm(2,4,4),ddMHpm2(2,4,4),ddMChi(7,4,4),   & 
& ddMChi2(7,4,4),ddMCha(2,4,4),ddMCha2(2,4,4),ddMFv(6,4,4),ddMFv2(6,4,4),ddMFe(3,4,4),   & 
& ddMFe2(3,4,4),ddMFd(3,4,4),ddMFd2(3,4,4),ddMFu(3,4,4),ddMFu2(3,4,4),ddMGlu(1,4,4),     & 
& ddMGlu2(1,4,4),ddMVZ(1,4,4),ddMVZp(1,4,4),ddMVZ2(1,4,4),ddMVZp2(1,4,4),ddMVWm(1,4,4),  & 
& ddMVWm2(1,4,4)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,4
Call FirstDerivativeMassesCoups(i1,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,               & 
& Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,           & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,     & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMSvIm(:,i1) = MSvIm
dMSvIm2(:,i1) = MSvIm2
dMSvRe(:,i1) = MSvRe
dMSvRe2(:,i1) = MSvRe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZp(:,i1) = MVZp
dMVZ2(:,i1) = MVZ2
dMVZp2(:,i1) = MVZp2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvImSvIm(:,:,:,i1) = cplAhSvImSvIm
dcplAhSvImSvRe(:,:,:,i1) = cplAhSvImSvRe
dcplAhSvReSvRe(:,:,:,i1) = cplAhSvReSvRe
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvImSvIm(:,:,:,i1) = cplhhSvImSvIm
dcplhhSvImSvRe(:,:,:,i1) = cplhhSvImSvRe
dcplhhSvReSvRe(:,:,:,i1) = cplhhSvReSvRe
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvImcSe(:,:,:,i1) = cplHpmSvImcSe
dcplHpmSvRecSe(:,:,:,i1) = cplHpmSvRecSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSeSvImcHpm(:,:,:,i1) = cplSeSvImcHpm
dcplSeSvRecHpm(:,:,:,i1) = cplSeSvRecHpm
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplFvFvAhL(:,:,:,i1) = cplFvFvAhL
dcplFvFvAhR(:,:,:,i1) = cplFvFvAhR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplFvChacSeL(:,:,:,i1) = cplFvChacSeL
dcplFvChacSeR(:,:,:,i1) = cplFvChacSeR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvImL(:,:,:,i1) = cplcFeChaSvImL
dcplcFeChaSvImR(:,:,:,i1) = cplcFeChaSvImR
dcplcFeChaSvReL(:,:,:,i1) = cplcFeChaSvReL
dcplcFeChaSvReR(:,:,:,i1) = cplcFeChaSvReR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvSvImL(:,:,:,i1) = cplChiFvSvImL
dcplChiFvSvImR(:,:,:,i1) = cplChiFvSvImR
dcplChiFvSvReL(:,:,:,i1) = cplChiFvSvReL
dcplChiFvSvReR(:,:,:,i1) = cplChiFvSvReR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplFvFecHpmL(:,:,:,i1) = cplFvFecHpmL
dcplFvFecHpmR(:,:,:,i1) = cplFvFecHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFeSvImL(:,:,:,i1) = cplcChaFeSvImL
dcplcChaFeSvImR(:,:,:,i1) = cplcChaFeSvImR
dcplcChaFeSvReL(:,:,:,i1) = cplcChaFeSvReL
dcplcChaFeSvReR(:,:,:,i1) = cplcChaFeSvReR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplFvFvhhL(:,:,:,i1) = cplFvFvhhL
dcplFvFvhhR(:,:,:,i1) = cplFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcChaFvSeL(:,:,:,i1) = cplcChaFvSeL
dcplcChaFvSeR(:,:,:,i1) = cplcChaFvSeR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvImSvIm(:,:,:,:,i1) = cplAhAhSvImSvIm
dcplAhAhSvReSvRe(:,:,:,:,i1) = cplAhAhSvReSvRe
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvImSvIm(:,:,:,:,i1) = cplhhhhSvImSvIm
dcplhhhhSvReSvRe(:,:,:,:,i1) = cplhhhhSvReSvRe
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvImSvImcHpm(:,:,:,:,i1) = cplHpmSvImSvImcHpm
dcplHpmSvReSvRecHpm(:,:,:,:,i1) = cplHpmSvReSvRecHpm
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvImSvImcSe(:,:,:,:,i1) = cplSeSvImSvImcSe
dcplSeSvReSvRecSe(:,:,:,:,i1) = cplSeSvReSvRecSe
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvImSvImcSu(:,:,:,:,i1) = cplSuSvImSvImcSu
dcplSuSvReSvRecSu(:,:,:,:,i1) = cplSuSvReSvRecSu
dcplSvImSvImSvImSvIm(:,:,:,:,i1) = cplSvImSvImSvImSvIm
dcplSvImSvImSvReSvRe(:,:,:,:,i1) = cplSvImSvImSvReSvRe
dcplSvReSvReSvReSvRe(:,:,:,:,i1) = cplSvReSvReSvReSvRe
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Do i1=1,4
  Do i2=i1,4
Call SecondDerivativeMassesCoups(i1,i2,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,              & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,           & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,     & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

ddMSd(:,i1,i2) = MSd
ddMSd2(:,i1,i2) = MSd2
ddMSu(:,i1,i2) = MSu
ddMSu2(:,i1,i2) = MSu2
ddMSe(:,i1,i2) = MSe
ddMSe2(:,i1,i2) = MSe2
ddMSvIm(:,i1,i2) = MSvIm
ddMSvIm2(:,i1,i2) = MSvIm2
ddMSvRe(:,i1,i2) = MSvRe
ddMSvRe2(:,i1,i2) = MSvRe2
ddMhh(:,i1,i2) = Mhh
ddMhh2(:,i1,i2) = Mhh2
ddMAh(:,i1,i2) = MAh
ddMAh2(:,i1,i2) = MAh2
ddMHpm(:,i1,i2) = MHpm
ddMHpm2(:,i1,i2) = MHpm2
ddMChi(:,i1,i2) = MChi
ddMChi2(:,i1,i2) = MChi2
ddMCha(:,i1,i2) = MCha
ddMCha2(:,i1,i2) = MCha2
ddMFv(:,i1,i2) = MFv
ddMFv2(:,i1,i2) = MFv2
ddMFe(:,i1,i2) = MFe
ddMFe2(:,i1,i2) = MFe2
ddMFd(:,i1,i2) = MFd
ddMFd2(:,i1,i2) = MFd2
ddMFu(:,i1,i2) = MFu
ddMFu2(:,i1,i2) = MFu2
ddMGlu(:,i1,i2) = MGlu
ddMGlu2(:,i1,i2) = MGlu2
ddMVZ(:,i1,i2) = MVZ
ddMVZp(:,i1,i2) = MVZp
ddMVZ2(:,i1,i2) = MVZ2
ddMVZp2(:,i1,i2) = MVZp2
ddMVWm(:,i1,i2) = MVWm
ddMVWm2(:,i1,i2) = MVWm2
ddcplAhSdcSd(:,:,:,i1,i2) = cplAhSdcSd
ddcplAhSecSe(:,:,:,i1,i2) = cplAhSecSe
ddcplAhSucSu(:,:,:,i1,i2) = cplAhSucSu
ddcplAhSvImSvIm(:,:,:,i1,i2) = cplAhSvImSvIm
ddcplAhSvImSvRe(:,:,:,i1,i2) = cplAhSvImSvRe
ddcplAhSvReSvRe(:,:,:,i1,i2) = cplAhSvReSvRe
ddcplhhSdcSd(:,:,:,i1,i2) = cplhhSdcSd
ddcplhhSecSe(:,:,:,i1,i2) = cplhhSecSe
ddcplhhSucSu(:,:,:,i1,i2) = cplhhSucSu
ddcplhhSvImSvIm(:,:,:,i1,i2) = cplhhSvImSvIm
ddcplhhSvImSvRe(:,:,:,i1,i2) = cplhhSvImSvRe
ddcplhhSvReSvRe(:,:,:,i1,i2) = cplhhSvReSvRe
ddcplHpmSucSd(:,:,:,i1,i2) = cplHpmSucSd
ddcplHpmSvImcSe(:,:,:,i1,i2) = cplHpmSvImcSe
ddcplHpmSvRecSe(:,:,:,i1,i2) = cplHpmSvRecSe
ddcplSdcHpmcSu(:,:,:,i1,i2) = cplSdcHpmcSu
ddcplSeSvImcHpm(:,:,:,i1,i2) = cplSeSvImcHpm
ddcplSeSvRecHpm(:,:,:,i1,i2) = cplSeSvRecHpm
ddcplSdcSdVG(:,:,i1,i2) = cplSdcSdVG
ddcplSucSuVG(:,:,i1,i2) = cplSucSuVG
ddcplVGVGVG(i1,i2) = cplVGVGVG
ddcplcFdFdAhL(:,:,:,i1,i2) = cplcFdFdAhL
ddcplcFdFdAhR(:,:,:,i1,i2) = cplcFdFdAhR
ddcplcFeFeAhL(:,:,:,i1,i2) = cplcFeFeAhL
ddcplcFeFeAhR(:,:,:,i1,i2) = cplcFeFeAhR
ddcplcFuFuAhL(:,:,:,i1,i2) = cplcFuFuAhL
ddcplcFuFuAhR(:,:,:,i1,i2) = cplcFuFuAhR
ddcplFvFvAhL(:,:,:,i1,i2) = cplFvFvAhL
ddcplFvFvAhR(:,:,:,i1,i2) = cplFvFvAhR
ddcplChaFucSdL(:,:,:,i1,i2) = cplChaFucSdL
ddcplChaFucSdR(:,:,:,i1,i2) = cplChaFucSdR
ddcplFvChacSeL(:,:,:,i1,i2) = cplFvChacSeL
ddcplFvChacSeR(:,:,:,i1,i2) = cplFvChacSeR
ddcplcFdChaSuL(:,:,:,i1,i2) = cplcFdChaSuL
ddcplcFdChaSuR(:,:,:,i1,i2) = cplcFdChaSuR
ddcplcFeChaSvImL(:,:,:,i1,i2) = cplcFeChaSvImL
ddcplcFeChaSvImR(:,:,:,i1,i2) = cplcFeChaSvImR
ddcplcFeChaSvReL(:,:,:,i1,i2) = cplcFeChaSvReL
ddcplcFeChaSvReR(:,:,:,i1,i2) = cplcFeChaSvReR
ddcplChiFdcSdL(:,:,:,i1,i2) = cplChiFdcSdL
ddcplChiFdcSdR(:,:,:,i1,i2) = cplChiFdcSdR
ddcplChiFecSeL(:,:,:,i1,i2) = cplChiFecSeL
ddcplChiFecSeR(:,:,:,i1,i2) = cplChiFecSeR
ddcplChiFucSuL(:,:,:,i1,i2) = cplChiFucSuL
ddcplChiFucSuR(:,:,:,i1,i2) = cplChiFucSuR
ddcplChiFvSvImL(:,:,:,i1,i2) = cplChiFvSvImL
ddcplChiFvSvImR(:,:,:,i1,i2) = cplChiFvSvImR
ddcplChiFvSvReL(:,:,:,i1,i2) = cplChiFvSvReL
ddcplChiFvSvReR(:,:,:,i1,i2) = cplChiFvSvReR
ddcplcFdChiSdL(:,:,:,i1,i2) = cplcFdChiSdL
ddcplcFdChiSdR(:,:,:,i1,i2) = cplcFdChiSdR
ddcplcFeChiSeL(:,:,:,i1,i2) = cplcFeChiSeL
ddcplcFeChiSeR(:,:,:,i1,i2) = cplcFeChiSeR
ddcplcFuChiSuL(:,:,:,i1,i2) = cplcFuChiSuL
ddcplcFuChiSuR(:,:,:,i1,i2) = cplcFuChiSuR
ddcplGluFdcSdL(:,:,i1,i2) = cplGluFdcSdL
ddcplGluFdcSdR(:,:,i1,i2) = cplGluFdcSdR
ddcplcFdFdhhL(:,:,:,i1,i2) = cplcFdFdhhL
ddcplcFdFdhhR(:,:,:,i1,i2) = cplcFdFdhhR
ddcplcChaFdcSuL(:,:,:,i1,i2) = cplcChaFdcSuL
ddcplcChaFdcSuR(:,:,:,i1,i2) = cplcChaFdcSuR
ddcplcFuFdcHpmL(:,:,:,i1,i2) = cplcFuFdcHpmL
ddcplcFuFdcHpmR(:,:,:,i1,i2) = cplcFuFdcHpmR
ddcplFvFecHpmL(:,:,:,i1,i2) = cplFvFecHpmL
ddcplFvFecHpmR(:,:,:,i1,i2) = cplFvFecHpmR
ddcplcFeFehhL(:,:,:,i1,i2) = cplcFeFehhL
ddcplcFeFehhR(:,:,:,i1,i2) = cplcFeFehhR
ddcplcChaFeSvImL(:,:,:,i1,i2) = cplcChaFeSvImL
ddcplcChaFeSvImR(:,:,:,i1,i2) = cplcChaFeSvImR
ddcplcChaFeSvReL(:,:,:,i1,i2) = cplcChaFeSvReL
ddcplcChaFeSvReR(:,:,:,i1,i2) = cplcChaFeSvReR
ddcplGluFucSuL(:,:,i1,i2) = cplGluFucSuL
ddcplGluFucSuR(:,:,i1,i2) = cplGluFucSuR
ddcplcFuFuhhL(:,:,:,i1,i2) = cplcFuFuhhL
ddcplcFuFuhhR(:,:,:,i1,i2) = cplcFuFuhhR
ddcplcFdFuHpmL(:,:,:,i1,i2) = cplcFdFuHpmL
ddcplcFdFuHpmR(:,:,:,i1,i2) = cplcFdFuHpmR
ddcplFvFvhhL(:,:,:,i1,i2) = cplFvFvhhL
ddcplFvFvhhR(:,:,:,i1,i2) = cplFvFvhhR
ddcplcFeFvHpmL(:,:,:,i1,i2) = cplcFeFvHpmL
ddcplcFeFvHpmR(:,:,:,i1,i2) = cplcFeFvHpmR
ddcplcChaFvSeL(:,:,:,i1,i2) = cplcChaFvSeL
ddcplcChaFvSeR(:,:,:,i1,i2) = cplcChaFvSeR
ddcplcFdGluSdL(:,:,i1,i2) = cplcFdGluSdL
ddcplcFdGluSdR(:,:,i1,i2) = cplcFdGluSdR
ddcplcFuGluSuL(:,:,i1,i2) = cplcFuGluSuL
ddcplcFuGluSuR(:,:,i1,i2) = cplcFuGluSuR
ddcplcChacFuSdL(:,:,:,i1,i2) = cplcChacFuSdL
ddcplcChacFuSdR(:,:,:,i1,i2) = cplcChacFuSdR
ddcplcFdFdVGL(:,:,i1,i2) = cplcFdFdVGL
ddcplcFdFdVGR(:,:,i1,i2) = cplcFdFdVGR
ddcplcFuFuVGL(:,:,i1,i2) = cplcFuFuVGL
ddcplcFuFuVGR(:,:,i1,i2) = cplcFuFuVGR
ddcplGluGluVGL(i1,i2) = cplGluGluVGL
ddcplGluGluVGR(i1,i2) = cplGluGluVGR
ddcplAhAhSdcSd(:,:,:,:,i1,i2) = cplAhAhSdcSd
ddcplAhAhSecSe(:,:,:,:,i1,i2) = cplAhAhSecSe
ddcplAhAhSucSu(:,:,:,:,i1,i2) = cplAhAhSucSu
ddcplAhAhSvImSvIm(:,:,:,:,i1,i2) = cplAhAhSvImSvIm
ddcplAhAhSvReSvRe(:,:,:,:,i1,i2) = cplAhAhSvReSvRe
ddcplhhhhSdcSd(:,:,:,:,i1,i2) = cplhhhhSdcSd
ddcplhhhhSecSe(:,:,:,:,i1,i2) = cplhhhhSecSe
ddcplhhhhSucSu(:,:,:,:,i1,i2) = cplhhhhSucSu
ddcplhhhhSvImSvIm(:,:,:,:,i1,i2) = cplhhhhSvImSvIm
ddcplhhhhSvReSvRe(:,:,:,:,i1,i2) = cplhhhhSvReSvRe
ddcplHpmSdcHpmcSd(:,:,:,:,i1,i2) = cplHpmSdcHpmcSd
ddcplHpmSecHpmcSe(:,:,:,:,i1,i2) = cplHpmSecHpmcSe
ddcplHpmSucHpmcSu(:,:,:,:,i1,i2) = cplHpmSucHpmcSu
ddcplHpmSvImSvImcHpm(:,:,:,:,i1,i2) = cplHpmSvImSvImcHpm
ddcplHpmSvReSvRecHpm(:,:,:,:,i1,i2) = cplHpmSvReSvRecHpm
ddcplSdSdcSdcSd(:,:,:,:,i1,i2) = cplSdSdcSdcSd
ddcplSdSecSdcSe(:,:,:,:,i1,i2) = cplSdSecSdcSe
ddcplSdSucSdcSu(:,:,:,:,i1,i2) = cplSdSucSdcSu
ddcplSeSecSecSe(:,:,:,:,i1,i2) = cplSeSecSecSe
ddcplSeSvImSvImcSe(:,:,:,:,i1,i2) = cplSeSvImSvImcSe
ddcplSeSvReSvRecSe(:,:,:,:,i1,i2) = cplSeSvReSvRecSe
ddcplSuSucSucSu(:,:,:,:,i1,i2) = cplSuSucSucSu
ddcplSuSvImSvImcSu(:,:,:,:,i1,i2) = cplSuSvImSvImcSu
ddcplSuSvReSvRecSu(:,:,:,:,i1,i2) = cplSuSvReSvRecSu
ddcplSvImSvImSvImSvIm(:,:,:,:,i1,i2) = cplSvImSvImSvImSvIm
ddcplSvImSvImSvReSvRe(:,:,:,:,i1,i2) = cplSvImSvImSvReSvRe
ddcplSvReSvReSvReSvRe(:,:,:,:,i1,i2) = cplSvReSvReSvReSvRe
ddcplSdcSdVGVG(:,:,i1,i2) = cplSdcSdVGVG
ddcplSucSuVGVG(:,:,i1,i2) = cplSucSuVGVG
  End Do 
 End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Call CouplingsForEffPot3(Mu,Yd,Td,ZD,ZA,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,               & 
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

Call CouplingsForEffPot4(Yd,ZD,ZA,Ye,ZE,Yu,ZU,Yx,Yv,ZVI,ZVR,ZH,ZP,g3,cplAhAhSdcSd,    & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,   & 
& cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,          & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSuSucSucSu,           & 
& cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
Do iv1=1,4
  Do iv2=iv1,4
    result = ZeroC
    result_ti = ZeroC
    results1 = ZeroC
    results1_ti = ZeroC
    results2 = ZeroC
    results2_ti = ZeroC


! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices


! ----- diagrams of type SSS, 15 ------ 

! ---- Ah,Sd,conj[Sd] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
Di_coup1 = dcplAhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMAh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(1)=results1(1) + coeff*colorfactor*temp
results1_ti(1)=results1_ti(1) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(1).eq.results1(1)))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
! ---- Ah,Se,conj[Se] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
Di_coup1 = dcplAhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMAh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
results1_ti(2)=results1_ti(2) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(2).eq.results1(2)))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
! ---- Ah,Su,conj[Su] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
Di_coup1 = dcplAhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMAh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(3)=results1(3) + coeff*colorfactor*temp
results1_ti(3)=results1_ti(3) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(3).eq.results1(3)))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
! ---- Ah,SvIm,SvIm ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
Di_coup1 = dcplAhSvImSvIm(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvImSvIm(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvImSvIm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvIm2(i3),dMAh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),dMAh2(i1,iv2),dMSvIm2(i2,iv2),dMSvIm2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
results1_ti(4)=results1_ti(4) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(4).eq.results1(4)))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
! ---- Ah,SvIm,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
Di_coup1 = dcplAhSvImSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvImSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvImSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvRe2(i3),dMAh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),dMAh2(i1,iv2),dMSvIm2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(5)=results1(5) + coeff*colorfactor*temp
results1_ti(5)=results1_ti(5) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(5).eq.results1(5)))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
! ---- Ah,SvRe,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
Di_coup1 = dcplAhSvReSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvReSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvReSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSvRe2(i2),MSvRe2(i3),dMAh2(i1,iv1)        & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),dMAh2(i1,iv2),dMSvRe2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMAh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
results1_ti(6)=results1_ti(6) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(6).eq.results1(6)))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
! ---- hh,Sd,conj[Sd] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
Di_coup1 = dcplhhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMhh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
results1_ti(7)=results1_ti(7) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(7).eq.results1(7)))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
! ---- hh,Se,conj[Se] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
Di_coup1 = dcplhhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMhh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
results1_ti(8)=results1_ti(8) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(8).eq.results1(8)))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
! ---- hh,Su,conj[Su] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
Di_coup1 = dcplhhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMhh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(9)=results1(9) + coeff*colorfactor*temp
results1_ti(9)=results1_ti(9) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(9).eq.results1(9)))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
! ---- hh,SvIm,SvIm ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
Di_coup1 = dcplhhSvImSvIm(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvImSvIm(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvImSvIm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),dMhh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),dMhh2(i1,iv2),dMSvIm2(i2,iv2),dMSvIm2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
results1_ti(10)=results1_ti(10) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(10).eq.results1(10)))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
! ---- hh,SvIm,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
Di_coup1 = dcplhhSvImSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvImSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvImSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),dMhh2(i1,iv1)        & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),dMhh2(i1,iv2),dMSvIm2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(11)=results1(11) + coeff*colorfactor*temp
results1_ti(11)=results1_ti(11) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(11).eq.results1(11)))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
! ---- hh,SvRe,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
Di_coup1 = dcplhhSvReSvRe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvReSvRe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvReSvRe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),dMhh2(i1,iv1)        & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),dMhh2(i1,iv2),dMSvRe2(i2,iv2),dMSvRe2(i3,iv2)         & 
& ,ddMhh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
results1_ti(12)=results1_ti(12) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(12).eq.results1(12)))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
Di_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
Dj_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv2)
DDcoup1 = ddcplSdcHpmcSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),dMSd2(i1,iv2),dMHpm2(i2,iv2),dMSu2(i3,iv2)               & 
& ,ddMSd2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
results1_ti(13)=results1_ti(13) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(13).eq.results1(13)))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
! ---- Se,SvIm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
Di_coup1 = dcplSeSvImcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplSeSvImcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplSeSvImcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSe2(i1),MSvIm2(i2),MHpm2(i3),dMSe2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMHpm2(i3,iv1),dMSe2(i1,iv2),dMSvIm2(i2,iv2),dMHpm2(i3,iv2)           & 
& ,ddMSe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
results1_ti(14)=results1_ti(14) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(14).eq.results1(14)))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
! ---- Se,SvRe,conj[Hpm] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
Di_coup1 = dcplSeSvRecHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplSeSvRecHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplSeSvRecHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSe2(i1),MSvRe2(i2),MHpm2(i3),dMSe2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMHpm2(i3,iv1),dMSe2(i1,iv2),dMSvRe2(i2,iv2),dMHpm2(i3,iv2)           & 
& ,ddMSe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 1
results1(15)=results1(15) + coeff*colorfactor*temp
results1_ti(15)=results1_ti(15) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(15).eq.results1(15)))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 

! ----- diagrams of type FFS, 22 ------ 

! ---- Ah,Fd,bar[Fd] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
Di_coup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFdFdAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFdFdAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFdFdAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(16)=results1(16) + coeff*colorfactor*temp
results1_ti(16)=results1_ti(16) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(16)=results1(16) + coeffbar*colorfactor*tempbar
results1_ti(16)=results1_ti(16) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(16).eq.results1(16)))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
Di_coup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFeFeAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFeFeAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFeFeAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFeFeAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
results1_ti(17)=results1_ti(17) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(17)=results1(17) + coeffbar*colorfactor*tempbar
results1_ti(17)=results1_ti(17) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(17).eq.results1(17)))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
Di_coup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFuFuAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFuFuAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFuFuAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(18)=results1(18) + coeff*colorfactor*temp
results1_ti(18)=results1_ti(18) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(18)=results1(18) + coeffbar*colorfactor*tempbar
results1_ti(18)=results1_ti(18) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(18).eq.results1(18)))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
! ---- Ah,Fv,Fv ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
Di_coup1L = dcplFvFvAhL(i2,i3,i1,iv1)
Di_coup1R = dcplFvFvAhR(i2,i3,i1,iv1)
Dj_coup1L = dcplFvFvAhL(i2,i3,i1,iv2)
Dj_coup1R = dcplFvFvAhR(i2,i3,i1,iv2)
DDcoup1L = ddcplFvFvAhL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplFvFvAhR(i2,i3,i1,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(19)=results1(19) + coeff*colorfactor*temp
results1_ti(19)=results1_ti(19) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(19)=results1(19) + coeffbar*colorfactor*tempbar
results1_ti(19)=results1_ti(19) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(19).eq.results1(19)))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
! ---- Chi,Fv,SvIm ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
Di_coup1L = dcplChiFvSvImL(i1,i2,i3,iv1)
Di_coup1R = dcplChiFvSvImR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiFvSvImL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiFvSvImR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiFvSvImL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiFvSvImR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvIm2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvIm2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvIm2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
results1_ti(20)=results1_ti(20) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(20)=results1(20) + coeffbar*colorfactor*tempbar
results1_ti(20)=results1_ti(20) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(20).eq.results1(20)))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
! ---- Chi,Fv,SvRe ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
Di_coup1L = dcplChiFvSvReL(i1,i2,i3,iv1)
Di_coup1R = dcplChiFvSvReR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiFvSvReL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiFvSvReR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiFvSvReL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiFvSvReR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvRe2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),dMFv2(i2,iv2),dMChi2(i1,iv2),dMSvRe2(i3,iv2)           & 
& ,ddMFv2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSvRe2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(21)=results1(21) + coeff*colorfactor*temp
results1_ti(21)=results1_ti(21) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(21)=results1(21) + coeffbar*colorfactor*tempbar
results1_ti(21)=results1_ti(21) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(21).eq.results1(21)))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
Di_coup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdChiSdL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdChiSdR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdChiSdL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdChiSdR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(22)=results1(22) + coeff*colorfactor*temp
results1_ti(22)=results1_ti(22) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
results1_ti(22)=results1_ti(22) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(22).eq.results1(22)))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
! ---- Chi,Se,bar[Fe] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
Di_coup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeChiSeL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeChiSeR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeChiSeL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeChiSeR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
results1_ti(23)=results1_ti(23) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
results1_ti(23)=results1_ti(23) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(23).eq.results1(23)))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
! ---- Chi,Su,bar[Fu] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
Di_coup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuChiSuL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuChiSuR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuChiSuL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuChiSuR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(24)=results1(24) + coeff*colorfactor*temp
results1_ti(24)=results1_ti(24) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
results1_ti(24)=results1_ti(24) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(24).eq.results1(24)))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
Di_coup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFdhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFdhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFdhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFdhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(25)=results1(25) + coeff*colorfactor*temp
results1_ti(25)=results1_ti(25) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
results1_ti(25)=results1_ti(25) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(25).eq.results1(25)))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
Di_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
Di_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
Dj_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv2)
Dj_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv2)
DDcoup1L = ddcplcChaFdcSuL(i2,i1,i3,iv1,iv2)
DDcoup1R = ddcplcChaFdcSuR(i2,i1,i3,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
results1_ti(26)=results1_ti(26) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
results1_ti(26)=results1_ti(26) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(26).eq.results1(26)))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
Di_coup1L = dcplcFeFehhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFehhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFehhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFehhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFehhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFehhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
results1_ti(27)=results1_ti(27) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
results1_ti(27)=results1_ti(27) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(27).eq.results1(27)))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
! ---- Fe,SvIm,bar[Cha] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
Di_coup1L = dcplcChaFeSvImL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFeSvImR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFeSvImL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFeSvImR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFeSvImL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFeSvImR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvIm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvIm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(28)=results1(28) + coeff*colorfactor*temp
results1_ti(28)=results1_ti(28) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
results1_ti(28)=results1_ti(28) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(28).eq.results1(28)))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
! ---- Fe,SvRe,bar[Cha] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
Di_coup1L = dcplcChaFeSvReL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFeSvReR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFeSvReL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFeSvReR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFeSvReL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFeSvReR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvRe2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)        & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),dMCha2(i3,iv2),dMFe2(i1,iv2),dMSvRe2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMFe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
results1_ti(29)=results1_ti(29) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
results1_ti(29)=results1_ti(29) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(29).eq.results1(29)))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
Di_coup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuFuhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuFuhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuFuhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuFuhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(30)=results1(30) + coeff*colorfactor*temp
results1_ti(30)=results1_ti(30) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
results1_ti(30)=results1_ti(30) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(30).eq.results1(30)))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
Di_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFuHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFuHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(31)=results1(31) + coeff*colorfactor*temp
results1_ti(31)=results1_ti(31) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
results1_ti(31)=results1_ti(31) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(31).eq.results1(31)))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
! ---- Fv,Fv,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,4
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
Di_coup1L = dcplFvFvhhL(i1,i2,i3,iv1)
Di_coup1R = dcplFvFvhhR(i1,i2,i3,iv1)
Dj_coup1L = dcplFvFvhhL(i1,i2,i3,iv2)
Dj_coup1R = dcplFvFvhhR(i1,i2,i3,iv2)
DDcoup1L = ddcplFvFvhhL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplFvFvhhR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),dMFv2(i2,iv2),dMFv2(i1,iv2),dMhh2(i3,iv2),ddMFv2(i2,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),dMFv2(i2,iv2),dMFv2(i1,iv2),dMhh2(i3,iv2),ddMFv2(i2,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
results1_ti(32)=results1_ti(32) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
results1_ti(32)=results1_ti(32) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(32).eq.results1(32)))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
Di_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFvHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFvHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(33)=results1(33) + coeff*colorfactor*temp
results1_ti(33)=results1_ti(33) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
results1_ti(33)=results1_ti(33) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(33).eq.results1(33)))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
! ---- Fv,Se,bar[Cha] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
Di_coup1L = dcplcChaFvSeL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaFvSeR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaFvSeL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaFvSeR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaFvSeL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaFvSeR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)          & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),dMCha2(i3,iv2),dMFv2(i1,iv2),dMSe2(i2,iv2),ddMCha2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)          & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),dMCha2(i3,iv2),dMFv2(i1,iv2),dMSe2(i2,iv2),ddMCha2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(34)=results1(34) + coeff*colorfactor*temp
results1_ti(34)=results1_ti(34) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
results1_ti(34)=results1_ti(34) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(34).eq.results1(34)))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
Di_coup1L = dcplcFdGluSdL(i3,i2,iv1)
Di_coup1R = dcplcFdGluSdR(i3,i2,iv1)
Dj_coup1L = dcplcFdGluSdL(i3,i2,iv2)
Dj_coup1R = dcplcFdGluSdR(i3,i2,iv2)
DDcoup1L = ddcplcFdGluSdL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFdGluSdR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(35)=results1(35) + coeff*colorfactor*temp
results1_ti(35)=results1_ti(35) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
results1_ti(35)=results1_ti(35) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(35).eq.results1(35)))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
Di_coup1L = dcplcFuGluSuL(i3,i2,iv1)
Di_coup1R = dcplcFuGluSuR(i3,i2,iv1)
Dj_coup1L = dcplcFuGluSuL(i3,i2,iv2)
Dj_coup1R = dcplcFuGluSuR(i3,i2,iv2)
DDcoup1L = ddcplcFuGluSuL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFuGluSuR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(36)=results1(36) + coeff*colorfactor*temp
results1_ti(36)=results1_ti(36) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
results1_ti(36)=results1_ti(36) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(36).eq.results1(36)))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
Di_coup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
Di_coup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
Dj_coup1L = dcplcChacFuSdL(i2,i3,i1,iv2)
Dj_coup1R = dcplcChacFuSdR(i2,i3,i1,iv2)
DDcoup1L = ddcplcChacFuSdL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplcChacFuSdR(i2,i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(37)=results1(37) + coeff*colorfactor*temp
results1_ti(37)=results1_ti(37) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
results1_ti(37)=results1_ti(37) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(37).eq.results1(37)))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 

! ----- diagrams of type SSV, 2 ------ 

! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
Di_coup1 = dcplSdcSdVG(i1,i3,iv1)
Dj_coup1 = dcplSdcSdVG(i1,i3,iv2)
DDcoup1 = ddcplSdcSdVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1)               & 
& ,dMSd2(i1,iv1),ZeroC,dMSd2(i3,iv2),dMSd2(i1,iv2),ZeroC,ddMSd2(i3,iv1,iv2)              & 
& ,ddMSd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(38)=results1(38) + coeff*colorfactor*temp
results1_ti(38)=results1_ti(38) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(38).eq.results1(38)))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
Di_coup1 = dcplSucSuVG(i1,i3,iv1)
Dj_coup1 = dcplSucSuVG(i1,i3,iv2)
DDcoup1 = ddcplSucSuVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1)               & 
& ,dMSu2(i1,iv1),ZeroC,dMSu2(i3,iv2),dMSu2(i1,iv2),ZeroC,ddMSu2(i3,iv1,iv2)              & 
& ,ddMSu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(39)=results1(39) + coeff*colorfactor*temp
results1_ti(39)=results1_ti(39) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(39).eq.results1(39)))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 

! ----- diagrams of type FFV, 3 ------ 

! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
Di_coup1L = dcplcFdFdVGL(i3,i1,iv1)
Di_coup1R = dcplcFdFdVGR(i3,i1,iv1)
Dj_coup1L = dcplcFdFdVGL(i3,i1,iv2)
Dj_coup1R = dcplcFdFdVGR(i3,i1,iv2)
DDcoup1L = ddcplcFdFdVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(40)=results1(40) + coeff*colorfactor*temp
results1_ti(40)=results1_ti(40) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
results1_ti(40)=results1_ti(40) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(40).eq.results1(40)))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
Di_coup1L = dcplcFuFuVGL(i3,i1,iv1)
Di_coup1R = dcplcFuFuVGR(i3,i1,iv1)
Dj_coup1L = dcplcFuFuVGL(i3,i1,iv2)
Dj_coup1R = dcplcFuFuVGR(i3,i1,iv2)
DDcoup1L = ddcplcFuFuVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(41)=results1(41) + coeff*colorfactor*temp
results1_ti(41)=results1_ti(41) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
results1_ti(41)=results1_ti(41) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(41).eq.results1(41)))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
Di_coup1L = dcplGluGluVGL(iv1)
Di_coup1R = dcplGluGluVGR(iv1)
Dj_coup1L = dcplGluGluVGL(iv2)
Dj_coup1R = dcplGluGluVGR(iv2)
DDcoup1L = ddcplGluGluVGL(iv1,iv2)
DDcoup1R = ddcplGluGluVGR(iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 24
results1(42)=results1(42) + coeff*colorfactor*temp
results1_ti(42)=results1_ti(42) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(42)=results1(42) + coeffbar*colorfactor*tempbar
results1_ti(42)=results1_ti(42) + coeffbar*colorfactor*tempbar_ti
if (.not.(results1(42).eq.results1(42)))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 

! ----- diagrams of type VVV, 1 ------ 

! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
Di_coup1 = dcplVGVGVG(iv1)
Dj_coup1 = dcplVGVGVG(iv2)
DDcoup1 = ddcplVGVGVG(iv1,iv2)
coeff = 0.000
colorfactor = 24
results1(43)=results1(43) + coeff*colorfactor*temp
results1_ti(43)=results1_ti(43) + coeff*colorfactor*temp_ti
if (.not.(results1(43).eq.results1(43)))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex


! ----- diagrams of type SS, 27 ------ 

! ---- Ah,Sd ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSd2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(1)=results2(1) + coeff*temp
results2_ti(1)=results2_ti(1) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(1).eq.results2(1)))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
! ---- Ah,Se ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSe2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(2)=results2(2) + coeff*temp
results2_ti(2)=results2_ti(2) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(2).eq.results2(2)))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
! ---- Ah,Su ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSu2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
results2_ti(3)=results2_ti(3) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(3).eq.results2(3)))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
! ---- Ah,SvIm ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSvIm2(i2),dMAh2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMAh2(i1,iv2),dMSvIm2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(4)=results2(4) + coeff*temp
results2_ti(4)=results2_ti(4) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(4).eq.results2(4)))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
! ---- Ah,SvRe ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSvRe2(i2),dMAh2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMAh2(i1,iv2),dMSvRe2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(5)=results2(5) + coeff*temp
results2_ti(5)=results2_ti(5) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(5).eq.results2(5)))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
! ---- hh,Sd ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSd2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
results2_ti(6)=results2_ti(6) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(6).eq.results2(6)))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
! ---- hh,Se ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSe2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(7)=results2(7) + coeff*temp
results2_ti(7)=results2_ti(7) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(7).eq.results2(7)))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
! ---- hh,Su ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSu2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(8)=results2(8) + coeff*temp
results2_ti(8)=results2_ti(8) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(8).eq.results2(8)))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
! ---- hh,SvIm ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSvIm2(i2),dMhh2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMhh2(i1,iv2),dMSvIm2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(9)=results2(9) + coeff*temp
results2_ti(9)=results2_ti(9) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(9).eq.results2(9)))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
! ---- hh,SvRe ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSvRe2(i2),dMhh2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMhh2(i1,iv2),dMSvRe2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(10)=results2(10) + coeff*temp
results2_ti(10)=results2_ti(10) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(10).eq.results2(10)))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
Di_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSd2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(11)=results2(11) + coeff*temp
results2_ti(11)=results2_ti(11) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(11).eq.results2(11)))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
Di_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSecHpmcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSe2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(12)=results2(12) + coeff*temp
results2_ti(12)=results2_ti(12) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(12).eq.results2(12)))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
Di_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSucHpmcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSu2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(13)=results2(13) + coeff*temp
results2_ti(13)=results2_ti(13) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(13).eq.results2(13)))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
! ---- Hpm,SvIm ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
Di_coup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSvIm2(i2),dMHpm2(i1,iv1),dMSvIm2(i2,iv1)   & 
& ,dMHpm2(i1,iv2),dMSvIm2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2)               & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(14)=results2(14) + coeff*temp
results2_ti(14)=results2_ti(14) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(14).eq.results2(14)))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
! ---- Hpm,SvRe ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
Di_coup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSvRe2(i2),dMHpm2(i1,iv1),dMSvRe2(i2,iv1)   & 
& ,dMHpm2(i1,iv2),dMSvRe2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)               & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(15)=results2(15) + coeff*temp
results2_ti(15)=results2_ti(15) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(15).eq.results2(15)))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
Di_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSdcSdcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSd2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(16)=results2(16) + coeff*temp
results2_ti(16)=results2_ti(16) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(16).eq.results2(16)))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
Di_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSecSdcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSe2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
results2_ti(17)=results2_ti(17) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(17).eq.results2(17)))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
Di_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSucSdcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSu2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
results2_ti(18)=results2_ti(18) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(18).eq.results2(18)))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
Di_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSeSecSecSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSe2(i1,iv2),dMSe2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(19)=results2(19) + coeff*temp
results2_ti(19)=results2_ti(19) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(19).eq.results2(19)))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
! ---- Se,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
Di_coup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSeSvImSvImcSe(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSvIm2(i2),dMSe2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMSe2(i1,iv2),dMSvIm2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(20)=results2(20) + coeff*temp
results2_ti(20)=results2_ti(20) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(20).eq.results2(20)))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
! ---- Se,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
Di_coup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSeSvReSvRecSe(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSvRe2(i2),dMSe2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMSe2(i1,iv2),dMSvRe2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(21)=results2(21) + coeff*temp
results2_ti(21)=results2_ti(21) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(21).eq.results2(21)))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
Di_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSuSucSucSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSu2(i1,iv2),dMSu2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
results2_ti(22)=results2_ti(22) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(22).eq.results2(22)))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
! ---- Su,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
Di_coup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSuSvImSvImcSu(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSvIm2(i2),dMSu2(i1,iv1),dMSvIm2(i2,iv1)     & 
& ,dMSu2(i1,iv2),dMSvIm2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(23)=results2(23) + coeff*temp
results2_ti(23)=results2_ti(23) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(23).eq.results2(23)))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
! ---- Su,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
Di_coup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv1)
Dj_coup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv2)
DDcoup1 = ddcplSuSvReSvRecSu(i1,i2,i2,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSvRe2(i2),dMSu2(i1,iv1),dMSvRe2(i2,iv1)     & 
& ,dMSu2(i1,iv2),dMSvRe2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(24)=results2(24) + coeff*temp
results2_ti(24)=results2_ti(24) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(24).eq.results2(24)))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
! ---- SvIm,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
Di_coup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvIm2(i1),MSvIm2(i2),dMSvIm2(i1,iv1),dMSvIm2(i2,iv1) & 
& ,dMSvIm2(i1,iv2),dMSvIm2(i2,iv2),ddMSvIm2(i1,iv1,iv2),ddMSvIm2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(25)=results2(25) + coeff*temp
results2_ti(25)=results2_ti(25) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(25).eq.results2(25)))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
! ---- SvIm,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvIm2(i1),MSvRe2(i2),dMSvIm2(i1,iv1),dMSvRe2(i2,iv1) & 
& ,dMSvIm2(i1,iv2),dMSvRe2(i2,iv2),ddMSvIm2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(26)=results2(26) + coeff*temp
results2_ti(26)=results2_ti(26) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(26).eq.results2(26)))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
! ---- SvRe,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
Di_coup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSvRe2(i1),MSvRe2(i2),dMSvRe2(i1,iv1),dMSvRe2(i2,iv1) & 
& ,dMSvRe2(i1,iv2),dMSvRe2(i2,iv2),ddMSvRe2(i1,iv1,iv2),ddMSvRe2(i2,iv1,iv2)             & 
& ,coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(27)=results2(27) + coeff*temp
results2_ti(27)=results2_ti(27) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(27).eq.results2(27)))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 

! ----- diagrams of type VS, 2 ------ 

! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
Di_coup1 = dcplSdcSdVGVG(i1,i1,iv1)
Dj_coup1 = dcplSdcSdVGVG(i1,i1,iv2)
DDcoup1 = ddcplSdcSdVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),ZeroC,dMSd2(i1,iv2)& 
& ,ZeroC,ddMSd2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(28)=results2(28) + coeff*temp
results2_ti(28)=results2_ti(28) + coeff*temp_ti
End Do
if (.not.(results2(28).eq.results2(28)))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
Di_coup1 = dcplSucSuVGVG(i1,i1,iv1)
Dj_coup1 = dcplSucSuVGVG(i1,i1,iv2)
DDcoup1 = ddcplSucSuVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),ZeroC,dMSu2(i1,iv2)& 
& ,ZeroC,ddMSu2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(29)=results2(29) + coeff*temp
results2_ti(29)=results2_ti(29) + coeff*temp_ti
End Do
if (.not.(results2(29).eq.results2(29)))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 

  result = sum(results1)+sum(results2) ! 2nd deriv. of V
  result_ti = sum(results1_ti)+sum(results2_ti) ! 1st deriv. of V
  pi2L(iv1,iv2) = oo16pi2**2 * Real(result,dp) 
  End Do 
  ti2L(iv1) = oo16pi2**2 * Real(result_ti,dp) 
End Do 
Do iv1=1,4
  Do iv2=1,iv1-1
  pi2L(iv1,iv2) = pi2L(iv2,iv1) 
  End Do 
End Do 
End Subroutine SecondDerivativeEffPot2Loop 





Subroutine FirstDerivativeEffPot2Loop(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,               & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: ti2L(4)
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,temp,tempbar
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R,dcoupx,dcoupxbar
Real(dp) :: gout(58390) 
Real(dp) :: results1(43),results2(29)
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
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhSdcSd(4,6,6,4),dcplAhSecSe(4,6,6,4),dcplAhSucSu(4,6,6,4),dcplAhSvImSvIm(4,6,6,4),& 
& dcplAhSvImSvRe(4,6,6,4),dcplAhSvReSvRe(4,6,6,4),dcplhhSdcSd(4,6,6,4),dcplhhSecSe(4,6,6,4),& 
& dcplhhSucSu(4,6,6,4),dcplhhSvImSvIm(4,6,6,4),dcplhhSvImSvRe(4,6,6,4),dcplhhSvReSvRe(4,6,6,4),& 
& dcplHpmSucSd(2,6,6,4),dcplHpmSvImcSe(2,6,6,4),dcplHpmSvRecSe(2,6,6,4),dcplSdcHpmcSu(6,2,6,4),& 
& dcplSeSvImcHpm(6,6,2,4),dcplSeSvRecHpm(6,6,2,4),dcplSdcSdVG(6,6,4),dcplSucSuVG(6,6,4), & 
& dcplVGVGVG(4),dcplcFdFdAhL(3,3,4,4),dcplcFdFdAhR(3,3,4,4),dcplcFeFeAhL(3,3,4,4),       & 
& dcplcFeFeAhR(3,3,4,4),dcplcFuFuAhL(3,3,4,4),dcplcFuFuAhR(3,3,4,4),dcplFvFvAhL(6,6,4,4),& 
& dcplFvFvAhR(6,6,4,4),dcplChaFucSdL(2,3,6,4),dcplChaFucSdR(2,3,6,4),dcplFvChacSeL(6,2,6,4),& 
& dcplFvChacSeR(6,2,6,4),dcplcFdChaSuL(3,2,6,4),dcplcFdChaSuR(3,2,6,4),dcplcFeChaSvImL(3,2,6,4),& 
& dcplcFeChaSvImR(3,2,6,4),dcplcFeChaSvReL(3,2,6,4),dcplcFeChaSvReR(3,2,6,4),            & 
& dcplChiFdcSdL(7,3,6,4),dcplChiFdcSdR(7,3,6,4),dcplChiFecSeL(7,3,6,4),dcplChiFecSeR(7,3,6,4),& 
& dcplChiFucSuL(7,3,6,4),dcplChiFucSuR(7,3,6,4),dcplChiFvSvImL(7,6,6,4),dcplChiFvSvImR(7,6,6,4),& 
& dcplChiFvSvReL(7,6,6,4),dcplChiFvSvReR(7,6,6,4),dcplcFdChiSdL(3,7,6,4),dcplcFdChiSdR(3,7,6,4),& 
& dcplcFeChiSeL(3,7,6,4),dcplcFeChiSeR(3,7,6,4),dcplcFuChiSuL(3,7,6,4),dcplcFuChiSuR(3,7,6,4),& 
& dcplGluFdcSdL(3,6,4),dcplGluFdcSdR(3,6,4),dcplcFdFdhhL(3,3,4,4),dcplcFdFdhhR(3,3,4,4), & 
& dcplcChaFdcSuL(2,3,6,4),dcplcChaFdcSuR(2,3,6,4),dcplcFuFdcHpmL(3,3,2,4),               & 
& dcplcFuFdcHpmR(3,3,2,4),dcplFvFecHpmL(6,3,2,4),dcplFvFecHpmR(6,3,2,4),dcplcFeFehhL(3,3,4,4),& 
& dcplcFeFehhR(3,3,4,4),dcplcChaFeSvImL(2,3,6,4),dcplcChaFeSvImR(2,3,6,4),               & 
& dcplcChaFeSvReL(2,3,6,4),dcplcChaFeSvReR(2,3,6,4),dcplGluFucSuL(3,6,4),dcplGluFucSuR(3,6,4),& 
& dcplcFuFuhhL(3,3,4,4),dcplcFuFuhhR(3,3,4,4),dcplcFdFuHpmL(3,3,2,4),dcplcFdFuHpmR(3,3,2,4),& 
& dcplFvFvhhL(6,6,4,4),dcplFvFvhhR(6,6,4,4),dcplcFeFvHpmL(3,6,2,4),dcplcFeFvHpmR(3,6,2,4),& 
& dcplcChaFvSeL(2,6,6,4),dcplcChaFvSeR(2,6,6,4),dcplcFdGluSdL(3,6,4),dcplcFdGluSdR(3,6,4),& 
& dcplcFuGluSuL(3,6,4),dcplcFuGluSuR(3,6,4),dcplcChacFuSdL(2,3,6,4),dcplcChacFuSdR(2,3,6,4),& 
& dcplcFdFdVGL(3,3,4),dcplcFdFdVGR(3,3,4),dcplcFuFuVGL(3,3,4),dcplcFuFuVGR(3,3,4),       & 
& dcplGluGluVGL(4),dcplGluGluVGR(4)

Complex(dp) :: dcplAhAhSdcSd(4,4,6,6,4),dcplAhAhSecSe(4,4,6,6,4),dcplAhAhSucSu(4,4,6,6,4),           & 
& dcplAhAhSvImSvIm(4,4,6,6,4),dcplAhAhSvReSvRe(4,4,6,6,4),dcplhhhhSdcSd(4,4,6,6,4),      & 
& dcplhhhhSecSe(4,4,6,6,4),dcplhhhhSucSu(4,4,6,6,4),dcplhhhhSvImSvIm(4,4,6,6,4),         & 
& dcplhhhhSvReSvRe(4,4,6,6,4),dcplHpmSdcHpmcSd(2,6,2,6,4),dcplHpmSecHpmcSe(2,6,2,6,4),   & 
& dcplHpmSucHpmcSu(2,6,2,6,4),dcplHpmSvImSvImcHpm(2,6,6,2,4),dcplHpmSvReSvRecHpm(2,6,6,2,4),& 
& dcplSdSdcSdcSd(6,6,6,6,4),dcplSdSecSdcSe(6,6,6,6,4),dcplSdSucSdcSu(6,6,6,6,4),         & 
& dcplSeSecSecSe(6,6,6,6,4),dcplSeSvImSvImcSe(6,6,6,6,4),dcplSeSvReSvRecSe(6,6,6,6,4),   & 
& dcplSuSucSucSu(6,6,6,6,4),dcplSuSvImSvImcSu(6,6,6,6,4),dcplSuSvReSvRecSu(6,6,6,6,4),   & 
& dcplSvImSvImSvImSvIm(6,6,6,6,4),dcplSvImSvImSvReSvRe(6,6,6,6,4),dcplSvReSvReSvReSvRe(6,6,6,6,4),& 
& dcplSdcSdVGVG(6,6,4),dcplSucSuVGVG(6,6,4)

Real(dp) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),             & 
& MSvRe2(6),Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MChi(7),MChi2(7),             & 
& MCha(2),MCha2(2),MFv(6),MFv2(6),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2

Complex(dp) :: dMSd(6,4),dMSd2(6,4),dMSu(6,4),dMSu2(6,4),dMSe(6,4),dMSe2(6,4),dMSvIm(6,4),           & 
& dMSvIm2(6,4),dMSvRe(6,4),dMSvRe2(6,4),dMhh(4,4),dMhh2(4,4),dMAh(4,4),dMAh2(4,4),       & 
& dMHpm(2,4),dMHpm2(2,4),dMChi(7,4),dMChi2(7,4),dMCha(2,4),dMCha2(2,4),dMFv(6,4),        & 
& dMFv2(6,4),dMFe(3,4),dMFe2(3,4),dMFd(3,4),dMFd2(3,4),dMFu(3,4),dMFu2(3,4),             & 
& dMGlu(1,4),dMGlu2(1,4),dMVZ(1,4),dMVZp(1,4),dMVZ2(1,4),dMVZp2(1,4),dMVWm(1,4),         & 
& dMVWm2(1,4)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,4
Call FirstDerivativeMassesCoups(i1,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,               & 
& Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,               & 
& MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,           & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,     & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMSvIm(:,i1) = MSvIm
dMSvIm2(:,i1) = MSvIm2
dMSvRe(:,i1) = MSvRe
dMSvRe2(:,i1) = MSvRe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZp(:,i1) = MVZp
dMVZ2(:,i1) = MVZ2
dMVZp2(:,i1) = MVZp2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvImSvIm(:,:,:,i1) = cplAhSvImSvIm
dcplAhSvImSvRe(:,:,:,i1) = cplAhSvImSvRe
dcplAhSvReSvRe(:,:,:,i1) = cplAhSvReSvRe
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvImSvIm(:,:,:,i1) = cplhhSvImSvIm
dcplhhSvImSvRe(:,:,:,i1) = cplhhSvImSvRe
dcplhhSvReSvRe(:,:,:,i1) = cplhhSvReSvRe
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvImcSe(:,:,:,i1) = cplHpmSvImcSe
dcplHpmSvRecSe(:,:,:,i1) = cplHpmSvRecSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSeSvImcHpm(:,:,:,i1) = cplSeSvImcHpm
dcplSeSvRecHpm(:,:,:,i1) = cplSeSvRecHpm
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplFvFvAhL(:,:,:,i1) = cplFvFvAhL
dcplFvFvAhR(:,:,:,i1) = cplFvFvAhR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplFvChacSeL(:,:,:,i1) = cplFvChacSeL
dcplFvChacSeR(:,:,:,i1) = cplFvChacSeR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvImL(:,:,:,i1) = cplcFeChaSvImL
dcplcFeChaSvImR(:,:,:,i1) = cplcFeChaSvImR
dcplcFeChaSvReL(:,:,:,i1) = cplcFeChaSvReL
dcplcFeChaSvReR(:,:,:,i1) = cplcFeChaSvReR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvSvImL(:,:,:,i1) = cplChiFvSvImL
dcplChiFvSvImR(:,:,:,i1) = cplChiFvSvImR
dcplChiFvSvReL(:,:,:,i1) = cplChiFvSvReL
dcplChiFvSvReR(:,:,:,i1) = cplChiFvSvReR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplFvFecHpmL(:,:,:,i1) = cplFvFecHpmL
dcplFvFecHpmR(:,:,:,i1) = cplFvFecHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFeSvImL(:,:,:,i1) = cplcChaFeSvImL
dcplcChaFeSvImR(:,:,:,i1) = cplcChaFeSvImR
dcplcChaFeSvReL(:,:,:,i1) = cplcChaFeSvReL
dcplcChaFeSvReR(:,:,:,i1) = cplcChaFeSvReR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplFvFvhhL(:,:,:,i1) = cplFvFvhhL
dcplFvFvhhR(:,:,:,i1) = cplFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcChaFvSeL(:,:,:,i1) = cplcChaFvSeL
dcplcChaFvSeR(:,:,:,i1) = cplcChaFvSeR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvImSvIm(:,:,:,:,i1) = cplAhAhSvImSvIm
dcplAhAhSvReSvRe(:,:,:,:,i1) = cplAhAhSvReSvRe
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvImSvIm(:,:,:,:,i1) = cplhhhhSvImSvIm
dcplhhhhSvReSvRe(:,:,:,:,i1) = cplhhhhSvReSvRe
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvImSvImcHpm(:,:,:,:,i1) = cplHpmSvImSvImcHpm
dcplHpmSvReSvRecHpm(:,:,:,:,i1) = cplHpmSvReSvRecHpm
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvImSvImcSe(:,:,:,:,i1) = cplSeSvImSvImcSe
dcplSeSvReSvRecSe(:,:,:,:,i1) = cplSeSvReSvRecSe
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvImSvImcSu(:,:,:,:,i1) = cplSuSvImSvImcSu
dcplSuSvReSvRecSu(:,:,:,:,i1) = cplSuSvReSvRecSu
dcplSvImSvImSvImSvIm(:,:,:,:,i1) = cplSvImSvImSvImSvIm
dcplSvImSvImSvReSvRe(:,:,:,:,i1) = cplSvImSvImSvReSvRe
dcplSvReSvReSvReSvRe(:,:,:,:,i1) = cplSvReSvReSvReSvRe
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Call CouplingsForEffPot3(Mu,Yd,Td,ZD,ZA,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,               & 
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

Call CouplingsForEffPot4(Yd,ZD,ZA,Ye,ZE,Yu,ZU,Yx,Yv,ZVI,ZVR,ZH,ZP,g3,cplAhAhSdcSd,    & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,   & 
& cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,          & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSuSucSucSu,           & 
& cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
ti2L = 0._dp
result = ZeroC
results1 = ZeroC
results2 = ZeroC
Do iv1=1,4
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 15 ------ 
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
dcoup1 = dcplAhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(1)=results1(1) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- Ah,Se,conj[Se] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
dcoup1 = dcplAhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- Ah,Su,conj[Su] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
dcoup1 = dcplAhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(3)=results1(3) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- Ah,SvIm,SvIm ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvIm(i1,i2,i3)
coup2 = cplAhSvImSvIm(i1,i2,i3)
dcoup1 = dcplAhSvImSvIm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvIm2(i3),dMAh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvIm]' 
    End Do
  End Do
End Do
! ---- Ah,SvIm,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvImSvRe(i1,i2,i3)
coup2 = cplAhSvImSvRe(i1,i2,i3)
dcoup1 = dcplAhSvImSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvIm2(i2),MSvRe2(i3),dMAh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(5)=results1(5) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvIm, SvRe]' 
    End Do
  End Do
End Do
! ---- Ah,SvRe,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvReSvRe(i1,i2,i3)
coup2 = cplAhSvReSvRe(i1,i2,i3)
dcoup1 = dcplAhSvReSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSvRe2(i2),MSvRe2(i3),dMAh2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, SvRe, SvRe]' 
    End Do
  End Do
End Do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
dcoup1 = dcplhhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- hh,Se,conj[Se] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
dcoup1 = dcplhhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- hh,Su,conj[Su] ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
dcoup1 = dcplhhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(9)=results1(9) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- hh,SvIm,SvIm ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvIm(i1,i2,i3)
coup2 = cplhhSvImSvIm(i1,i2,i3)
dcoup1 = dcplhhSvImSvIm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvIm2(i3),dMhh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvIm]' 
    End Do
  End Do
End Do
! ---- hh,SvIm,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvImSvRe(i1,i2,i3)
coup2 = cplhhSvImSvRe(i1,i2,i3)
dcoup1 = dcplhhSvImSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvIm2(i2),MSvRe2(i3),dMhh2(i1,iv1)         & 
& ,dMSvIm2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(11)=results1(11) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvIm, SvRe]' 
    End Do
  End Do
End Do
! ---- hh,SvRe,SvRe ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvReSvRe(i1,i2,i3)
coup2 = cplhhSvReSvRe(i1,i2,i3)
dcoup1 = dcplhhSvReSvRe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSvRe2(i2),MSvRe2(i3),dMhh2(i1,iv1)         & 
& ,dMSvRe2(i2,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, SvRe, SvRe]' 
    End Do
  End Do
End Do
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
dcoup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)            & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
! ---- Se,SvIm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvImcHpm(i1,i2,i3)
coup2 = cplHpmSvImcSe(i3,i2,i1)
dcoup1 = dcplSeSvImcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSe2(i1),MSvIm2(i2),MHpm2(i3),dMSe2(i1,iv1)          & 
& ,dMSvIm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvIm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- Se,SvRe,conj[Hpm] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1 = cplSeSvRecHpm(i1,i2,i3)
coup2 = cplHpmSvRecSe(i3,i2,i1)
dcoup1 = dcplSeSvRecHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSe2(i1),MSvRe2(i2),MHpm2(i3),dMSe2(i1,iv1)          & 
& ,dMSvRe2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 1
results1(15)=results1(15) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, SvRe, conj[Hpm]]' 
    End Do
  End Do
End Do
! ----- diagrams of type FFS, 22 ------ 
! ---- Ah,Fd,bar[Fd] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
dcoup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(16)=results1(16) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
coeffbar = 0.5_dp
results1(16)=results1(16) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
dcoup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
coeffbar = 0.5_dp
results1(17)=results1(17) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,4
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
dcoup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(18)=results1(18) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
coeffbar = 0.5_dp
results1(18)=results1(18) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fv,Fv ----
Do i1=1,4
 Do i2=1,6
    Do i3=1,6
coup1L = cplFvFvAhL(i2,i3,i1)
coup1R = cplFvFvAhR(i2,i3,i1)
coup2L = cplFvFvAhL(i2,i3,i1)
coup2R = cplFvFvAhR(i2,i3,i1)
dcoup1L = dcplFvFvAhL(i2,i3,i1,iv1)
dcoup1R = dcplFvFvAhR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(19)=results1(19) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, Fv]' 
coeffbar = 0.5_dp
results1(19)=results1(19) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Fv,SvIm ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvImL(i1,i2,i3)
coup1R = cplChiFvSvImR(i1,i2,i3)
coup2L = cplChiFvSvImL(i1,i2,i3)
coup2R = cplChiFvSvImR(i1,i2,i3)
dcoup1L = dcplChiFvSvImL(i1,i2,i3,iv1)
dcoup1R = dcplChiFvSvImR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvIm2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvIm2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvIm]' 
coeffbar = 1._dp
results1(20)=results1(20) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Fv,SvRe ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,6
coup1L = cplChiFvSvReL(i1,i2,i3)
coup1R = cplChiFvSvReR(i1,i2,i3)
coup2L = cplChiFvSvReL(i1,i2,i3)
coup2R = cplChiFvSvReR(i1,i2,i3)
dcoup1L = dcplChiFvSvReL(i1,i2,i3,iv1)
dcoup1R = dcplChiFvSvReR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MChi2(i1),MSvRe2(i3),dMFv2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMSvRe2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(21)=results1(21) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Fv, SvRe]' 
coeffbar = 1._dp
results1(21)=results1(21) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
dcoup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
dcoup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(22)=results1(22) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Se,bar[Fe] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
dcoup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
dcoup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
coeffbar = 1._dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Su,bar[Fu] ----
Do i1=1,7
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
dcoup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
dcoup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(24)=results1(24) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
dcoup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(25)=results1(25) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
coeffbar = 0.5_dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
dcoup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
dcoup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
coeffbar = 1._dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
dcoup1L = dcplcFeFehhL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFehhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
coeffbar = 0.5_dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,SvIm,bar[Cha] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvImL(i3,i1,i2)
coup1R = cplcChaFeSvImR(i3,i1,i2)
coup2L = cplcFeChaSvImL(i1,i3,i2)
coup2R = cplcFeChaSvImR(i1,i3,i2)
dcoup1L = dcplcChaFeSvImL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFeSvImR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvIm2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvIm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(28)=results1(28) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvIm, bar[Cha]]' 
coeffbar = 1._dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,SvRe,bar[Cha] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFeSvReL(i3,i1,i2)
coup1R = cplcChaFeSvReR(i3,i1,i2)
coup2L = cplcFeChaSvReL(i1,i3,i2)
coup2R = cplcFeChaSvReR(i1,i3,i2)
dcoup1L = dcplcChaFeSvReL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFeSvReR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFe2(i1),MSvRe2(i2),dMCha2(i3,iv1)         & 
& ,dMFe2(i1,iv1),dMSvRe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, SvRe, bar[Cha]]' 
coeffbar = 1._dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,4
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
dcoup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(30)=results1(30) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
coeffbar = 0.5_dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
dcoup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(31)=results1(31) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Fv,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,4
coup1L = cplFvFvhhL(i1,i2,i3)
coup1R = cplFvFvhhR(i1,i2,i3)
coup2L = cplFvFvhhL(i1,i2,i3)
coup2R = cplFvFvhhR(i1,i2,i3)
dcoup1L = dcplFvFvhhL(i1,i2,i3,iv1)
dcoup1R = dcplFvFvhhR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i2),MFv2(i1),Mhh2(i3),dMFv2(i2,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Fv, hh]' 
coeffbar = 0.5_dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplFvFecHpmL(i1,i3,i2)
coup2R = cplFvFecHpmR(i1,i3,i2)
dcoup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(33)=results1(33) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Se,bar[Cha] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaFvSeL(i3,i1,i2)
coup1R = cplcChaFvSeR(i3,i1,i2)
coup2L = cplFvChacSeL(i1,i3,i2)
coup2R = cplFvChacSeR(i1,i3,i2)
dcoup1L = dcplcChaFvSeL(i3,i1,i2,iv1)
dcoup1R = dcplcChaFvSeR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MFv2(i1),MSe2(i2),dMCha2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMSe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(34)=results1(34) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Se, bar[Cha]]' 
coeffbar = 1._dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
dcoup1L = dcplcFdGluSdL(i3,i2,iv1)
dcoup1R = dcplcFdGluSdR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(35)=results1(35) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
dcoup1L = dcplcFuGluSuL(i3,i2,iv1)
dcoup1R = dcplcFuGluSuR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(36)=results1(36) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
dcoup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
dcoup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(37)=results1(37) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
dcoup1 = dcplSdcSdVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1),dMSd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(38)=results1(38) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
dcoup1 = dcplSucSuVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1),dMSu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(39)=results1(39) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
dcoup1L = dcplcFdFdVGL(i3,i1,iv1)
dcoup1R = dcplcFdFdVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(40)=results1(40) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
coeffbar = 0.5_dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
dcoup1L = dcplcFuFuVGL(i3,i1,iv1)
dcoup1R = dcplcFuFuVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(41)=results1(41) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
coeffbar = 0.5_dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
dcoup1L = dcplGluGluVGL(iv1)
dcoup1R = dcplGluGluVGR(iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 24
results1(42)=results1(42) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
coeffbar = 0.5_dp
results1(42)=results1(42) + coeffbar*colorfactor*tempbar
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
dcoup1 = dcplVGVGVG(iv1)
coeff = 0.0000
colorfactor = 24
results1(43)=results1(43) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 27 ------ 
! ---- Ah,Sd ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(1)=results2(1) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
! ---- Ah,Se ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
dcoup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(2)=results2(2) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
! ---- Ah,Su ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
dcoup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
! ---- Ah,SvIm ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplAhAhSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSvIm2(i2),dMAh2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(4)=results2(4) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvIm, SvIm]' 
  End Do
End Do
! ---- Ah,SvRe ----
Do i1=1,4
 Do i2=1,6
coup1 = cplAhAhSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplAhAhSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSvRe2(i2),dMAh2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(5)=results2(5) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, SvRe, SvRe]' 
  End Do
End Do
! ---- hh,Sd ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
! ---- hh,Se ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
dcoup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(7)=results2(7) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
! ---- hh,Su ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
dcoup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(8)=results2(8) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
! ---- hh,SvIm ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplhhhhSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSvIm2(i2),dMhh2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(9)=results2(9) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvIm, SvIm]' 
  End Do
End Do
! ---- hh,SvRe ----
Do i1=1,4
 Do i2=1,6
coup1 = cplhhhhSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplhhhhSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSvRe2(i2),dMhh2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(10)=results2(10) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, SvRe, SvRe]' 
  End Do
End Do
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
dcoup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(11)=results2(11) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
dcoup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(12)=results2(12) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
dcoup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(13)=results2(13) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
! ---- Hpm,SvIm ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvImSvImcHpm(i1,i2,i2,i1)
dcoup1 = dcplHpmSvImSvImcHpm(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSvIm2(i2),dMHpm2(i1,iv1),dMSvIm2(i2,iv1)    & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(14)=results2(14) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvIm, SvIm, conj[Hpm]]' 
  End Do
End Do
! ---- Hpm,SvRe ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvReSvRecHpm(i1,i2,i2,i1)
dcoup1 = dcplHpmSvReSvRecHpm(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSvRe2(i2),dMHpm2(i1,iv1),dMSvRe2(i2,iv1)    & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(15)=results2(15) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, SvRe, SvRe, conj[Hpm]]' 
  End Do
End Do
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
dcoup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(16)=results2(16) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
dcoup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
dcoup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
dcoup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(19)=results2(19) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
! ---- Se,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvImSvImcSe(i1,i2,i2,i1)
dcoup1 = dcplSeSvImSvImcSe(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSvIm2(i2),dMSe2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(20)=results2(20) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvIm, SvIm, conj[Se]]' 
  End Do
End Do
! ---- Se,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvReSvRecSe(i1,i2,i2,i1)
dcoup1 = dcplSeSvReSvRecSe(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSvRe2(i2),dMSe2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(21)=results2(21) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, SvRe, SvRe, conj[Se]]' 
  End Do
End Do
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
dcoup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
! ---- Su,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvImSvImcSu(i1,i2,i2,i1)
dcoup1 = dcplSuSvImSvImcSu(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSvIm2(i2),dMSu2(i1,iv1),dMSvIm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(23)=results2(23) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvIm, SvIm, conj[Su]]' 
  End Do
End Do
! ---- Su,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvReSvRecSu(i1,i2,i2,i1)
dcoup1 = dcplSuSvReSvRecSu(i1,i2,i2,i1,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSvRe2(i2),dMSu2(i1,iv1),dMSvRe2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(24)=results2(24) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, SvRe, SvRe, conj[Su]]' 
  End Do
End Do
! ---- SvIm,SvIm ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvImSvIm(i1,i1,i2,i2)
dcoup1 = dcplSvImSvImSvImSvIm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvIm2(i1),MSvIm2(i2),dMSvIm2(i1,iv1),dMSvIm2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(25)=results2(25) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvIm, SvIm]' 
  End Do
End Do
! ---- SvIm,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvImSvImSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplSvImSvImSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvIm2(i1),MSvRe2(i2),dMSvIm2(i1,iv1),dMSvRe2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(26)=results2(26) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvIm, SvIm, SvRe, SvRe]' 
  End Do
End Do
! ---- SvRe,SvRe ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvReSvReSvReSvRe(i1,i1,i2,i2)
dcoup1 = dcplSvReSvReSvReSvRe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MSvRe2(i1),MSvRe2(i2),dMSvRe2(i1,iv1),dMSvRe2(i2,iv1)  & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(27)=results2(27) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[SvRe, SvRe, SvRe, SvRe]' 
  End Do
End Do
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
dcoup1 = dcplSdcSdVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(28)=results2(28) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
dcoup1 = dcplSucSuVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(29)=results2(29) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
result = sum(results1)+sum(results2) 


 
ti2L(iv1) = oo16pi2**2 * Real(result,dp) 
End Do 
End Subroutine FirstDerivativeEffPot2Loop 


Subroutine SecondDerivativeMassesCoups(i1,i2,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,            & 
& gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,               & 
& mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(4) 
Integer :: iout 
Integer, Intent(in) :: i1,i2 
vevs = (/vd,vu,x1,x2/) 
gout = partialDiffXY_RiddersMulDim(AllMassesCouplings,58390,vevs,i1,i2,4,err) 
If (err.gt.err2L) err2L = err 
End Subroutine SecondDerivativeMassesCoups

Subroutine FirstDerivativeMassesCoups(i1,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,            & 
& Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(4) 
Integer :: iout 
Integer, Intent(in) :: i1 
vevs = (/vd,vu,x1,x2/) 
gout = partialDiff_RiddersMulDim(AllMassesCouplings,58390,vevs,i1,4,err) 
If (err.gt.err2L) err2L = err 
End Subroutine FirstDerivativeMassesCoups

Subroutine AllMassesCouplings(vevs,gout) 
Implicit None 
Real(dp), Intent(out) :: gout(58390) 
Real(dp), Intent(in) :: vevs(4) 
Integer :: kont 
Real(dp) :: vd,vu,x1,x2

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
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Real(dp) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

vd=vevs(1) 
vu=vevs(2) 
x1=vevs(3) 
x2=vevs(4) 
Call WrapperForDerivatives(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,              & 
& Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,              & 
& mC22,MBBp,M1,M2,M3,MBp,gout)

End Subroutine 

Subroutine WrapperForDerivatives(vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,              & 
& Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,             & 
& mC12,mC22,MBBp,M1,M2,M3,MBp,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: vd,vu,x1,x2

Real(dp), Intent(out) :: gout(:) 
Integer :: kont 
Real(dp) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),             & 
& MSvRe2(6),Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MChi(7),MChi2(7),             & 
& MCha(2),MCha2(2),MFv(6),MFv2(6),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2

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
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.,kont)

Call CouplingsForEffPot3(Mu,Yd,Td,ZD,ZA,Ye,Te,ZE,Yu,Tu,ZU,MuP,Yx,Tx,Yv,               & 
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

Call CouplingsForEffPot4(Yd,ZD,ZA,Ye,ZE,Yu,ZU,Yx,Yv,ZVI,ZVR,ZH,ZP,g3,cplAhAhSdcSd,    & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,   & 
& cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,          & 
& cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm,cplSdSdcSdcSd,cplSdSecSdcSe,     & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,cplSeSvReSvRecSe,cplSuSucSucSu,           & 
& cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,cplSvImSvImSvReSvRe,             & 
& cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

Call MassesCoupsToG(MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,             & 
& Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,MFd,              & 
& MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,         & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG,gout)

End Subroutine WrapperForDerivatives

Subroutine MassesCoupsToG(MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,              & 
& MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,           & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,     & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG,g)

Implicit None 
Real(dp), Intent(out) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(in) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),             & 
& MSvRe2(6),Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MChi(7),MChi2(7),             & 
& MCha(2),MCha2(2),MFv(6),MFv2(6),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),           & 
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

Complex(dp),Intent(in) :: cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),cplAhAhSvImSvIm(4,4,6,6),& 
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

g(1:6) = MSd
g(7:12) = MSd2
g(13:18) = MSu
g(19:24) = MSu2
g(25:30) = MSe
g(31:36) = MSe2
g(37:42) = MSvIm
g(43:48) = MSvIm2
g(49:54) = MSvRe
g(55:60) = MSvRe2
g(61:64) = Mhh
g(65:68) = Mhh2
g(69:72) = MAh
g(73:76) = MAh2
g(77:78) = MHpm
g(79:80) = MHpm2
g(81:87) = MChi
g(88:94) = MChi2
g(95:96) = MCha
g(97:98) = MCha2
g(99:104) = MFv
g(105:110) = MFv2
g(111:113) = MFe
g(114:116) = MFe2
g(117:119) = MFd
g(120:122) = MFd2
g(123:125) = MFu
g(126:128) = MFu2
g(129) = MGlu
g(130) = MGlu2
g(131) = MVZ
g(132) = MVZp
g(133) = MVZ2
g(134) = MVZp2
g(135) = MVWm
g(136) = MVWm2
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+137) = Real(cplAhSdcSd(i1,i2,i3), dp) 
g(SumI+138) = Aimag(cplAhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+425) = Real(cplAhSecSe(i1,i2,i3), dp) 
g(SumI+426) = Aimag(cplAhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+713) = Real(cplAhSucSu(i1,i2,i3), dp) 
g(SumI+714) = Aimag(cplAhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1001) = Real(cplAhSvImSvIm(i1,i2,i3), dp) 
g(SumI+1002) = Aimag(cplAhSvImSvIm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1289) = Real(cplAhSvImSvRe(i1,i2,i3), dp) 
g(SumI+1290) = Aimag(cplAhSvImSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1577) = Real(cplAhSvReSvRe(i1,i2,i3), dp) 
g(SumI+1578) = Aimag(cplAhSvReSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1865) = Real(cplhhSdcSd(i1,i2,i3), dp) 
g(SumI+1866) = Aimag(cplhhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2153) = Real(cplhhSecSe(i1,i2,i3), dp) 
g(SumI+2154) = Aimag(cplhhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2441) = Real(cplhhSucSu(i1,i2,i3), dp) 
g(SumI+2442) = Aimag(cplhhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2729) = Real(cplhhSvImSvIm(i1,i2,i3), dp) 
g(SumI+2730) = Aimag(cplhhSvImSvIm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3017) = Real(cplhhSvImSvRe(i1,i2,i3), dp) 
g(SumI+3018) = Aimag(cplhhSvImSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3305) = Real(cplhhSvReSvRe(i1,i2,i3), dp) 
g(SumI+3306) = Aimag(cplhhSvReSvRe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3593) = Real(cplHpmSucSd(i1,i2,i3), dp) 
g(SumI+3594) = Aimag(cplHpmSucSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3737) = Real(cplHpmSvImcSe(i1,i2,i3), dp) 
g(SumI+3738) = Aimag(cplHpmSvImcSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3881) = Real(cplHpmSvRecSe(i1,i2,i3), dp) 
g(SumI+3882) = Aimag(cplHpmSvRecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+4025) = Real(cplSdcHpmcSu(i1,i2,i3), dp) 
g(SumI+4026) = Aimag(cplSdcHpmcSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
g(SumI+4169) = Real(cplSeSvImcHpm(i1,i2,i3), dp) 
g(SumI+4170) = Aimag(cplSeSvImcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
g(SumI+4313) = Real(cplSeSvRecHpm(i1,i2,i3), dp) 
g(SumI+4314) = Aimag(cplSeSvRecHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+4457) = Real(cplSdcSdVG(i1,i2), dp) 
g(SumI+4458) = Aimag(cplSdcSdVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+4529) = Real(cplSucSuVG(i1,i2), dp) 
g(SumI+4530) = Aimag(cplSucSuVG(i1,i2)) 
End Do 
End Do 

g(4601) = Real(cplVGVGVG,dp)  
g(4602) = Aimag(cplVGVGVG)  
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4603) = Real(cplcFdFdAhL(i1,i2,i3), dp) 
g(SumI+4604) = Aimag(cplcFdFdAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4675) = Real(cplcFdFdAhR(i1,i2,i3), dp) 
g(SumI+4676) = Aimag(cplcFdFdAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4747) = Real(cplcFeFeAhL(i1,i2,i3), dp) 
g(SumI+4748) = Aimag(cplcFeFeAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4819) = Real(cplcFeFeAhR(i1,i2,i3), dp) 
g(SumI+4820) = Aimag(cplcFeFeAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4891) = Real(cplcFuFuAhL(i1,i2,i3), dp) 
g(SumI+4892) = Aimag(cplcFuFuAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+4963) = Real(cplcFuFuAhR(i1,i2,i3), dp) 
g(SumI+4964) = Aimag(cplcFuFuAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+5035) = Real(cplFvFvAhL(i1,i2,i3), dp) 
g(SumI+5036) = Aimag(cplFvFvAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+5323) = Real(cplFvFvAhR(i1,i2,i3), dp) 
g(SumI+5324) = Aimag(cplFvFvAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+5611) = Real(cplChaFucSdL(i1,i2,i3), dp) 
g(SumI+5612) = Aimag(cplChaFucSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+5683) = Real(cplChaFucSdR(i1,i2,i3), dp) 
g(SumI+5684) = Aimag(cplChaFucSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+5755) = Real(cplFvChacSeL(i1,i2,i3), dp) 
g(SumI+5756) = Aimag(cplFvChacSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+5899) = Real(cplFvChacSeR(i1,i2,i3), dp) 
g(SumI+5900) = Aimag(cplFvChacSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6043) = Real(cplcFdChaSuL(i1,i2,i3), dp) 
g(SumI+6044) = Aimag(cplcFdChaSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6115) = Real(cplcFdChaSuR(i1,i2,i3), dp) 
g(SumI+6116) = Aimag(cplcFdChaSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6187) = Real(cplcFeChaSvImL(i1,i2,i3), dp) 
g(SumI+6188) = Aimag(cplcFeChaSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6259) = Real(cplcFeChaSvImR(i1,i2,i3), dp) 
g(SumI+6260) = Aimag(cplcFeChaSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6331) = Real(cplcFeChaSvReL(i1,i2,i3), dp) 
g(SumI+6332) = Aimag(cplcFeChaSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6403) = Real(cplcFeChaSvReR(i1,i2,i3), dp) 
g(SumI+6404) = Aimag(cplcFeChaSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+6475) = Real(cplChiFdcSdL(i1,i2,i3), dp) 
g(SumI+6476) = Aimag(cplChiFdcSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+6727) = Real(cplChiFdcSdR(i1,i2,i3), dp) 
g(SumI+6728) = Aimag(cplChiFdcSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+6979) = Real(cplChiFecSeL(i1,i2,i3), dp) 
g(SumI+6980) = Aimag(cplChiFecSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+7231) = Real(cplChiFecSeR(i1,i2,i3), dp) 
g(SumI+7232) = Aimag(cplChiFecSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+7483) = Real(cplChiFucSuL(i1,i2,i3), dp) 
g(SumI+7484) = Aimag(cplChiFucSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+7735) = Real(cplChiFucSuR(i1,i2,i3), dp) 
g(SumI+7736) = Aimag(cplChiFucSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+7987) = Real(cplChiFvSvImL(i1,i2,i3), dp) 
g(SumI+7988) = Aimag(cplChiFvSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+8491) = Real(cplChiFvSvImR(i1,i2,i3), dp) 
g(SumI+8492) = Aimag(cplChiFvSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+8995) = Real(cplChiFvSvReL(i1,i2,i3), dp) 
g(SumI+8996) = Aimag(cplChiFvSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+9499) = Real(cplChiFvSvReR(i1,i2,i3), dp) 
g(SumI+9500) = Aimag(cplChiFvSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+10003) = Real(cplcFdChiSdL(i1,i2,i3), dp) 
g(SumI+10004) = Aimag(cplcFdChiSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+10255) = Real(cplcFdChiSdR(i1,i2,i3), dp) 
g(SumI+10256) = Aimag(cplcFdChiSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+10507) = Real(cplcFeChiSeL(i1,i2,i3), dp) 
g(SumI+10508) = Aimag(cplcFeChiSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+10759) = Real(cplcFeChiSeR(i1,i2,i3), dp) 
g(SumI+10760) = Aimag(cplcFeChiSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+11011) = Real(cplcFuChiSuL(i1,i2,i3), dp) 
g(SumI+11012) = Aimag(cplcFuChiSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
g(SumI+11263) = Real(cplcFuChiSuR(i1,i2,i3), dp) 
g(SumI+11264) = Aimag(cplcFuChiSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+11515) = Real(cplGluFdcSdL(i1,i2), dp) 
g(SumI+11516) = Aimag(cplGluFdcSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+11551) = Real(cplGluFdcSdR(i1,i2), dp) 
g(SumI+11552) = Aimag(cplGluFdcSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+11587) = Real(cplcFdFdhhL(i1,i2,i3), dp) 
g(SumI+11588) = Aimag(cplcFdFdhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+11659) = Real(cplcFdFdhhR(i1,i2,i3), dp) 
g(SumI+11660) = Aimag(cplcFdFdhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+11731) = Real(cplcChaFdcSuL(i1,i2,i3), dp) 
g(SumI+11732) = Aimag(cplcChaFdcSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+11803) = Real(cplcChaFdcSuR(i1,i2,i3), dp) 
g(SumI+11804) = Aimag(cplcChaFdcSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+11875) = Real(cplcFuFdcHpmL(i1,i2,i3), dp) 
g(SumI+11876) = Aimag(cplcFuFdcHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+11911) = Real(cplcFuFdcHpmR(i1,i2,i3), dp) 
g(SumI+11912) = Aimag(cplcFuFdcHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+11947) = Real(cplFvFecHpmL(i1,i2,i3), dp) 
g(SumI+11948) = Aimag(cplFvFecHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+12019) = Real(cplFvFecHpmR(i1,i2,i3), dp) 
g(SumI+12020) = Aimag(cplFvFecHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+12091) = Real(cplcFeFehhL(i1,i2,i3), dp) 
g(SumI+12092) = Aimag(cplcFeFehhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+12163) = Real(cplcFeFehhR(i1,i2,i3), dp) 
g(SumI+12164) = Aimag(cplcFeFehhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12235) = Real(cplcChaFeSvImL(i1,i2,i3), dp) 
g(SumI+12236) = Aimag(cplcChaFeSvImL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12307) = Real(cplcChaFeSvImR(i1,i2,i3), dp) 
g(SumI+12308) = Aimag(cplcChaFeSvImR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12379) = Real(cplcChaFeSvReL(i1,i2,i3), dp) 
g(SumI+12380) = Aimag(cplcChaFeSvReL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12451) = Real(cplcChaFeSvReR(i1,i2,i3), dp) 
g(SumI+12452) = Aimag(cplcChaFeSvReR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+12523) = Real(cplGluFucSuL(i1,i2), dp) 
g(SumI+12524) = Aimag(cplGluFucSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+12559) = Real(cplGluFucSuR(i1,i2), dp) 
g(SumI+12560) = Aimag(cplGluFucSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+12595) = Real(cplcFuFuhhL(i1,i2,i3), dp) 
g(SumI+12596) = Aimag(cplcFuFuhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
g(SumI+12667) = Real(cplcFuFuhhR(i1,i2,i3), dp) 
g(SumI+12668) = Aimag(cplcFuFuhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+12739) = Real(cplcFdFuHpmL(i1,i2,i3), dp) 
g(SumI+12740) = Aimag(cplcFdFuHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+12775) = Real(cplcFdFuHpmR(i1,i2,i3), dp) 
g(SumI+12776) = Aimag(cplcFdFuHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+12811) = Real(cplFvFvhhL(i1,i2,i3), dp) 
g(SumI+12812) = Aimag(cplFvFvhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+13099) = Real(cplFvFvhhR(i1,i2,i3), dp) 
g(SumI+13100) = Aimag(cplFvFvhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
g(SumI+13387) = Real(cplcFeFvHpmL(i1,i2,i3), dp) 
g(SumI+13388) = Aimag(cplcFeFvHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
g(SumI+13459) = Real(cplcFeFvHpmR(i1,i2,i3), dp) 
g(SumI+13460) = Aimag(cplcFeFvHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+13531) = Real(cplcChaFvSeL(i1,i2,i3), dp) 
g(SumI+13532) = Aimag(cplcChaFvSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+13675) = Real(cplcChaFvSeR(i1,i2,i3), dp) 
g(SumI+13676) = Aimag(cplcChaFvSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+13819) = Real(cplcFdGluSdL(i1,i2), dp) 
g(SumI+13820) = Aimag(cplcFdGluSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+13855) = Real(cplcFdGluSdR(i1,i2), dp) 
g(SumI+13856) = Aimag(cplcFdGluSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+13891) = Real(cplcFuGluSuL(i1,i2), dp) 
g(SumI+13892) = Aimag(cplcFuGluSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+13927) = Real(cplcFuGluSuR(i1,i2), dp) 
g(SumI+13928) = Aimag(cplcFuGluSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+13963) = Real(cplcChacFuSdL(i1,i2,i3), dp) 
g(SumI+13964) = Aimag(cplcChacFuSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+14035) = Real(cplcChacFuSdR(i1,i2,i3), dp) 
g(SumI+14036) = Aimag(cplcChacFuSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14107) = Real(cplcFdFdVGL(i1,i2), dp) 
g(SumI+14108) = Aimag(cplcFdFdVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14125) = Real(cplcFdFdVGR(i1,i2), dp) 
g(SumI+14126) = Aimag(cplcFdFdVGR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14143) = Real(cplcFuFuVGL(i1,i2), dp) 
g(SumI+14144) = Aimag(cplcFuFuVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14161) = Real(cplcFuFuVGR(i1,i2), dp) 
g(SumI+14162) = Aimag(cplcFuFuVGR(i1,i2)) 
End Do 
End Do 

g(14179) = Real(cplGluGluVGL,dp)  
g(14180) = Aimag(cplGluGluVGL)  
g(14181) = Real(cplGluGluVGR,dp)  
g(14182) = Aimag(cplGluGluVGR)  
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+14183) = Real(cplAhAhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+14184) = Aimag(cplAhAhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+15335) = Real(cplAhAhSecSe(i1,i2,i3,i4), dp) 
g(SumI+15336) = Aimag(cplAhAhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+16487) = Real(cplAhAhSucSu(i1,i2,i3,i4), dp) 
g(SumI+16488) = Aimag(cplAhAhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+17639) = Real(cplAhAhSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+17640) = Aimag(cplAhAhSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+18791) = Real(cplAhAhSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+18792) = Aimag(cplAhAhSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+19943) = Real(cplhhhhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+19944) = Aimag(cplhhhhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+21095) = Real(cplhhhhSecSe(i1,i2,i3,i4), dp) 
g(SumI+21096) = Aimag(cplhhhhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+22247) = Real(cplhhhhSucSu(i1,i2,i3,i4), dp) 
g(SumI+22248) = Aimag(cplhhhhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+23399) = Real(cplhhhhSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+23400) = Aimag(cplhhhhSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
g(SumI+24551) = Real(cplhhhhSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+24552) = Aimag(cplhhhhSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+25703) = Real(cplHpmSdcHpmcSd(i1,i2,i3,i4), dp) 
g(SumI+25704) = Aimag(cplHpmSdcHpmcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+25991) = Real(cplHpmSecHpmcSe(i1,i2,i3,i4), dp) 
g(SumI+25992) = Aimag(cplHpmSecHpmcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+26279) = Real(cplHpmSucHpmcSu(i1,i2,i3,i4), dp) 
g(SumI+26280) = Aimag(cplHpmSucHpmcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+26567) = Real(cplHpmSvImSvImcHpm(i1,i2,i3,i4), dp) 
g(SumI+26568) = Aimag(cplHpmSvImSvImcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+26855) = Real(cplHpmSvReSvRecHpm(i1,i2,i3,i4), dp) 
g(SumI+26856) = Aimag(cplHpmSvReSvRecHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+27143) = Real(cplSdSdcSdcSd(i1,i2,i3,i4), dp) 
g(SumI+27144) = Aimag(cplSdSdcSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+29735) = Real(cplSdSecSdcSe(i1,i2,i3,i4), dp) 
g(SumI+29736) = Aimag(cplSdSecSdcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+32327) = Real(cplSdSucSdcSu(i1,i2,i3,i4), dp) 
g(SumI+32328) = Aimag(cplSdSucSdcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+34919) = Real(cplSeSecSecSe(i1,i2,i3,i4), dp) 
g(SumI+34920) = Aimag(cplSeSecSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+37511) = Real(cplSeSvImSvImcSe(i1,i2,i3,i4), dp) 
g(SumI+37512) = Aimag(cplSeSvImSvImcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+40103) = Real(cplSeSvReSvRecSe(i1,i2,i3,i4), dp) 
g(SumI+40104) = Aimag(cplSeSvReSvRecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+42695) = Real(cplSuSucSucSu(i1,i2,i3,i4), dp) 
g(SumI+42696) = Aimag(cplSuSucSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+45287) = Real(cplSuSvImSvImcSu(i1,i2,i3,i4), dp) 
g(SumI+45288) = Aimag(cplSuSvImSvImcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+47879) = Real(cplSuSvReSvRecSu(i1,i2,i3,i4), dp) 
g(SumI+47880) = Aimag(cplSuSvReSvRecSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+50471) = Real(cplSvImSvImSvImSvIm(i1,i2,i3,i4), dp) 
g(SumI+50472) = Aimag(cplSvImSvImSvImSvIm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+53063) = Real(cplSvImSvImSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+53064) = Aimag(cplSvImSvImSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+55655) = Real(cplSvReSvReSvReSvRe(i1,i2,i3,i4), dp) 
g(SumI+55656) = Aimag(cplSvReSvReSvReSvRe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+58247) = Real(cplSdcSdVGVG(i1,i2), dp) 
g(SumI+58248) = Aimag(cplSdcSdVGVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+58319) = Real(cplSucSuVGVG(i1,i2), dp) 
g(SumI+58320) = Aimag(cplSucSuVGVG(i1,i2)) 
End Do 
End Do 

End Subroutine MassesCoupsToG

Subroutine GToMassesCoups(g,MSd,MSd2,MSu,MSu2,MSe,MSe2,MSvIm,MSvIm2,MSvRe,            & 
& MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,MCha2,MFv,MFv2,MFe,MFe2,           & 
& MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhSdcSd,cplAhSecSe,     & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplhhSdcSd,cplhhSecSe,            & 
& cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSucSd,cplHpmSvImcSe,        & 
& cplHpmSvRecSe,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplSdcSdVG,cplSucSuVG,          & 
& cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplFvFvAhL,cplFvFvAhR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,             & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplFvFvhhL,cplFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,             & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& cplcChacFuSdL,cplcChacFuSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvImSvIm,      & 
& cplAhAhSvReSvRe,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvImSvIm,cplhhhhSvReSvRe,& 
& cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvImSvImcHpm,cplHpmSvReSvRecHpm, & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvImSvImcSe,              & 
& cplSeSvReSvRecSe,cplSuSucSucSu,cplSuSvImSvImcSu,cplSuSvReSvRecSu,cplSvImSvImSvImSvIm,  & 
& cplSvImSvImSvReSvRe,cplSvReSvReSvReSvRe,cplSdcSdVGVG,cplSucSuVGVG)

Implicit None 
Real(dp), Intent(in) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(inout) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),MSvIm(6),MSvIm2(6),MSvRe(6),             & 
& MSvRe2(6),Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(2),MHpm2(2),MChi(7),MChi2(7),             & 
& MCha(2),MCha2(2),MFv(6),MFv2(6),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2

Complex(dp),Intent(inout) :: cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),cplAhSvImSvIm(4,6,6),           & 
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

Complex(dp),Intent(inout) :: cplAhAhSdcSd(4,4,6,6),cplAhAhSecSe(4,4,6,6),cplAhAhSucSu(4,4,6,6),cplAhAhSvImSvIm(4,4,6,6),& 
& cplAhAhSvReSvRe(4,4,6,6),cplhhhhSdcSd(4,4,6,6),cplhhhhSecSe(4,4,6,6),cplhhhhSucSu(4,4,6,6),& 
& cplhhhhSvImSvIm(4,4,6,6),cplhhhhSvReSvRe(4,4,6,6),cplHpmSdcHpmcSd(2,6,2,6),            & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvImSvImcHpm(2,6,6,2),         & 
& cplHpmSvReSvRecHpm(2,6,6,2),cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),             & 
& cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),cplSeSvImSvImcSe(6,6,6,6),               & 
& cplSeSvReSvRecSe(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvImSvImcSu(6,6,6,6),            & 
& cplSuSvReSvRecSu(6,6,6,6),cplSvImSvImSvImSvIm(6,6,6,6),cplSvImSvImSvReSvRe(6,6,6,6),   & 
& cplSvReSvReSvReSvRe(6,6,6,6),cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

MSd=g(1:6) 
MSd2=g(7:12) 
MSu=g(13:18) 
MSu2=g(19:24) 
MSe=g(25:30) 
MSe2=g(31:36) 
MSvIm=g(37:42) 
MSvIm2=g(43:48) 
MSvRe=g(49:54) 
MSvRe2=g(55:60) 
Mhh=g(61:64) 
Mhh2=g(65:68) 
MAh=g(69:72) 
MAh2=g(73:76) 
MHpm=g(77:78) 
MHpm2=g(79:80) 
MChi=g(81:87) 
MChi2=g(88:94) 
MCha=g(95:96) 
MCha2=g(97:98) 
MFv=g(99:104) 
MFv2=g(105:110) 
MFe=g(111:113) 
MFe2=g(114:116) 
MFd=g(117:119) 
MFd2=g(120:122) 
MFu=g(123:125) 
MFu2=g(126:128) 
MGlu=g(129) 
MGlu2=g(130) 
MVZ=g(131) 
MVZp=g(132) 
MVZ2=g(133) 
MVZp2=g(134) 
MVWm=g(135) 
MVWm2=g(136) 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSdcSd(i1,i2,i3) = Cmplx( g(SumI+137), g(SumI+138), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSecSe(i1,i2,i3) = Cmplx( g(SumI+425), g(SumI+426), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSucSu(i1,i2,i3) = Cmplx( g(SumI+713), g(SumI+714), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSvImSvIm(i1,i2,i3) = Cmplx( g(SumI+1001), g(SumI+1002), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSvImSvRe(i1,i2,i3) = Cmplx( g(SumI+1289), g(SumI+1290), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSvReSvRe(i1,i2,i3) = Cmplx( g(SumI+1577), g(SumI+1578), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSdcSd(i1,i2,i3) = Cmplx( g(SumI+1865), g(SumI+1866), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSecSe(i1,i2,i3) = Cmplx( g(SumI+2153), g(SumI+2154), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSucSu(i1,i2,i3) = Cmplx( g(SumI+2441), g(SumI+2442), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSvImSvIm(i1,i2,i3) = Cmplx( g(SumI+2729), g(SumI+2730), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSvImSvRe(i1,i2,i3) = Cmplx( g(SumI+3017), g(SumI+3018), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSvReSvRe(i1,i2,i3) = Cmplx( g(SumI+3305), g(SumI+3306), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSucSd(i1,i2,i3) = Cmplx( g(SumI+3593), g(SumI+3594), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSvImcSe(i1,i2,i3) = Cmplx( g(SumI+3737), g(SumI+3738), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSvRecSe(i1,i2,i3) = Cmplx( g(SumI+3881), g(SumI+3882), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplSdcHpmcSu(i1,i2,i3) = Cmplx( g(SumI+4025), g(SumI+4026), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
cplSeSvImcHpm(i1,i2,i3) = Cmplx( g(SumI+4169), g(SumI+4170), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
cplSeSvRecHpm(i1,i2,i3) = Cmplx( g(SumI+4313), g(SumI+4314), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVG(i1,i2) = Cmplx( g(SumI+4457), g(SumI+4458), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVG(i1,i2) = Cmplx( g(SumI+4529), g(SumI+4530), dp) 
End Do 
 End Do 
 
cplVGVGVG= Cmplx(g(4601),g(4602),dp) 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFdFdAhL(i1,i2,i3) = Cmplx( g(SumI+4603), g(SumI+4604), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFdFdAhR(i1,i2,i3) = Cmplx( g(SumI+4675), g(SumI+4676), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFeFeAhL(i1,i2,i3) = Cmplx( g(SumI+4747), g(SumI+4748), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFeFeAhR(i1,i2,i3) = Cmplx( g(SumI+4819), g(SumI+4820), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFuFuAhL(i1,i2,i3) = Cmplx( g(SumI+4891), g(SumI+4892), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFuFuAhR(i1,i2,i3) = Cmplx( g(SumI+4963), g(SumI+4964), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplFvFvAhL(i1,i2,i3) = Cmplx( g(SumI+5035), g(SumI+5036), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplFvFvAhR(i1,i2,i3) = Cmplx( g(SumI+5323), g(SumI+5324), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdL(i1,i2,i3) = Cmplx( g(SumI+5611), g(SumI+5612), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdR(i1,i2,i3) = Cmplx( g(SumI+5683), g(SumI+5684), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplFvChacSeL(i1,i2,i3) = Cmplx( g(SumI+5755), g(SumI+5756), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplFvChacSeR(i1,i2,i3) = Cmplx( g(SumI+5899), g(SumI+5900), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuL(i1,i2,i3) = Cmplx( g(SumI+6043), g(SumI+6044), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuR(i1,i2,i3) = Cmplx( g(SumI+6115), g(SumI+6116), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvImL(i1,i2,i3) = Cmplx( g(SumI+6187), g(SumI+6188), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvImR(i1,i2,i3) = Cmplx( g(SumI+6259), g(SumI+6260), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvReL(i1,i2,i3) = Cmplx( g(SumI+6331), g(SumI+6332), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvReR(i1,i2,i3) = Cmplx( g(SumI+6403), g(SumI+6404), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdL(i1,i2,i3) = Cmplx( g(SumI+6475), g(SumI+6476), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdR(i1,i2,i3) = Cmplx( g(SumI+6727), g(SumI+6728), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeL(i1,i2,i3) = Cmplx( g(SumI+6979), g(SumI+6980), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeR(i1,i2,i3) = Cmplx( g(SumI+7231), g(SumI+7232), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuL(i1,i2,i3) = Cmplx( g(SumI+7483), g(SumI+7484), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuR(i1,i2,i3) = Cmplx( g(SumI+7735), g(SumI+7736), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplChiFvSvImL(i1,i2,i3) = Cmplx( g(SumI+7987), g(SumI+7988), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplChiFvSvImR(i1,i2,i3) = Cmplx( g(SumI+8491), g(SumI+8492), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplChiFvSvReL(i1,i2,i3) = Cmplx( g(SumI+8995), g(SumI+8996), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,7
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplChiFvSvReR(i1,i2,i3) = Cmplx( g(SumI+9499), g(SumI+9500), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFdChiSdL(i1,i2,i3) = Cmplx( g(SumI+10003), g(SumI+10004), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFdChiSdR(i1,i2,i3) = Cmplx( g(SumI+10255), g(SumI+10256), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFeChiSeL(i1,i2,i3) = Cmplx( g(SumI+10507), g(SumI+10508), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFeChiSeR(i1,i2,i3) = Cmplx( g(SumI+10759), g(SumI+10760), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFuChiSuL(i1,i2,i3) = Cmplx( g(SumI+11011), g(SumI+11012), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,7
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*42
SumI = SumI*2 
cplcFuChiSuR(i1,i2,i3) = Cmplx( g(SumI+11263), g(SumI+11264), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdL(i1,i2) = Cmplx( g(SumI+11515), g(SumI+11516), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdR(i1,i2) = Cmplx( g(SumI+11551), g(SumI+11552), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFdFdhhL(i1,i2,i3) = Cmplx( g(SumI+11587), g(SumI+11588), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFdFdhhR(i1,i2,i3) = Cmplx( g(SumI+11659), g(SumI+11660), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuL(i1,i2,i3) = Cmplx( g(SumI+11731), g(SumI+11732), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuR(i1,i2,i3) = Cmplx( g(SumI+11803), g(SumI+11804), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmL(i1,i2,i3) = Cmplx( g(SumI+11875), g(SumI+11876), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmR(i1,i2,i3) = Cmplx( g(SumI+11911), g(SumI+11912), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplFvFecHpmL(i1,i2,i3) = Cmplx( g(SumI+11947), g(SumI+11948), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplFvFecHpmR(i1,i2,i3) = Cmplx( g(SumI+12019), g(SumI+12020), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFeFehhL(i1,i2,i3) = Cmplx( g(SumI+12091), g(SumI+12092), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFeFehhR(i1,i2,i3) = Cmplx( g(SumI+12163), g(SumI+12164), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFeSvImL(i1,i2,i3) = Cmplx( g(SumI+12235), g(SumI+12236), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFeSvImR(i1,i2,i3) = Cmplx( g(SumI+12307), g(SumI+12308), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFeSvReL(i1,i2,i3) = Cmplx( g(SumI+12379), g(SumI+12380), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFeSvReR(i1,i2,i3) = Cmplx( g(SumI+12451), g(SumI+12452), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuL(i1,i2) = Cmplx( g(SumI+12523), g(SumI+12524), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuR(i1,i2) = Cmplx( g(SumI+12559), g(SumI+12560), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFuFuhhL(i1,i2,i3) = Cmplx( g(SumI+12595), g(SumI+12596), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*12
SumI = SumI*2 
cplcFuFuhhR(i1,i2,i3) = Cmplx( g(SumI+12667), g(SumI+12668), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmL(i1,i2,i3) = Cmplx( g(SumI+12739), g(SumI+12740), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmR(i1,i2,i3) = Cmplx( g(SumI+12775), g(SumI+12776), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplFvFvhhL(i1,i2,i3) = Cmplx( g(SumI+12811), g(SumI+12812), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,4
SumI = (i3-1) + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplFvFvhhR(i1,i2,i3) = Cmplx( g(SumI+13099), g(SumI+13100), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
cplcFeFvHpmL(i1,i2,i3) = Cmplx( g(SumI+13387), g(SumI+13388), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*12
SumI = SumI*2 
cplcFeFvHpmR(i1,i2,i3) = Cmplx( g(SumI+13459), g(SumI+13460), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplcChaFvSeL(i1,i2,i3) = Cmplx( g(SumI+13531), g(SumI+13532), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplcChaFvSeR(i1,i2,i3) = Cmplx( g(SumI+13675), g(SumI+13676), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdL(i1,i2) = Cmplx( g(SumI+13819), g(SumI+13820), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdR(i1,i2) = Cmplx( g(SumI+13855), g(SumI+13856), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuL(i1,i2) = Cmplx( g(SumI+13891), g(SumI+13892), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuR(i1,i2) = Cmplx( g(SumI+13927), g(SumI+13928), dp) 
End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdL(i1,i2,i3) = Cmplx( g(SumI+13963), g(SumI+13964), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdR(i1,i2,i3) = Cmplx( g(SumI+14035), g(SumI+14036), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGL(i1,i2) = Cmplx( g(SumI+14107), g(SumI+14108), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGR(i1,i2) = Cmplx( g(SumI+14125), g(SumI+14126), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGL(i1,i2) = Cmplx( g(SumI+14143), g(SumI+14144), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGR(i1,i2) = Cmplx( g(SumI+14161), g(SumI+14162), dp) 
End Do 
 End Do 
 
cplGluGluVGL= Cmplx(g(14179),g(14180),dp) 
cplGluGluVGR= Cmplx(g(14181),g(14182),dp) 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplAhAhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+14183), g(SumI+14184), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplAhAhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+15335), g(SumI+15336), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplAhAhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+16487), g(SumI+16488), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplAhAhSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+17639), g(SumI+17640), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplAhAhSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+18791), g(SumI+18792), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplhhhhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+19943), g(SumI+19944), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplhhhhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+21095), g(SumI+21096), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplhhhhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+22247), g(SumI+22248), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplhhhhSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+23399), g(SumI+23400), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,4
Do i2 = 1,4
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*144
SumI = SumI*2 
cplhhhhSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+24551), g(SumI+24552), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSdcHpmcSd(i1,i2,i3,i4) = Cmplx( g(SumI+25703), g(SumI+25704), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSecHpmcSe(i1,i2,i3,i4) = Cmplx( g(SumI+25991), g(SumI+25992), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSucHpmcSu(i1,i2,i3,i4) = Cmplx( g(SumI+26279), g(SumI+26280), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSvImSvImcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+26567), g(SumI+26568), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSvReSvRecHpm(i1,i2,i3,i4) = Cmplx( g(SumI+26855), g(SumI+26856), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSdcSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+27143), g(SumI+27144), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSecSdcSe(i1,i2,i3,i4) = Cmplx( g(SumI+29735), g(SumI+29736), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSucSdcSu(i1,i2,i3,i4) = Cmplx( g(SumI+32327), g(SumI+32328), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSecSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+34919), g(SumI+34920), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSvImSvImcSe(i1,i2,i3,i4) = Cmplx( g(SumI+37511), g(SumI+37512), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSvReSvRecSe(i1,i2,i3,i4) = Cmplx( g(SumI+40103), g(SumI+40104), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSucSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+42695), g(SumI+42696), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSvImSvImcSu(i1,i2,i3,i4) = Cmplx( g(SumI+45287), g(SumI+45288), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSvReSvRecSu(i1,i2,i3,i4) = Cmplx( g(SumI+47879), g(SumI+47880), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSvImSvImSvImSvIm(i1,i2,i3,i4) = Cmplx( g(SumI+50471), g(SumI+50472), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSvImSvImSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+53063), g(SumI+53064), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSvReSvReSvReSvRe(i1,i2,i3,i4) = Cmplx( g(SumI+55655), g(SumI+55656), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVGVG(i1,i2) = Cmplx( g(SumI+58247), g(SumI+58248), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVGVG(i1,i2) = Cmplx( g(SumI+58319), g(SumI+58320), dp) 
End Do 
 End Do 
 
End Subroutine GToMassesCoups

End Module EffectivePotential_BLSSM 
 
