! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:23 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_BLSSM 
 
Use Model_Data_BLSSM 
Use TreeLevelMasses_BLSSM 
Use RGEs_BLSSM 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,             & 
& Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,           & 
& M1,M2,M3,MBp,vd,vu,x1,x2,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp) :: Abs2Mu,Abs2MuP

Complex(dp), Intent(in) :: Tad1Loop(10)

! For numerical routines 
Real(dp) :: gC(320)
logical :: broycheck 
Real(dp) :: broyx(4)

Abs2Mu =  0._dp 
Abs2MuP =  0._dp 
If (HighScaleModel.Eq."LOW") Then 
mHd2 = (-(g1**2*vd**3) - gYB**2*vd**3 - g2**2*vd**3 + g1**2*vd*vu**2 + gYB**2*vd*vu**2 +     & 
&  g2**2*vd*vu**2 - 2*gYB*gBL*vd*x1**2 - 2*g1*gBY*vd*x1**2 + 2*gYB*gBL*vd*x2**2 +        & 
&  2*g1*gBY*vd*x2**2 + 4*vu*Bmu - 8*vd*Mu*Conjg(Mu) + 4*vu*Conjg(Bmu) + 8*Tad1Loop(1))/(8._dp*vd)
mHu2 = (g1**2*vd**2*vu + gYB**2*vd**2*vu + g2**2*vd**2*vu - g1**2*vu**3 - gYB**2*vu**3 -     & 
&  g2**2*vu**3 + 2*gYB*gBL*vu*x1**2 + 2*g1*gBY*vu*x1**2 - 2*gYB*gBL*vu*x2**2 -           & 
&  2*g1*gBY*vu*x2**2 + 4*vd*Bmu - 8*vu*Mu*Conjg(Mu) + 4*vd*Conjg(Bmu) + 8*Tad1Loop(2))/(8._dp*vu)
mC12 = (-(gYB*gBL*vd**2*x1) - g1*gBY*vd**2*x1 + gYB*gBL*vu**2*x1 + g1*gBY*vu**2*x1 -         & 
&  2*gBL**2*x1**3 - 2*gBY**2*x1**3 + 2*gBL**2*x1*x2**2 + 2*gBY**2*x1*x2**2 +             & 
&  2*x2*BMuP - 4*MuP*x1*Conjg(MuP) + 2*x2*Conjg(BMuP) + 4*Tad1Loop(3))/(4._dp*x1)
mC22 = (gYB*gBL*vd**2*x2 + g1*gBY*vd**2*x2 - gYB*gBL*vu**2*x2 - g1*gBY*vu**2*x2 +            & 
&  2*gBL**2*x1**2*x2 + 2*gBY**2*x1**2*x2 - 2*gBL**2*x2**3 - 2*gBY**2*x2**3 +             & 
&  2*x1*BMuP - 4*MuP*x2*Conjg(MuP) + 2*x1*Conjg(BMuP) + 4*Tad1Loop(4))/(4._dp*x2)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mHd2.ne.mHd2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHd2" 
   Call TerminateProgram  
 End If 
 If (mHu2.ne.mHu2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHu2" 
   Call TerminateProgram  
 End If 
 If (mC12.ne.mC12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mC12" 
   Call TerminateProgram  
 End If 
 If (mC22.ne.mC22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mC22" 
   Call TerminateProgram  
 End If 
 
 ! Check for positive abs-squared 
Else 
Bmu = (-4*mHd2*vd*vu + 4*mHu2*vd*vu - g1**2*vd**3*vu - gYB**2*vd**3*vu - g2**2*vd**3*vu +   & 
&  g1**2*vd*vu**3 + gYB**2*vd*vu**3 + g2**2*vd*vu**3 - 2*gYB*gBL*vd*vu*x1**2 -           & 
&  2*g1*gBY*vd*vu*x1**2 + 2*gYB*gBL*vd*vu*x2**2 + 2*g1*gBY*vd*vu*x2**2 + 4*vu*Tad1Loop(1) -& 
&  4*vd*Tad1Loop(2))/(4._dp*(vd**2 - vu**2))
BMuP = (-2*mC12*x1*x2 + 2*mC22*x1*x2 - gYB*gBL*vd**2*x1*x2 - g1*gBY*vd**2*x1*x2 +            & 
&  gYB*gBL*vu**2*x1*x2 + g1*gBY*vu**2*x1*x2 - 2*gBL**2*x1**3*x2 - 2*gBY**2*x1**3*x2 +    & 
&  2*gBL**2*x1*x2**3 + 2*gBY**2*x1*x2**3 + 2*x2*Tad1Loop(3) - 2*x1*Tad1Loop(4))/(2._dp*(x1**2 - x2**2))
Abs2Mu = (-8*mHd2*vd**2 - gYB**2*vd**4 - g2**2*vd**4 + 8*mHu2*vu**2 + gYB**2*vu**4 +           & 
&  g2**2*vu**4 + g1**2*(-vd**4 + vu**4) - 2*gYB*gBL*vd**2*x1**2 - 2*gYB*gBL*vu**2*x1**2 +& 
&  2*gYB*gBL*vd**2*x2**2 + 2*gYB*gBL*vu**2*x2**2 - 2*g1*gBY*(vd**2 + vu**2)*(x1**2 -     & 
&  x2**2) + 8*vd*Tad1Loop(1) - 8*vu*Tad1Loop(2))/(8._dp*(vd**2 - vu**2))
Mu = Sqrt(Abs2Mu)*SignumMu
Abs2MuP = -(4*mC12*x1**2 + g1*gBY*vd**2*x1**2 - g1*gBY*vu**2*x1**2 + 2*gBL**2*x1**4 +           & 
&  2*gBY**2*x1**4 - 4*mC22*x2**2 + g1*gBY*vd**2*x2**2 - g1*gBY*vu**2*x2**2 -             & 
&  2*gBL**2*x2**4 - 2*gBY**2*x2**4 + gYB*gBL*(vd**2 - vu**2)*(x1**2 + x2**2) -           & 
&  4*x1*Tad1Loop(3) + 4*x2*Tad1Loop(4))/(4._dp*(x1**2 - x2**2))
MuP = Sqrt(Abs2MuP)*SignumMuP

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Bmu,dp).ne.Real(Bmu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Bmu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Bmu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Bmu" 
   !Call TerminateProgram  
   Bmu = Real(Bmu,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(BMuP,dp).ne.Real(BMuP,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for BMuP" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(BMuP)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for BMuP" 
   !Call TerminateProgram  
   BMuP = Real(BMuP,dp) 
  SignOfMuChanged= .True. 
End If 
 
 ! Check for positive abs-squared 
If (Abs2Mu.Lt.0._dp) Then 
Write(*,*) "No consistent solution found for tadpoles: " 
Write(*,*) "Negative absolute squared: ,Abs2Mu "   
Write(*,*) "Result: ",Abs2Mu 
Abs2Mu = Abs(Abs2Mu)  
Mu = SignumMu* sqrt(Abs2Mu) 
SignOfMuChanged = .True.  
End If 
If (Abs2MuP.Lt.0._dp) Then 
Write(*,*) "No consistent solution found for tadpoles: " 
Write(*,*) "Negative absolute squared: ,Abs2MuP "   
Write(*,*) "Result: ",Abs2MuP 
Abs2MuP = Abs(Abs2MuP)  
MuP = SignumMuP* sqrt(Abs2MuP) 
SignOfMuChanged = .True.  
End If 
End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,              & 
& Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,              & 
& M1,M2,M3,MBp,vd,vu,x1,x2,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Complex(dp), Intent(in) :: Tad1Loop(4)

Real(dp), Intent(out) :: TadpoleValues(4)

TadpoleValues(1) = Real(((g1**2 + gYB**2 + g2**2)*vd**3 - 8*Bmu*vu + vd*(-((g1**2 + gYB**2 + g2**2)& 
& *vu**2) + 2*(4._dp*(mHd2) + (gYB*gBL + g1*gBY)*x1**2 - (gYB*gBL + g1*gBY)              & 
& *x2**2) + 8*Mu**2))/8._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((-8*Bmu*vd + vu*(8._dp*(mHu2) - (g1**2 + gYB**2 + g2**2)      & 
& *vd**2 + g1**2*vu**2 + gYB**2*vu**2 + g2**2*vu**2 - 2*gYB*gBL*x1**2 - 2*g1*gBY*x1**2 + 2*gYB*gBL*x2**2 + 2*g1*gBY*x2**2 + 8*Mu**2))& 
& /8._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((2*(gBL**2 + gBY**2)*x1**3 - 4*BMuP*x2 + x1*(4._dp*(mC12)     & 
&  + 4*MuP**2 + (gYB*gBL + g1*gBY)*vd**2 - gYB*gBL*vu**2 - g1*gBY*vu**2 - 2*gBL**2*x2**2 - 2*gBY**2*x2**2))& 
& /4._dp - Tad1Loop(3),dp) 
TadpoleValues(4) = Real((-4*BMuP*x1 + x2*(4._dp*(mC22) + 4*MuP**2 - (gYB*gBL + g1*gBY)& 
& *vd**2 + gYB*gBL*vu**2 + g1*gBY*vu**2 - 2*gBL**2*x1**2 - 2*gBY**2*x1**2 + 2*gBL**2*x2**2 + 2*gBY**2*x2**2))& 
& /4._dp - Tad1Loop(4),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_BLSSM 
 
