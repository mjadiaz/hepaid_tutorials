! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:46 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module RGEs_BLSSM 
 
Use Control 
Use Settings 
Use Model_Data_BLSSM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters96(g,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv)

Implicit None 
Real(dp), Intent(in) :: g(96) 
Real(dp),Intent(out) :: g1,g2,g3,gBL,gYB,gBY

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters96' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
gBL= g(4) 
gYB= g(5) 
gBY= g(6) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+7), g(SumI+8), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+25), g(SumI+26), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yx(i1,i2) = Cmplx( g(SumI+61), g(SumI+62), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+79), g(SumI+80), dp) 
End Do 
 End Do 
 
Do i1=1,96 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters96

Subroutine ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,g)

Implicit None 
Real(dp), Intent(out) :: g(96) 
Real(dp), Intent(in) :: g1,g2,g3,gBL,gYB,gBY

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG96' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = gBL  
g(5) = gYB  
g(6) = gBY  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+7) = Real(Yd(i1,i2), dp) 
g(SumI+8) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+25) = Real(Ye(i1,i2), dp) 
g(SumI+26) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yu(i1,i2), dp) 
g(SumI+44) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+61) = Real(Yx(i1,i2), dp) 
g(SumI+62) = Aimag(Yx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+79) = Real(Yv(i1,i2), dp) 
g(SumI+80) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

Iname = Iname - 1 
 
End Subroutine ParametersToG96

Subroutine rge96(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,gBL,betagBL1,betagBL2,DgBL,gYB,betagYB1,betagYB2,DgYB,gBY,betagBY1,betagBY2,DgBY
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yx(3,3),betaYx1(3,3),betaYx2(3,3),DYx(3,3),adjYx(3,3)             & 
& ,Yv(3,3),betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3)
Complex(dp) :: YdadjYd(3,3),YeadjYe(3,3),YxCYx(3,3),YuadjYu(3,3),YvadjYv(3,3),adjYdYd(3,3),          & 
& adjYeYe(3,3),adjYuYu(3,3),adjYvYx(3,3),adjYvYv(3,3),CYxYx(3,3),CYxYv(3,3),             & 
& CYvTpYv(3,3),YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YeadjYvYv(3,3),              & 
& YxCYxYx(3,3),YxCYxYv(3,3),YxCYvTpYv(3,3),YuadjYdYd(3,3),YuadjYuYu(3,3),YvadjYeYe(3,3), & 
& YvadjYvYx(3,3),YvadjYvYv(3,3)

Complex(dp) :: YuadjYd(3,3),YvadjYe(3,3),CYeTpYv(3,3),YeadjYvYx(3,3),adjYdYdadjYd(3,3),              & 
& adjYeYeadjYe(3,3),adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),adjYvYvadjYe(3,3),               & 
& adjYvYvadjYv(3,3),CYxYxCYx(3,3),CYxYvadjYv(3,3),TpYeCYeTpYv(3,3),TpYvCYxYx(3,3),       & 
& TpYvCYxYv(3,3),TpYvCYvTpYv(3,3),YdadjYdYdadjYd(3,3),YdadjYuYuadjYd(3,3),               & 
& YeadjYeYeadjYe(3,3),YeadjYvYvadjYe(3,3),YxCYxYxCYx(3,3),YxCYxYvadjYv(3,3),             & 
& YuadjYuYuadjYu(3,3),YvadjYvYvadjYv(3,3),adjYdYdadjYdYd(3,3),adjYdYdadjYuYu(3,3),       & 
& adjYeYeadjYeYe(3,3),adjYeYeadjYvYx(3,3),adjYeYeadjYvYv(3,3),adjYuYuadjYdYd(3,3),       & 
& adjYuYuadjYuYu(3,3),adjYvYxCYxYv(3,3),adjYvYvadjYeYe(3,3),adjYvYvadjYvYx(3,3),         & 
& adjYvYvadjYvYv(3,3),CYxYxCYxYx(3,3),CYxYxCYxYv(3,3),CYxYvadjYvYx(3,3),CYvTpYeCYeTpYv(3,3),& 
& CYvTpYvCYxYx(3,3),CYvTpYvCYxYv(3,3),CYvTpYvCYvTpYv(3,3),YdadjYdYdadjYdYd(3,3),         & 
& YdadjYuYuadjYdYd(3,3),YdadjYuYuadjYuYu(3,3),YeadjYeYeadjYeYe(3,3),YeadjYvYxCYxYv(3,3), & 
& YeadjYvYvadjYeYe(3,3),YeadjYvYvadjYvYv(3,3),YxCYxYxCYxYx(3,3),YxCYxYxCYxYv(3,3),       & 
& YxCYxYvadjYvYx(3,3),YxCYvTpYeCYeTpYv(3,3),YxCYvTpYvCYxYx(3,3),YxCYvTpYvCYxYv(3,3),     & 
& YxCYvTpYvCYvTpYv(3,3),YuadjYdYdadjYdYd(3,3),YuadjYdYdadjYuYu(3,3),YuadjYuYuadjYuYu(3,3),& 
& YvadjYeYeadjYeYe(3,3),YvadjYeYeadjYvYx(3,3),YvadjYeYeadjYvYv(3,3),YvadjYvYxCYxYv(3,3), & 
& YvadjYvYvadjYvYx(3,3),YvadjYvYvadjYvYv(3,3)

Complex(dp) :: TrYdadjYd,TrYeadjYe,TrYxCYx,TrYuadjYu,TrYvadjYv

Complex(dp) :: TrYdadjYdYdadjYd,TrYdadjYuYuadjYd,TrYeadjYeYeadjYe,TrYeadjYvYvadjYe,TrYxCYxYxCYx,     & 
& TrYxCYxYvadjYv,TrYuadjYuYuadjYu,TrYvadjYvYvadjYv

Real(dp) :: g1p2,g1p3,gYBp2,g2p2,g2p3,g3p2,g3p3,gBLp2,gBLp3,gBYp2

Complex(dp) :: sqrt10

Real(dp) :: g1p4,g1p5,gYBp3,gYBp4,gYBp5,g2p4,g3p4,gBLp4,gBLp5,gBYp3,gBYp4,gBYp5

Complex(dp) :: sqrt2ov5,ooSqrt10

Iname = Iname +1 
NameOfUnit(Iname) = 'rge96' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters96(gy,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv)

Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yx,adjYx)
Call Adjungate(Yv,adjYv)
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YxCYx = Matmul2(Yx,adjYx,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYvYx = Matmul2(adjYv,Yx,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 CYxYx = Matmul2(adjYx,Yx,OnlyDiagonal) 
 CYxYv = Matmul2(adjYx,Yv,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYvYv = Matmul2(Ye,adjYvYv,OnlyDiagonal) 
 YxCYxYx = Matmul2(Yx,CYxYx,OnlyDiagonal) 
 YxCYxYv = Matmul2(Yx,CYxYv,OnlyDiagonal) 
 YxCYvTpYv = Matmul2(Yx,CYvTpYv,OnlyDiagonal) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YvadjYeYe = Matmul2(Yv,adjYeYe,OnlyDiagonal) 
 YvadjYvYx = Matmul2(Yv,adjYvYx,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYxCYx = cTrace(YxCYx) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 sqrt10 =sqrt(10._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 gYBp2 =gYB**2 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gBLp2 =gBL**2 
 gBLp3 =gBL**3 
 gBYp2 =gBY**2 
 sqrt2ov5 =Sqrt(2._dp/5._dp) 
 ooSqrt10 =1._dp/sqrt(10._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 


If (TwoLoopRGE) Then 
 YuadjYd = Matmul2(Yu,adjYd,OnlyDiagonal) 
 YvadjYe = Matmul2(Yv,adjYe,OnlyDiagonal) 
 CYeTpYv = Matmul2(Conjg(Ye),Transpose(Yv),OnlyDiagonal) 
 YeadjYvYx = Matmul2(Ye,adjYvYx,OnlyDiagonal) 
 adjYdYdadjYd = Matmul2(adjYd,YdadjYd,OnlyDiagonal) 
 adjYeYeadjYe = Matmul2(adjYe,YeadjYe,OnlyDiagonal) 
 adjYuYuadjYd = Matmul2(adjYu,YuadjYd,OnlyDiagonal) 
 adjYuYuadjYu = Matmul2(adjYu,YuadjYu,OnlyDiagonal) 
 adjYvYvadjYe = Matmul2(adjYv,YvadjYe,OnlyDiagonal) 
 adjYvYvadjYv = Matmul2(adjYv,YvadjYv,OnlyDiagonal) 
 CYxYxCYx = Matmul2(adjYx,YxCYx,OnlyDiagonal) 
 CYxYvadjYv = Matmul2(adjYx,YvadjYv,OnlyDiagonal) 
 TpYeCYeTpYv = Matmul2(Transpose(Ye),CYeTpYv,OnlyDiagonal) 
 TpYvCYxYx = Matmul2(Transpose(Yv),CYxYx,OnlyDiagonal) 
 TpYvCYxYv = Matmul2(Transpose(Yv),CYxYv,OnlyDiagonal) 
 TpYvCYvTpYv = Matmul2(Transpose(Yv),CYvTpYv,OnlyDiagonal) 
 YdadjYdYdadjYd = Matmul2(Yd,adjYdYdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYuYuadjYd = Matmul2(Yd,adjYuYuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul2(Ye,adjYeYeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYvYvadjYe = Matmul2(Ye,adjYvYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYvYvadjYe(i2,i2) =  Real(YeadjYvYvadjYe(i2,i2),dp) 
 YxCYxYxCYx = Matmul2(Yx,CYxYxCYx,OnlyDiagonal) 
 YxCYxYvadjYv = Matmul2(Yx,CYxYvadjYv,OnlyDiagonal) 
 YuadjYuYuadjYu = Matmul2(Yu,adjYuYuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 YvadjYvYvadjYv = Matmul2(Yv,adjYvYvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvYvadjYv(i2,i2) =  Real(YvadjYvYvadjYv(i2,i2),dp) 
 adjYdYdadjYdYd = Matmul2(adjYd,YdadjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdadjYdYd(i2,i2) =  Real(adjYdYdadjYdYd(i2,i2),dp) 
 adjYdYdadjYuYu = Matmul2(adjYd,YdadjYuYu,OnlyDiagonal) 
 adjYeYeadjYeYe = Matmul2(adjYe,YeadjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeadjYeYe(i2,i2) =  Real(adjYeYeadjYeYe(i2,i2),dp) 
 adjYeYeadjYvYx = Matmul2(adjYe,YeadjYvYx,OnlyDiagonal) 
 adjYeYeadjYvYv = Matmul2(adjYe,YeadjYvYv,OnlyDiagonal) 
 adjYuYuadjYdYd = Matmul2(adjYu,YuadjYdYd,OnlyDiagonal) 
 adjYuYuadjYuYu = Matmul2(adjYu,YuadjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYuadjYuYu(i2,i2) =  Real(adjYuYuadjYuYu(i2,i2),dp) 
 adjYvYxCYxYv = Matmul2(adjYv,YxCYxYv,OnlyDiagonal) 
 adjYvYvadjYeYe = Matmul2(adjYv,YvadjYeYe,OnlyDiagonal) 
 adjYvYvadjYvYx = Matmul2(adjYv,YvadjYvYx,OnlyDiagonal) 
 adjYvYvadjYvYv = Matmul2(adjYv,YvadjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvadjYvYv(i2,i2) =  Real(adjYvYvadjYvYv(i2,i2),dp) 
 CYxYxCYxYx = Matmul2(adjYx,YxCYxYx,OnlyDiagonal) 
 CYxYxCYxYv = Matmul2(adjYx,YxCYxYv,OnlyDiagonal) 
 CYxYvadjYvYx = Matmul2(adjYx,YvadjYvYx,OnlyDiagonal) 
 CYvTpYeCYeTpYv = Matmul2(Conjg(Yv),TpYeCYeTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYeCYeTpYv(i2,i2) =  Real(CYvTpYeCYeTpYv(i2,i2),dp) 
 CYvTpYvCYxYx = Matmul2(Conjg(Yv),TpYvCYxYx,OnlyDiagonal) 
 CYvTpYvCYxYv = Matmul2(Conjg(Yv),TpYvCYxYv,OnlyDiagonal) 
 CYvTpYvCYvTpYv = Matmul2(Conjg(Yv),TpYvCYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvCYvTpYv(i2,i2) =  Real(CYvTpYvCYvTpYv(i2,i2),dp) 
 YdadjYdYdadjYdYd = Matmul2(Yd,adjYdYdadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYdYd = Matmul2(Yd,adjYuYuadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYuYu = Matmul2(Yd,adjYuYuadjYuYu,OnlyDiagonal) 
 YeadjYeYeadjYeYe = Matmul2(Ye,adjYeYeadjYeYe,OnlyDiagonal) 
 YeadjYvYxCYxYv = Matmul2(Ye,adjYvYxCYxYv,OnlyDiagonal) 
 YeadjYvYvadjYeYe = Matmul2(Ye,adjYvYvadjYeYe,OnlyDiagonal) 
 YeadjYvYvadjYvYv = Matmul2(Ye,adjYvYvadjYvYv,OnlyDiagonal) 
 YxCYxYxCYxYx = Matmul2(Yx,CYxYxCYxYx,OnlyDiagonal) 
 YxCYxYxCYxYv = Matmul2(Yx,CYxYxCYxYv,OnlyDiagonal) 
 YxCYxYvadjYvYx = Matmul2(Yx,CYxYvadjYvYx,OnlyDiagonal) 
 YxCYvTpYeCYeTpYv = Matmul2(Yx,CYvTpYeCYeTpYv,OnlyDiagonal) 
 YxCYvTpYvCYxYx = Matmul2(Yx,CYvTpYvCYxYx,OnlyDiagonal) 
 YxCYvTpYvCYxYv = Matmul2(Yx,CYvTpYvCYxYv,OnlyDiagonal) 
 YxCYvTpYvCYvTpYv = Matmul2(Yx,CYvTpYvCYvTpYv,OnlyDiagonal) 
 YuadjYdYdadjYdYd = Matmul2(Yu,adjYdYdadjYdYd,OnlyDiagonal) 
 YuadjYdYdadjYuYu = Matmul2(Yu,adjYdYdadjYuYu,OnlyDiagonal) 
 YuadjYuYuadjYuYu = Matmul2(Yu,adjYuYuadjYuYu,OnlyDiagonal) 
 YvadjYeYeadjYeYe = Matmul2(Yv,adjYeYeadjYeYe,OnlyDiagonal) 
 YvadjYeYeadjYvYx = Matmul2(Yv,adjYeYeadjYvYx,OnlyDiagonal) 
 YvadjYeYeadjYvYv = Matmul2(Yv,adjYeYeadjYvYv,OnlyDiagonal) 
 YvadjYvYxCYxYv = Matmul2(Yv,adjYvYxCYxYv,OnlyDiagonal) 
 YvadjYvYvadjYvYx = Matmul2(Yv,adjYvYvadjYvYx,OnlyDiagonal) 
 YvadjYvYvadjYvYv = Matmul2(Yv,adjYvYvadjYvYv,OnlyDiagonal) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp)  
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp)  
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp)  
 TrYeadjYvYvadjYe = Real(cTrace(YeadjYvYvadjYe),dp)  
 TrYxCYxYxCYx = cTrace(YxCYxYxCYx)
 TrYxCYxYvadjYv = cTrace(YxCYxYvadjYv)
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp)  
 TrYvadjYvYvadjYv = Real(cTrace(YvadjYvYvadjYv),dp)  
 sqrt2ov5 =Sqrt(2._dp/5._dp) 
 ooSqrt10 =1._dp/sqrt(10._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = (3*(11._dp*(g1p3) + 4*g1p2*gBY*sqrt10 + gYB*gBY*(15._dp*(gBL)              & 
&  + 2*gYB*sqrt10) + g1*(15._dp*(gBYp2) + 11._dp*(gYBp2) + 2*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = (-14._dp*(g1p3)/5._dp - gYB*gBL*gBY + gBY*gYBp2*ooSqrt10 + g1*(-1._dp*(gBYp2) -       & 
&  14._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10) + g1p2*gBY*sqrt2ov5)*TrYdadjYd +             & 
&  (398._dp*(g1p5) + 270*g1p3*g2p2 + 880*g1p3*g3p2 + 1610*gYB*g1p2*gBL*gBY +             & 
&  450*gYB*g2p2*gBL*gBY + 400*gYB*g3p2*gBL*gBY + 230*g1p3*gBLp2 + 1250*gYB*gBY*gBLp3 +   & 
&  1380*g1p3*gBYp2 + 450*g1*g2p2*gBYp2 + 400*g1*g3p2*gBYp2 + 1250*g1*gBLp2*gBYp2 +       & 
&  1250*gYB*gBL*gBYp3 + 1250*g1*gBYp4 + 796*g1p3*gYBp2 + 270*g1*g2p2*gYBp2 +             & 
&  880*g1*g3p2*gYBp2 + 690*g1*gBLp2*gYBp2 + 920*g1*gBYp2*gYBp2 + 690*gBL*gBY*gYBp3 +     & 
&  398*g1*gYBp4 + 246*gYB*g1p3*gBL*sqrt10 + 90*g1*gYB*g2p2*gBL*sqrt10 + 80*g1*gYB*g3p2*gBL*sqrt10 +& 
&  328*g1p4*gBY*sqrt10 + 180*g1p2*g2p2*gBY*sqrt10 + 160*g1p2*g3p2*gBY*sqrt10 +           & 
&  140*g1p2*gBY*gBLp2*sqrt10 + 70*g1*gYB*gBLp3*sqrt10 + 350*g1*gYB*gBL*gBYp2*sqrt10 +    & 
&  280*g1p2*gBYp3*sqrt10 + 410*g1p2*gBY*gYBp2*sqrt10 + 90*g2p2*gBY*gYBp2*sqrt10 +        & 
&  80*g3p2*gBY*gYBp2*sqrt10 + 210*gBY*gBLp2*gYBp2*sqrt10 + 70*gBYp3*gYBp2*sqrt10 +       & 
&  246*g1*gBL*gYBp3*sqrt10 + 82*gBY*gYBp4*sqrt10 - 15*(12._dp*(g1p3) + 6*g1p2*gBY*sqrt10 +& 
&  gYB*gBY*(10._dp*(gBL) + 3*gYB*sqrt10) + g1*(10._dp*(gBYp2) + 12._dp*(gYBp2) +         & 
&  3*gYB*gBL*sqrt10))*TrYeadjYe - 260*g1p3*TrYuadjYu - 50*gYB*gBL*gBY*TrYuadjYu -        & 
&  50*g1*gBYp2*TrYuadjYu - 260*g1*gYBp2*TrYuadjYu - 25*g1*gYB*gBL*sqrt10*TrYuadjYu -     & 
&  50*g1p2*gBY*sqrt10*TrYuadjYu - 25*gBY*gYBp2*sqrt10*TrYuadjYu - 60*g1p3*TrYvadjYv -    & 
&  150*gYB*gBL*gBY*TrYvadjYv - 150*g1*gBYp2*TrYvadjYv - 60*g1*gYBp2*TrYvadjYv -          & 
&  15*g1*gYB*gBL*sqrt10*TrYvadjYv - 30*g1p2*gBY*sqrt10*TrYvadjYv - 15*gBY*gYBp2*sqrt10*TrYvadjYv -& 
&  450*gBY*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = (g2p3*(9._dp*(g1p2) + 125._dp*(g2p2) + 120._dp*(g3p2) + 15._dp*(gBLp2) -              & 
&  30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv)))/5._dp

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = (g3p3*(11._dp*(g1p2) + 45._dp*(g2p2) + 70._dp*(g3p2) + 5._dp*(gBLp2) - 20._dp*(TrYdadjYd) -& 
&  20._dp*(TrYuadjYu)))/5._dp

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = (3*(11*g1*gYB*gBY + 15._dp*(gBLp3) + 15*gBL*gBYp2 + 11*gBL*gYBp2 +        & 
&  2*g1*gBL*gBY*sqrt10 + 4*gYB*gBLp2*sqrt10 + 2*gYB*gBYp2*sqrt10))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBL2 = (398*gYB*g1p3*gBY + 270*g1*gYB*g2p2*gBY + 880*g1*gYB*g3p2*gBY + 1610*g1*gYB*gBY*gBLp2 +& 
&  230*g1p2*gBLp3 + 450*g2p2*gBLp3 + 400*g3p2*gBLp3 + 1250._dp*(gBLp5) + 690*g1p2*gBL*gBYp2 +& 
&  450*g2p2*gBL*gBYp2 + 400*g3p2*gBL*gBYp2 + 2500*gBLp3*gBYp2 + 690*g1*gYB*gBYp3 +       & 
&  1250*gBL*gBYp4 + 398*g1p2*gBL*gYBp2 + 270*g2p2*gBL*gYBp2 + 880*g3p2*gBL*gYBp2 +       & 
&  1380*gBLp3*gYBp2 + 920*gBL*gBYp2*gYBp2 + 398*g1*gBY*gYBp3 + 398*gBL*gYBp4 +           & 
&  82*g1p3*gBL*gBY*sqrt10 + 90*g1*g2p2*gBL*gBY*sqrt10 + 80*g1*g3p2*gBL*gBY*sqrt10 +      & 
&  164*gYB*g1p2*gBLp2*sqrt10 + 180*gYB*g2p2*gBLp2*sqrt10 + 160*gYB*g3p2*gBLp2*sqrt10 +   & 
&  210*g1*gBY*gBLp3*sqrt10 + 280*gYB*gBLp4*sqrt10 + 246*gYB*g1p2*gBYp2*sqrt10 +          & 
&  90*gYB*g2p2*gBYp2*sqrt10 + 80*gYB*g3p2*gBYp2*sqrt10 + 350*gYB*gBLp2*gBYp2*sqrt10 +    & 
&  210*g1*gBL*gBYp3*sqrt10 + 70*gYB*gBYp4*sqrt10 + 410*g1*gBL*gBY*gYBp2*sqrt10 +         & 
&  328*gBLp2*gYBp3*sqrt10 + 82*gBYp2*gYBp3*sqrt10 - 5*(28*g1*gYB*gBY + 10._dp*(gBLp3) +  & 
&  10*gBL*gBYp2 + 28*gBL*gYBp2 - g1*gBL*gBY*sqrt10 - 2*gYB*gBLp2*sqrt10 - gYB*gBYp2*sqrt10)*TrYdadjYd -& 
&  15*(12*g1*gYB*gBY + 10._dp*(gBLp3) + 10*gBL*gBYp2 + 12*gBL*gYBp2 + 3*g1*gBL*gBY*sqrt10 +& 
&  6*gYB*gBLp2*sqrt10 + 3*gYB*gBYp2*sqrt10)*TrYeadjYe - 260*g1*gYB*gBY*TrYuadjYu -       & 
&  50*gBLp3*TrYuadjYu - 50*gBL*gBYp2*TrYuadjYu - 260*gBL*gYBp2*TrYuadjYu -               & 
&  25*g1*gBL*gBY*sqrt10*TrYuadjYu - 50*gYB*gBLp2*sqrt10*TrYuadjYu - 25*gYB*gBYp2*sqrt10*TrYuadjYu -& 
&  60*g1*gYB*gBY*TrYvadjYv - 150*gBLp3*TrYvadjYv - 150*gBL*gBYp2*TrYvadjYv -             & 
&  60*gBL*gYBp2*TrYvadjYv - 15*g1*gBL*gBY*sqrt10*TrYvadjYv - 30*gYB*gBLp2*sqrt10*TrYvadjYv -& 
&  15*gYB*gBYp2*sqrt10*TrYvadjYv - 450*gBLp3*TrYxCYx - 450*gBL*gBYp2*TrYxCYx)/50._dp

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! gYB 
!-------------------- 
 
betagYB1  = (3*(g1*gBY*(15._dp*(gBL) + 2*gYB*sqrt10) + g1p2*(11._dp*(gYB)             & 
&  + 2*gBL*sqrt10) + gYB*(15._dp*(gBLp2) + 11._dp*(gYBp2) + 4*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagYB2 = (g1p2*(-14._dp*(gYB)/5._dp + gBL*ooSqrt10) + g1*(-(gBL*gBY) + gYB*gBY*ooSqrt10) +     & 
&  (gYB*(-5._dp*(gBLp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10))/5._dp)*TrYdadjYd +           & 
&  (398*gYB*g1p4 + 270*gYB*g1p2*g2p2 + 880*gYB*g1p2*g3p2 + 690*g1p3*gBL*gBY +            & 
&  450*g1*g2p2*gBL*gBY + 400*g1*g3p2*gBL*gBY + 920*gYB*g1p2*gBLp2 + 450*gYB*g2p2*gBLp2 + & 
&  400*gYB*g3p2*gBLp2 + 1250*g1*gBY*gBLp3 + 1250*gYB*gBLp4 + 690*gYB*g1p2*gBYp2 +        & 
&  1250*gYB*gBLp2*gBYp2 + 1250*g1*gBL*gBYp3 + 1610*g1*gBL*gBY*gYBp2 + 796*g1p2*gYBp3 +   & 
&  270*g2p2*gYBp3 + 880*g3p2*gYBp3 + 1380*gBLp2*gYBp3 + 230*gBYp2*gYBp3 + 398._dp*(gYBp5) +& 
&  82*g1p4*gBL*sqrt10 + 90*g1p2*g2p2*gBL*sqrt10 + 80*g1p2*g3p2*gBL*sqrt10 +              & 
&  246*gYB*g1p3*gBY*sqrt10 + 90*g1*gYB*g2p2*gBY*sqrt10 + 80*g1*gYB*g3p2*gBY*sqrt10 +     & 
&  350*g1*gYB*gBY*gBLp2*sqrt10 + 70*g1p2*gBLp3*sqrt10 + 210*g1p2*gBL*gBYp2*sqrt10 +      & 
&  70*g1*gYB*gBYp3*sqrt10 + 410*g1p2*gBL*gYBp2*sqrt10 + 180*g2p2*gBL*gYBp2*sqrt10 +      & 
&  160*g3p2*gBL*gYBp2*sqrt10 + 280*gBLp3*gYBp2*sqrt10 + 140*gBL*gBYp2*gYBp2*sqrt10 +     & 
&  246*g1*gBY*gYBp3*sqrt10 + 328*gBL*gYBp4*sqrt10 - 15*(g1*gBY*(10._dp*(gBL) +           & 
&  3*gYB*sqrt10) + 3*g1p2*(4._dp*(gYB) + gBL*sqrt10) + 2*gYB*(5._dp*(gBLp2) +            & 
&  6._dp*(gYBp2) + 3*gYB*gBL*sqrt10))*TrYeadjYe - 260*gYB*g1p2*TrYuadjYu -               & 
&  50*g1*gBL*gBY*TrYuadjYu - 50*gYB*gBLp2*TrYuadjYu - 260*gYBp3*TrYuadjYu -              & 
&  25*g1p2*gBL*sqrt10*TrYuadjYu - 25*g1*gYB*gBY*sqrt10*TrYuadjYu - 50*gBL*gYBp2*sqrt10*TrYuadjYu -& 
&  60*gYB*g1p2*TrYvadjYv - 150*g1*gBL*gBY*TrYvadjYv - 150*gYB*gBLp2*TrYvadjYv -          & 
&  60*gYBp3*TrYvadjYv - 15*g1p2*gBL*sqrt10*TrYvadjYv - 15*g1*gYB*gBY*sqrt10*TrYvadjYv -  & 
&  30*gBL*gYBp2*sqrt10*TrYvadjYv - 450*gBL*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
DgYB = oo16pi2*( betagYB1 + oo16pi2 * betagYB2 ) 

 
Else 
DgYB = oo16pi2* betagYB1 
End If 
 
 
If (.not.KineticMixing) DgYB  = 0._dp 
!-------------------- 
! gBY 
!-------------------- 
 
betagBY1  = (3*(11*g1p2*gBY + gBY*(15*(gBLp2 + gBYp2) + 2*gYB*gBL*sqrt10)             & 
&  + g1*(11*gYB*gBL + 2*(gBLp2 + 2._dp*(gBYp2))*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBY2 = (398*gYB*g1p3*gBL + 270*g1*gYB*g2p2*gBL + 880*g1*gYB*g3p2*gBL + 398*g1p4*gBY +        & 
&  270*g1p2*g2p2*gBY + 880*g1p2*g3p2*gBY + 920*g1p2*gBY*gBLp2 + 450*g2p2*gBY*gBLp2 +     & 
&  400*g3p2*gBY*gBLp2 + 690*g1*gYB*gBLp3 + 1250*gBY*gBLp4 + 1610*g1*gYB*gBL*gBYp2 +      & 
&  1380*g1p2*gBYp3 + 450*g2p2*gBYp3 + 400*g3p2*gBYp3 + 2500*gBLp2*gBYp3 + 1250._dp*(gBYp5) +& 
&  398*g1p2*gBY*gYBp2 + 690*gBY*gBLp2*gYBp2 + 230*gBYp3*gYBp2 + 398*g1*gBL*gYBp3 +       & 
&  410*gYB*g1p2*gBL*gBY*sqrt10 + 90*gYB*g2p2*gBL*gBY*sqrt10 + 80*gYB*g3p2*gBL*gBY*sqrt10 +& 
&  82*g1p3*gBLp2*sqrt10 + 90*g1*g2p2*gBLp2*sqrt10 + 80*g1*g3p2*gBLp2*sqrt10 +            & 
&  210*gYB*gBY*gBLp3*sqrt10 + 70*g1*gBLp4*sqrt10 + 328*g1p3*gBYp2*sqrt10 +               & 
&  180*g1*g2p2*gBYp2*sqrt10 + 160*g1*g3p2*gBYp2*sqrt10 + 350*g1*gBLp2*gBYp2*sqrt10 +     & 
&  210*gYB*gBL*gBYp3*sqrt10 + 280*g1*gBYp4*sqrt10 + 246*g1*gBLp2*gYBp2*sqrt10 +          & 
&  164*g1*gBYp2*gYBp2*sqrt10 + 82*gBL*gBY*gYBp3*sqrt10 - 5*(28*g1p2*gBY + 10*gBY*(gBLp2 +& 
&  gBYp2) - gYB*gBL*gBY*sqrt10 + g1*(28*gYB*gBL - (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*gBY + gBY*(10*(gBLp2 + gBYp2) + 3*gYB*gBL*sqrt10) + 3*g1*(4*gYB*gBL +     & 
&  (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYeadjYe - 260*g1*gYB*gBL*TrYuadjYu -               & 
&  260*g1p2*gBY*TrYuadjYu - 50*gBY*gBLp2*TrYuadjYu - 50*gBYp3*TrYuadjYu - 25*gYB*gBL*gBY*sqrt10*TrYuadjYu -& 
&  25*g1*gBLp2*sqrt10*TrYuadjYu - 50*g1*gBYp2*sqrt10*TrYuadjYu - 60*g1*gYB*gBL*TrYvadjYv -& 
&  60*g1p2*gBY*TrYvadjYv - 150*gBY*gBLp2*TrYvadjYv - 150*gBYp3*TrYvadjYv -               & 
&  15*gYB*gBL*gBY*sqrt10*TrYvadjYv - 15*g1*gBLp2*sqrt10*TrYvadjYv - 30*g1*gBYp2*sqrt10*TrYvadjYv -& 
&  450*gBY*gBLp2*TrYxCYx - 450*gBYp3*TrYxCYx)/50._dp

 
DgBY = oo16pi2*( betagBY1 + oo16pi2 * betagBY2 ) 

 
Else 
DgBY = oo16pi2* betagBY1 
End If 
 
 
If (.not.KineticMixing) DgBY  = 0._dp 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = ((-14._dp*(g1p2) - 90._dp*(g2p2) - 160._dp*(g3p2) - 5._dp*(gBLp2)          & 
&  - 5._dp*(gBYp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10 + 90._dp*(TrYdadjYd)& 
&  + 30._dp*(TrYeadjYe))*Yd + 30*(3._dp*(YdadjYdYd) + YdadjYuYu))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = ((5740._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 1600*g1p2*g3p2 +              & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 17840._dp*g1*gYB*gBL*gBY - 670*g1p2*gBLp2 +   & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 8250*g1p2*gBYp2 +               & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  11480._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 1600*g3p2*gYBp2 + 8250*gBLp2*gYBp2 -         & 
&  670*gBYp2*gYBp2 + 5740._dp*(gYBp4) + 1592*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 -& 
&  320*gYB*g3p2*gBL*sqrt10 + 1592*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 -             & 
&  320*g1*g3p2*gBY*sqrt10 + 170*g1*gBY*gBLp2*sqrt10 + 170*gYB*gBLp3*sqrt10 +             & 
&  170*gYB*gBL*gBYp2*sqrt10 + 170*g1*gBYp3*sqrt10 + 1592*g1*gBY*gYBp2*sqrt10 +           & 
&  1592*gBL*gYBp3*sqrt10 - 180*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +       & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 16200._dp*(TrYdadjYdYdadjYd) -& 
&  5400._dp*(TrYdadjYuYuadjYd) + 540*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) + & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 5400._dp*(TrYeadjYeYeadjYe) -         & 
&  1800._dp*(TrYeadjYvYvadjYe))*Yd)/1800._dp + (4._dp*(g1p2)/5._dp + 6._dp*(g2p2) +      & 
&  4._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10 + g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) -        & 
&  3._dp*(TrYeadjYe))*YdadjYdYd - 4._dp*(YdadjYdYdadjYdYd) + (4*g1p2*YdadjYuYu)/5._dp +  & 
&  (4*gYBp2*YdadjYuYu)/5._dp + gYB*gBL*ooSqrt10*YdadjYuYu + g1*gBY*ooSqrt10*YdadjYuYu -  & 
&  3*TrYuadjYu*YdadjYuYu - TrYvadjYv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdYd) -              & 
&  2._dp*(YdadjYuYuadjYuYu)

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = -((3*(6._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 6._dp*(gYBp2)      & 
&  + 3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10) - 30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe))      & 
& *Ye)/10._dp + 3._dp*(YeadjYeYe) + YeadjYvYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = ((2700._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 16560._dp*g1*gYB*gBL*gBY +      & 
&  2610*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 10890._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 5400*g1p2*gYBp2 +              & 
&  360*g2p2*gYBp2 + 10890._dp*gBLp2*gYBp2 + 2610*gBYp2*gYBp2 + 2700._dp*(gYBp4) +        & 
&  2376*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 + 2376*g1p3*gBY*sqrt10 +           & 
&  180*g1*g2p2*gBY*sqrt10 + 2610*g1*gBY*gBLp2*sqrt10 + 2610*gYB*gBLp3*sqrt10 +           & 
&  2610*gYB*gBL*gBYp2*sqrt10 + 2610*g1*gBYp3*sqrt10 + 2376*g1*gBY*gYBp2*sqrt10 +         & 
&  2376*gBL*gYBp3*sqrt10 - 20*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +        & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 1800._dp*(TrYdadjYdYdadjYd) -& 
&  600._dp*(TrYdadjYuYuadjYd) + 60*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) +   & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 600._dp*(TrYeadjYeYeadjYe) -          & 
&  200._dp*(TrYeadjYvYvadjYe))*Ye)/200._dp + (6._dp*(g2p2) - 3*gYB*gBL*ooSqrt10 -        & 
&  3*g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YeadjYeYe - 4._dp*(YeadjYeYeadjYeYe) -& 
&  3*gYB*gBL*ooSqrt10*YeadjYvYv - 3*g1*gBY*ooSqrt10*YeadjYvYv - 3*TrYuadjYu*YeadjYvYv -  & 
&  TrYvadjYv*YeadjYvYv - 2._dp*(YeadjYvYvadjYeYe) - 2._dp*(YeadjYvYvadjYvYv) -           & 
&  4._dp*(YeadjYvYxCYxYv)

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-((26._dp*(g1p2) + 90._dp*(g2p2) + 160._dp*(g3p2) + 5._dp*(gBLp2)         & 
&  + 5._dp*(gBYp2) + 26._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10 -               & 
&  90._dp*(TrYuadjYu) - 30._dp*(TrYvadjYv))*Yu) + 30*(YuadjYdYd + 3._dp*(YuadjYuYu)))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = ((10972._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 5440*g1p2*g3p2 +             & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 39920._dp*g1*gYB*gBL*gBY + 3770*g1p2*gBLp2 +  & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 23730._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  21944._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 5440*g3p2*gYBp2 + 23730._dp*gBLp2*gYBp2 +    & 
&  3770*gBYp2*gYBp2 + 10972._dp*(gYBp4) + 5984*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 +& 
&  1600*gYB*g3p2*gBL*sqrt10 + 5984*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +            & 
&  1600*g1*g3p2*gBY*sqrt10 + 3470*g1*gBY*gBLp2*sqrt10 + 3470*gYB*gBLp3*sqrt10 +          & 
&  3470*gYB*gBL*gBYp2*sqrt10 + 3470*g1*gBYp3*sqrt10 + 5984*g1*gBY*gYBp2*sqrt10 +         & 
&  5984*gBL*gYBp3*sqrt10 - 5400._dp*(TrYdadjYuYuadjYd) - 1800._dp*(TrYeadjYvYvadjYe) +   & 
&  180*(8._dp*(g1p2) + 5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) +               & 
&  5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu - 16200._dp*(TrYuadjYuYuadjYu) +        & 
&  540*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + g1*sqrt10))*TrYvadjYv -      & 
&  5400._dp*(TrYvadjYvYvadjYv) - 7200._dp*(TrYxCYxYvadjYv))*Yu)/1800._dp +               & 
&  ((4._dp*(g1p2) + 4._dp*(gYBp2) - gYB*gBL*sqrt10 - g1*gBY*sqrt10 - 30._dp*(TrYdadjYd) -& 
&  10._dp*(TrYeadjYe))*YuadjYdYd)/10._dp - 2._dp*(YuadjYdYdadjYdYd) - 2._dp*(YuadjYdYdadjYuYu) +& 
&  (2*g1p2*YuadjYuYu)/5._dp + 6*g2p2*YuadjYuYu + (2*gYBp2*YuadjYuYu)/5._dp -             & 
&  gYB*gBL*ooSqrt10*YuadjYuYu - g1*gBY*ooSqrt10*YuadjYuYu - 9*TrYuadjYu*YuadjYuYu -      & 
&  3*TrYvadjYv*YuadjYuYu - 4._dp*(YuadjYuYuadjYuYu)

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yx 
!-------------------- 
 
betaYx1  = -((9*(gBLp2 + gBYp2) - 4._dp*(TrYxCYx))*Yx)/2._dp + 2*(YvadjYvYx +         & 
&  YxCYvTpYv + 4._dp*(YxCYxYx))

 
 
If (TwoLoopRGE) Then 
betaYx2 = ((2376*g1*gYB*gBL*gBY + 2025._dp*(gBLp4) + 1188*g1p2*gBYp2 + 4050*gBLp2*gBYp2 +       & 
&  2025._dp*(gBYp4) + 1188*gBLp2*gYBp2 + 432*g1*gBY*gBLp2*sqrt10 + 432*gYB*gBLp3*sqrt10 +& 
&  432*gYB*gBL*gBYp2*sqrt10 + 432*g1*gBYp3*sqrt10 - 120*(gBLp2 + gBYp2)*TrYxCYx -        & 
&  320._dp*(TrYxCYxYvadjYv) - 640._dp*(TrYxCYxYxCYx))*Yx)/40._dp - 2._dp*(YvadjYeYeadjYvYx) -& 
&  2._dp*(YvadjYvYvadjYvYx) + (6*g1p2*YvadjYvYx)/5._dp + 6*g2p2*YvadjYvYx +              & 
&  (6*gYBp2*YvadjYvYx)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYvYx + 3*g1*gBY*sqrt2ov5*YvadjYvYx -& 
&  6*TrYuadjYu*YvadjYvYx - 2*TrYvadjYv*YvadjYvYx - 2._dp*(YxCYvTpYeCYeTpYv) +            & 
&  (6*g1p2*YxCYvTpYv)/5._dp + 6*g2p2*YxCYvTpYv + (6*gYBp2*YxCYvTpYv)/5._dp +             & 
&  3*gYB*gBL*sqrt2ov5*YxCYvTpYv + 3*g1*gBY*sqrt2ov5*YxCYvTpYv - 6*TrYuadjYu*YxCYvTpYv -  & 
&  2*TrYvadjYv*YxCYvTpYv - 2._dp*(YxCYvTpYvCYvTpYv) - 8._dp*(YxCYvTpYvCYxYx) -           & 
&  8._dp*(YxCYxYvadjYvYx) + 8*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYx -            & 
&  32._dp*(YxCYxYxCYxYx)

 
DYx = oo16pi2*( betaYx1 + oo16pi2 * betaYx2 ) 

 
Else 
DYx = oo16pi2* betaYx1 
End If 
 
 
Call Chop(DYx) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = -((3*(2._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 2._dp*(gYBp2)      & 
&  + gYB*gBL*sqrt10 + g1*gBY*sqrt10) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv))          & 
& *Yv)/10._dp + YvadjYeYe + 3._dp*(YvadjYvYv) + 4._dp*(YxCYxYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = ((828._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 7920*g1*gYB*gBL*gBY +            & 
&  810*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 4770*g1p2*gBYp2 + 450*g2p2*gBYp2 +& 
&  5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 1656*g1p2*gYBp2 + 360*g2p2*gYBp2 +              & 
&  4770*gBLp2*gYBp2 + 810*gBYp2*gYBp2 + 828._dp*(gYBp4) + 720*gYB*g1p2*gBL*sqrt10 +      & 
&  180*gYB*g2p2*gBL*sqrt10 + 720*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +              & 
&  1350*g1*gBY*gBLp2*sqrt10 + 1350*gYB*gBLp3*sqrt10 + 1350*gYB*gBL*gBYp2*sqrt10 +        & 
&  1350*g1*gBYp3*sqrt10 + 720*g1*gBY*gYBp2*sqrt10 + 720*gBL*gYBp3*sqrt10 -               & 
&  600._dp*(TrYdadjYuYuadjYd) - 200._dp*(TrYeadjYvYvadjYe) + 20*(8._dp*(g1p2) +          & 
&  5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu -& 
&  1800._dp*(TrYuadjYuYuadjYu) + 60*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + & 
&  g1*sqrt10))*TrYvadjYv - 600._dp*(TrYvadjYvYvadjYv) - 800._dp*(TrYxCYxYvadjYv))*Yv)/200._dp +& 
&  (6*g1p2*YvadjYeYe)/5._dp + (6*gYBp2*YvadjYeYe)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYeYe + & 
&  3*g1*gBY*ooSqrt10*YvadjYeYe - 3*TrYdadjYd*YvadjYeYe - TrYeadjYe*YvadjYeYe -           & 
&  2._dp*(YvadjYeYeadjYeYe) - 2._dp*(YvadjYeYeadjYvYv) + (6*g1p2*YvadjYvYv)/5._dp +      & 
&  6*g2p2*YvadjYvYv + (6*gYBp2*YvadjYvYv)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYvYv +         & 
&  3*g1*gBY*ooSqrt10*YvadjYvYv - 9*TrYuadjYu*YvadjYvYv - 3*TrYvadjYv*YvadjYvYv -         & 
&  4._dp*(YvadjYvYvadjYvYv) - 4._dp*(YvadjYvYxCYxYv) - 8._dp*(YxCYvTpYvCYxYv) +          & 
&  4*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYv - 16._dp*(YxCYxYxCYxYv)

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

Call ParametersToG96(Dg1,Dg2,Dg3,DgBL,DgYB,DgBY,DYd,DYe,DYu,DYx,DYv,f)

Iname = Iname - 1 
 
End Subroutine rge96  

Subroutine GToParameters316(g,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,             & 
& Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,              & 
& M1,M2,M3,MBp)

Implicit None 
Real(dp), Intent(in) :: g(316) 
Real(dp),Intent(out) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters316' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
gBL= g(4) 
gYB= g(5) 
gBY= g(6) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+7), g(SumI+8), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+25), g(SumI+26), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yx(i1,i2) = Cmplx( g(SumI+61), g(SumI+62), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+79), g(SumI+80), dp) 
End Do 
 End Do 
 
MuP= Cmplx(g(97),g(98),dp) 
Mu= Cmplx(g(99),g(100),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+101), g(SumI+102), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+119), g(SumI+120), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+137), g(SumI+138), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tx(i1,i2) = Cmplx( g(SumI+155), g(SumI+156), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+173), g(SumI+174), dp) 
End Do 
 End Do 
 
BMuP= Cmplx(g(191),g(192),dp) 
Bmu= Cmplx(g(193),g(194),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+195), g(SumI+196), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+213), g(SumI+214), dp) 
End Do 
 End Do 
 
mHd2= g(231) 
mHu2= g(232) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+233), g(SumI+234), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+251), g(SumI+252), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+269), g(SumI+270), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+287), g(SumI+288), dp) 
End Do 
 End Do 
 
mC12= g(305) 
mC22= g(306) 
MBBp= Cmplx(g(307),g(308),dp) 
M1= Cmplx(g(309),g(310),dp) 
M2= Cmplx(g(311),g(312),dp) 
M3= Cmplx(g(313),g(314),dp) 
MBp= Cmplx(g(315),g(316),dp) 
Do i1=1,316 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters316

Subroutine ParametersToG316(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,               & 
& Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,              & 
& M1,M2,M3,MBp,g)

Implicit None 
Real(dp), Intent(out) :: g(316) 
Real(dp), Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG316' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = gBL  
g(5) = gYB  
g(6) = gBY  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+7) = Real(Yd(i1,i2), dp) 
g(SumI+8) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+25) = Real(Ye(i1,i2), dp) 
g(SumI+26) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yu(i1,i2), dp) 
g(SumI+44) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+61) = Real(Yx(i1,i2), dp) 
g(SumI+62) = Aimag(Yx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+79) = Real(Yv(i1,i2), dp) 
g(SumI+80) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

g(97) = Real(MuP,dp)  
g(98) = Aimag(MuP)  
g(99) = Real(Mu,dp)  
g(100) = Aimag(Mu)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+101) = Real(Td(i1,i2), dp) 
g(SumI+102) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+119) = Real(Te(i1,i2), dp) 
g(SumI+120) = Aimag(Te(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+137) = Real(Tu(i1,i2), dp) 
g(SumI+138) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+155) = Real(Tx(i1,i2), dp) 
g(SumI+156) = Aimag(Tx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+173) = Real(Tv(i1,i2), dp) 
g(SumI+174) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

g(191) = Real(BMuP,dp)  
g(192) = Aimag(BMuP)  
g(193) = Real(Bmu,dp)  
g(194) = Aimag(Bmu)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+195) = Real(mq2(i1,i2), dp) 
g(SumI+196) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+213) = Real(ml2(i1,i2), dp) 
g(SumI+214) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(231) = mHd2  
g(232) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+233) = Real(md2(i1,i2), dp) 
g(SumI+234) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+251) = Real(mu2(i1,i2), dp) 
g(SumI+252) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+269) = Real(me2(i1,i2), dp) 
g(SumI+270) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+287) = Real(mv2(i1,i2), dp) 
g(SumI+288) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(305) = mC12  
g(306) = mC22  
g(307) = Real(MBBp,dp)  
g(308) = Aimag(MBBp)  
g(309) = Real(M1,dp)  
g(310) = Aimag(M1)  
g(311) = Real(M2,dp)  
g(312) = Aimag(M2)  
g(313) = Real(M3,dp)  
g(314) = Aimag(M3)  
g(315) = Real(MBp,dp)  
g(316) = Aimag(MBp)  
Iname = Iname - 1 
 
End Subroutine ParametersToG316

Subroutine rge316(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,gBL,betagBL1,betagBL2,DgBL,gYB,betagYB1,betagYB2,DgYB,gBY,betagBY1,betagBY2,       & 
& DgBY,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,mC12,               & 
& betamC121,betamC122,DmC12,mC22,betamC221,betamC222,DmC22
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yx(3,3),betaYx1(3,3),betaYx2(3,3),DYx(3,3),adjYx(3,3)             & 
& ,Yv(3,3),betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),MuP,betaMuP1,betaMuP2,          & 
& DMuP,Mu,betaMu1,betaMu2,DMu,Td(3,3),betaTd1(3,3),betaTd2(3,3),DTd(3,3),adjTd(3,3)      & 
& ,Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3),Tu(3,3),betaTu1(3,3)            & 
& ,betaTu2(3,3),DTu(3,3),adjTu(3,3),Tx(3,3),betaTx1(3,3),betaTx2(3,3),DTx(3,3)           & 
& ,adjTx(3,3),Tv(3,3),betaTv1(3,3),betaTv2(3,3),DTv(3,3),adjTv(3,3),BMuP,betaBMuP1,      & 
& betaBMuP2,DBMuP,Bmu,betaBmu1,betaBmu2,DBmu,mq2(3,3),betamq21(3,3),betamq22(3,3)        & 
& ,Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3),Dml2(3,3),md2(3,3),betamd21(3,3)       & 
& ,betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3),betamu22(3,3),Dmu2(3,3),               & 
& me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),mv2(3,3),betamv21(3,3),betamv22(3,3)    & 
& ,Dmv2(3,3),MBBp,betaMBBp1,betaMBBp2,DMBBp,M1,betaM11,betaM12,DM1,M2,betaM21,           & 
& betaM22,DM2,M3,betaM31,betaM32,DM3,MBp,betaMBp1,betaMBp2,DMBp
Real(dp) :: Tr1(4),Tr2(4),Tr3(4) 
Real(dp) :: Tr2U1(4,4) 
Real(dp) :: AbsM2,AbsM3,AbsMBp
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2adjYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),        & 
& mu2Yu(3,3),mv2Yv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),YxCYx(3,3),      & 
& Yumq2(3,3),YuadjYu(3,3),Yvml2(3,3),YvadjYv(3,3),adjYdmd2(3,3),adjYdYd(3,3),            & 
& adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),       & 
& adjYuTu(3,3),adjYvmv2(3,3),adjYvYx(3,3),adjYvYv(3,3),adjYvTx(3,3),adjYvTv(3,3),        & 
& adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),adjTvTv(3,3),Cmv2CYx(3,3),CYxmv2(3,3),          & 
& CYxYx(3,3),CYxYv(3,3),CYxTx(3,3),CYxTv(3,3),CYvTpYv(3,3),CYvTpTv(3,3),CTdTpTd(3,3),    & 
& CTeTpTe(3,3),CTxTx(3,3),CTuTpTu(3,3),CTvTpTv(3,3),TdadjTd(3,3),TeadjTe(3,3),           & 
& TxCTx(3,3),TuadjTu(3,3),TvadjTv(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),ml2adjYeYe(3,3),  & 
& ml2adjYvYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),mv2YxCYx(3,3),         & 
& mv2YvadjYv(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),         & 
& YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),YeadjYeYe(3,3),          & 
& YeadjYeTe(3,3),YeadjYvYv(3,3),YeadjYvTv(3,3),YxCmv2CYx(3,3),YxCYxmv2(3,3),             & 
& YxCYxYx(3,3),YxCYxYv(3,3),YxCYxTx(3,3),YxCYxTv(3,3),YxCYvTpYv(3,3),YxCYvTpTv(3,3),     & 
& Yumq2adjYu(3,3),YuadjYdYd(3,3),YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),          & 
& YuadjYuTu(3,3),Yvml2adjYv(3,3),YvadjYeYe(3,3),YvadjYeTe(3,3),YvadjYvmv2(3,3),          & 
& YvadjYvYx(3,3),YvadjYvYv(3,3),YvadjYvTx(3,3),YvadjYvTv(3,3),adjYdmd2Yd(3,3),           & 
& adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3),adjYumu2Yu(3,3),adjYuYumq2(3,3),       & 
& adjYvmv2Yv(3,3),adjYvYvml2(3,3),TdadjYdYd(3,3),TdadjYuYu(3,3),TeadjYeYe(3,3),          & 
& TeadjYvYv(3,3),TxCYxYx(3,3),TxCYxYv(3,3),TxCYvTpYv(3,3),TuadjYdYd(3,3),TuadjYuYu(3,3), & 
& TvadjYeYe(3,3),TvadjYvYx(3,3),TvadjYvYv(3,3)

Complex(dp) :: YdadjYu(3,3),YdadjTd(3,3),YdadjTu(3,3),YeadjYv(3,3),YeadjTe(3,3),YeadjTv(3,3),        & 
& YxCTx(3,3),YuadjYd(3,3),YuadjTd(3,3),YuadjTu(3,3),YvadjYe(3,3),YvadjTe(3,3),           & 
& YvadjTv(3,3),adjYdCmd2(3,3),adjYeCme2(3,3),adjYuCmu2(3,3),adjYvCmv2(3,3),              & 
& adjTdYd(3,3),adjTeYe(3,3),adjTuYu(3,3),adjTvYv(3,3),Cml2adjYe(3,3),Cml2adjYv(3,3),     & 
& Cmq2adjYd(3,3),Cmq2adjYu(3,3),CYeTpYv(3,3),CYeTpTv(3,3),CTdTpYd(3,3),CTeTpYe(3,3),     & 
& CTxYv(3,3),CTxTv(3,3),CTuTpYu(3,3),CTvTpYv(3,3),TdadjYd(3,3),TdadjYu(3,3),             & 
& TdadjTu(3,3),TeadjYe(3,3),TeadjYv(3,3),TeadjTv(3,3),TxCYx(3,3),TuadjYd(3,3),           & 
& TuadjYu(3,3),TuadjTd(3,3),TvadjYe(3,3),TvadjYv(3,3),TvadjTe(3,3),TpYvCYx(3,3),         & 
& TpYvCTx(3,3),TpTvCYx(3,3),TpTvCTx(3,3),md2YdadjYu(3,3),me2YeadjYv(3,3),mu2YuadjYd(3,3),& 
& mv2YvadjYe(3,3),mv2CYxYx(3,3),Ydmq2adjYu(3,3),YdadjYdCmd2(3,3),YdadjYumu2(3,3),        & 
& YdadjTdTd(3,3),YdCmq2adjYd(3,3),Yeml2adjYv(3,3),YeadjYeCme2(3,3),YeadjYvmv2(3,3),      & 
& YeadjYvYx(3,3),YeadjYvTx(3,3),YeadjTeTe(3,3),YeCml2adjYe(3,3),YxCTxTv(3,3),            & 
& Yumq2adjYd(3,3),YuadjYdmd2(3,3),YuadjYuCmu2(3,3),YuadjTuTu(3,3),YuCmq2adjYu(3,3),      & 
& Yvml2adjYe(3,3),YvadjYeme2(3,3),YvadjYvCmv2(3,3),YvadjTvTv(3,3),YvCml2adjYv(3,3),      & 
& adjYdYdadjYd(3,3),adjYdYdadjYu(3,3),adjYdYdadjTd(3,3),adjYdYdadjTu(3,3),               & 
& adjYdTdadjYd(3,3),adjYdTdadjYu(3,3),adjYdTdadjTd(3,3),adjYdTdadjTu(3,3),               & 
& adjYeYeadjYe(3,3),adjYeYeadjYv(3,3),adjYeYeadjTe(3,3),adjYeYeadjTv(3,3),               & 
& adjYeTeadjYe(3,3),adjYeTeadjYv(3,3),adjYeTeadjTe(3,3),adjYeTeadjTv(3,3),               & 
& adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),adjYuYuadjTd(3,3),adjYuYuadjTu(3,3),               & 
& adjYuTuadjYd(3,3),adjYuTuadjYu(3,3),adjYuTuadjTd(3,3),adjYuTuadjTu(3,3),               & 
& adjYvYxCYx(3,3),adjYvYvadjYe(3,3),adjYvYvadjYv(3,3),adjYvYvadjTe(3,3),adjYvYvadjTv(3,3),& 
& adjYvTxCYx(3,3),adjYvTxCTx(3,3),adjYvTvadjYe(3,3),adjYvTvadjYv(3,3),adjYvTvadjTe(3,3), & 
& adjYvTvadjTv(3,3),adjTdYdadjYd(3,3),adjTdYdadjYu(3,3),adjTdTdadjYd(3,3),               & 
& adjTdTdadjYu(3,3),adjTeYeadjYe(3,3),adjTeYeadjYv(3,3),adjTeTeadjYe(3,3),               & 
& adjTeTeadjYv(3,3),adjTuYuadjYd(3,3),adjTuYuadjYu(3,3),adjTuTuadjYd(3,3),               & 
& adjTuTuadjYu(3,3),adjTvYvadjYe(3,3),adjTvYvadjYv(3,3),adjTvTvadjYe(3,3),               & 
& adjTvTvadjYv(3,3),Cml2TpYvCYx(3,3),Cmv2CYxYv(3,3),CYxmv2Yv(3,3),CYxYxCYx(3,3),         & 
& CYxYxCTx(3,3),CYxYvml2(3,3),CYxYvadjYv(3,3),CYxTxCYx(3,3),CYxTxCTx(3,3),               & 
& CYxTvadjYv(3,3),CYxTvadjTv(3,3),CYvTpYvCYx(3,3),CYvTpYvCTx(3,3),CYvTpTvCTx(3,3),       & 
& CTxYxCYx(3,3),CTxTxCYx(3,3),CTxTvadjYv(3,3),CTvTpYvCYx(3,3),CTvTpTvCYx(3,3),           & 
& TdadjTdYd(3,3),TeadjYvYx(3,3),TeadjTeYe(3,3),TxCTxYv(3,3),TxCTvTpYv(3,3),              & 
& TuadjTuYu(3,3),TvadjTvYv(3,3),TpYeCYeTpYv(3,3),TpYeCYeTpTv(3,3),TpYvCmv2CYx(3,3),      & 
& TpYvCYxmv2(3,3),TpYvCYxYx(3,3),TpYvCYxYv(3,3),TpYvCYxTx(3,3),TpYvCYxTv(3,3),           & 
& TpYvCYvTpYv(3,3),TpYvCYvTpTv(3,3),TpTeCYeTpYv(3,3),TpTvCYxYx(3,3),TpTvCYxYv(3,3),      & 
& TpTvCYvTpYv(3,3),md2YdadjYdYd(3,3),me2YeadjYeYe(3,3),ml2adjYeYeadjYe(3,3),             & 
& ml2adjYeYeadjYv(3,3),ml2adjYvYvadjYe(3,3),ml2adjYvYvadjYv(3,3),mq2adjYdYdadjYd(3,3),   & 
& mq2adjYdYdadjYu(3,3),mq2adjYuYuadjYd(3,3),mq2adjYuYuadjYu(3,3),mu2YuadjYuYu(3,3)

Complex(dp) :: mv2YxCYxYv(3,3),mv2YvadjYvYv(3,3),Ydmq2adjYdYd(3,3),YdadjYdmd2Yd(3,3),YdadjYdYdmq2(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYdTdadjYd(3,3),YdadjYdTdadjTd(3,3),YdadjYuYuadjYd(3,3),       & 
& YdadjYuTuadjYd(3,3),YdadjYuTuadjTd(3,3),YdadjTdTdadjYd(3,3),YdadjTuTuadjYd(3,3),       & 
& Yeml2adjYeYe(3,3),YeadjYeme2Ye(3,3),YeadjYeYeml2(3,3),YeadjYeYeadjYe(3,3),             & 
& YeadjYeTeadjYe(3,3),YeadjYeTeadjTe(3,3),YeadjYvYvadjYe(3,3),YeadjYvTvadjYe(3,3),       & 
& YeadjYvTvadjTe(3,3),YeadjTeTeadjYe(3,3),YeadjTvTvadjYe(3,3),YxCmv2CYxYv(3,3),          & 
& YxCYxmv2Yv(3,3),YxCYxYxCYx(3,3),YxCYxYvml2(3,3),YxCYxYvadjYv(3,3),YxCYxTxCYx(3,3),     & 
& YxCYxTxCTx(3,3),YxCYxTvadjYv(3,3),YxCYxTvadjTv(3,3),YxCYvTpYvCYx(3,3),YxCYvTpTvCTx(3,3),& 
& YxCTxTxCYx(3,3),YxCTxTvadjYv(3,3),YxCTvTpTvCYx(3,3),Yumq2adjYuYu(3,3),YuadjYdYdadjYu(3,3),& 
& YuadjYdTdadjYu(3,3),YuadjYdTdadjTu(3,3),YuadjYumu2Yu(3,3),YuadjYuYumq2(3,3),           & 
& YuadjYuYuadjYu(3,3),YuadjYuTuadjYu(3,3),YuadjYuTuadjTu(3,3),YuadjTdTdadjYu(3,3),       & 
& YuadjTuTuadjYu(3,3),Yvml2adjYvYv(3,3),YvadjYeYeadjYv(3,3),YvadjYeTeadjYv(3,3),         & 
& YvadjYeTeadjTv(3,3),YvadjYvmv2Yv(3,3),YvadjYvYxCYx(3,3),YvadjYvYvml2(3,3),             & 
& YvadjYvYvadjYv(3,3),YvadjYvTxCYx(3,3),YvadjYvTxCTx(3,3),YvadjYvTvadjYv(3,3),           & 
& YvadjYvTvadjTv(3,3),YvadjTeTeadjYv(3,3),YvadjTvTvadjYv(3,3),adjYdmd2YdadjYd(3,3),      & 
& adjYdmd2YdadjYu(3,3),adjYdYdmq2adjYd(3,3),adjYdYdmq2adjYu(3,3),adjYdYdadjYdmd2(3,3),   & 
& adjYdYdadjYdYd(3,3),adjYdYdadjYdTd(3,3),adjYdYdadjYumu2(3,3),adjYdYdadjYuYu(3,3),      & 
& adjYdYdadjYuTu(3,3),adjYdYdadjTdTd(3,3),adjYdTdadjYdYd(3,3),adjYdTdadjYuYu(3,3),       & 
& adjYdTdadjTdYd(3,3),adjYeme2YeadjYe(3,3),adjYeme2YeadjYv(3,3),adjYeYeml2adjYe(3,3),    & 
& adjYeYeml2adjYv(3,3),adjYeYeadjYeme2(3,3),adjYeYeadjYeYe(3,3),adjYeYeadjYeTe(3,3),     & 
& adjYeYeadjYvmv2(3,3),adjYeYeadjYvYx(3,3),adjYeYeadjYvYv(3,3),adjYeYeadjYvTx(3,3),      & 
& adjYeYeadjYvTv(3,3),adjYeYeadjTeTe(3,3),adjYeTeadjYeYe(3,3),adjYeTeadjYvYx(3,3),       & 
& adjYeTeadjYvYv(3,3),adjYeTeadjTeYe(3,3),adjYumu2YuadjYd(3,3),adjYumu2YuadjYu(3,3),     & 
& adjYuYumq2adjYd(3,3),adjYuYumq2adjYu(3,3),adjYuYuadjYdmd2(3,3),adjYuYuadjYdYd(3,3),    & 
& adjYuYuadjYdTd(3,3),adjYuYuadjYumu2(3,3),adjYuYuadjYuYu(3,3),adjYuYuadjYuTu(3,3),      & 
& adjYuYuadjTuTu(3,3),adjYuTuadjYdYd(3,3),adjYuTuadjYuYu(3,3),adjYuTuadjTuYu(3,3),       & 
& adjYvmv2YvadjYe(3,3),adjYvmv2YvadjYv(3,3),adjYvYxCYxYv(3,3),adjYvYxCYxTv(3,3),         & 
& adjYvYxCTxTv(3,3),adjYvYvml2adjYe(3,3),adjYvYvml2adjYv(3,3),adjYvYvadjYeme2(3,3),      & 
& adjYvYvadjYeYe(3,3),adjYvYvadjYeTe(3,3),adjYvYvadjYvmv2(3,3),adjYvYvadjYvYx(3,3),      & 
& adjYvYvadjYvYv(3,3),adjYvYvadjYvTx(3,3),adjYvYvadjYvTv(3,3),adjYvYvadjTvTv(3,3),       & 
& adjYvTxCYxYv(3,3),adjYvTxCTxYv(3,3),adjYvTvadjYeYe(3,3),adjYvTvadjYvYx(3,3),           & 
& adjYvTvadjYvYv(3,3),adjYvTvadjTvYv(3,3),adjTdYdadjYdTd(3,3),adjTdTdadjYdYd(3,3),       & 
& adjTeYeadjYeTe(3,3),adjTeTeadjYeYe(3,3),adjTuYuadjYuTu(3,3),adjTuTuadjYuYu(3,3),       & 
& adjTvYxCYxTv(3,3),adjTvYvadjYvTv(3,3),adjTvTxCYxYv(3,3),adjTvTvadjYvYv(3,3),           & 
& Cmv2CYxYxCYx(3,3),Cmv2CYxYvadjYv(3,3),Cmv2CYvTpYvCYx(3,3),CYxmv2YxCYx(3,3),            & 
& CYxYxCmv2CYx(3,3),CYxYxCYxmv2(3,3),CYxYxCYxYx(3,3),CYxYxCYxYv(3,3),CYxYxCYxTx(3,3),    & 
& CYxYxCYxTv(3,3),CYxYvadjYvYx(3,3),CYxYvadjYvTx(3,3),CYxTxCYxYx(3,3),CYxTxCYxYv(3,3)

Complex(dp) :: CYxTxCTvTpYv(3,3),CYxTvadjYvYx(3,3),CYvCml2TpYvCYx(3,3),CYvTpYeCYeTpYv(3,3),           & 
& CYvTpYeCYeTpTv(3,3),CYvTpYvCmv2CYx(3,3),CYvTpYvCYxmv2(3,3),CYvTpYvCYxYx(3,3),          & 
& CYvTpYvCYxYv(3,3),CYvTpYvCYxTx(3,3),CYvTpYvCYxTv(3,3),CYvTpYvCYvTpYv(3,3),             & 
& CYvTpYvCYvTpTv(3,3),CYvTpTeCYeTpYv(3,3),CYvTpTvCYxYx(3,3),CYvTpTvCYxYv(3,3),           & 
& CYvTpTvCYvTpYv(3,3),TdadjYdYdadjTd(3,3),TdadjYuYuadjTd(3,3),TdadjTdYdadjYd(3,3),       & 
& TdadjTuYuadjYd(3,3),TeadjYeYeadjTe(3,3),TeadjYvYvadjTe(3,3),TeadjTeYeadjYe(3,3),       & 
& TeadjTvYvadjYe(3,3),TxCYxYxCTx(3,3),TxCYvTpYvCTx(3,3),TxCTxYxCYx(3,3),TxCTvTpYvCYx(3,3),& 
& TuadjYdYdadjTu(3,3),TuadjYuYuadjTu(3,3),TuadjTdYdadjYu(3,3),TuadjTuYuadjYu(3,3),       & 
& TvadjYeYeadjTv(3,3),TvadjYvYvadjTv(3,3),TvadjTeYeadjYv(3,3),TvadjTvYvadjYv(3,3),       & 
& md2YdadjYdYdadjYd(3,3),md2YdadjYuYuadjYd(3,3),me2YeadjYeYeadjYe(3,3),me2YeadjYvYvadjYe(3,3),& 
& ml2adjYeYeadjYeYe(3,3),ml2adjYeYeadjYvYv(3,3),ml2adjYvYxCYxYv(3,3),ml2adjYvYvadjYeYe(3,3),& 
& ml2adjYvYvadjYvYv(3,3),mq2adjYdYdadjYdYd(3,3),mq2adjYdYdadjYuYu(3,3),mq2adjYuYuadjYdYd(3,3),& 
& mq2adjYuYuadjYuYu(3,3),mu2YuadjYdYdadjYu(3,3),mu2YuadjYuYuadjYu(3,3),mv2YxCYxYxCYx(3,3),& 
& mv2YxCYxYvadjYv(3,3),mv2YxCYvTpYvCYx(3,3),mv2YvadjYeYeadjYv(3,3),mv2YvadjYvYxCYx(3,3), & 
& mv2YvadjYvYvadjYv(3,3),Ydmq2adjYdYdadjYd(3,3),Ydmq2adjYuYuadjYd(3,3),YdadjYdmd2YdadjYd(3,3),& 
& YdadjYdYdmq2adjYd(3,3),YdadjYdYdadjYdmd2(3,3),YdadjYdYdadjYdYd(3,3),YdadjYdYdadjYdTd(3,3),& 
& YdadjYdTdadjYdYd(3,3),YdadjYumu2YuadjYd(3,3),YdadjYuYumq2adjYd(3,3),YdadjYuYuadjYdmd2(3,3),& 
& YdadjYuYuadjYdYd(3,3),YdadjYuYuadjYdTd(3,3),YdadjYuYuadjYuYu(3,3),YdadjYuYuadjYuTu(3,3),& 
& YdadjYuTuadjYdYd(3,3),YdadjYuTuadjYuYu(3,3),Yeml2adjYeYeadjYe(3,3),Yeml2adjYvYvadjYe(3,3),& 
& YeadjYeme2YeadjYe(3,3),YeadjYeYeml2adjYe(3,3),YeadjYeYeadjYeme2(3,3),YeadjYeYeadjYeYe(3,3),& 
& YeadjYeYeadjYeTe(3,3),YeadjYeTeadjYeYe(3,3),YeadjYvmv2YvadjYe(3,3),YeadjYvYxCYxYv(3,3),& 
& YeadjYvYxCYxTv(3,3),YeadjYvYvml2adjYe(3,3),YeadjYvYvadjYeme2(3,3),YeadjYvYvadjYeYe(3,3),& 
& YeadjYvYvadjYeTe(3,3),YeadjYvYvadjYvYv(3,3),YeadjYvYvadjYvTv(3,3),YeadjYvTxCYxYv(3,3), & 
& YeadjYvTvadjYeYe(3,3),YeadjYvTvadjYvYv(3,3),YxCmv2CYxYxCYx(3,3),YxCmv2CYxYvadjYv(3,3), & 
& YxCmv2CYvTpYvCYx(3,3),YxCYxmv2YxCYx(3,3),YxCYxYxCmv2CYx(3,3),YxCYxYxCYxmv2(3,3),       & 
& YxCYxYxCYxYx(3,3),YxCYxYxCYxYv(3,3),YxCYxYxCYxTx(3,3),YxCYxYxCYxTv(3,3),               & 
& YxCYxYvadjYvYx(3,3),YxCYxYvadjYvTx(3,3),YxCYxTxCYxYx(3,3),YxCYxTxCYxYv(3,3),           & 
& YxCYxTvadjYvYx(3,3),YxCYvCml2TpYvCYx(3,3),YxCYvTpYeCYeTpYv(3,3),YxCYvTpYeCYeTpTv(3,3), & 
& YxCYvTpYvCmv2CYx(3,3),YxCYvTpYvCYxmv2(3,3),YxCYvTpYvCYxYx(3,3),YxCYvTpYvCYxYv(3,3),    & 
& YxCYvTpYvCYxTx(3,3),YxCYvTpYvCYxTv(3,3),YxCYvTpYvCYvTpYv(3,3),YxCYvTpYvCYvTpTv(3,3),   & 
& YxCYvTpTeCYeTpYv(3,3),YxCYvTpTvCYxYx(3,3),YxCYvTpTvCYxYv(3,3),YxCYvTpTvCYvTpYv(3,3),   & 
& Yumq2adjYdYdadjYu(3,3),Yumq2adjYuYuadjYu(3,3),YuadjYdmd2YdadjYu(3,3),YuadjYdYdmq2adjYu(3,3),& 
& YuadjYdYdadjYdYd(3,3),YuadjYdYdadjYdTd(3,3),YuadjYdYdadjYumu2(3,3),YuadjYdYdadjYuYu(3,3),& 
& YuadjYdYdadjYuTu(3,3),YuadjYdTdadjYdYd(3,3),YuadjYdTdadjYuYu(3,3),YuadjYumu2YuadjYu(3,3),& 
& YuadjYuYumq2adjYu(3,3),YuadjYuYuadjYumu2(3,3),YuadjYuYuadjYuYu(3,3),YuadjYuYuadjYuTu(3,3),& 
& YuadjYuTuadjYuYu(3,3),Yvml2adjYeYeadjYv(3,3),Yvml2adjYvYvadjYv(3,3),YvadjYeme2YeadjYv(3,3),& 
& YvadjYeYeml2adjYv(3,3),YvadjYeYeadjYeYe(3,3),YvadjYeYeadjYeTe(3,3),YvadjYeYeadjYvmv2(3,3)

Complex(dp) :: YvadjYeYeadjYvYx(3,3),YvadjYeYeadjYvYv(3,3),YvadjYeYeadjYvTx(3,3),YvadjYeYeadjYvTv(3,3),& 
& YvadjYeTeadjYeYe(3,3),YvadjYeTeadjYvYx(3,3),YvadjYeTeadjYvYv(3,3),YvadjYvmv2YvadjYv(3,3),& 
& YvadjYvYxCYxYv(3,3),YvadjYvYxCYxTv(3,3),YvadjYvYvml2adjYv(3,3),YvadjYvYvadjYvmv2(3,3), & 
& YvadjYvYvadjYvYx(3,3),YvadjYvYvadjYvYv(3,3),YvadjYvYvadjYvTx(3,3),YvadjYvYvadjYvTv(3,3),& 
& YvadjYvTxCYxYv(3,3),YvadjYvTvadjYvYx(3,3),YvadjYvTvadjYvYv(3,3),adjYdmd2YdadjYdYd(3,3),& 
& adjYdYdmq2adjYdYd(3,3),adjYdYdadjYdmd2Yd(3,3),adjYdYdadjYdYdmq2(3,3),adjYeme2YeadjYeYe(3,3),& 
& adjYeYeml2adjYeYe(3,3),adjYeYeadjYeme2Ye(3,3),adjYeYeadjYeYeml2(3,3),adjYumu2YuadjYuYu(3,3),& 
& adjYuYumq2adjYuYu(3,3),adjYuYuadjYumu2Yu(3,3),adjYuYuadjYuYumq2(3,3),adjYvmv2YxCYxYv(3,3),& 
& adjYvmv2YvadjYvYv(3,3),adjYvYxCmv2CYxYv(3,3),adjYvYxCYxmv2Yv(3,3),adjYvYxCYxYvml2(3,3),& 
& adjYvYvml2adjYvYv(3,3),adjYvYvadjYvmv2Yv(3,3),adjYvYvadjYvYvml2(3,3),TdadjYdYdadjYdYd(3,3),& 
& TdadjYuYuadjYdYd(3,3),TdadjYuYuadjYuYu(3,3),TeadjYeYeadjYeYe(3,3),TeadjYvYxCYxYv(3,3), & 
& TeadjYvYvadjYeYe(3,3),TeadjYvYvadjYvYv(3,3),TxCYxYxCYxYx(3,3),TxCYxYxCYxYv(3,3),       & 
& TxCYxYvadjYvYx(3,3),TxCYvTpYeCYeTpYv(3,3),TxCYvTpYvCYxYx(3,3),TxCYvTpYvCYxYv(3,3),     & 
& TxCYvTpYvCYvTpYv(3,3),TuadjYdYdadjYdYd(3,3),TuadjYdYdadjYuYu(3,3),TuadjYuYuadjYuYu(3,3),& 
& TvadjYeYeadjYeYe(3,3),TvadjYeYeadjYvYx(3,3),TvadjYeYeadjYvYv(3,3),TvadjYvYxCYxYv(3,3), & 
& TvadjYvYvadjYvYx(3,3),TvadjYvYvadjYvYv(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,Trmv2,TrYdadjYd,TrYeadjYe,TrYxCYx,TrYuadjYu,            & 
& TrYvadjYv,TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrCYxTx,TrCTdTpTd,TrCTeTpTe,         & 
& TrCTxTx,TrCTuTpTu,TrCTvTpTv,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2adjYvYv,       & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,Trmv2YxCYx,Trmv2YvadjYv

Complex(dp) :: TrYxCTx,TrCTdTpYd,TrCTeTpYe,TrCTuTpYu,TrCTvTpYv,Trmv2CYxYx,TrYdadjYdCmd2,             & 
& TrYdCmq2adjYd,TrYeadjYeCme2,TrYeCml2adjYe,TrYuadjYuCmu2,TrYuCmq2adjYu,TrYvadjYvCmv2,   & 
& TrYvCml2adjYv,TrYdadjYdYdadjYd,TrYdadjYdTdadjYd,TrYdadjYdTdadjTd,TrYdadjYuYuadjYd,     & 
& TrYdadjYuTuadjYd,TrYdadjYuTuadjTd,TrYdadjTdTdadjYd,TrYdadjTuTuadjYd,TrYeadjYeYeadjYe,  & 
& TrYeadjYeTeadjYe,TrYeadjYeTeadjTe,TrYeadjYvYvadjYe,TrYeadjYvTvadjYe,TrYeadjYvTvadjTe,  & 
& TrYeadjTeTeadjYe,TrYeadjTvTvadjYe,TrYxCYxYxCYx,TrYxCYxYvadjYv,TrYxCYxTxCYx,            & 
& TrYxCYxTxCTx,TrYxCYxTvadjYv,TrYxCYxTvadjTv,TrYxCTxTxCYx,TrYxCTxTvadjYv,TrYuadjYdTdadjYu,& 
& TrYuadjYdTdadjTu,TrYuadjYuYuadjYu,TrYuadjYuTuadjYu,TrYuadjYuTuadjTu,TrYuadjTdTdadjYu,  & 
& TrYuadjTuTuadjYu,TrYvadjYeTeadjYv,TrYvadjYeTeadjTv,TrYvadjYvYvadjYv,TrYvadjYvTxCYx,    & 
& TrYvadjYvTxCTx,TrYvadjYvTvadjYv,TrYvadjYvTvadjTv,TrYvadjTeTeadjYv,TrYvadjTvTvadjYv,    & 
& TrCYxTxCTvTpYv,Trmd2YdadjYdYdadjYd,Trmd2YdadjYuYuadjYd,Trme2YeadjYeYeadjYe,            & 
& Trme2YeadjYvYvadjYe,Trml2adjYeYeadjYeYe,Trml2adjYeYeadjYvYv,Trml2adjYvYxCYxYv,         & 
& Trml2adjYvYvadjYeYe,Trml2adjYvYvadjYvYv,Trmq2adjYdYdadjYdYd,Trmq2adjYdYdadjYuYu,       & 
& Trmq2adjYuYuadjYdYd,Trmq2adjYuYuadjYuYu,Trmu2YuadjYdYdadjYu,Trmu2YuadjYuYuadjYu,       & 
& Trmv2YxCYxYxCYx,Trmv2YxCYxYvadjYv,Trmv2YvadjYeYeadjYv,Trmv2YvadjYvYxCYx,               & 
& Trmv2YvadjYvYvadjYv,TrYxCmv2CYxYvadjYv

Real(dp) :: g1p2,g1p3,gYBp2,g2p2,g2p3,g3p2,g3p3,gBLp2,gBLp3,gBYp2

Complex(dp) :: sqrt2ov5,sqrt3ov5,sqrt3ov2,sqrt2,sqrt3,sqrt5,sqrt6,ooSqrt10,sqrt10,sqrt15

Real(dp) :: g1p4,g1p5,gYBp3,gYBp4,gYBp5,g2p4,g3p4,gBLp4,gBLp5,gBYp3,gBYp4,gBYp5

Complex(dp) :: sqrt2ov3,sqrt5ov2,ooSqrt3,ooSqrt15

Iname = Iname +1 
NameOfUnit(Iname) = 'rge316' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters316(gy,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)

AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
AbsMBp = Conjg(MBp)*MBp
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yx,adjYx)
Call Adjungate(Yv,adjYv)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tu,adjTu)
Call Adjungate(Tx,adjTx)
Call Adjungate(Tv,adjTv)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2adjYv = Matmul2(ml2,adjYv,OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2Yv = Matmul2(mv2,Yv,OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YxCYx = Matmul2(Yx,adjYx,OnlyDiagonal) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 Yvml2 = Matmul2(Yv,ml2,OnlyDiagonal) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvmv2 = Matmul2(adjYv,mv2,OnlyDiagonal) 
 adjYvYx = Matmul2(adjYv,Yx,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvTx = Matmul2(adjYv,Tx,OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 adjTvTv = Matmul2(adjTv,Tv,OnlyDiagonal) 
 Cmv2CYx = Matmul2(Conjg(mv2),adjYx,OnlyDiagonal) 
 CYxmv2 = Matmul2(adjYx,mv2,OnlyDiagonal) 
 CYxYx = Matmul2(adjYx,Yx,OnlyDiagonal) 
 CYxYv = Matmul2(adjYx,Yv,OnlyDiagonal) 
 CYxTx = Matmul2(adjYx,Tx,OnlyDiagonal) 
 CYxTv = Matmul2(adjYx,Tv,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTxTx = Matmul2(adjTx,Tx,OnlyDiagonal) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TxCTx = Matmul2(Tx,adjTx,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2adjYvYv = Matmul2(ml2,adjYvYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2YxCYx = Matmul2(mv2,YxCYx,OnlyDiagonal) 
 mv2YvadjYv = Matmul2(mv2,YvadjYv,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeadjYvYv = Matmul2(Ye,adjYvYv,OnlyDiagonal) 
 YeadjYvTv = Matmul2(Ye,adjYvTv,OnlyDiagonal) 
 YxCmv2CYx = Matmul2(Yx,Cmv2CYx,OnlyDiagonal) 
 YxCYxmv2 = Matmul2(Yx,CYxmv2,OnlyDiagonal) 
 YxCYxYx = Matmul2(Yx,CYxYx,OnlyDiagonal) 
 YxCYxYv = Matmul2(Yx,CYxYv,OnlyDiagonal) 
 YxCYxTx = Matmul2(Yx,CYxTx,OnlyDiagonal) 
 YxCYxTv = Matmul2(Yx,CYxTv,OnlyDiagonal) 
 YxCYvTpYv = Matmul2(Yx,CYvTpYv,OnlyDiagonal) 
 YxCYvTpTv = Matmul2(Yx,CYvTpTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 Yvml2adjYv = Matmul2(Yv,ml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  Yvml2adjYv(i2,i2) =  Real(Yvml2adjYv(i2,i2),dp) 
 YvadjYeYe = Matmul2(Yv,adjYeYe,OnlyDiagonal) 
 YvadjYeTe = Matmul2(Yv,adjYeTe,OnlyDiagonal) 
 YvadjYvmv2 = Matmul2(Yv,adjYvmv2,OnlyDiagonal) 
 YvadjYvYx = Matmul2(Yv,adjYvYx,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvTx = Matmul2(Yv,adjYvTx,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 adjYvmv2Yv = Matmul2(adjYv,mv2Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvmv2Yv(i2,i2) =  Real(adjYvmv2Yv(i2,i2),dp) 
 adjYvYvml2 = Matmul2(adjYv,Yvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeadjYvYv = Matmul2(Te,adjYvYv,OnlyDiagonal) 
 TxCYxYx = Matmul2(Tx,CYxYx,OnlyDiagonal) 
 TxCYxYv = Matmul2(Tx,CYxYv,OnlyDiagonal) 
 TxCYvTpYv = Matmul2(Tx,CYvTpYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYeYe = Matmul2(Tv,adjYeYe,OnlyDiagonal) 
 TvadjYvYx = Matmul2(Tv,adjYvYx,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 Trmv2 = Real(cTrace(mv2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYxCYx = cTrace(YxCYx) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrCYxTx = cTrace(CYxTx) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTxTx = cTrace(CTxTx) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2adjYvYv = cTrace(ml2adjYvYv) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 Trmv2YxCYx = cTrace(mv2YxCYx) 
 Trmv2YvadjYv = cTrace(mv2YvadjYv) 
 sqrt2ov5 =Sqrt(2._dp/5._dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 sqrt3ov2 =Sqrt(3._dp/2._dp) 
 sqrt2 =sqrt(2._dp) 
 sqrt3 =sqrt(3._dp) 
 sqrt5 =sqrt(5._dp) 
 sqrt6 =sqrt(6._dp) 
 ooSqrt10 =1._dp/sqrt(10._dp) 
 sqrt10 =sqrt(10._dp) 
 sqrt15 =sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 gYBp2 =gYB**2 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gBLp2 =gBL**2 
 gBLp3 =gBL**3 
 gBYp2 =gBY**2 
 sqrt2ov3 =Sqrt(2._dp/3._dp) 
 sqrt5ov2 =Sqrt(5._dp/2._dp) 
 ooSqrt3 =1._dp/sqrt(3._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 


If (TwoLoopRGE) Then 
 YdadjYu = Matmul2(Yd,adjYu,OnlyDiagonal) 
 YdadjTd = Matmul2(Yd,adjTd,OnlyDiagonal) 
 YdadjTu = Matmul2(Yd,adjTu,OnlyDiagonal) 
 YeadjYv = Matmul2(Ye,adjYv,OnlyDiagonal) 
 YeadjTe = Matmul2(Ye,adjTe,OnlyDiagonal) 
 YeadjTv = Matmul2(Ye,adjTv,OnlyDiagonal) 
 YxCTx = Matmul2(Yx,adjTx,OnlyDiagonal) 
 YuadjYd = Matmul2(Yu,adjYd,OnlyDiagonal) 
 YuadjTd = Matmul2(Yu,adjTd,OnlyDiagonal) 
 YuadjTu = Matmul2(Yu,adjTu,OnlyDiagonal) 
 YvadjYe = Matmul2(Yv,adjYe,OnlyDiagonal) 
 YvadjTe = Matmul2(Yv,adjTe,OnlyDiagonal) 
 YvadjTv = Matmul2(Yv,adjTv,OnlyDiagonal) 
 adjYdCmd2 = Matmul2(adjYd,Conjg(md2),OnlyDiagonal) 
 adjYeCme2 = Matmul2(adjYe,Conjg(me2),OnlyDiagonal) 
 adjYuCmu2 = Matmul2(adjYu,Conjg(mu2),OnlyDiagonal) 
 adjYvCmv2 = Matmul2(adjYv,Conjg(mv2),OnlyDiagonal) 
 adjTdYd = Matmul2(adjTd,Yd,OnlyDiagonal) 
 adjTeYe = Matmul2(adjTe,Ye,OnlyDiagonal) 
 adjTuYu = Matmul2(adjTu,Yu,OnlyDiagonal) 
 adjTvYv = Matmul2(adjTv,Yv,OnlyDiagonal) 
 Cml2adjYe = Matmul2(Conjg(ml2),adjYe,OnlyDiagonal) 
 Cml2adjYv = Matmul2(Conjg(ml2),adjYv,OnlyDiagonal) 
 Cmq2adjYd = Matmul2(Conjg(mq2),adjYd,OnlyDiagonal) 
 Cmq2adjYu = Matmul2(Conjg(mq2),adjYu,OnlyDiagonal) 
 CYeTpYv = Matmul2(Conjg(Ye),Transpose(Yv),OnlyDiagonal) 
 CYeTpTv = Matmul2(Conjg(Ye),Transpose(Tv),OnlyDiagonal) 
 CTdTpYd = Matmul2(Conjg(Td),Transpose(Yd),OnlyDiagonal) 
 CTeTpYe = Matmul2(Conjg(Te),Transpose(Ye),OnlyDiagonal) 
 CTxYv = Matmul2(adjTx,Yv,OnlyDiagonal) 
 CTxTv = Matmul2(adjTx,Tv,OnlyDiagonal) 
 CTuTpYu = Matmul2(Conjg(Tu),Transpose(Yu),OnlyDiagonal) 
 CTvTpYv = Matmul2(Conjg(Tv),Transpose(Yv),OnlyDiagonal) 
 TdadjYd = Matmul2(Td,adjYd,OnlyDiagonal) 
 TdadjYu = Matmul2(Td,adjYu,OnlyDiagonal) 
 TdadjTu = Matmul2(Td,adjTu,OnlyDiagonal) 
 TeadjYe = Matmul2(Te,adjYe,OnlyDiagonal) 
 TeadjYv = Matmul2(Te,adjYv,OnlyDiagonal) 
 TeadjTv = Matmul2(Te,adjTv,OnlyDiagonal) 
 TxCYx = Matmul2(Tx,adjYx,OnlyDiagonal) 
 TuadjYd = Matmul2(Tu,adjYd,OnlyDiagonal) 
 TuadjYu = Matmul2(Tu,adjYu,OnlyDiagonal) 
 TuadjTd = Matmul2(Tu,adjTd,OnlyDiagonal) 
 TvadjYe = Matmul2(Tv,adjYe,OnlyDiagonal) 
 TvadjYv = Matmul2(Tv,adjYv,OnlyDiagonal) 
 TvadjTe = Matmul2(Tv,adjTe,OnlyDiagonal) 
 TpYvCYx = Matmul2(Transpose(Yv),adjYx,OnlyDiagonal) 
 TpYvCTx = Matmul2(Transpose(Yv),adjTx,OnlyDiagonal) 
 TpTvCYx = Matmul2(Transpose(Tv),adjYx,OnlyDiagonal) 
 TpTvCTx = Matmul2(Transpose(Tv),adjTx,OnlyDiagonal) 
 md2YdadjYu = Matmul2(md2,YdadjYu,OnlyDiagonal) 
 me2YeadjYv = Matmul2(me2,YeadjYv,OnlyDiagonal) 
 mu2YuadjYd = Matmul2(mu2,YuadjYd,OnlyDiagonal) 
 mv2YvadjYe = Matmul2(mv2,YvadjYe,OnlyDiagonal) 
 mv2CYxYx = Matmul2(mv2,CYxYx,OnlyDiagonal) 
 Ydmq2adjYu = Matmul2(Yd,mq2adjYu,OnlyDiagonal) 
 YdadjYdCmd2 = Matmul2(Yd,adjYdCmd2,OnlyDiagonal) 
 YdadjYumu2 = Matmul2(Yd,adjYumu2,OnlyDiagonal) 
 YdadjTdTd = Matmul2(Yd,adjTdTd,OnlyDiagonal) 
 YdCmq2adjYd = Matmul2(Yd,Cmq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdCmq2adjYd(i2,i2) =  Real(YdCmq2adjYd(i2,i2),dp) 
 Yeml2adjYv = Matmul2(Ye,ml2adjYv,OnlyDiagonal) 
 YeadjYeCme2 = Matmul2(Ye,adjYeCme2,OnlyDiagonal) 
 YeadjYvmv2 = Matmul2(Ye,adjYvmv2,OnlyDiagonal) 
 YeadjYvYx = Matmul2(Ye,adjYvYx,OnlyDiagonal) 
 YeadjYvTx = Matmul2(Ye,adjYvTx,OnlyDiagonal) 
 YeadjTeTe = Matmul2(Ye,adjTeTe,OnlyDiagonal) 
 YeCml2adjYe = Matmul2(Ye,Cml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCml2adjYe(i2,i2) =  Real(YeCml2adjYe(i2,i2),dp) 
 YxCTxTv = Matmul2(Yx,CTxTv,OnlyDiagonal) 
 Yumq2adjYd = Matmul2(Yu,mq2adjYd,OnlyDiagonal) 
 YuadjYdmd2 = Matmul2(Yu,adjYdmd2,OnlyDiagonal) 
 YuadjYuCmu2 = Matmul2(Yu,adjYuCmu2,OnlyDiagonal) 
 YuadjTuTu = Matmul2(Yu,adjTuTu,OnlyDiagonal) 
 YuCmq2adjYu = Matmul2(Yu,Cmq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuCmq2adjYu(i2,i2) =  Real(YuCmq2adjYu(i2,i2),dp) 
 Yvml2adjYe = Matmul2(Yv,ml2adjYe,OnlyDiagonal) 
 YvadjYeme2 = Matmul2(Yv,adjYeme2,OnlyDiagonal) 
 YvadjYvCmv2 = Matmul2(Yv,adjYvCmv2,OnlyDiagonal) 
 YvadjTvTv = Matmul2(Yv,adjTvTv,OnlyDiagonal) 
 YvCml2adjYv = Matmul2(Yv,Cml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvCml2adjYv(i2,i2) =  Real(YvCml2adjYv(i2,i2),dp) 
 adjYdYdadjYd = Matmul2(adjYd,YdadjYd,OnlyDiagonal) 
 adjYdYdadjYu = Matmul2(adjYd,YdadjYu,OnlyDiagonal) 
 adjYdYdadjTd = Matmul2(adjYd,YdadjTd,OnlyDiagonal) 
 adjYdYdadjTu = Matmul2(adjYd,YdadjTu,OnlyDiagonal) 
 adjYdTdadjYd = Matmul2(adjYd,TdadjYd,OnlyDiagonal) 
 adjYdTdadjYu = Matmul2(adjYd,TdadjYu,OnlyDiagonal) 
 adjYdTdadjTd = Matmul2(adjYd,TdadjTd,OnlyDiagonal) 
 adjYdTdadjTu = Matmul2(adjYd,TdadjTu,OnlyDiagonal) 
 adjYeYeadjYe = Matmul2(adjYe,YeadjYe,OnlyDiagonal) 
 adjYeYeadjYv = Matmul2(adjYe,YeadjYv,OnlyDiagonal) 
 adjYeYeadjTe = Matmul2(adjYe,YeadjTe,OnlyDiagonal) 
 adjYeYeadjTv = Matmul2(adjYe,YeadjTv,OnlyDiagonal) 
 adjYeTeadjYe = Matmul2(adjYe,TeadjYe,OnlyDiagonal) 
 adjYeTeadjYv = Matmul2(adjYe,TeadjYv,OnlyDiagonal) 
 adjYeTeadjTe = Matmul2(adjYe,TeadjTe,OnlyDiagonal) 
 adjYeTeadjTv = Matmul2(adjYe,TeadjTv,OnlyDiagonal) 
 adjYuYuadjYd = Matmul2(adjYu,YuadjYd,OnlyDiagonal) 
 adjYuYuadjYu = Matmul2(adjYu,YuadjYu,OnlyDiagonal) 
 adjYuYuadjTd = Matmul2(adjYu,YuadjTd,OnlyDiagonal) 
 adjYuYuadjTu = Matmul2(adjYu,YuadjTu,OnlyDiagonal) 
 adjYuTuadjYd = Matmul2(adjYu,TuadjYd,OnlyDiagonal) 
 adjYuTuadjYu = Matmul2(adjYu,TuadjYu,OnlyDiagonal) 
 adjYuTuadjTd = Matmul2(adjYu,TuadjTd,OnlyDiagonal) 
 adjYuTuadjTu = Matmul2(adjYu,TuadjTu,OnlyDiagonal) 
 adjYvYxCYx = Matmul2(adjYv,YxCYx,OnlyDiagonal) 
 adjYvYvadjYe = Matmul2(adjYv,YvadjYe,OnlyDiagonal) 
 adjYvYvadjYv = Matmul2(adjYv,YvadjYv,OnlyDiagonal) 
 adjYvYvadjTe = Matmul2(adjYv,YvadjTe,OnlyDiagonal) 
 adjYvYvadjTv = Matmul2(adjYv,YvadjTv,OnlyDiagonal) 
 adjYvTxCYx = Matmul2(adjYv,TxCYx,OnlyDiagonal) 
 adjYvTxCTx = Matmul2(adjYv,TxCTx,OnlyDiagonal) 
 adjYvTvadjYe = Matmul2(adjYv,TvadjYe,OnlyDiagonal) 
 adjYvTvadjYv = Matmul2(adjYv,TvadjYv,OnlyDiagonal) 
 adjYvTvadjTe = Matmul2(adjYv,TvadjTe,OnlyDiagonal) 
 adjYvTvadjTv = Matmul2(adjYv,TvadjTv,OnlyDiagonal) 
 adjTdYdadjYd = Matmul2(adjTd,YdadjYd,OnlyDiagonal) 
 adjTdYdadjYu = Matmul2(adjTd,YdadjYu,OnlyDiagonal) 
 adjTdTdadjYd = Matmul2(adjTd,TdadjYd,OnlyDiagonal) 
 adjTdTdadjYu = Matmul2(adjTd,TdadjYu,OnlyDiagonal) 
 adjTeYeadjYe = Matmul2(adjTe,YeadjYe,OnlyDiagonal) 
 adjTeYeadjYv = Matmul2(adjTe,YeadjYv,OnlyDiagonal) 
 adjTeTeadjYe = Matmul2(adjTe,TeadjYe,OnlyDiagonal) 
 adjTeTeadjYv = Matmul2(adjTe,TeadjYv,OnlyDiagonal) 
 adjTuYuadjYd = Matmul2(adjTu,YuadjYd,OnlyDiagonal) 
 adjTuYuadjYu = Matmul2(adjTu,YuadjYu,OnlyDiagonal) 
 adjTuTuadjYd = Matmul2(adjTu,TuadjYd,OnlyDiagonal) 
 adjTuTuadjYu = Matmul2(adjTu,TuadjYu,OnlyDiagonal) 
 adjTvYvadjYe = Matmul2(adjTv,YvadjYe,OnlyDiagonal) 
 adjTvYvadjYv = Matmul2(adjTv,YvadjYv,OnlyDiagonal) 
 adjTvTvadjYe = Matmul2(adjTv,TvadjYe,OnlyDiagonal) 
 adjTvTvadjYv = Matmul2(adjTv,TvadjYv,OnlyDiagonal) 
 Cml2TpYvCYx = Matmul2(Conjg(ml2),TpYvCYx,OnlyDiagonal) 
 Cmv2CYxYv = Matmul2(Conjg(mv2),CYxYv,OnlyDiagonal) 
 CYxmv2Yv = Matmul2(adjYx,mv2Yv,OnlyDiagonal) 
 CYxYxCYx = Matmul2(adjYx,YxCYx,OnlyDiagonal) 
 CYxYxCTx = Matmul2(adjYx,YxCTx,OnlyDiagonal) 
 CYxYvml2 = Matmul2(adjYx,Yvml2,OnlyDiagonal) 
 CYxYvadjYv = Matmul2(adjYx,YvadjYv,OnlyDiagonal) 
 CYxTxCYx = Matmul2(adjYx,TxCYx,OnlyDiagonal) 
 CYxTxCTx = Matmul2(adjYx,TxCTx,OnlyDiagonal) 
 CYxTvadjYv = Matmul2(adjYx,TvadjYv,OnlyDiagonal) 
 CYxTvadjTv = Matmul2(adjYx,TvadjTv,OnlyDiagonal) 
 CYvTpYvCYx = Matmul2(Conjg(Yv),TpYvCYx,OnlyDiagonal) 
 CYvTpYvCTx = Matmul2(Conjg(Yv),TpYvCTx,OnlyDiagonal) 
 CYvTpTvCTx = Matmul2(Conjg(Yv),TpTvCTx,OnlyDiagonal) 
 CTxYxCYx = Matmul2(adjTx,YxCYx,OnlyDiagonal) 
 CTxTxCYx = Matmul2(adjTx,TxCYx,OnlyDiagonal) 
 CTxTvadjYv = Matmul2(adjTx,TvadjYv,OnlyDiagonal) 
 CTvTpYvCYx = Matmul2(Conjg(Tv),TpYvCYx,OnlyDiagonal) 
 CTvTpTvCYx = Matmul2(Conjg(Tv),TpTvCYx,OnlyDiagonal) 
 TdadjTdYd = Matmul2(Td,adjTdYd,OnlyDiagonal) 
 TeadjYvYx = Matmul2(Te,adjYvYx,OnlyDiagonal) 
 TeadjTeYe = Matmul2(Te,adjTeYe,OnlyDiagonal) 
 TxCTxYv = Matmul2(Tx,CTxYv,OnlyDiagonal) 
 TxCTvTpYv = Matmul2(Tx,CTvTpYv,OnlyDiagonal) 
 TuadjTuYu = Matmul2(Tu,adjTuYu,OnlyDiagonal) 
 TvadjTvYv = Matmul2(Tv,adjTvYv,OnlyDiagonal) 
 TpYeCYeTpYv = Matmul2(Transpose(Ye),CYeTpYv,OnlyDiagonal) 
 TpYeCYeTpTv = Matmul2(Transpose(Ye),CYeTpTv,OnlyDiagonal) 
 TpYvCmv2CYx = Matmul2(Transpose(Yv),Cmv2CYx,OnlyDiagonal) 
 TpYvCYxmv2 = Matmul2(Transpose(Yv),CYxmv2,OnlyDiagonal) 
 TpYvCYxYx = Matmul2(Transpose(Yv),CYxYx,OnlyDiagonal) 
 TpYvCYxYv = Matmul2(Transpose(Yv),CYxYv,OnlyDiagonal) 
 TpYvCYxTx = Matmul2(Transpose(Yv),CYxTx,OnlyDiagonal) 
 TpYvCYxTv = Matmul2(Transpose(Yv),CYxTv,OnlyDiagonal) 
 TpYvCYvTpYv = Matmul2(Transpose(Yv),CYvTpYv,OnlyDiagonal) 
 TpYvCYvTpTv = Matmul2(Transpose(Yv),CYvTpTv,OnlyDiagonal) 
 TpTeCYeTpYv = Matmul2(Transpose(Te),CYeTpYv,OnlyDiagonal) 
 TpTvCYxYx = Matmul2(Transpose(Tv),CYxYx,OnlyDiagonal) 
 TpTvCYxYv = Matmul2(Transpose(Tv),CYxYv,OnlyDiagonal) 
 TpTvCYvTpYv = Matmul2(Transpose(Tv),CYvTpYv,OnlyDiagonal) 
 md2YdadjYdYd = Matmul2(md2,YdadjYdYd,OnlyDiagonal) 
 me2YeadjYeYe = Matmul2(me2,YeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYe = Matmul2(ml2,adjYeYeadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYv = Matmul2(ml2,adjYeYeadjYv,OnlyDiagonal) 
 ml2adjYvYvadjYe = Matmul2(ml2,adjYvYvadjYe,OnlyDiagonal) 
 ml2adjYvYvadjYv = Matmul2(ml2,adjYvYvadjYv,OnlyDiagonal) 
 mq2adjYdYdadjYd = Matmul2(mq2,adjYdYdadjYd,OnlyDiagonal) 
 mq2adjYdYdadjYu = Matmul2(mq2,adjYdYdadjYu,OnlyDiagonal) 
 mq2adjYuYuadjYd = Matmul2(mq2,adjYuYuadjYd,OnlyDiagonal) 
 mq2adjYuYuadjYu = Matmul2(mq2,adjYuYuadjYu,OnlyDiagonal) 
 mu2YuadjYuYu = Matmul2(mu2,YuadjYuYu,OnlyDiagonal) 
 mv2YxCYxYv = Matmul2(mv2,YxCYxYv,OnlyDiagonal) 
 mv2YvadjYvYv = Matmul2(mv2,YvadjYvYv,OnlyDiagonal) 
 Ydmq2adjYdYd = Matmul2(Yd,mq2adjYdYd,OnlyDiagonal) 
 YdadjYdmd2Yd = Matmul2(Yd,adjYdmd2Yd,OnlyDiagonal) 
 YdadjYdYdmq2 = Matmul2(Yd,adjYdYdmq2,OnlyDiagonal) 
 YdadjYdYdadjYd = Matmul2(Yd,adjYdYdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYdTdadjYd = Matmul2(Yd,adjYdTdadjYd,OnlyDiagonal) 
 YdadjYdTdadjTd = Matmul2(Yd,adjYdTdadjTd,OnlyDiagonal) 
 YdadjYuYuadjYd = Matmul2(Yd,adjYuYuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YdadjYuTuadjYd = Matmul2(Yd,adjYuTuadjYd,OnlyDiagonal) 
 YdadjYuTuadjTd = Matmul2(Yd,adjYuTuadjTd,OnlyDiagonal) 
 YdadjTdTdadjYd = Matmul2(Yd,adjTdTdadjYd,OnlyDiagonal) 
 YdadjTuTuadjYd = Matmul2(Yd,adjTuTuadjYd,OnlyDiagonal) 
 Yeml2adjYeYe = Matmul2(Ye,ml2adjYeYe,OnlyDiagonal) 
 YeadjYeme2Ye = Matmul2(Ye,adjYeme2Ye,OnlyDiagonal) 
 YeadjYeYeml2 = Matmul2(Ye,adjYeYeml2,OnlyDiagonal) 
 YeadjYeYeadjYe = Matmul2(Ye,adjYeYeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTeadjYe = Matmul2(Ye,adjYeTeadjYe,OnlyDiagonal) 
 YeadjYeTeadjTe = Matmul2(Ye,adjYeTeadjTe,OnlyDiagonal) 
 YeadjYvYvadjYe = Matmul2(Ye,adjYvYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYvYvadjYe(i2,i2) =  Real(YeadjYvYvadjYe(i2,i2),dp) 
 YeadjYvTvadjYe = Matmul2(Ye,adjYvTvadjYe,OnlyDiagonal) 
 YeadjYvTvadjTe = Matmul2(Ye,adjYvTvadjTe,OnlyDiagonal) 
 YeadjTeTeadjYe = Matmul2(Ye,adjTeTeadjYe,OnlyDiagonal) 
 YeadjTvTvadjYe = Matmul2(Ye,adjTvTvadjYe,OnlyDiagonal) 
 YxCmv2CYxYv = Matmul2(Yx,Cmv2CYxYv,OnlyDiagonal) 
 YxCYxmv2Yv = Matmul2(Yx,CYxmv2Yv,OnlyDiagonal) 
 YxCYxYxCYx = Matmul2(Yx,CYxYxCYx,OnlyDiagonal) 
 YxCYxYvml2 = Matmul2(Yx,CYxYvml2,OnlyDiagonal) 
 YxCYxYvadjYv = Matmul2(Yx,CYxYvadjYv,OnlyDiagonal) 
 YxCYxTxCYx = Matmul2(Yx,CYxTxCYx,OnlyDiagonal) 
 YxCYxTxCTx = Matmul2(Yx,CYxTxCTx,OnlyDiagonal) 
 YxCYxTvadjYv = Matmul2(Yx,CYxTvadjYv,OnlyDiagonal) 
 YxCYxTvadjTv = Matmul2(Yx,CYxTvadjTv,OnlyDiagonal) 
 YxCYvTpYvCYx = Matmul2(Yx,CYvTpYvCYx,OnlyDiagonal) 
 YxCYvTpTvCTx = Matmul2(Yx,CYvTpTvCTx,OnlyDiagonal) 
 YxCTxTxCYx = Matmul2(Yx,CTxTxCYx,OnlyDiagonal) 
 YxCTxTvadjYv = Matmul2(Yx,CTxTvadjYv,OnlyDiagonal) 
 YxCTvTpTvCYx = Matmul2(Yx,CTvTpTvCYx,OnlyDiagonal) 
 Yumq2adjYuYu = Matmul2(Yu,mq2adjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYu = Matmul2(Yu,adjYdYdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdYdadjYu(i2,i2) =  Real(YuadjYdYdadjYu(i2,i2),dp) 
 YuadjYdTdadjYu = Matmul2(Yu,adjYdTdadjYu,OnlyDiagonal) 
 YuadjYdTdadjTu = Matmul2(Yu,adjYdTdadjTu,OnlyDiagonal) 
 YuadjYumu2Yu = Matmul2(Yu,adjYumu2Yu,OnlyDiagonal) 
 YuadjYuYumq2 = Matmul2(Yu,adjYuYumq2,OnlyDiagonal) 
 YuadjYuYuadjYu = Matmul2(Yu,adjYuYuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 YuadjYuTuadjYu = Matmul2(Yu,adjYuTuadjYu,OnlyDiagonal) 
 YuadjYuTuadjTu = Matmul2(Yu,adjYuTuadjTu,OnlyDiagonal) 
 YuadjTdTdadjYu = Matmul2(Yu,adjTdTdadjYu,OnlyDiagonal) 
 YuadjTuTuadjYu = Matmul2(Yu,adjTuTuadjYu,OnlyDiagonal) 
 Yvml2adjYvYv = Matmul2(Yv,ml2adjYvYv,OnlyDiagonal) 
 YvadjYeYeadjYv = Matmul2(Yv,adjYeYeadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYeYeadjYv(i2,i2) =  Real(YvadjYeYeadjYv(i2,i2),dp) 
 YvadjYeTeadjYv = Matmul2(Yv,adjYeTeadjYv,OnlyDiagonal) 
 YvadjYeTeadjTv = Matmul2(Yv,adjYeTeadjTv,OnlyDiagonal) 
 YvadjYvmv2Yv = Matmul2(Yv,adjYvmv2Yv,OnlyDiagonal) 
 YvadjYvYxCYx = Matmul2(Yv,adjYvYxCYx,OnlyDiagonal) 
 YvadjYvYvml2 = Matmul2(Yv,adjYvYvml2,OnlyDiagonal) 
 YvadjYvYvadjYv = Matmul2(Yv,adjYvYvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvYvadjYv(i2,i2) =  Real(YvadjYvYvadjYv(i2,i2),dp) 
 YvadjYvTxCYx = Matmul2(Yv,adjYvTxCYx,OnlyDiagonal) 
 YvadjYvTxCTx = Matmul2(Yv,adjYvTxCTx,OnlyDiagonal) 
 YvadjYvTvadjYv = Matmul2(Yv,adjYvTvadjYv,OnlyDiagonal) 
 YvadjYvTvadjTv = Matmul2(Yv,adjYvTvadjTv,OnlyDiagonal) 
 YvadjTeTeadjYv = Matmul2(Yv,adjTeTeadjYv,OnlyDiagonal) 
 YvadjTvTvadjYv = Matmul2(Yv,adjTvTvadjYv,OnlyDiagonal) 
 adjYdmd2YdadjYd = Matmul2(adjYd,md2YdadjYd,OnlyDiagonal) 
 adjYdmd2YdadjYu = Matmul2(adjYd,md2YdadjYu,OnlyDiagonal) 
 adjYdYdmq2adjYd = Matmul2(adjYd,Ydmq2adjYd,OnlyDiagonal) 
 adjYdYdmq2adjYu = Matmul2(adjYd,Ydmq2adjYu,OnlyDiagonal) 
 adjYdYdadjYdmd2 = Matmul2(adjYd,YdadjYdmd2,OnlyDiagonal) 
 adjYdYdadjYdYd = Matmul2(adjYd,YdadjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdadjYdYd(i2,i2) =  Real(adjYdYdadjYdYd(i2,i2),dp) 
 adjYdYdadjYdTd = Matmul2(adjYd,YdadjYdTd,OnlyDiagonal) 
 adjYdYdadjYumu2 = Matmul2(adjYd,YdadjYumu2,OnlyDiagonal) 
 adjYdYdadjYuYu = Matmul2(adjYd,YdadjYuYu,OnlyDiagonal) 
 adjYdYdadjYuTu = Matmul2(adjYd,YdadjYuTu,OnlyDiagonal) 
 adjYdYdadjTdTd = Matmul2(adjYd,YdadjTdTd,OnlyDiagonal) 
 adjYdTdadjYdYd = Matmul2(adjYd,TdadjYdYd,OnlyDiagonal) 
 adjYdTdadjYuYu = Matmul2(adjYd,TdadjYuYu,OnlyDiagonal) 
 adjYdTdadjTdYd = Matmul2(adjYd,TdadjTdYd,OnlyDiagonal) 
 adjYeme2YeadjYe = Matmul2(adjYe,me2YeadjYe,OnlyDiagonal) 
 adjYeme2YeadjYv = Matmul2(adjYe,me2YeadjYv,OnlyDiagonal) 
 adjYeYeml2adjYe = Matmul2(adjYe,Yeml2adjYe,OnlyDiagonal) 
 adjYeYeml2adjYv = Matmul2(adjYe,Yeml2adjYv,OnlyDiagonal) 
 adjYeYeadjYeme2 = Matmul2(adjYe,YeadjYeme2,OnlyDiagonal) 
 adjYeYeadjYeYe = Matmul2(adjYe,YeadjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeadjYeYe(i2,i2) =  Real(adjYeYeadjYeYe(i2,i2),dp) 
 adjYeYeadjYeTe = Matmul2(adjYe,YeadjYeTe,OnlyDiagonal) 
 adjYeYeadjYvmv2 = Matmul2(adjYe,YeadjYvmv2,OnlyDiagonal) 
 adjYeYeadjYvYx = Matmul2(adjYe,YeadjYvYx,OnlyDiagonal) 
 adjYeYeadjYvYv = Matmul2(adjYe,YeadjYvYv,OnlyDiagonal) 
 adjYeYeadjYvTx = Matmul2(adjYe,YeadjYvTx,OnlyDiagonal) 
 adjYeYeadjYvTv = Matmul2(adjYe,YeadjYvTv,OnlyDiagonal) 
 adjYeYeadjTeTe = Matmul2(adjYe,YeadjTeTe,OnlyDiagonal) 
 adjYeTeadjYeYe = Matmul2(adjYe,TeadjYeYe,OnlyDiagonal) 
 adjYeTeadjYvYx = Matmul2(adjYe,TeadjYvYx,OnlyDiagonal) 
 adjYeTeadjYvYv = Matmul2(adjYe,TeadjYvYv,OnlyDiagonal) 
 adjYeTeadjTeYe = Matmul2(adjYe,TeadjTeYe,OnlyDiagonal) 
 adjYumu2YuadjYd = Matmul2(adjYu,mu2YuadjYd,OnlyDiagonal) 
 adjYumu2YuadjYu = Matmul2(adjYu,mu2YuadjYu,OnlyDiagonal) 
 adjYuYumq2adjYd = Matmul2(adjYu,Yumq2adjYd,OnlyDiagonal) 
 adjYuYumq2adjYu = Matmul2(adjYu,Yumq2adjYu,OnlyDiagonal) 
 adjYuYuadjYdmd2 = Matmul2(adjYu,YuadjYdmd2,OnlyDiagonal) 
 adjYuYuadjYdYd = Matmul2(adjYu,YuadjYdYd,OnlyDiagonal) 
 adjYuYuadjYdTd = Matmul2(adjYu,YuadjYdTd,OnlyDiagonal) 
 adjYuYuadjYumu2 = Matmul2(adjYu,YuadjYumu2,OnlyDiagonal) 
 adjYuYuadjYuYu = Matmul2(adjYu,YuadjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYuadjYuYu(i2,i2) =  Real(adjYuYuadjYuYu(i2,i2),dp) 
 adjYuYuadjYuTu = Matmul2(adjYu,YuadjYuTu,OnlyDiagonal) 
 adjYuYuadjTuTu = Matmul2(adjYu,YuadjTuTu,OnlyDiagonal) 
 adjYuTuadjYdYd = Matmul2(adjYu,TuadjYdYd,OnlyDiagonal) 
 adjYuTuadjYuYu = Matmul2(adjYu,TuadjYuYu,OnlyDiagonal) 
 adjYuTuadjTuYu = Matmul2(adjYu,TuadjTuYu,OnlyDiagonal) 
 adjYvmv2YvadjYe = Matmul2(adjYv,mv2YvadjYe,OnlyDiagonal) 
 adjYvmv2YvadjYv = Matmul2(adjYv,mv2YvadjYv,OnlyDiagonal) 
 adjYvYxCYxYv = Matmul2(adjYv,YxCYxYv,OnlyDiagonal) 
 adjYvYxCYxTv = Matmul2(adjYv,YxCYxTv,OnlyDiagonal) 
 adjYvYxCTxTv = Matmul2(adjYv,YxCTxTv,OnlyDiagonal) 
 adjYvYvml2adjYe = Matmul2(adjYv,Yvml2adjYe,OnlyDiagonal) 
 adjYvYvml2adjYv = Matmul2(adjYv,Yvml2adjYv,OnlyDiagonal) 
 adjYvYvadjYeme2 = Matmul2(adjYv,YvadjYeme2,OnlyDiagonal) 
 adjYvYvadjYeYe = Matmul2(adjYv,YvadjYeYe,OnlyDiagonal) 
 adjYvYvadjYeTe = Matmul2(adjYv,YvadjYeTe,OnlyDiagonal) 
 adjYvYvadjYvmv2 = Matmul2(adjYv,YvadjYvmv2,OnlyDiagonal) 
 adjYvYvadjYvYx = Matmul2(adjYv,YvadjYvYx,OnlyDiagonal) 
 adjYvYvadjYvYv = Matmul2(adjYv,YvadjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvadjYvYv(i2,i2) =  Real(adjYvYvadjYvYv(i2,i2),dp) 
 adjYvYvadjYvTx = Matmul2(adjYv,YvadjYvTx,OnlyDiagonal) 
 adjYvYvadjYvTv = Matmul2(adjYv,YvadjYvTv,OnlyDiagonal) 
 adjYvYvadjTvTv = Matmul2(adjYv,YvadjTvTv,OnlyDiagonal) 
 adjYvTxCYxYv = Matmul2(adjYv,TxCYxYv,OnlyDiagonal) 
 adjYvTxCTxYv = Matmul2(adjYv,TxCTxYv,OnlyDiagonal) 
 adjYvTvadjYeYe = Matmul2(adjYv,TvadjYeYe,OnlyDiagonal) 
 adjYvTvadjYvYx = Matmul2(adjYv,TvadjYvYx,OnlyDiagonal) 
 adjYvTvadjYvYv = Matmul2(adjYv,TvadjYvYv,OnlyDiagonal) 
 adjYvTvadjTvYv = Matmul2(adjYv,TvadjTvYv,OnlyDiagonal) 
 adjTdYdadjYdTd = Matmul2(adjTd,YdadjYdTd,OnlyDiagonal) 
 adjTdTdadjYdYd = Matmul2(adjTd,TdadjYdYd,OnlyDiagonal) 
 adjTeYeadjYeTe = Matmul2(adjTe,YeadjYeTe,OnlyDiagonal) 
 adjTeTeadjYeYe = Matmul2(adjTe,TeadjYeYe,OnlyDiagonal) 
 adjTuYuadjYuTu = Matmul2(adjTu,YuadjYuTu,OnlyDiagonal) 
 adjTuTuadjYuYu = Matmul2(adjTu,TuadjYuYu,OnlyDiagonal) 
 adjTvYxCYxTv = Matmul2(adjTv,YxCYxTv,OnlyDiagonal) 
 adjTvYvadjYvTv = Matmul2(adjTv,YvadjYvTv,OnlyDiagonal) 
 adjTvTxCYxYv = Matmul2(adjTv,TxCYxYv,OnlyDiagonal) 
 adjTvTvadjYvYv = Matmul2(adjTv,TvadjYvYv,OnlyDiagonal) 
 Cmv2CYxYxCYx = Matmul2(Conjg(mv2),CYxYxCYx,OnlyDiagonal) 
 Cmv2CYxYvadjYv = Matmul2(Conjg(mv2),CYxYvadjYv,OnlyDiagonal) 
 Cmv2CYvTpYvCYx = Matmul2(Conjg(mv2),CYvTpYvCYx,OnlyDiagonal) 
 CYxmv2YxCYx = Matmul2(adjYx,mv2YxCYx,OnlyDiagonal) 
 CYxYxCmv2CYx = Matmul2(adjYx,YxCmv2CYx,OnlyDiagonal) 
 CYxYxCYxmv2 = Matmul2(adjYx,YxCYxmv2,OnlyDiagonal) 
 CYxYxCYxYx = Matmul2(adjYx,YxCYxYx,OnlyDiagonal) 
 CYxYxCYxYv = Matmul2(adjYx,YxCYxYv,OnlyDiagonal) 
 CYxYxCYxTx = Matmul2(adjYx,YxCYxTx,OnlyDiagonal) 
 CYxYxCYxTv = Matmul2(adjYx,YxCYxTv,OnlyDiagonal) 
 CYxYvadjYvYx = Matmul2(adjYx,YvadjYvYx,OnlyDiagonal) 
 CYxYvadjYvTx = Matmul2(adjYx,YvadjYvTx,OnlyDiagonal) 
 CYxTxCYxYx = Matmul2(adjYx,TxCYxYx,OnlyDiagonal) 
 CYxTxCYxYv = Matmul2(adjYx,TxCYxYv,OnlyDiagonal) 
 CYxTxCTvTpYv = Matmul2(adjYx,TxCTvTpYv,OnlyDiagonal) 
 CYxTvadjYvYx = Matmul2(adjYx,TvadjYvYx,OnlyDiagonal) 
 CYvCml2TpYvCYx = Matmul2(Conjg(Yv),Cml2TpYvCYx,OnlyDiagonal) 
 CYvTpYeCYeTpYv = Matmul2(Conjg(Yv),TpYeCYeTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYeCYeTpYv(i2,i2) =  Real(CYvTpYeCYeTpYv(i2,i2),dp) 
 CYvTpYeCYeTpTv = Matmul2(Conjg(Yv),TpYeCYeTpTv,OnlyDiagonal) 
 CYvTpYvCmv2CYx = Matmul2(Conjg(Yv),TpYvCmv2CYx,OnlyDiagonal) 
 CYvTpYvCYxmv2 = Matmul2(Conjg(Yv),TpYvCYxmv2,OnlyDiagonal) 
 CYvTpYvCYxYx = Matmul2(Conjg(Yv),TpYvCYxYx,OnlyDiagonal) 
 CYvTpYvCYxYv = Matmul2(Conjg(Yv),TpYvCYxYv,OnlyDiagonal) 
 CYvTpYvCYxTx = Matmul2(Conjg(Yv),TpYvCYxTx,OnlyDiagonal) 
 CYvTpYvCYxTv = Matmul2(Conjg(Yv),TpYvCYxTv,OnlyDiagonal) 
 CYvTpYvCYvTpYv = Matmul2(Conjg(Yv),TpYvCYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvCYvTpYv(i2,i2) =  Real(CYvTpYvCYvTpYv(i2,i2),dp) 
 CYvTpYvCYvTpTv = Matmul2(Conjg(Yv),TpYvCYvTpTv,OnlyDiagonal) 
 CYvTpTeCYeTpYv = Matmul2(Conjg(Yv),TpTeCYeTpYv,OnlyDiagonal) 
 CYvTpTvCYxYx = Matmul2(Conjg(Yv),TpTvCYxYx,OnlyDiagonal) 
 CYvTpTvCYxYv = Matmul2(Conjg(Yv),TpTvCYxYv,OnlyDiagonal) 
 CYvTpTvCYvTpYv = Matmul2(Conjg(Yv),TpTvCYvTpYv,OnlyDiagonal) 
 TdadjYdYdadjTd = Matmul2(Td,adjYdYdadjTd,OnlyDiagonal) 
 TdadjYuYuadjTd = Matmul2(Td,adjYuYuadjTd,OnlyDiagonal) 
 TdadjTdYdadjYd = Matmul2(Td,adjTdYdadjYd,OnlyDiagonal) 
 TdadjTuYuadjYd = Matmul2(Td,adjTuYuadjYd,OnlyDiagonal) 
 TeadjYeYeadjTe = Matmul2(Te,adjYeYeadjTe,OnlyDiagonal) 
 TeadjYvYvadjTe = Matmul2(Te,adjYvYvadjTe,OnlyDiagonal) 
 TeadjTeYeadjYe = Matmul2(Te,adjTeYeadjYe,OnlyDiagonal) 
 TeadjTvYvadjYe = Matmul2(Te,adjTvYvadjYe,OnlyDiagonal) 
 TxCYxYxCTx = Matmul2(Tx,CYxYxCTx,OnlyDiagonal) 
 TxCYvTpYvCTx = Matmul2(Tx,CYvTpYvCTx,OnlyDiagonal) 
 TxCTxYxCYx = Matmul2(Tx,CTxYxCYx,OnlyDiagonal) 
 TxCTvTpYvCYx = Matmul2(Tx,CTvTpYvCYx,OnlyDiagonal) 
 TuadjYdYdadjTu = Matmul2(Tu,adjYdYdadjTu,OnlyDiagonal) 
 TuadjYuYuadjTu = Matmul2(Tu,adjYuYuadjTu,OnlyDiagonal) 
 TuadjTdYdadjYu = Matmul2(Tu,adjTdYdadjYu,OnlyDiagonal) 
 TuadjTuYuadjYu = Matmul2(Tu,adjTuYuadjYu,OnlyDiagonal) 
 TvadjYeYeadjTv = Matmul2(Tv,adjYeYeadjTv,OnlyDiagonal) 
 TvadjYvYvadjTv = Matmul2(Tv,adjYvYvadjTv,OnlyDiagonal) 
 TvadjTeYeadjYv = Matmul2(Tv,adjTeYeadjYv,OnlyDiagonal) 
 TvadjTvYvadjYv = Matmul2(Tv,adjTvYvadjYv,OnlyDiagonal) 
 md2YdadjYdYdadjYd = Matmul2(md2,YdadjYdYdadjYd,OnlyDiagonal) 
 md2YdadjYuYuadjYd = Matmul2(md2,YdadjYuYuadjYd,OnlyDiagonal) 
 me2YeadjYeYeadjYe = Matmul2(me2,YeadjYeYeadjYe,OnlyDiagonal) 
 me2YeadjYvYvadjYe = Matmul2(me2,YeadjYvYvadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYeYe = Matmul2(ml2,adjYeYeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYvYv = Matmul2(ml2,adjYeYeadjYvYv,OnlyDiagonal) 
 ml2adjYvYxCYxYv = Matmul2(ml2,adjYvYxCYxYv,OnlyDiagonal) 
 ml2adjYvYvadjYeYe = Matmul2(ml2,adjYvYvadjYeYe,OnlyDiagonal) 
 ml2adjYvYvadjYvYv = Matmul2(ml2,adjYvYvadjYvYv,OnlyDiagonal) 
 mq2adjYdYdadjYdYd = Matmul2(mq2,adjYdYdadjYdYd,OnlyDiagonal) 
 mq2adjYdYdadjYuYu = Matmul2(mq2,adjYdYdadjYuYu,OnlyDiagonal) 
 mq2adjYuYuadjYdYd = Matmul2(mq2,adjYuYuadjYdYd,OnlyDiagonal) 
 mq2adjYuYuadjYuYu = Matmul2(mq2,adjYuYuadjYuYu,OnlyDiagonal) 
 mu2YuadjYdYdadjYu = Matmul2(mu2,YuadjYdYdadjYu,OnlyDiagonal) 
 mu2YuadjYuYuadjYu = Matmul2(mu2,YuadjYuYuadjYu,OnlyDiagonal) 
 mv2YxCYxYxCYx = Matmul2(mv2,YxCYxYxCYx,OnlyDiagonal) 
 mv2YxCYxYvadjYv = Matmul2(mv2,YxCYxYvadjYv,OnlyDiagonal) 
 mv2YxCYvTpYvCYx = Matmul2(mv2,YxCYvTpYvCYx,OnlyDiagonal) 
 mv2YvadjYeYeadjYv = Matmul2(mv2,YvadjYeYeadjYv,OnlyDiagonal) 
 mv2YvadjYvYxCYx = Matmul2(mv2,YvadjYvYxCYx,OnlyDiagonal) 
 mv2YvadjYvYvadjYv = Matmul2(mv2,YvadjYvYvadjYv,OnlyDiagonal) 
 Ydmq2adjYdYdadjYd = Matmul2(Yd,mq2adjYdYdadjYd,OnlyDiagonal) 
 Ydmq2adjYuYuadjYd = Matmul2(Yd,mq2adjYuYuadjYd,OnlyDiagonal) 
 YdadjYdmd2YdadjYd = Matmul2(Yd,adjYdmd2YdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdmd2YdadjYd(i2,i2) =  Real(YdadjYdmd2YdadjYd(i2,i2),dp) 
 YdadjYdYdmq2adjYd = Matmul2(Yd,adjYdYdmq2adjYd,OnlyDiagonal) 
 YdadjYdYdadjYdmd2 = Matmul2(Yd,adjYdYdadjYdmd2,OnlyDiagonal) 
 YdadjYdYdadjYdYd = Matmul2(Yd,adjYdYdadjYdYd,OnlyDiagonal) 
 YdadjYdYdadjYdTd = Matmul2(Yd,adjYdYdadjYdTd,OnlyDiagonal) 
 YdadjYdTdadjYdYd = Matmul2(Yd,adjYdTdadjYdYd,OnlyDiagonal) 
 YdadjYumu2YuadjYd = Matmul2(Yd,adjYumu2YuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYumu2YuadjYd(i2,i2) =  Real(YdadjYumu2YuadjYd(i2,i2),dp) 
 YdadjYuYumq2adjYd = Matmul2(Yd,adjYuYumq2adjYd,OnlyDiagonal) 
 YdadjYuYuadjYdmd2 = Matmul2(Yd,adjYuYuadjYdmd2,OnlyDiagonal) 
 YdadjYuYuadjYdYd = Matmul2(Yd,adjYuYuadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYdTd = Matmul2(Yd,adjYuYuadjYdTd,OnlyDiagonal) 
 YdadjYuYuadjYuYu = Matmul2(Yd,adjYuYuadjYuYu,OnlyDiagonal) 
 YdadjYuYuadjYuTu = Matmul2(Yd,adjYuYuadjYuTu,OnlyDiagonal) 
 YdadjYuTuadjYdYd = Matmul2(Yd,adjYuTuadjYdYd,OnlyDiagonal) 
 YdadjYuTuadjYuYu = Matmul2(Yd,adjYuTuadjYuYu,OnlyDiagonal) 
 Yeml2adjYeYeadjYe = Matmul2(Ye,ml2adjYeYeadjYe,OnlyDiagonal) 
 Yeml2adjYvYvadjYe = Matmul2(Ye,ml2adjYvYvadjYe,OnlyDiagonal) 
 YeadjYeme2YeadjYe = Matmul2(Ye,adjYeme2YeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeme2YeadjYe(i2,i2) =  Real(YeadjYeme2YeadjYe(i2,i2),dp) 
 YeadjYeYeml2adjYe = Matmul2(Ye,adjYeYeml2adjYe,OnlyDiagonal) 
 YeadjYeYeadjYeme2 = Matmul2(Ye,adjYeYeadjYeme2,OnlyDiagonal) 
 YeadjYeYeadjYeYe = Matmul2(Ye,adjYeYeadjYeYe,OnlyDiagonal) 
 YeadjYeYeadjYeTe = Matmul2(Ye,adjYeYeadjYeTe,OnlyDiagonal) 
 YeadjYeTeadjYeYe = Matmul2(Ye,adjYeTeadjYeYe,OnlyDiagonal) 
 YeadjYvmv2YvadjYe = Matmul2(Ye,adjYvmv2YvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYvmv2YvadjYe(i2,i2) =  Real(YeadjYvmv2YvadjYe(i2,i2),dp) 
 YeadjYvYxCYxYv = Matmul2(Ye,adjYvYxCYxYv,OnlyDiagonal) 
 YeadjYvYxCYxTv = Matmul2(Ye,adjYvYxCYxTv,OnlyDiagonal) 
 YeadjYvYvml2adjYe = Matmul2(Ye,adjYvYvml2adjYe,OnlyDiagonal) 
 YeadjYvYvadjYeme2 = Matmul2(Ye,adjYvYvadjYeme2,OnlyDiagonal) 
 YeadjYvYvadjYeYe = Matmul2(Ye,adjYvYvadjYeYe,OnlyDiagonal) 
 YeadjYvYvadjYeTe = Matmul2(Ye,adjYvYvadjYeTe,OnlyDiagonal) 
 YeadjYvYvadjYvYv = Matmul2(Ye,adjYvYvadjYvYv,OnlyDiagonal) 
 YeadjYvYvadjYvTv = Matmul2(Ye,adjYvYvadjYvTv,OnlyDiagonal) 
 YeadjYvTxCYxYv = Matmul2(Ye,adjYvTxCYxYv,OnlyDiagonal) 
 YeadjYvTvadjYeYe = Matmul2(Ye,adjYvTvadjYeYe,OnlyDiagonal) 
 YeadjYvTvadjYvYv = Matmul2(Ye,adjYvTvadjYvYv,OnlyDiagonal) 
 YxCmv2CYxYxCYx = Matmul2(Yx,Cmv2CYxYxCYx,OnlyDiagonal) 
 YxCmv2CYxYvadjYv = Matmul2(Yx,Cmv2CYxYvadjYv,OnlyDiagonal) 
 YxCmv2CYvTpYvCYx = Matmul2(Yx,Cmv2CYvTpYvCYx,OnlyDiagonal) 
 YxCYxmv2YxCYx = Matmul2(Yx,CYxmv2YxCYx,OnlyDiagonal) 
 YxCYxYxCmv2CYx = Matmul2(Yx,CYxYxCmv2CYx,OnlyDiagonal) 
 YxCYxYxCYxmv2 = Matmul2(Yx,CYxYxCYxmv2,OnlyDiagonal) 
 YxCYxYxCYxYx = Matmul2(Yx,CYxYxCYxYx,OnlyDiagonal) 
 YxCYxYxCYxYv = Matmul2(Yx,CYxYxCYxYv,OnlyDiagonal) 
 YxCYxYxCYxTx = Matmul2(Yx,CYxYxCYxTx,OnlyDiagonal) 
 YxCYxYxCYxTv = Matmul2(Yx,CYxYxCYxTv,OnlyDiagonal) 
 YxCYxYvadjYvYx = Matmul2(Yx,CYxYvadjYvYx,OnlyDiagonal) 
 YxCYxYvadjYvTx = Matmul2(Yx,CYxYvadjYvTx,OnlyDiagonal) 
 YxCYxTxCYxYx = Matmul2(Yx,CYxTxCYxYx,OnlyDiagonal) 
 YxCYxTxCYxYv = Matmul2(Yx,CYxTxCYxYv,OnlyDiagonal) 
 YxCYxTvadjYvYx = Matmul2(Yx,CYxTvadjYvYx,OnlyDiagonal) 
 YxCYvCml2TpYvCYx = Matmul2(Yx,CYvCml2TpYvCYx,OnlyDiagonal) 
 YxCYvTpYeCYeTpYv = Matmul2(Yx,CYvTpYeCYeTpYv,OnlyDiagonal) 
 YxCYvTpYeCYeTpTv = Matmul2(Yx,CYvTpYeCYeTpTv,OnlyDiagonal) 
 YxCYvTpYvCmv2CYx = Matmul2(Yx,CYvTpYvCmv2CYx,OnlyDiagonal) 
 YxCYvTpYvCYxmv2 = Matmul2(Yx,CYvTpYvCYxmv2,OnlyDiagonal) 
 YxCYvTpYvCYxYx = Matmul2(Yx,CYvTpYvCYxYx,OnlyDiagonal) 
 YxCYvTpYvCYxYv = Matmul2(Yx,CYvTpYvCYxYv,OnlyDiagonal) 
 YxCYvTpYvCYxTx = Matmul2(Yx,CYvTpYvCYxTx,OnlyDiagonal) 
 YxCYvTpYvCYxTv = Matmul2(Yx,CYvTpYvCYxTv,OnlyDiagonal) 
 YxCYvTpYvCYvTpYv = Matmul2(Yx,CYvTpYvCYvTpYv,OnlyDiagonal) 
 YxCYvTpYvCYvTpTv = Matmul2(Yx,CYvTpYvCYvTpTv,OnlyDiagonal) 
 YxCYvTpTeCYeTpYv = Matmul2(Yx,CYvTpTeCYeTpYv,OnlyDiagonal) 
 YxCYvTpTvCYxYx = Matmul2(Yx,CYvTpTvCYxYx,OnlyDiagonal) 
 YxCYvTpTvCYxYv = Matmul2(Yx,CYvTpTvCYxYv,OnlyDiagonal) 
 YxCYvTpTvCYvTpYv = Matmul2(Yx,CYvTpTvCYvTpYv,OnlyDiagonal) 
 Yumq2adjYdYdadjYu = Matmul2(Yu,mq2adjYdYdadjYu,OnlyDiagonal) 
 Yumq2adjYuYuadjYu = Matmul2(Yu,mq2adjYuYuadjYu,OnlyDiagonal) 
 YuadjYdmd2YdadjYu = Matmul2(Yu,adjYdmd2YdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdmd2YdadjYu(i2,i2) =  Real(YuadjYdmd2YdadjYu(i2,i2),dp) 
 YuadjYdYdmq2adjYu = Matmul2(Yu,adjYdYdmq2adjYu,OnlyDiagonal) 
 YuadjYdYdadjYdYd = Matmul2(Yu,adjYdYdadjYdYd,OnlyDiagonal) 
 YuadjYdYdadjYdTd = Matmul2(Yu,adjYdYdadjYdTd,OnlyDiagonal) 
 YuadjYdYdadjYumu2 = Matmul2(Yu,adjYdYdadjYumu2,OnlyDiagonal) 
 YuadjYdYdadjYuYu = Matmul2(Yu,adjYdYdadjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYuTu = Matmul2(Yu,adjYdYdadjYuTu,OnlyDiagonal) 
 YuadjYdTdadjYdYd = Matmul2(Yu,adjYdTdadjYdYd,OnlyDiagonal) 
 YuadjYdTdadjYuYu = Matmul2(Yu,adjYdTdadjYuYu,OnlyDiagonal) 
 YuadjYumu2YuadjYu = Matmul2(Yu,adjYumu2YuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYumu2YuadjYu(i2,i2) =  Real(YuadjYumu2YuadjYu(i2,i2),dp) 
 YuadjYuYumq2adjYu = Matmul2(Yu,adjYuYumq2adjYu,OnlyDiagonal) 
 YuadjYuYuadjYumu2 = Matmul2(Yu,adjYuYuadjYumu2,OnlyDiagonal) 
 YuadjYuYuadjYuYu = Matmul2(Yu,adjYuYuadjYuYu,OnlyDiagonal) 
 YuadjYuYuadjYuTu = Matmul2(Yu,adjYuYuadjYuTu,OnlyDiagonal) 
 YuadjYuTuadjYuYu = Matmul2(Yu,adjYuTuadjYuYu,OnlyDiagonal) 
 Yvml2adjYeYeadjYv = Matmul2(Yv,ml2adjYeYeadjYv,OnlyDiagonal) 
 Yvml2adjYvYvadjYv = Matmul2(Yv,ml2adjYvYvadjYv,OnlyDiagonal) 
 YvadjYeme2YeadjYv = Matmul2(Yv,adjYeme2YeadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYeme2YeadjYv(i2,i2) =  Real(YvadjYeme2YeadjYv(i2,i2),dp) 
 YvadjYeYeml2adjYv = Matmul2(Yv,adjYeYeml2adjYv,OnlyDiagonal) 
 YvadjYeYeadjYeYe = Matmul2(Yv,adjYeYeadjYeYe,OnlyDiagonal) 
 YvadjYeYeadjYeTe = Matmul2(Yv,adjYeYeadjYeTe,OnlyDiagonal) 
 YvadjYeYeadjYvmv2 = Matmul2(Yv,adjYeYeadjYvmv2,OnlyDiagonal) 
 YvadjYeYeadjYvYx = Matmul2(Yv,adjYeYeadjYvYx,OnlyDiagonal) 
 YvadjYeYeadjYvYv = Matmul2(Yv,adjYeYeadjYvYv,OnlyDiagonal) 
 YvadjYeYeadjYvTx = Matmul2(Yv,adjYeYeadjYvTx,OnlyDiagonal) 
 YvadjYeYeadjYvTv = Matmul2(Yv,adjYeYeadjYvTv,OnlyDiagonal) 
 YvadjYeTeadjYeYe = Matmul2(Yv,adjYeTeadjYeYe,OnlyDiagonal) 
 YvadjYeTeadjYvYx = Matmul2(Yv,adjYeTeadjYvYx,OnlyDiagonal) 
 YvadjYeTeadjYvYv = Matmul2(Yv,adjYeTeadjYvYv,OnlyDiagonal) 
 YvadjYvmv2YvadjYv = Matmul2(Yv,adjYvmv2YvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvmv2YvadjYv(i2,i2) =  Real(YvadjYvmv2YvadjYv(i2,i2),dp) 
 YvadjYvYxCYxYv = Matmul2(Yv,adjYvYxCYxYv,OnlyDiagonal) 
 YvadjYvYxCYxTv = Matmul2(Yv,adjYvYxCYxTv,OnlyDiagonal) 
 YvadjYvYvml2adjYv = Matmul2(Yv,adjYvYvml2adjYv,OnlyDiagonal) 
 YvadjYvYvadjYvmv2 = Matmul2(Yv,adjYvYvadjYvmv2,OnlyDiagonal) 
 YvadjYvYvadjYvYx = Matmul2(Yv,adjYvYvadjYvYx,OnlyDiagonal) 
 YvadjYvYvadjYvYv = Matmul2(Yv,adjYvYvadjYvYv,OnlyDiagonal) 
 YvadjYvYvadjYvTx = Matmul2(Yv,adjYvYvadjYvTx,OnlyDiagonal) 
 YvadjYvYvadjYvTv = Matmul2(Yv,adjYvYvadjYvTv,OnlyDiagonal) 
 YvadjYvTxCYxYv = Matmul2(Yv,adjYvTxCYxYv,OnlyDiagonal) 
 YvadjYvTvadjYvYx = Matmul2(Yv,adjYvTvadjYvYx,OnlyDiagonal) 
 YvadjYvTvadjYvYv = Matmul2(Yv,adjYvTvadjYvYv,OnlyDiagonal) 
 adjYdmd2YdadjYdYd = Matmul2(adjYd,md2YdadjYdYd,OnlyDiagonal) 
 adjYdYdmq2adjYdYd = Matmul2(adjYd,Ydmq2adjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdmq2adjYdYd(i2,i2) =  Real(adjYdYdmq2adjYdYd(i2,i2),dp) 
 adjYdYdadjYdmd2Yd = Matmul2(adjYd,YdadjYdmd2Yd,OnlyDiagonal) 
 adjYdYdadjYdYdmq2 = Matmul2(adjYd,YdadjYdYdmq2,OnlyDiagonal) 
 adjYeme2YeadjYeYe = Matmul2(adjYe,me2YeadjYeYe,OnlyDiagonal) 
 adjYeYeml2adjYeYe = Matmul2(adjYe,Yeml2adjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeml2adjYeYe(i2,i2) =  Real(adjYeYeml2adjYeYe(i2,i2),dp) 
 adjYeYeadjYeme2Ye = Matmul2(adjYe,YeadjYeme2Ye,OnlyDiagonal) 
 adjYeYeadjYeYeml2 = Matmul2(adjYe,YeadjYeYeml2,OnlyDiagonal) 
 adjYumu2YuadjYuYu = Matmul2(adjYu,mu2YuadjYuYu,OnlyDiagonal) 
 adjYuYumq2adjYuYu = Matmul2(adjYu,Yumq2adjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYumq2adjYuYu(i2,i2) =  Real(adjYuYumq2adjYuYu(i2,i2),dp) 
 adjYuYuadjYumu2Yu = Matmul2(adjYu,YuadjYumu2Yu,OnlyDiagonal) 
 adjYuYuadjYuYumq2 = Matmul2(adjYu,YuadjYuYumq2,OnlyDiagonal) 
 adjYvmv2YxCYxYv = Matmul2(adjYv,mv2YxCYxYv,OnlyDiagonal) 
 adjYvmv2YvadjYvYv = Matmul2(adjYv,mv2YvadjYvYv,OnlyDiagonal) 
 adjYvYxCmv2CYxYv = Matmul2(adjYv,YxCmv2CYxYv,OnlyDiagonal) 
 adjYvYxCYxmv2Yv = Matmul2(adjYv,YxCYxmv2Yv,OnlyDiagonal) 
 adjYvYxCYxYvml2 = Matmul2(adjYv,YxCYxYvml2,OnlyDiagonal) 
 adjYvYvml2adjYvYv = Matmul2(adjYv,Yvml2adjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvml2adjYvYv(i2,i2) =  Real(adjYvYvml2adjYvYv(i2,i2),dp) 
 adjYvYvadjYvmv2Yv = Matmul2(adjYv,YvadjYvmv2Yv,OnlyDiagonal) 
 adjYvYvadjYvYvml2 = Matmul2(adjYv,YvadjYvYvml2,OnlyDiagonal) 
 TdadjYdYdadjYdYd = Matmul2(Td,adjYdYdadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYdYd = Matmul2(Td,adjYuYuadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYuYu = Matmul2(Td,adjYuYuadjYuYu,OnlyDiagonal) 
 TeadjYeYeadjYeYe = Matmul2(Te,adjYeYeadjYeYe,OnlyDiagonal) 
 TeadjYvYxCYxYv = Matmul2(Te,adjYvYxCYxYv,OnlyDiagonal) 
 TeadjYvYvadjYeYe = Matmul2(Te,adjYvYvadjYeYe,OnlyDiagonal) 
 TeadjYvYvadjYvYv = Matmul2(Te,adjYvYvadjYvYv,OnlyDiagonal) 
 TxCYxYxCYxYx = Matmul2(Tx,CYxYxCYxYx,OnlyDiagonal) 
 TxCYxYxCYxYv = Matmul2(Tx,CYxYxCYxYv,OnlyDiagonal) 
 TxCYxYvadjYvYx = Matmul2(Tx,CYxYvadjYvYx,OnlyDiagonal) 
 TxCYvTpYeCYeTpYv = Matmul2(Tx,CYvTpYeCYeTpYv,OnlyDiagonal) 
 TxCYvTpYvCYxYx = Matmul2(Tx,CYvTpYvCYxYx,OnlyDiagonal) 
 TxCYvTpYvCYxYv = Matmul2(Tx,CYvTpYvCYxYv,OnlyDiagonal) 
 TxCYvTpYvCYvTpYv = Matmul2(Tx,CYvTpYvCYvTpYv,OnlyDiagonal) 
 TuadjYdYdadjYdYd = Matmul2(Tu,adjYdYdadjYdYd,OnlyDiagonal) 
 TuadjYdYdadjYuYu = Matmul2(Tu,adjYdYdadjYuYu,OnlyDiagonal) 
 TuadjYuYuadjYuYu = Matmul2(Tu,adjYuYuadjYuYu,OnlyDiagonal) 
 TvadjYeYeadjYeYe = Matmul2(Tv,adjYeYeadjYeYe,OnlyDiagonal) 
 TvadjYeYeadjYvYx = Matmul2(Tv,adjYeYeadjYvYx,OnlyDiagonal) 
 TvadjYeYeadjYvYv = Matmul2(Tv,adjYeYeadjYvYv,OnlyDiagonal) 
 TvadjYvYxCYxYv = Matmul2(Tv,adjYvYxCYxYv,OnlyDiagonal) 
 TvadjYvYvadjYvYx = Matmul2(Tv,adjYvYvadjYvYx,OnlyDiagonal) 
 TvadjYvYvadjYvYv = Matmul2(Tv,adjYvYvadjYvYv,OnlyDiagonal) 
 TrYxCTx = cTrace(YxCTx)
 TrCTdTpYd = cTrace(CTdTpYd)
 TrCTeTpYe = cTrace(CTeTpYe)
 TrCTuTpYu = cTrace(CTuTpYu)
 TrCTvTpYv = cTrace(CTvTpYv)
 Trmv2CYxYx = cTrace(mv2CYxYx)
 TrYdadjYdCmd2 = cTrace(YdadjYdCmd2)
 TrYdCmq2adjYd = Real(cTrace(YdCmq2adjYd),dp)  
 TrYeadjYeCme2 = cTrace(YeadjYeCme2)
 TrYeCml2adjYe = Real(cTrace(YeCml2adjYe),dp)  
 TrYuadjYuCmu2 = cTrace(YuadjYuCmu2)
 TrYuCmq2adjYu = Real(cTrace(YuCmq2adjYu),dp)  
 TrYvadjYvCmv2 = cTrace(YvadjYvCmv2)
 TrYvCml2adjYv = Real(cTrace(YvCml2adjYv),dp)  
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp)  
 TrYdadjYdTdadjYd = cTrace(YdadjYdTdadjYd)
 TrYdadjYdTdadjTd = cTrace(YdadjYdTdadjTd)
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp)  
 TrYdadjYuTuadjYd = cTrace(YdadjYuTuadjYd)
 TrYdadjYuTuadjTd = cTrace(YdadjYuTuadjTd)
 TrYdadjTdTdadjYd = cTrace(YdadjTdTdadjYd)
 TrYdadjTuTuadjYd = cTrace(YdadjTuTuadjYd)
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp)  
 TrYeadjYeTeadjYe = cTrace(YeadjYeTeadjYe)
 TrYeadjYeTeadjTe = cTrace(YeadjYeTeadjTe)
 TrYeadjYvYvadjYe = Real(cTrace(YeadjYvYvadjYe),dp)  
 TrYeadjYvTvadjYe = cTrace(YeadjYvTvadjYe)
 TrYeadjYvTvadjTe = cTrace(YeadjYvTvadjTe)
 TrYeadjTeTeadjYe = cTrace(YeadjTeTeadjYe)
 TrYeadjTvTvadjYe = cTrace(YeadjTvTvadjYe)
 TrYxCYxYxCYx = cTrace(YxCYxYxCYx)
 TrYxCYxYvadjYv = cTrace(YxCYxYvadjYv)
 TrYxCYxTxCYx = cTrace(YxCYxTxCYx)
 TrYxCYxTxCTx = cTrace(YxCYxTxCTx)
 TrYxCYxTvadjYv = cTrace(YxCYxTvadjYv)
 TrYxCYxTvadjTv = cTrace(YxCYxTvadjTv)
 TrYxCTxTxCYx = cTrace(YxCTxTxCYx)
 TrYxCTxTvadjYv = cTrace(YxCTxTvadjYv)
 TrYuadjYdTdadjYu = cTrace(YuadjYdTdadjYu)
 TrYuadjYdTdadjTu = cTrace(YuadjYdTdadjTu)
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp)  
 TrYuadjYuTuadjYu = cTrace(YuadjYuTuadjYu)
 TrYuadjYuTuadjTu = cTrace(YuadjYuTuadjTu)
 TrYuadjTdTdadjYu = cTrace(YuadjTdTdadjYu)
 TrYuadjTuTuadjYu = cTrace(YuadjTuTuadjYu)
 TrYvadjYeTeadjYv = cTrace(YvadjYeTeadjYv)
 TrYvadjYeTeadjTv = cTrace(YvadjYeTeadjTv)
 TrYvadjYvYvadjYv = Real(cTrace(YvadjYvYvadjYv),dp)  
 TrYvadjYvTxCYx = cTrace(YvadjYvTxCYx)
 TrYvadjYvTxCTx = cTrace(YvadjYvTxCTx)
 TrYvadjYvTvadjYv = cTrace(YvadjYvTvadjYv)
 TrYvadjYvTvadjTv = cTrace(YvadjYvTvadjTv)
 TrYvadjTeTeadjYv = cTrace(YvadjTeTeadjYv)
 TrYvadjTvTvadjYv = cTrace(YvadjTvTvadjYv)
 TrCYxTxCTvTpYv = cTrace(CYxTxCTvTpYv)
 Trmd2YdadjYdYdadjYd = cTrace(md2YdadjYdYdadjYd)
 Trmd2YdadjYuYuadjYd = cTrace(md2YdadjYuYuadjYd)
 Trme2YeadjYeYeadjYe = cTrace(me2YeadjYeYeadjYe)
 Trme2YeadjYvYvadjYe = cTrace(me2YeadjYvYvadjYe)
 Trml2adjYeYeadjYeYe = cTrace(ml2adjYeYeadjYeYe)
 Trml2adjYeYeadjYvYv = cTrace(ml2adjYeYeadjYvYv)
 Trml2adjYvYxCYxYv = cTrace(ml2adjYvYxCYxYv)
 Trml2adjYvYvadjYeYe = cTrace(ml2adjYvYvadjYeYe)
 Trml2adjYvYvadjYvYv = cTrace(ml2adjYvYvadjYvYv)
 Trmq2adjYdYdadjYdYd = cTrace(mq2adjYdYdadjYdYd)
 Trmq2adjYdYdadjYuYu = cTrace(mq2adjYdYdadjYuYu)
 Trmq2adjYuYuadjYdYd = cTrace(mq2adjYuYuadjYdYd)
 Trmq2adjYuYuadjYuYu = cTrace(mq2adjYuYuadjYuYu)
 Trmu2YuadjYdYdadjYu = cTrace(mu2YuadjYdYdadjYu)
 Trmu2YuadjYuYuadjYu = cTrace(mu2YuadjYuYuadjYu)
 Trmv2YxCYxYxCYx = cTrace(mv2YxCYxYxCYx)
 Trmv2YxCYxYvadjYv = cTrace(mv2YxCYxYvadjYv)
 Trmv2YvadjYeYeadjYv = cTrace(mv2YvadjYeYeadjYv)
 Trmv2YvadjYvYxCYx = cTrace(mv2YvadjYvYxCYx)
 Trmv2YvadjYvYvadjYv = cTrace(mv2YvadjYvYvadjYv)
 TrYxCmv2CYxYvadjYv = cTrace(YxCmv2CYxYvadjYv)
 sqrt2ov3 =Sqrt(2._dp/3._dp) 
 sqrt5ov2 =Sqrt(5._dp/2._dp) 
 ooSqrt3 =1._dp/sqrt(3._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 
End If 
 
 
Tr1(1) = (sqrt3*(4*g1*sqrt5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 +           & 
&  Trmq2 - 2._dp*(Trmu2)) - 5*gBY*sqrt2*(2._dp*(mC12) - 2._dp*(mC22) + Trmd2 -           & 
&  Trme2 + 2._dp*(Trml2) - 2._dp*(Trmq2) + Trmu2 - Trmv2)))/20._dp

Tr1(4) = (sqrt3*(4*gYB*sqrt5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 +          & 
&  Trmq2 - 2._dp*(Trmu2)) - 5*gBL*sqrt2*(2._dp*(mC12) - 2._dp*(mC22) + Trmd2 -           & 
&  Trme2 + 2._dp*(Trml2) - 2._dp*(Trmq2) + Trmu2 - Trmv2)))/20._dp

If (TwoLoopRGE) Then 
Tr2U1(1, 1) = (60*gBYp2*mC12 + 60*gBYp2*mC22 + 12*g1p2*mHd2 + 12*g1p2*mHu2 +          & 
&  (8._dp*(g1p2) + 5._dp*(gBYp2) - 4*g1*gBY*sqrt10)*Trmd2 + 3*(8._dp*(g1p2)              & 
&  + 5._dp*(gBYp2) + 4*g1*gBY*sqrt10)*Trme2 + 12*g1p2*Trml2 + 30*gBYp2*Trml2 +           & 
&  12*g1*gBY*sqrt10*Trml2 + 4*g1p2*Trmq2 + 10*gBYp2*Trmq2 + 4*g1*gBY*sqrt10*Trmq2 +      & 
&  32*g1p2*Trmu2 + 5*gBYp2*Trmu2 + 8*g1*gBY*sqrt10*Trmu2 + 15*gBYp2*Trmv2)/40._dp

Tr2U1(1, 4) = (60*gBL*gBY*mC12 + 60*gBL*gBY*mC22 + 12*g1*gYB*mHd2 + 12*g1*gYB*mHu2 +  & 
&  (8*g1*gYB + 5*gBL*gBY - 2*g1*gBL*sqrt10 - 2*gYB*gBY*sqrt10)*Trmd2 + 3*(8*g1*gYB +     & 
&  5*gBL*gBY + 2*g1*gBL*sqrt10 + 2*gYB*gBY*sqrt10)*Trme2 + 12*g1*gYB*Trml2 +             & 
&  30*gBL*gBY*Trml2 + 6*g1*gBL*sqrt10*Trml2 + 6*gYB*gBY*sqrt10*Trml2 + 4*g1*gYB*Trmq2 +  & 
&  10*gBL*gBY*Trmq2 + 2*g1*gBL*sqrt10*Trmq2 + 2*gYB*gBY*sqrt10*Trmq2 + 32*g1*gYB*Trmu2 + & 
&  5*gBL*gBY*Trmu2 + 4*g1*gBL*sqrt10*Trmu2 + 4*gYB*gBY*sqrt10*Trmu2 + 15*gBL*gBY*Trmv2)/40._dp

Tr3(1) = (ooSqrt3*(-1800*gBY*gBLp2*mC12*sqrt2 - 1800*gBYp3*mC12*sqrt2 +               & 
&  1800*gBY*gBLp2*mC22*sqrt2 + 1800*gBYp3*mC22*sqrt2 - 72*g1p3*mHd2*sqrt5 -              & 
&  360*g1*g2p2*mHd2*sqrt5 - 72*g1*gYBp2*mHd2*sqrt5 + 72*g1p3*mHu2*sqrt5 + 360*g1*g2p2*mHu2*sqrt5 +& 
&  72*g1*gYBp2*mHu2*sqrt5 + (-120*g1p2*gBY*sqrt2 + 32*g1p3*sqrt5 - 5*gBY*(5*(32._dp*(g3p2)& 
&  + gBLp2 + gBYp2)*sqrt2 + 8*gYBp2*sqrt2 - 8*gYB*gBL*sqrt5) + 4*g1*(-20*gYB*gBL*sqrt2 + & 
&  5*(32._dp*(g3p2) + gBLp2 + 3._dp*(gBYp2))*sqrt5 + 8*gYBp2*sqrt5))*Trmd2 +             & 
&  9*(120*g1p2*gBY*sqrt2 + 32*g1p3*sqrt5 + 5*gBY*(5*(gBLp2 + gBYp2)*sqrt2 +              & 
&  8*gYBp2*sqrt2 + 8*gYB*gBL*sqrt5) + 4*g1*(20*gYB*gBL*sqrt2 + 5*(gBLp2 + 3._dp*(gBYp2)) & 
& *sqrt5 + 8*gYBp2*sqrt5))*Trme2 - 360*g1*gYB*gBL*sqrt2*Trml2 - 540*g1p2*gBY*sqrt2*Trml2 -& 
&  900*g2p2*gBY*sqrt2*Trml2 - 450*gBY*gBLp2*sqrt2*Trml2 - 450*gBYp3*sqrt2*Trml2 -        & 
&  180*gBY*gYBp2*sqrt2*Trml2 - 72*g1p3*sqrt5*Trml2 - 360*g1*g2p2*sqrt5*Trml2 -           & 
&  360*gYB*gBL*gBY*sqrt5*Trml2 - 180*g1*gBLp2*sqrt5*Trml2 - 540*g1*gBYp2*sqrt5*Trml2 -   & 
&  72*g1*gYBp2*sqrt5*Trml2 + 40*g1*gYB*gBL*sqrt2*Trmq2 + 60*g1p2*gBY*sqrt2*Trmq2 +       & 
&  900*g2p2*gBY*sqrt2*Trmq2 + 1600*g3p2*gBY*sqrt2*Trmq2 + 50*gBY*gBLp2*sqrt2*Trmq2 +     & 
&  50*gBYp3*sqrt2*Trmq2 + 20*gBY*gYBp2*sqrt2*Trmq2 + 8*g1p3*sqrt5*Trmq2 + 360*g1*g2p2*sqrt5*Trmq2 +& 
&  640*g1*g3p2*sqrt5*Trmq2 + 40*gYB*gBL*gBY*sqrt5*Trmq2 + 20*g1*gBLp2*sqrt5*Trmq2 +      & 
&  60*g1*gBYp2*sqrt5*Trmq2 + 8*g1*gYBp2*sqrt5*Trmq2 - 320*g1*gYB*gBL*sqrt2*Trmu2 -       & 
&  480*g1p2*gBY*sqrt2*Trmu2 - 800*g3p2*gBY*sqrt2*Trmu2 - 25*gBY*gBLp2*sqrt2*Trmu2 -      & 
&  25*gBYp3*sqrt2*Trmu2 - 160*gBY*gYBp2*sqrt2*Trmu2 - 256*g1p3*sqrt5*Trmu2 -             & 
&  1280*g1*g3p2*sqrt5*Trmu2 - 80*gYB*gBL*gBY*sqrt5*Trmu2 - 40*g1*gBLp2*sqrt5*Trmu2 -     & 
&  120*g1*gBYp2*sqrt5*Trmu2 - 256*g1*gYBp2*sqrt5*Trmu2 + 225*gBY*gBLp2*sqrt2*Trmv2 +     & 
&  225*gBYp3*sqrt2*Trmv2 - 1200*gBY*sqrt2*Trmv2CYxYx + 720*g1*mHd2*sqrt5*TrYdadjYd +     & 
&  600*gBY*sqrt2*TrYdadjYdCmd2 - 480*g1*sqrt5*TrYdadjYdCmd2 - 600*gBY*sqrt2*TrYdCmq2adjYd -& 
&  240*g1*sqrt5*TrYdCmq2adjYd + 240*g1*mHd2*sqrt5*TrYeadjYe - 600*gBY*sqrt2*TrYeadjYeCme2 -& 
&  480*g1*sqrt5*TrYeadjYeCme2 + 600*gBY*sqrt2*TrYeCml2adjYe + 240*g1*sqrt5*TrYeCml2adjYe -& 
&  720*g1*mHu2*sqrt5*TrYuadjYu + 600*gBY*sqrt2*TrYuadjYuCmu2 + 960*g1*sqrt5*TrYuadjYuCmu2 -& 
&  600*gBY*sqrt2*TrYuCmq2adjYu - 240*g1*sqrt5*TrYuCmq2adjYu - 240*g1*mHu2*sqrt5*TrYvadjYv -& 
&  600*gBY*sqrt2*TrYvadjYvCmv2 + 600*gBY*sqrt2*TrYvCml2adjYv + 240*g1*sqrt5*TrYvCml2adjYv +& 
&  1200*gBY*mC12*sqrt2*TrYxCYx))/800._dp

Tr2(2) = (mHd2 + mHu2 + Trml2 + 3._dp*(Trmq2))/2._dp

Tr2(3) = (Trmd2 + 2._dp*(Trmq2) + Trmu2)/2._dp

Tr2U1(4, 1) = (60*gBL*gBY*mC12 + 60*gBL*gBY*mC22 + 12*g1*gYB*mHd2 + 12*g1*gYB*mHu2 +  & 
&  (8*g1*gYB + 5*gBL*gBY - 2*g1*gBL*sqrt10 - 2*gYB*gBY*sqrt10)*Trmd2 + 3*(8*g1*gYB +     & 
&  5*gBL*gBY + 2*g1*gBL*sqrt10 + 2*gYB*gBY*sqrt10)*Trme2 + 12*g1*gYB*Trml2 +             & 
&  30*gBL*gBY*Trml2 + 6*g1*gBL*sqrt10*Trml2 + 6*gYB*gBY*sqrt10*Trml2 + 4*g1*gYB*Trmq2 +  & 
&  10*gBL*gBY*Trmq2 + 2*g1*gBL*sqrt10*Trmq2 + 2*gYB*gBY*sqrt10*Trmq2 + 32*g1*gYB*Trmu2 + & 
&  5*gBL*gBY*Trmu2 + 4*g1*gBL*sqrt10*Trmu2 + 4*gYB*gBY*sqrt10*Trmu2 + 15*gBL*gBY*Trmv2)/40._dp

Tr2U1(4, 4) = (60*gBLp2*mC12 + 60*gBLp2*mC22 + 12*gYBp2*mHd2 + 12*gYBp2*mHu2 +        & 
&  (5._dp*(gBLp2) + 8._dp*(gYBp2) - 4*gYB*gBL*sqrt10)*Trmd2 + 3*(5._dp*(gBLp2)           & 
&  + 8._dp*(gYBp2) + 4*gYB*gBL*sqrt10)*Trme2 + 30*gBLp2*Trml2 + 12*gYBp2*Trml2 +         & 
&  12*gYB*gBL*sqrt10*Trml2 + 10*gBLp2*Trmq2 + 4*gYBp2*Trmq2 + 4*gYB*gBL*sqrt10*Trmq2 +   & 
&  5*gBLp2*Trmu2 + 32*gYBp2*Trmu2 + 8*gYB*gBL*sqrt10*Trmu2 + 15*gBLp2*Trmv2)/40._dp

Tr3(4) = (ooSqrt3*(-1800*gBLp3*mC12*sqrt2 - 1800*gBL*gBYp2*mC12*sqrt2 +               & 
&  1800*gBLp3*mC22*sqrt2 + 1800*gBL*gBYp2*mC22*sqrt2 - 72*gYB*g1p2*mHd2*sqrt5 -          & 
&  360*gYB*g2p2*mHd2*sqrt5 - 72*gYBp3*mHd2*sqrt5 + 72*gYB*g1p2*mHu2*sqrt5 +              & 
&  360*gYB*g2p2*mHu2*sqrt5 + 72*gYBp3*mHu2*sqrt5 + (-25*gBL*(32._dp*(g3p2)               & 
&  + gBLp2 + gBYp2)*sqrt2 - 120*gBL*gYBp2*sqrt2 + 20*gYB*(32._dp*(g3p2) + 3._dp*(gBLp2)  & 
&  + gBYp2)*sqrt5 + 32*gYBp3*sqrt5 + 8*g1p2*(-5*gBL*sqrt2 + 4*gYB*sqrt5) +               & 
&  40*g1*gBY*(-2*gYB*sqrt2 + gBL*sqrt5))*Trmd2 + 9*(25*gBL*(gBLp2 + gBYp2)               & 
& *sqrt2 + 120*gBL*gYBp2*sqrt2 + 20*gYB*(3._dp*(gBLp2) + gBYp2)*sqrt5 + 32*gYBp3*sqrt5 + & 
&  8*g1p2*(5*gBL*sqrt2 + 4*gYB*sqrt5) + 40*g1*gBY*(2*gYB*sqrt2 + gBL*sqrt5))             & 
& *Trme2 - 180*g1p2*gBL*sqrt2*Trml2 - 900*g2p2*gBL*sqrt2*Trml2 - 360*g1*gYB*gBY*sqrt2*Trml2 -& 
&  450*gBLp3*sqrt2*Trml2 - 450*gBL*gBYp2*sqrt2*Trml2 - 540*gBL*gYBp2*sqrt2*Trml2 -       & 
&  72*gYB*g1p2*sqrt5*Trml2 - 360*gYB*g2p2*sqrt5*Trml2 - 360*g1*gBL*gBY*sqrt5*Trml2 -     & 
&  540*gYB*gBLp2*sqrt5*Trml2 - 180*gYB*gBYp2*sqrt5*Trml2 - 72*gYBp3*sqrt5*Trml2 +        & 
&  20*g1p2*gBL*sqrt2*Trmq2 + 900*g2p2*gBL*sqrt2*Trmq2 + 1600*g3p2*gBL*sqrt2*Trmq2 +      & 
&  40*g1*gYB*gBY*sqrt2*Trmq2 + 50*gBLp3*sqrt2*Trmq2 + 50*gBL*gBYp2*sqrt2*Trmq2 +         & 
&  60*gBL*gYBp2*sqrt2*Trmq2 + 8*gYB*g1p2*sqrt5*Trmq2 + 360*gYB*g2p2*sqrt5*Trmq2 +        & 
&  640*gYB*g3p2*sqrt5*Trmq2 + 40*g1*gBL*gBY*sqrt5*Trmq2 + 60*gYB*gBLp2*sqrt5*Trmq2 +     & 
&  20*gYB*gBYp2*sqrt5*Trmq2 + 8*gYBp3*sqrt5*Trmq2 - 160*g1p2*gBL*sqrt2*Trmu2 -           & 
&  800*g3p2*gBL*sqrt2*Trmu2 - 320*g1*gYB*gBY*sqrt2*Trmu2 - 25*gBLp3*sqrt2*Trmu2 -        & 
&  25*gBL*gBYp2*sqrt2*Trmu2 - 480*gBL*gYBp2*sqrt2*Trmu2 - 256*gYB*g1p2*sqrt5*Trmu2 -     & 
&  1280*gYB*g3p2*sqrt5*Trmu2 - 80*g1*gBL*gBY*sqrt5*Trmu2 - 120*gYB*gBLp2*sqrt5*Trmu2 -   & 
&  40*gYB*gBYp2*sqrt5*Trmu2 - 256*gYBp3*sqrt5*Trmu2 + 225*gBLp3*sqrt2*Trmv2 +            & 
&  225*gBL*gBYp2*sqrt2*Trmv2 - 1200*gBL*sqrt2*Trmv2CYxYx + 720*gYB*mHd2*sqrt5*TrYdadjYd +& 
&  600*gBL*sqrt2*TrYdadjYdCmd2 - 480*gYB*sqrt5*TrYdadjYdCmd2 - 600*gBL*sqrt2*TrYdCmq2adjYd -& 
&  240*gYB*sqrt5*TrYdCmq2adjYd + 240*gYB*mHd2*sqrt5*TrYeadjYe - 600*gBL*sqrt2*TrYeadjYeCme2 -& 
&  480*gYB*sqrt5*TrYeadjYeCme2 + 600*gBL*sqrt2*TrYeCml2adjYe + 240*gYB*sqrt5*TrYeCml2adjYe -& 
&  720*gYB*mHu2*sqrt5*TrYuadjYu + 600*gBL*sqrt2*TrYuadjYuCmu2 + 960*gYB*sqrt5*TrYuadjYuCmu2 -& 
&  600*gBL*sqrt2*TrYuCmq2adjYu - 240*gYB*sqrt5*TrYuCmq2adjYu - 240*gYB*mHu2*sqrt5*TrYvadjYv -& 
&  600*gBL*sqrt2*TrYvadjYvCmv2 + 600*gBL*sqrt2*TrYvCml2adjYv + 240*gYB*sqrt5*TrYvCml2adjYv +& 
&  1200*gBL*mC12*sqrt2*TrYxCYx))/800._dp

End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = (3*(11._dp*(g1p3) + 4*g1p2*gBY*sqrt10 + gYB*gBY*(15._dp*(gBL)              & 
&  + 2*gYB*sqrt10) + g1*(15._dp*(gBYp2) + 11._dp*(gYBp2) + 2*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = (-14._dp*(g1p3)/5._dp - gYB*gBL*gBY + gBY*gYBp2*ooSqrt10 + g1*(-1._dp*(gBYp2) -       & 
&  14._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10) + g1p2*gBY*sqrt2ov5)*TrYdadjYd +             & 
&  (398._dp*(g1p5) + 270*g1p3*g2p2 + 880*g1p3*g3p2 + 1610*gYB*g1p2*gBL*gBY +             & 
&  450*gYB*g2p2*gBL*gBY + 400*gYB*g3p2*gBL*gBY + 230*g1p3*gBLp2 + 1250*gYB*gBY*gBLp3 +   & 
&  1380*g1p3*gBYp2 + 450*g1*g2p2*gBYp2 + 400*g1*g3p2*gBYp2 + 1250*g1*gBLp2*gBYp2 +       & 
&  1250*gYB*gBL*gBYp3 + 1250*g1*gBYp4 + 796*g1p3*gYBp2 + 270*g1*g2p2*gYBp2 +             & 
&  880*g1*g3p2*gYBp2 + 690*g1*gBLp2*gYBp2 + 920*g1*gBYp2*gYBp2 + 690*gBL*gBY*gYBp3 +     & 
&  398*g1*gYBp4 + 246*gYB*g1p3*gBL*sqrt10 + 90*g1*gYB*g2p2*gBL*sqrt10 + 80*g1*gYB*g3p2*gBL*sqrt10 +& 
&  328*g1p4*gBY*sqrt10 + 180*g1p2*g2p2*gBY*sqrt10 + 160*g1p2*g3p2*gBY*sqrt10 +           & 
&  140*g1p2*gBY*gBLp2*sqrt10 + 70*g1*gYB*gBLp3*sqrt10 + 350*g1*gYB*gBL*gBYp2*sqrt10 +    & 
&  280*g1p2*gBYp3*sqrt10 + 410*g1p2*gBY*gYBp2*sqrt10 + 90*g2p2*gBY*gYBp2*sqrt10 +        & 
&  80*g3p2*gBY*gYBp2*sqrt10 + 210*gBY*gBLp2*gYBp2*sqrt10 + 70*gBYp3*gYBp2*sqrt10 +       & 
&  246*g1*gBL*gYBp3*sqrt10 + 82*gBY*gYBp4*sqrt10 - 15*(12._dp*(g1p3) + 6*g1p2*gBY*sqrt10 +& 
&  gYB*gBY*(10._dp*(gBL) + 3*gYB*sqrt10) + g1*(10._dp*(gBYp2) + 12._dp*(gYBp2) +         & 
&  3*gYB*gBL*sqrt10))*TrYeadjYe - 260*g1p3*TrYuadjYu - 50*gYB*gBL*gBY*TrYuadjYu -        & 
&  50*g1*gBYp2*TrYuadjYu - 260*g1*gYBp2*TrYuadjYu - 25*g1*gYB*gBL*sqrt10*TrYuadjYu -     & 
&  50*g1p2*gBY*sqrt10*TrYuadjYu - 25*gBY*gYBp2*sqrt10*TrYuadjYu - 60*g1p3*TrYvadjYv -    & 
&  150*gYB*gBL*gBY*TrYvadjYv - 150*g1*gBYp2*TrYvadjYv - 60*g1*gYBp2*TrYvadjYv -          & 
&  15*g1*gYB*gBL*sqrt10*TrYvadjYv - 30*g1p2*gBY*sqrt10*TrYvadjYv - 15*gBY*gYBp2*sqrt10*TrYvadjYv -& 
&  450*gBY*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = (g2p3*(9._dp*(g1p2) + 125._dp*(g2p2) + 120._dp*(g3p2) + 15._dp*(gBLp2) -              & 
&  30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv)))/5._dp

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = (g3p3*(11._dp*(g1p2) + 45._dp*(g2p2) + 70._dp*(g3p2) + 5._dp*(gBLp2) - 20._dp*(TrYdadjYd) -& 
&  20._dp*(TrYuadjYu)))/5._dp

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = (3*(11*g1*gYB*gBY + 15._dp*(gBLp3) + 15*gBL*gBYp2 + 11*gBL*gYBp2 +        & 
&  2*g1*gBL*gBY*sqrt10 + 4*gYB*gBLp2*sqrt10 + 2*gYB*gBYp2*sqrt10))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBL2 = (398*gYB*g1p3*gBY + 270*g1*gYB*g2p2*gBY + 880*g1*gYB*g3p2*gBY + 1610*g1*gYB*gBY*gBLp2 +& 
&  230*g1p2*gBLp3 + 450*g2p2*gBLp3 + 400*g3p2*gBLp3 + 1250._dp*(gBLp5) + 690*g1p2*gBL*gBYp2 +& 
&  450*g2p2*gBL*gBYp2 + 400*g3p2*gBL*gBYp2 + 2500*gBLp3*gBYp2 + 690*g1*gYB*gBYp3 +       & 
&  1250*gBL*gBYp4 + 398*g1p2*gBL*gYBp2 + 270*g2p2*gBL*gYBp2 + 880*g3p2*gBL*gYBp2 +       & 
&  1380*gBLp3*gYBp2 + 920*gBL*gBYp2*gYBp2 + 398*g1*gBY*gYBp3 + 398*gBL*gYBp4 +           & 
&  82*g1p3*gBL*gBY*sqrt10 + 90*g1*g2p2*gBL*gBY*sqrt10 + 80*g1*g3p2*gBL*gBY*sqrt10 +      & 
&  164*gYB*g1p2*gBLp2*sqrt10 + 180*gYB*g2p2*gBLp2*sqrt10 + 160*gYB*g3p2*gBLp2*sqrt10 +   & 
&  210*g1*gBY*gBLp3*sqrt10 + 280*gYB*gBLp4*sqrt10 + 246*gYB*g1p2*gBYp2*sqrt10 +          & 
&  90*gYB*g2p2*gBYp2*sqrt10 + 80*gYB*g3p2*gBYp2*sqrt10 + 350*gYB*gBLp2*gBYp2*sqrt10 +    & 
&  210*g1*gBL*gBYp3*sqrt10 + 70*gYB*gBYp4*sqrt10 + 410*g1*gBL*gBY*gYBp2*sqrt10 +         & 
&  328*gBLp2*gYBp3*sqrt10 + 82*gBYp2*gYBp3*sqrt10 - 5*(28*g1*gYB*gBY + 10._dp*(gBLp3) +  & 
&  10*gBL*gBYp2 + 28*gBL*gYBp2 - g1*gBL*gBY*sqrt10 - 2*gYB*gBLp2*sqrt10 - gYB*gBYp2*sqrt10)*TrYdadjYd -& 
&  15*(12*g1*gYB*gBY + 10._dp*(gBLp3) + 10*gBL*gBYp2 + 12*gBL*gYBp2 + 3*g1*gBL*gBY*sqrt10 +& 
&  6*gYB*gBLp2*sqrt10 + 3*gYB*gBYp2*sqrt10)*TrYeadjYe - 260*g1*gYB*gBY*TrYuadjYu -       & 
&  50*gBLp3*TrYuadjYu - 50*gBL*gBYp2*TrYuadjYu - 260*gBL*gYBp2*TrYuadjYu -               & 
&  25*g1*gBL*gBY*sqrt10*TrYuadjYu - 50*gYB*gBLp2*sqrt10*TrYuadjYu - 25*gYB*gBYp2*sqrt10*TrYuadjYu -& 
&  60*g1*gYB*gBY*TrYvadjYv - 150*gBLp3*TrYvadjYv - 150*gBL*gBYp2*TrYvadjYv -             & 
&  60*gBL*gYBp2*TrYvadjYv - 15*g1*gBL*gBY*sqrt10*TrYvadjYv - 30*gYB*gBLp2*sqrt10*TrYvadjYv -& 
&  15*gYB*gBYp2*sqrt10*TrYvadjYv - 450*gBLp3*TrYxCYx - 450*gBL*gBYp2*TrYxCYx)/50._dp

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! gYB 
!-------------------- 
 
betagYB1  = (3*(g1*gBY*(15._dp*(gBL) + 2*gYB*sqrt10) + g1p2*(11._dp*(gYB)             & 
&  + 2*gBL*sqrt10) + gYB*(15._dp*(gBLp2) + 11._dp*(gYBp2) + 4*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagYB2 = (g1p2*(-14._dp*(gYB)/5._dp + gBL*ooSqrt10) + g1*(-(gBL*gBY) + gYB*gBY*ooSqrt10) +     & 
&  (gYB*(-5._dp*(gBLp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10))/5._dp)*TrYdadjYd +           & 
&  (398*gYB*g1p4 + 270*gYB*g1p2*g2p2 + 880*gYB*g1p2*g3p2 + 690*g1p3*gBL*gBY +            & 
&  450*g1*g2p2*gBL*gBY + 400*g1*g3p2*gBL*gBY + 920*gYB*g1p2*gBLp2 + 450*gYB*g2p2*gBLp2 + & 
&  400*gYB*g3p2*gBLp2 + 1250*g1*gBY*gBLp3 + 1250*gYB*gBLp4 + 690*gYB*g1p2*gBYp2 +        & 
&  1250*gYB*gBLp2*gBYp2 + 1250*g1*gBL*gBYp3 + 1610*g1*gBL*gBY*gYBp2 + 796*g1p2*gYBp3 +   & 
&  270*g2p2*gYBp3 + 880*g3p2*gYBp3 + 1380*gBLp2*gYBp3 + 230*gBYp2*gYBp3 + 398._dp*(gYBp5) +& 
&  82*g1p4*gBL*sqrt10 + 90*g1p2*g2p2*gBL*sqrt10 + 80*g1p2*g3p2*gBL*sqrt10 +              & 
&  246*gYB*g1p3*gBY*sqrt10 + 90*g1*gYB*g2p2*gBY*sqrt10 + 80*g1*gYB*g3p2*gBY*sqrt10 +     & 
&  350*g1*gYB*gBY*gBLp2*sqrt10 + 70*g1p2*gBLp3*sqrt10 + 210*g1p2*gBL*gBYp2*sqrt10 +      & 
&  70*g1*gYB*gBYp3*sqrt10 + 410*g1p2*gBL*gYBp2*sqrt10 + 180*g2p2*gBL*gYBp2*sqrt10 +      & 
&  160*g3p2*gBL*gYBp2*sqrt10 + 280*gBLp3*gYBp2*sqrt10 + 140*gBL*gBYp2*gYBp2*sqrt10 +     & 
&  246*g1*gBY*gYBp3*sqrt10 + 328*gBL*gYBp4*sqrt10 - 15*(g1*gBY*(10._dp*(gBL) +           & 
&  3*gYB*sqrt10) + 3*g1p2*(4._dp*(gYB) + gBL*sqrt10) + 2*gYB*(5._dp*(gBLp2) +            & 
&  6._dp*(gYBp2) + 3*gYB*gBL*sqrt10))*TrYeadjYe - 260*gYB*g1p2*TrYuadjYu -               & 
&  50*g1*gBL*gBY*TrYuadjYu - 50*gYB*gBLp2*TrYuadjYu - 260*gYBp3*TrYuadjYu -              & 
&  25*g1p2*gBL*sqrt10*TrYuadjYu - 25*g1*gYB*gBY*sqrt10*TrYuadjYu - 50*gBL*gYBp2*sqrt10*TrYuadjYu -& 
&  60*gYB*g1p2*TrYvadjYv - 150*g1*gBL*gBY*TrYvadjYv - 150*gYB*gBLp2*TrYvadjYv -          & 
&  60*gYBp3*TrYvadjYv - 15*g1p2*gBL*sqrt10*TrYvadjYv - 15*g1*gYB*gBY*sqrt10*TrYvadjYv -  & 
&  30*gBL*gYBp2*sqrt10*TrYvadjYv - 450*gBL*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
DgYB = oo16pi2*( betagYB1 + oo16pi2 * betagYB2 ) 

 
Else 
DgYB = oo16pi2* betagYB1 
End If 
 
 
If (.not.KineticMixing) DgYB  = 0._dp 
!-------------------- 
! gBY 
!-------------------- 
 
betagBY1  = (3*(11*g1p2*gBY + gBY*(15*(gBLp2 + gBYp2) + 2*gYB*gBL*sqrt10)             & 
&  + g1*(11*gYB*gBL + 2*(gBLp2 + 2._dp*(gBYp2))*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBY2 = (398*gYB*g1p3*gBL + 270*g1*gYB*g2p2*gBL + 880*g1*gYB*g3p2*gBL + 398*g1p4*gBY +        & 
&  270*g1p2*g2p2*gBY + 880*g1p2*g3p2*gBY + 920*g1p2*gBY*gBLp2 + 450*g2p2*gBY*gBLp2 +     & 
&  400*g3p2*gBY*gBLp2 + 690*g1*gYB*gBLp3 + 1250*gBY*gBLp4 + 1610*g1*gYB*gBL*gBYp2 +      & 
&  1380*g1p2*gBYp3 + 450*g2p2*gBYp3 + 400*g3p2*gBYp3 + 2500*gBLp2*gBYp3 + 1250._dp*(gBYp5) +& 
&  398*g1p2*gBY*gYBp2 + 690*gBY*gBLp2*gYBp2 + 230*gBYp3*gYBp2 + 398*g1*gBL*gYBp3 +       & 
&  410*gYB*g1p2*gBL*gBY*sqrt10 + 90*gYB*g2p2*gBL*gBY*sqrt10 + 80*gYB*g3p2*gBL*gBY*sqrt10 +& 
&  82*g1p3*gBLp2*sqrt10 + 90*g1*g2p2*gBLp2*sqrt10 + 80*g1*g3p2*gBLp2*sqrt10 +            & 
&  210*gYB*gBY*gBLp3*sqrt10 + 70*g1*gBLp4*sqrt10 + 328*g1p3*gBYp2*sqrt10 +               & 
&  180*g1*g2p2*gBYp2*sqrt10 + 160*g1*g3p2*gBYp2*sqrt10 + 350*g1*gBLp2*gBYp2*sqrt10 +     & 
&  210*gYB*gBL*gBYp3*sqrt10 + 280*g1*gBYp4*sqrt10 + 246*g1*gBLp2*gYBp2*sqrt10 +          & 
&  164*g1*gBYp2*gYBp2*sqrt10 + 82*gBL*gBY*gYBp3*sqrt10 - 5*(28*g1p2*gBY + 10*gBY*(gBLp2 +& 
&  gBYp2) - gYB*gBL*gBY*sqrt10 + g1*(28*gYB*gBL - (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*gBY + gBY*(10*(gBLp2 + gBYp2) + 3*gYB*gBL*sqrt10) + 3*g1*(4*gYB*gBL +     & 
&  (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYeadjYe - 260*g1*gYB*gBL*TrYuadjYu -               & 
&  260*g1p2*gBY*TrYuadjYu - 50*gBY*gBLp2*TrYuadjYu - 50*gBYp3*TrYuadjYu - 25*gYB*gBL*gBY*sqrt10*TrYuadjYu -& 
&  25*g1*gBLp2*sqrt10*TrYuadjYu - 50*g1*gBYp2*sqrt10*TrYuadjYu - 60*g1*gYB*gBL*TrYvadjYv -& 
&  60*g1p2*gBY*TrYvadjYv - 150*gBY*gBLp2*TrYvadjYv - 150*gBYp3*TrYvadjYv -               & 
&  15*gYB*gBL*gBY*sqrt10*TrYvadjYv - 15*g1*gBLp2*sqrt10*TrYvadjYv - 30*g1*gBYp2*sqrt10*TrYvadjYv -& 
&  450*gBY*gBLp2*TrYxCYx - 450*gBYp3*TrYxCYx)/50._dp

 
DgBY = oo16pi2*( betagBY1 + oo16pi2 * betagBY2 ) 

 
Else 
DgBY = oo16pi2* betagBY1 
End If 
 
 
If (.not.KineticMixing) DgBY  = 0._dp 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = ((-14._dp*(g1p2) - 90._dp*(g2p2) - 160._dp*(g3p2) - 5._dp*(gBLp2)          & 
&  - 5._dp*(gBYp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10 + 90._dp*(TrYdadjYd)& 
&  + 30._dp*(TrYeadjYe))*Yd + 30*(3._dp*(YdadjYdYd) + YdadjYuYu))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = ((5740._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 1600*g1p2*g3p2 +              & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 17840._dp*g1*gYB*gBL*gBY - 670*g1p2*gBLp2 +   & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 8250*g1p2*gBYp2 +               & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  11480._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 1600*g3p2*gYBp2 + 8250*gBLp2*gYBp2 -         & 
&  670*gBYp2*gYBp2 + 5740._dp*(gYBp4) + 1592*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 -& 
&  320*gYB*g3p2*gBL*sqrt10 + 1592*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 -             & 
&  320*g1*g3p2*gBY*sqrt10 + 170*g1*gBY*gBLp2*sqrt10 + 170*gYB*gBLp3*sqrt10 +             & 
&  170*gYB*gBL*gBYp2*sqrt10 + 170*g1*gBYp3*sqrt10 + 1592*g1*gBY*gYBp2*sqrt10 +           & 
&  1592*gBL*gYBp3*sqrt10 - 180*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +       & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 16200._dp*(TrYdadjYdYdadjYd) -& 
&  5400._dp*(TrYdadjYuYuadjYd) + 540*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) + & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 5400._dp*(TrYeadjYeYeadjYe) -         & 
&  1800._dp*(TrYeadjYvYvadjYe))*Yd)/1800._dp + (4._dp*(g1p2)/5._dp + 6._dp*(g2p2) +      & 
&  4._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10 + g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) -        & 
&  3._dp*(TrYeadjYe))*YdadjYdYd - 4._dp*(YdadjYdYdadjYdYd) + (4*g1p2*YdadjYuYu)/5._dp +  & 
&  (4*gYBp2*YdadjYuYu)/5._dp + gYB*gBL*ooSqrt10*YdadjYuYu + g1*gBY*ooSqrt10*YdadjYuYu -  & 
&  3*TrYuadjYu*YdadjYuYu - TrYvadjYv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdYd) -              & 
&  2._dp*(YdadjYuYuadjYuYu)

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = -((3*(6._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 6._dp*(gYBp2)      & 
&  + 3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10) - 30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe))      & 
& *Ye)/10._dp + 3._dp*(YeadjYeYe) + YeadjYvYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = ((2700._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 16560._dp*g1*gYB*gBL*gBY +      & 
&  2610*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 10890._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 5400*g1p2*gYBp2 +              & 
&  360*g2p2*gYBp2 + 10890._dp*gBLp2*gYBp2 + 2610*gBYp2*gYBp2 + 2700._dp*(gYBp4) +        & 
&  2376*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 + 2376*g1p3*gBY*sqrt10 +           & 
&  180*g1*g2p2*gBY*sqrt10 + 2610*g1*gBY*gBLp2*sqrt10 + 2610*gYB*gBLp3*sqrt10 +           & 
&  2610*gYB*gBL*gBYp2*sqrt10 + 2610*g1*gBYp3*sqrt10 + 2376*g1*gBY*gYBp2*sqrt10 +         & 
&  2376*gBL*gYBp3*sqrt10 - 20*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +        & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 1800._dp*(TrYdadjYdYdadjYd) -& 
&  600._dp*(TrYdadjYuYuadjYd) + 60*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) +   & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 600._dp*(TrYeadjYeYeadjYe) -          & 
&  200._dp*(TrYeadjYvYvadjYe))*Ye)/200._dp + (6._dp*(g2p2) - 3*gYB*gBL*ooSqrt10 -        & 
&  3*g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YeadjYeYe - 4._dp*(YeadjYeYeadjYeYe) -& 
&  3*gYB*gBL*ooSqrt10*YeadjYvYv - 3*g1*gBY*ooSqrt10*YeadjYvYv - 3*TrYuadjYu*YeadjYvYv -  & 
&  TrYvadjYv*YeadjYvYv - 2._dp*(YeadjYvYvadjYeYe) - 2._dp*(YeadjYvYvadjYvYv) -           & 
&  4._dp*(YeadjYvYxCYxYv)

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-((26._dp*(g1p2) + 90._dp*(g2p2) + 160._dp*(g3p2) + 5._dp*(gBLp2)         & 
&  + 5._dp*(gBYp2) + 26._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10 -               & 
&  90._dp*(TrYuadjYu) - 30._dp*(TrYvadjYv))*Yu) + 30*(YuadjYdYd + 3._dp*(YuadjYuYu)))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = ((10972._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 5440*g1p2*g3p2 +             & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 39920._dp*g1*gYB*gBL*gBY + 3770*g1p2*gBLp2 +  & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 23730._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  21944._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 5440*g3p2*gYBp2 + 23730._dp*gBLp2*gYBp2 +    & 
&  3770*gBYp2*gYBp2 + 10972._dp*(gYBp4) + 5984*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 +& 
&  1600*gYB*g3p2*gBL*sqrt10 + 5984*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +            & 
&  1600*g1*g3p2*gBY*sqrt10 + 3470*g1*gBY*gBLp2*sqrt10 + 3470*gYB*gBLp3*sqrt10 +          & 
&  3470*gYB*gBL*gBYp2*sqrt10 + 3470*g1*gBYp3*sqrt10 + 5984*g1*gBY*gYBp2*sqrt10 +         & 
&  5984*gBL*gYBp3*sqrt10 - 5400._dp*(TrYdadjYuYuadjYd) - 1800._dp*(TrYeadjYvYvadjYe) +   & 
&  180*(8._dp*(g1p2) + 5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) +               & 
&  5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu - 16200._dp*(TrYuadjYuYuadjYu) +        & 
&  540*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + g1*sqrt10))*TrYvadjYv -      & 
&  5400._dp*(TrYvadjYvYvadjYv) - 7200._dp*(TrYxCYxYvadjYv))*Yu)/1800._dp +               & 
&  ((4._dp*(g1p2) + 4._dp*(gYBp2) - gYB*gBL*sqrt10 - g1*gBY*sqrt10 - 30._dp*(TrYdadjYd) -& 
&  10._dp*(TrYeadjYe))*YuadjYdYd)/10._dp - 2._dp*(YuadjYdYdadjYdYd) - 2._dp*(YuadjYdYdadjYuYu) +& 
&  (2*g1p2*YuadjYuYu)/5._dp + 6*g2p2*YuadjYuYu + (2*gYBp2*YuadjYuYu)/5._dp -             & 
&  gYB*gBL*ooSqrt10*YuadjYuYu - g1*gBY*ooSqrt10*YuadjYuYu - 9*TrYuadjYu*YuadjYuYu -      & 
&  3*TrYvadjYv*YuadjYuYu - 4._dp*(YuadjYuYuadjYuYu)

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yx 
!-------------------- 
 
betaYx1  = -((9*(gBLp2 + gBYp2) - 4._dp*(TrYxCYx))*Yx)/2._dp + 2*(YvadjYvYx +         & 
&  YxCYvTpYv + 4._dp*(YxCYxYx))

 
 
If (TwoLoopRGE) Then 
betaYx2 = ((2376*g1*gYB*gBL*gBY + 2025._dp*(gBLp4) + 1188*g1p2*gBYp2 + 4050*gBLp2*gBYp2 +       & 
&  2025._dp*(gBYp4) + 1188*gBLp2*gYBp2 + 432*g1*gBY*gBLp2*sqrt10 + 432*gYB*gBLp3*sqrt10 +& 
&  432*gYB*gBL*gBYp2*sqrt10 + 432*g1*gBYp3*sqrt10 - 120*(gBLp2 + gBYp2)*TrYxCYx -        & 
&  320._dp*(TrYxCYxYvadjYv) - 640._dp*(TrYxCYxYxCYx))*Yx)/40._dp - 2._dp*(YvadjYeYeadjYvYx) -& 
&  2._dp*(YvadjYvYvadjYvYx) + (6*g1p2*YvadjYvYx)/5._dp + 6*g2p2*YvadjYvYx +              & 
&  (6*gYBp2*YvadjYvYx)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYvYx + 3*g1*gBY*sqrt2ov5*YvadjYvYx -& 
&  6*TrYuadjYu*YvadjYvYx - 2*TrYvadjYv*YvadjYvYx - 2._dp*(YxCYvTpYeCYeTpYv) +            & 
&  (6*g1p2*YxCYvTpYv)/5._dp + 6*g2p2*YxCYvTpYv + (6*gYBp2*YxCYvTpYv)/5._dp +             & 
&  3*gYB*gBL*sqrt2ov5*YxCYvTpYv + 3*g1*gBY*sqrt2ov5*YxCYvTpYv - 6*TrYuadjYu*YxCYvTpYv -  & 
&  2*TrYvadjYv*YxCYvTpYv - 2._dp*(YxCYvTpYvCYvTpYv) - 8._dp*(YxCYvTpYvCYxYx) -           & 
&  8._dp*(YxCYxYvadjYvYx) + 8*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYx -            & 
&  32._dp*(YxCYxYxCYxYx)

 
DYx = oo16pi2*( betaYx1 + oo16pi2 * betaYx2 ) 

 
Else 
DYx = oo16pi2* betaYx1 
End If 
 
 
Call Chop(DYx) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = -((3*(2._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 2._dp*(gYBp2)      & 
&  + gYB*gBL*sqrt10 + g1*gBY*sqrt10) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv))          & 
& *Yv)/10._dp + YvadjYeYe + 3._dp*(YvadjYvYv) + 4._dp*(YxCYxYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = ((828._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 7920*g1*gYB*gBL*gBY +            & 
&  810*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 4770*g1p2*gBYp2 + 450*g2p2*gBYp2 +& 
&  5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 1656*g1p2*gYBp2 + 360*g2p2*gYBp2 +              & 
&  4770*gBLp2*gYBp2 + 810*gBYp2*gYBp2 + 828._dp*(gYBp4) + 720*gYB*g1p2*gBL*sqrt10 +      & 
&  180*gYB*g2p2*gBL*sqrt10 + 720*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +              & 
&  1350*g1*gBY*gBLp2*sqrt10 + 1350*gYB*gBLp3*sqrt10 + 1350*gYB*gBL*gBYp2*sqrt10 +        & 
&  1350*g1*gBYp3*sqrt10 + 720*g1*gBY*gYBp2*sqrt10 + 720*gBL*gYBp3*sqrt10 -               & 
&  600._dp*(TrYdadjYuYuadjYd) - 200._dp*(TrYeadjYvYvadjYe) + 20*(8._dp*(g1p2) +          & 
&  5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu -& 
&  1800._dp*(TrYuadjYuYuadjYu) + 60*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + & 
&  g1*sqrt10))*TrYvadjYv - 600._dp*(TrYvadjYvYvadjYv) - 800._dp*(TrYxCYxYvadjYv))*Yv)/200._dp +& 
&  (6*g1p2*YvadjYeYe)/5._dp + (6*gYBp2*YvadjYeYe)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYeYe + & 
&  3*g1*gBY*ooSqrt10*YvadjYeYe - 3*TrYdadjYd*YvadjYeYe - TrYeadjYe*YvadjYeYe -           & 
&  2._dp*(YvadjYeYeadjYeYe) - 2._dp*(YvadjYeYeadjYvYv) + (6*g1p2*YvadjYvYv)/5._dp +      & 
&  6*g2p2*YvadjYvYv + (6*gYBp2*YvadjYvYv)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYvYv +         & 
&  3*g1*gBY*ooSqrt10*YvadjYvYv - 9*TrYuadjYu*YvadjYvYv - 3*TrYvadjYv*YvadjYvYv -         & 
&  4._dp*(YvadjYvYvadjYvYv) - 4._dp*(YvadjYvYxCYxYv) - 8._dp*(YxCYvTpYvCYxYv) +          & 
&  4*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYv - 16._dp*(YxCYxYxCYxYv)

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! MuP 
!-------------------- 
 
betaMuP1  = 2*MuP*(-3*(gBLp2 + gBYp2) + TrYxCYx)

 
 
If (TwoLoopRGE) Then 
betaMuP2 = (MuP*(-15*(gBLp2 + gBYp2)*TrYxCYx + 2*(9*(20._dp*(gBLp4) + 11*gBLp2*gYBp2 +           & 
&  4*gBY*gBLp2*(10._dp*(gBY) + g1*sqrt10) + gBYp2*(11._dp*(g1p2) + 20._dp*(gBYp2) +      & 
&  4*g1*gBY*sqrt10) + gYB*(4*gBLp3*sqrt10 + 2*gBL*gBY*(11._dp*(g1) + 2*gBY*sqrt10))) -   & 
&  20._dp*(TrYxCYxYvadjYv) - 40._dp*(TrYxCYxYxCYx))))/5._dp

 
DMuP = oo16pi2*( betaMuP1 + oo16pi2 * betaMuP2 ) 

 
Else 
DMuP = oo16pi2* betaMuP1 
End If 
 
 
Call Chop(DMuP) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = ((-3._dp*(g1p2) - 15._dp*(g2p2) - 3._dp*(gYBp2) + 15._dp*(TrYdadjYd)       & 
&  + 5._dp*(TrYeadjYe) + 15._dp*(TrYuadjYu) + 5._dp*(TrYvadjYv))*Mu)/5._dp

 
 
If (TwoLoopRGE) Then 
betaMu2 = ((207._dp*(g1p4) + 90*g1p2*g2p2 + 375._dp*(g2p4) + 540*g1*gYB*gBL*gBY +               & 
&  270*g1p2*gBYp2 + 414*g1p2*gYBp2 + 90*g2p2*gYBp2 + 270*gBLp2*gYBp2 + 207._dp*(gYBp4) + & 
&  72*gYB*g1p2*gBL*sqrt10 + 72*g1p3*gBY*sqrt10 + 72*g1*gBY*gYBp2*sqrt10 + 72*gBL*gYBp3*sqrt10 -& 
&  5*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 4._dp*(gYBp2) + gYB*gBL*sqrt10 +& 
&  g1*gBY*sqrt10)*TrYdadjYd - 450._dp*(TrYdadjYdYdadjYd) - 300._dp*(TrYdadjYuYuadjYd) +  & 
&  15*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) + 3*gYB*gBL*sqrt10 +             & 
&  3*g1*gBY*sqrt10)*TrYeadjYe - 150._dp*(TrYeadjYeYeadjYe) - 100._dp*(TrYeadjYvYvadjYe) +& 
&  40*g1p2*TrYuadjYu + 800*g3p2*TrYuadjYu + 25*gBLp2*TrYuadjYu + 25*gBYp2*TrYuadjYu +    & 
&  40*gYBp2*TrYuadjYu + 25*gYB*gBL*sqrt10*TrYuadjYu + 25*g1*gBY*sqrt10*TrYuadjYu -       & 
&  450._dp*(TrYuadjYuYuadjYu) + 75*gBLp2*TrYvadjYv + 75*gBYp2*TrYvadjYv + 15*gYB*gBL*sqrt10*TrYvadjYv +& 
&  15*g1*gBY*sqrt10*TrYvadjYv - 150._dp*(TrYvadjYvYvadjYv) - 200._dp*(TrYxCYxYvadjYv))*Mu)/50._dp

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = (150._dp*(TdadjYdYd) + 30._dp*(TdadjYuYu) + 2*(14*g1p2*M1 + 5*gBYp2*M1 +   & 
&  28*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 14*gYBp2*MBp + 160*g3p2*M3 +         & 
&  90*g2p2*M2 - g1*gBY*M1*sqrt10 - g1*gBL*MBBp*sqrt10 - gYB*gBY*MBBp*sqrt10 -            & 
&  gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYdTd) + 30._dp*(TradjYeTe))*Yd + 120._dp*(YdadjYdTd)& 
&  + 60._dp*(YdadjYuTu) - 14*g1p2*Td - 90*g2p2*Td - 160*g3p2*Td - 5*gBLp2*Td -           & 
&  5*gBYp2*Td - 14*gYBp2*Td + gYB*gBL*sqrt10*Td + g1*gBY*sqrt10*Td + 90*TrYdadjYd*Td +   & 
&  30*TrYeadjYe*Td)/30._dp

 
 
If (TwoLoopRGE) Then 
betaTd2 = (6*g1p2*TdadjYdYd)/5._dp + 12*g2p2*TdadjYdYd + (6*gYBp2*TdadjYdYd)/5._dp +            & 
&  3*gYB*gBL*ooSqrt10*TdadjYdYd + 3*g1*gBY*ooSqrt10*TdadjYdYd - 6._dp*(TdadjYdYdadjYdYd) +& 
&  (4*g1p2*TdadjYuYu)/5._dp + (4*gYBp2*TdadjYuYu)/5._dp + gYB*gBL*ooSqrt10*TdadjYuYu +   & 
&  g1*gBY*ooSqrt10*TdadjYuYu - 4._dp*(TdadjYuYuadjYdYd) - 2._dp*(TdadjYuYuadjYuYu) -     & 
&  15*TdadjYdYd*TrYdadjYd - 5*TdadjYdYd*TrYeadjYe - 3*TdadjYuYu*TrYuadjYu -              & 
&  TdadjYuYu*TrYvadjYv - ((5740*g1p4*M1 + 900*g1p2*g2p2*M1 + 800*g1p2*g3p2*M1 +          & 
&  8920*g1*gYB*gBL*gBY*M1 - 335*g1p2*gBLp2*M1 + 8250*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + & 
&  800*g3p2*gBYp2*M1 + 2725*gBLp2*gBYp2*M1 + 2725*gBYp4*M1 + 5740*g1p2*gYBp2*M1 -        & 
&  335*gBYp2*gYBp2*M1 + 11480._dp*gYB*g1p3*MBBp + 1800*g1*gYB*g2p2*MBBp + 1600*g1*gYB*g3p2*MBBp +& 
&  8250*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 1600*g3p2*gBL*gBY*MBBp +             & 
&  8250*g1*gYB*gBLp2*MBBp + 5450*gBY*gBLp3*MBBp + 8250*g1*gYB*gBYp2*MBBp +               & 
&  5450*gBL*gBYp3*MBBp + 8250*gBL*gBY*gYBp2*MBBp + 11480._dp*g1*gYBp3*MBBp +             & 
&  8920*g1*gYB*gBL*gBY*MBp - 335*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp + 800*g3p2*gBLp2*MBp +& 
&  2725*gBLp4*MBp + 2725*gBLp2*gBYp2*MBp + 5740*g1p2*gYBp2*MBp + 900*g2p2*gYBp2*MBp +    & 
&  800*g3p2*gYBp2*MBp + 8250*gBLp2*gYBp2*MBp - 335*gBYp2*gYBp2*MBp + 5740*gYBp4*MBp +    & 
&  800*g1p2*g3p2*M3 + 7200*g2p2*g3p2*M3 - 3200*g3p4*M3 + 800*g3p2*gBLp2*M3 +             & 
&  800*g3p2*gBYp2*M3 + 800*g3p2*gYBp2*M3 + 900*g1p2*g2p2*M2 + 13500._dp*g2p4*M2 +        & 
&  7200*g2p2*g3p2*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 900*g2p2*gYBp2*M2 +       & 
&  796*gYB*g1p2*gBL*M1*sqrt10 + 1592*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 -     & 
&  160*g1*g3p2*gBY*M1*sqrt10 + 85*g1*gBY*gBLp2*M1*sqrt10 + 85*gYB*gBL*gBYp2*M1*sqrt10 +  & 
&  170*g1*gBYp3*M1*sqrt10 + 796*g1*gBY*gYBp2*M1*sqrt10 + 796*g1p3*gBL*MBBp*sqrt10 +      & 
&  90*g1*g2p2*gBL*MBBp*sqrt10 - 160*g1*g3p2*gBL*MBBp*sqrt10 + 2388*gYB*g1p2*gBY*MBBp*sqrt10 +& 
&  90*gYB*g2p2*gBY*MBBp*sqrt10 - 160*gYB*g3p2*gBY*MBBp*sqrt10 + 255*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  85*g1*gBLp3*MBBp*sqrt10 + 255*g1*gBL*gBYp2*MBBp*sqrt10 + 85*gYB*gBYp3*MBBp*sqrt10 +   & 
&  2388*g1*gBL*gYBp2*MBBp*sqrt10 + 796*gBY*gYBp3*MBBp*sqrt10 + 796*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 - 160*gYB*g3p2*gBL*MBp*sqrt10 + 85*g1*gBY*gBLp2*MBp*sqrt10 +& 
&  170*gYB*gBLp3*MBp*sqrt10 + 85*gYB*gBL*gBYp2*MBp*sqrt10 + 796*g1*gBY*gYBp2*MBp*sqrt10 +& 
&  1592*gBL*gYBp3*MBp*sqrt10 - 160*gYB*g3p2*gBL*M3*sqrt10 - 160*g1*g3p2*gBY*M3*sqrt10 +  & 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 + 360*g1p2*TradjYdTd -           & 
&  14400._dp*g3p2*TradjYdTd - 450*gBLp2*TradjYdTd - 450*gBYp2*TradjYdTd + 360*gYBp2*TradjYdTd +& 
&  90*gYB*gBL*sqrt10*TradjYdTd + 90*g1*gBY*sqrt10*TradjYdTd - 1080*g1p2*TradjYeTe -      & 
&  1350*gBLp2*TradjYeTe - 1350*gBYp2*TradjYeTe - 1080*gYBp2*TradjYeTe - 810*gYB*gBL*sqrt10*TradjYeTe -& 
&  810*g1*gBY*sqrt10*TradjYeTe - 90*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp -          & 
&  5*gBLp2*MBp + 4*gYBp2*MBp - 160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 +  & 
&  g1*(8*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 16200._dp*(TrYdadjYdTdadjYd) +& 
&  2700._dp*(TrYdadjYuTuadjYd) + 270*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +           & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 5400._dp*(TrYeadjYeTeadjYe) +& 
&  900._dp*(TrYeadjYvTvadjYe) + 2700._dp*(TrYuadjYdTdadjYu) + 900._dp*(TrYvadjYeTeadjYv))*Yd)/450._dp  
betaTd2 =  betaTd2+ (6*g1p2*YdadjYdTd)/5._dp + 6*g2p2*YdadjYdTd + (6*gYBp2*YdadjYdTd)/5._dp -             & 
&  12*TrYdadjYd*YdadjYdTd - 4*TrYeadjYe*YdadjYdTd - 8._dp*(YdadjYdTdadjYdYd) -           & 
&  ((8*g1p2*M1 + 16*g1*gYB*MBBp + 8*gYBp2*MBp + 60*g2p2*M2 + g1*gBY*M1*sqrt10 +          & 
&  g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYdTd) +  & 
&  30._dp*(TradjYeTe))*YdadjYdYd)/5._dp - 6._dp*(YdadjYdYdadjYdTd) + (8*g1p2*YdadjYuTu)/5._dp +& 
&  (8*gYBp2*YdadjYuTu)/5._dp + gYB*gBL*sqrt2ov5*YdadjYuTu + g1*gBY*sqrt2ov5*YdadjYuTu -  & 
&  6*TrYuadjYu*YdadjYuTu - 2*TrYvadjYv*YdadjYuTu - 4._dp*(YdadjYuTuadjYdYd) -            & 
&  4._dp*(YdadjYuTuadjYuYu) - (8*g1p2*M1*YdadjYuYu)/5._dp - (16*g1*gYB*MBBp*YdadjYuYu)/5._dp -& 
&  (8*gYBp2*MBp*YdadjYuYu)/5._dp - g1*gBY*M1*sqrt2ov5*YdadjYuYu - g1*gBL*MBBp*sqrt2ov5*YdadjYuYu -& 
&  gYB*gBY*MBBp*sqrt2ov5*YdadjYuYu - gYB*gBL*MBp*sqrt2ov5*YdadjYuYu - 6*TradjYuTu*YdadjYuYu -& 
&  2*TradjYvTv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdTd) - 4._dp*(YdadjYuYuadjYuTu) +         & 
&  (287*g1p4*Td)/90._dp + g1p2*g2p2*Td + (15*g2p4*Td)/2._dp + (8*g1p2*g3p2*Td)/9._dp +   & 
&  8*g2p2*g3p2*Td - (16*g3p4*Td)/9._dp + (446*g1*gYB*gBL*gBY*Td)/45._dp - (67*g1p2*gBLp2*Td)/180._dp +& 
&  (g2p2*gBLp2*Td)/4._dp + (8*g3p2*gBLp2*Td)/9._dp + (109*gBLp4*Td)/72._dp +             & 
&  (55*g1p2*gBYp2*Td)/12._dp + (g2p2*gBYp2*Td)/4._dp + (8*g3p2*gBYp2*Td)/9._dp +         & 
&  (109*gBLp2*gBYp2*Td)/36._dp + (109*gBYp4*Td)/72._dp + (287*g1p2*gYBp2*Td)/45._dp +    & 
&  g2p2*gYBp2*Td + (8*g3p2*gYBp2*Td)/9._dp + (55*gBLp2*gYBp2*Td)/12._dp - (67*gBYp2*gYBp2*Td)/180._dp +& 
&  (287*gYBp4*Td)/90._dp + gYB*g2p2*gBL*ooSqrt10*Td + g1*g2p2*gBY*ooSqrt10*Td +          & 
&  (17*g1*gBY*gBLp2*ooSqrt10*Td)/18._dp + (17*gYB*gBLp3*ooSqrt10*Td)/18._dp +            & 
&  (17*gYB*gBL*gBYp2*ooSqrt10*Td)/18._dp + (17*g1*gBYp3*ooSqrt10*Td)/18._dp +            & 
&  (199*gYB*g1p2*gBL*sqrt2ov5*Td)/45._dp - (8*gYB*g3p2*gBL*sqrt2ov5*Td)/9._dp  
betaTd2 =  betaTd2+ (199*g1p3*gBY*sqrt2ov5*Td)/45._dp - (8*g1*g3p2*gBY*sqrt2ov5*Td)/9._dp +               & 
&  (199*g1*gBY*gYBp2*sqrt2ov5*Td)/45._dp + (199*gBL*gYBp3*sqrt2ov5*Td)/45._dp -          & 
&  (2*g1p2*TrYdadjYd*Td)/5._dp + 16*g3p2*TrYdadjYd*Td + (gBLp2*TrYdadjYd*Td)/2._dp +     & 
&  (gBYp2*TrYdadjYd*Td)/2._dp - (2*gYBp2*TrYdadjYd*Td)/5._dp - gYB*gBL*ooSqrt10*TrYdadjYd*Td -& 
&  g1*gBY*ooSqrt10*TrYdadjYd*Td - 9*TrYdadjYdYdadjYd*Td - 3*TrYdadjYuYuadjYd*Td +        & 
&  (6*g1p2*TrYeadjYe*Td)/5._dp + (3*gBLp2*TrYeadjYe*Td)/2._dp + (3*gBYp2*TrYeadjYe*Td)/2._dp +& 
&  (6*gYBp2*TrYeadjYe*Td)/5._dp + 9*gYB*gBL*ooSqrt10*TrYeadjYe*Td + 9*g1*gBY*ooSqrt10*TrYeadjYe*Td -& 
&  3*TrYeadjYeYeadjYe*Td - TrYeadjYvYvadjYe*Td

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeadjYvYv + ((3*(6*g1p2*M1 + 5*gBYp2*M1 +              & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 6*gYBp2*MBp + 10*g2p2*M2 + 3*gYB*gBY*MBBp*sqrt10 +    & 
&  3*gYB*gBL*MBp*sqrt10 + 3*g1*(4*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))           & 
&  + 30._dp*(TradjYdTd) + 10._dp*(TradjYeTe))*Ye)/5._dp + 4._dp*(YeadjYeTe)              & 
&  + 2._dp*(YeadjYvTv) - (9*g1p2*Te)/5._dp - 3*g2p2*Te - (3*gBLp2*Te)/2._dp -            & 
&  (3*gBYp2*Te)/2._dp - (9*gYBp2*Te)/5._dp - 9*gYB*gBL*ooSqrt10*Te - 9*g1*gBY*ooSqrt10*Te +& 
&  3*TrYdadjYd*Te + TrYeadjYe*Te

 
 
If (TwoLoopRGE) Then 
betaTe2 = (-6*g1p2*TeadjYeYe)/5._dp + 12*g2p2*TeadjYeYe - (6*gYBp2*TeadjYeYe)/5._dp -           & 
&  9*gYB*gBL*ooSqrt10*TeadjYeYe - 9*g1*gBY*ooSqrt10*TeadjYeYe - 6._dp*(TeadjYeYeadjYeYe) -& 
&  3*gYB*gBL*ooSqrt10*TeadjYvYv - 3*g1*gBY*ooSqrt10*TeadjYvYv - 4._dp*(TeadjYvYvadjYeYe) -& 
&  2._dp*(TeadjYvYvadjYvYv) - 4._dp*(TeadjYvYxCYxYv) - 15*TeadjYeYe*TrYdadjYd -          & 
&  5*TeadjYeYe*TrYeadjYe - 3*TeadjYvYv*TrYuadjYu - TeadjYvYv*TrYvadjYv - ((2700*g1p4*M1 +& 
&  180*g1p2*g2p2*M1 + 8280*g1*gYB*gBL*gBY*M1 + 1305*g1p2*gBLp2*M1 + 10890._dp*g1p2*gBYp2*M1 +& 
&  225*g2p2*gBYp2*M1 + 2925*gBLp2*gBYp2*M1 + 2925*gBYp4*M1 + 2700*g1p2*gYBp2*M1 +        & 
&  1305*gBYp2*gYBp2*M1 + 5400*gYB*g1p3*MBBp + 360*g1*gYB*g2p2*MBBp + 10890._dp*g1p2*gBL*gBY*MBBp +& 
&  450*g2p2*gBL*gBY*MBBp + 10890._dp*g1*gYB*gBLp2*MBBp + 5850*gBY*gBLp3*MBBp +           & 
&  10890._dp*g1*gYB*gBYp2*MBBp + 5850*gBL*gBYp3*MBBp + 10890._dp*gBL*gBY*gYBp2*MBBp +    & 
&  5400*g1*gYBp3*MBBp + 8280*g1*gYB*gBL*gBY*MBp + 1305*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp +& 
&  2925*gBLp4*MBp + 2925*gBLp2*gBYp2*MBp + 2700*g1p2*gYBp2*MBp + 180*g2p2*gYBp2*MBp +    & 
&  10890._dp*gBLp2*gYBp2*MBp + 1305*gBYp2*gYBp2*MBp + 2700*gYBp4*MBp + 180*g1p2*g2p2*M2 +& 
&  1500*g2p4*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 180*g2p2*gYBp2*M2 +            & 
&  1188*gYB*g1p2*gBL*M1*sqrt10 + 2376*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +    & 
&  1305*g1*gBY*gBLp2*M1*sqrt10 + 1305*gYB*gBL*gBYp2*M1*sqrt10 + 2610*g1*gBYp3*M1*sqrt10 +& 
&  1188*g1*gBY*gYBp2*M1*sqrt10 + 1188*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 +& 
&  3564*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 3915*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  1305*g1*gBLp3*MBBp*sqrt10 + 3915*g1*gBL*gBYp2*MBBp*sqrt10 + 1305*gYB*gBYp3*MBBp*sqrt10 +& 
&  3564*g1*gBL*gYBp2*MBBp*sqrt10 + 1188*gBY*gYBp3*MBBp*sqrt10 + 1188*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 1305*g1*gBY*gBLp2*MBp*sqrt10 + 2610*gYB*gBLp3*MBp*sqrt10 +& 
&  1305*gYB*gBL*gBYp2*MBp*sqrt10 + 1188*g1*gBY*gYBp2*MBp*sqrt10 + 2376*gBL*gYBp3*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 + 40*g1p2*TradjYdTd -            & 
&  1600*g3p2*TradjYdTd - 50*gBLp2*TradjYdTd - 50*gBYp2*TradjYdTd + 40*gYBp2*TradjYdTd +  & 
&  10*gYB*gBL*sqrt10*TradjYdTd + 10*g1*gBY*sqrt10*TradjYdTd - 120*g1p2*TradjYeTe -       & 
&  150*gBLp2*TradjYeTe - 150*gBYp2*TradjYeTe - 120*gYBp2*TradjYeTe - 90*gYB*gBL*sqrt10*TradjYeTe -& 
&  90*g1*gBY*sqrt10*TradjYeTe - 10*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp -           & 
&  5*gBLp2*MBp + 4*gYBp2*MBp - 160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 +  & 
&  g1*(8*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 1800._dp*(TrYdadjYdTdadjYd) +& 
&  300._dp*(TrYdadjYuTuadjYd) + 30*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +             & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 600._dp*(TrYeadjYeTeadjYe) +& 
&  100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) + 100._dp*(TrYvadjYeTeadjYv))*Ye)/50._dp  
betaTe2 =  betaTe2+ (6*g1p2*YeadjYeTe)/5._dp + 6*g2p2*YeadjYeTe + (6*gYBp2*YeadjYeTe)/5._dp -             & 
&  12*TrYdadjYd*YeadjYeTe - 4*TrYeadjYe*YeadjYeTe - 8._dp*(YeadjYeTeadjYeYe) +           & 
&  (3*(-20*g2p2*M2 + g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 +       & 
&  gYB*gBL*MBp*sqrt10 - 30._dp*(TradjYdTd) - 10._dp*(TradjYeTe))*YeadjYeYe)/5._dp -      & 
&  6._dp*(YeadjYeYeadjYeTe) - 3*gYB*gBL*sqrt2ov5*YeadjYvTv - 3*g1*gBY*sqrt2ov5*YeadjYvTv -& 
&  6*TrYuadjYu*YeadjYvTv - 2*TrYvadjYv*YeadjYvTv - 4._dp*(YeadjYvTvadjYeYe) -            & 
&  4._dp*(YeadjYvTvadjYvYv) - 8._dp*(YeadjYvTxCYxYv) + 3*g1*gBY*M1*sqrt2ov5*YeadjYvYv +  & 
&  3*g1*gBL*MBBp*sqrt2ov5*YeadjYvYv + 3*gYB*gBY*MBBp*sqrt2ov5*YeadjYvYv + 3*gYB*gBL*MBp*sqrt2ov5*YeadjYvYv -& 
&  6*TradjYuTu*YeadjYvYv - 2*TradjYvTv*YeadjYvYv - 2._dp*(YeadjYvYvadjYeTe) -            & 
&  4._dp*(YeadjYvYvadjYvTv) - 8._dp*(YeadjYvYxCYxTv) + (27*g1p4*Te)/2._dp +              & 
&  (9*g1p2*g2p2*Te)/5._dp + (15*g2p4*Te)/2._dp + (414*g1*gYB*gBL*gBY*Te)/5._dp +         & 
&  (261*g1p2*gBLp2*Te)/20._dp + (9*g2p2*gBLp2*Te)/4._dp + (117*gBLp4*Te)/8._dp +         & 
&  (1089*g1p2*gBYp2*Te)/20._dp + (9*g2p2*gBYp2*Te)/4._dp + (117*gBLp2*gBYp2*Te)/4._dp +  & 
&  (117*gBYp4*Te)/8._dp + 27*g1p2*gYBp2*Te + (9*g2p2*gYBp2*Te)/5._dp + (1089*gBLp2*gYBp2*Te)/20._dp +& 
&  (261*gBYp2*gYBp2*Te)/20._dp + (27*gYBp4*Te)/2._dp + 9*gYB*g2p2*gBL*ooSqrt10*Te +      & 
&  9*g1*g2p2*gBY*ooSqrt10*Te + (261*g1*gBY*gBLp2*ooSqrt10*Te)/2._dp + (261*gYB*gBLp3*ooSqrt10*Te)/2._dp +& 
&  (261*gYB*gBL*gBYp2*ooSqrt10*Te)/2._dp + (261*g1*gBYp3*ooSqrt10*Te)/2._dp +            & 
&  (297*gYB*g1p2*gBL*sqrt2ov5*Te)/5._dp + (297*g1p3*gBY*sqrt2ov5*Te)/5._dp +             & 
&  (297*g1*gBY*gYBp2*sqrt2ov5*Te)/5._dp + (297*gBL*gYBp3*sqrt2ov5*Te)/5._dp -            & 
&  (2*g1p2*TrYdadjYd*Te)/5._dp + 16*g3p2*TrYdadjYd*Te + (gBLp2*TrYdadjYd*Te)/2._dp +     & 
&  (gBYp2*TrYdadjYd*Te)/2._dp - (2*gYBp2*TrYdadjYd*Te)/5._dp - gYB*gBL*ooSqrt10*TrYdadjYd*Te  
betaTe2 =  betaTe2- g1*gBY*ooSqrt10*TrYdadjYd*Te - 9*TrYdadjYdYdadjYd*Te - 3*TrYdadjYuYuadjYd*Te +        & 
&  (6*g1p2*TrYeadjYe*Te)/5._dp + (3*gBLp2*TrYeadjYe*Te)/2._dp + (3*gBYp2*TrYeadjYe*Te)/2._dp +& 
&  (6*gYBp2*TrYeadjYe*Te)/5._dp + 9*gYB*gBL*ooSqrt10*TrYeadjYe*Te + 9*g1*gBY*ooSqrt10*TrYeadjYe*Te -& 
&  3*TrYeadjYeYeadjYe*Te - TrYeadjYvYvadjYe*Te

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = (30._dp*(TuadjYdYd) + 150._dp*(TuadjYuYu) + 2*(26*g1p2*M1 + 5*gBYp2*M1 +   & 
&  52*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 26*gYBp2*MBp + 160*g3p2*M3 +         & 
&  90*g2p2*M2 + 5*g1*gBY*M1*sqrt10 + 5*g1*gBL*MBBp*sqrt10 + 5*gYB*gBY*MBBp*sqrt10 +      & 
&  5*gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYuTu) + 30._dp*(TradjYvTv))*Yu + 60._dp*(YuadjYdTd)& 
&  + 120._dp*(YuadjYuTu) - 26*g1p2*Tu - 90*g2p2*Tu - 160*g3p2*Tu - 5*gBLp2*Tu -          & 
&  5*gBYp2*Tu - 26*gYBp2*Tu - 5*gYB*gBL*sqrt10*Tu - 5*g1*gBY*sqrt10*Tu + 90*TrYuadjYu*Tu +& 
&  30*TrYvadjYv*Tu)/30._dp

 
 
If (TwoLoopRGE) Then 
betaTu2 = (2*g1p2*TuadjYdYd)/5._dp + (2*gYBp2*TuadjYdYd)/5._dp - gYB*gBL*ooSqrt10*TuadjYdYd -   & 
&  g1*gBY*ooSqrt10*TuadjYdYd - 3*TrYdadjYd*TuadjYdYd - TrYeadjYe*TuadjYdYd -             & 
&  2._dp*(TuadjYdYdadjYdYd) - 4._dp*(TuadjYdYdadjYuYu) + 12*g2p2*TuadjYuYu -             & 
&  3*gYB*gBL*ooSqrt10*TuadjYuYu - 3*g1*gBY*ooSqrt10*TuadjYuYu - 15*TrYuadjYu*TuadjYuYu - & 
&  5*TrYvadjYv*TuadjYuYu - 6._dp*(TuadjYuYuadjYuYu) - ((10972._dp*g1p4*M1 +              & 
&  900*g1p2*g2p2*M1 + 2720*g1p2*g3p2*M1 + 19960._dp*g1*gYB*gBL*gBY*M1 + 1885*g1p2*gBLp2*M1 +& 
&  23730._dp*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + 800*g3p2*gBYp2*M1 + 2725*gBLp2*gBYp2*M1 +& 
&  2725*gBYp4*M1 + 10972._dp*g1p2*gYBp2*M1 + 1885*gBYp2*gYBp2*M1 + 21944._dp*gYB*g1p3*MBBp +& 
&  1800*g1*gYB*g2p2*MBBp + 5440*g1*gYB*g3p2*MBBp + 23730._dp*g1p2*gBL*gBY*MBBp +         & 
&  450*g2p2*gBL*gBY*MBBp + 1600*g3p2*gBL*gBY*MBBp + 23730._dp*g1*gYB*gBLp2*MBBp +        & 
&  5450*gBY*gBLp3*MBBp + 23730._dp*g1*gYB*gBYp2*MBBp + 5450*gBL*gBYp3*MBBp +             & 
&  23730._dp*gBL*gBY*gYBp2*MBBp + 21944._dp*g1*gYBp3*MBBp + 19960._dp*g1*gYB*gBL*gBY*MBp +& 
&  1885*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp + 800*g3p2*gBLp2*MBp + 2725*gBLp4*MBp +      & 
&  2725*gBLp2*gBYp2*MBp + 10972._dp*g1p2*gYBp2*MBp + 900*g2p2*gYBp2*MBp + 2720*g3p2*gYBp2*MBp +& 
&  23730._dp*gBLp2*gYBp2*MBp + 1885*gBYp2*gYBp2*MBp + 10972._dp*gYBp4*MBp +              & 
&  2720*g1p2*g3p2*M3 + 7200*g2p2*g3p2*M3 - 3200*g3p4*M3 + 800*g3p2*gBLp2*M3 +            & 
&  800*g3p2*gBYp2*M3 + 2720*g3p2*gYBp2*M3 + 900*g1p2*g2p2*M2 + 13500._dp*g2p4*M2 +       & 
&  7200*g2p2*g3p2*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 900*g2p2*gYBp2*M2 +       & 
&  2992*gYB*g1p2*gBL*M1*sqrt10 + 5984*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +    & 
&  800*g1*g3p2*gBY*M1*sqrt10 + 1735*g1*gBY*gBLp2*M1*sqrt10 + 1735*gYB*gBL*gBYp2*M1*sqrt10 +& 
&  3470*g1*gBYp3*M1*sqrt10 + 2992*g1*gBY*gYBp2*M1*sqrt10 + 2992*g1p3*gBL*MBBp*sqrt10 +   & 
&  90*g1*g2p2*gBL*MBBp*sqrt10 + 800*g1*g3p2*gBL*MBBp*sqrt10 + 8976*gYB*g1p2*gBY*MBBp*sqrt10 +& 
&  90*gYB*g2p2*gBY*MBBp*sqrt10 + 800*gYB*g3p2*gBY*MBBp*sqrt10 + 5205*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  1735*g1*gBLp3*MBBp*sqrt10 + 5205*g1*gBL*gBYp2*MBBp*sqrt10 + 1735*gYB*gBYp3*MBBp*sqrt10 +& 
&  8976*g1*gBL*gYBp2*MBBp*sqrt10 + 2992*gBY*gYBp3*MBBp*sqrt10 + 2992*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 800*gYB*g3p2*gBL*MBp*sqrt10 + 1735*g1*gBY*gBLp2*MBp*sqrt10 +& 
&  3470*gYB*gBLp3*MBp*sqrt10 + 1735*gYB*gBL*gBYp2*MBp*sqrt10 + 2992*g1*gBY*gYBp2*MBp*sqrt10 +& 
&  5984*gBL*gYBp3*MBp*sqrt10 + 800*gYB*g3p2*gBL*M3*sqrt10 + 800*g1*g3p2*gBY*M3*sqrt10 +  & 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 - 720*g1p2*TradjYuTu -           & 
&  14400._dp*g3p2*TradjYuTu - 450*gBLp2*TradjYuTu - 450*gBYp2*TradjYuTu - 720*gYBp2*TradjYuTu -& 
&  450*gYB*gBL*sqrt10*TradjYuTu - 450*g1*gBY*sqrt10*TradjYuTu - 1350*gBLp2*TradjYvTv -   & 
&  1350*gBYp2*TradjYvTv - 270*gYB*gBL*sqrt10*TradjYvTv - 270*g1*gBY*sqrt10*TradjYvTv +   & 
&  2700._dp*(TrYdadjYuTuadjYd) + 900._dp*(TrYeadjYvTvadjYe) + 2700._dp*(TrYuadjYdTdadjYu) +& 
&  90*(8*g1p2*M1 + 5*gBYp2*M1 + 5*gBLp2*MBp + 8*gYBp2*MBp + 160*g3p2*M3 + 5*gYB*gBL*MBp*sqrt10 +& 
&  5*gBY*MBBp*(2._dp*(gBL) + gYB*sqrt10) + g1*(16*gYB*MBBp + 5*gBY*M1*sqrt10 +           & 
&  5*gBL*MBBp*sqrt10))*TrYuadjYu + 16200._dp*(TrYuadjYuTuadjYu) + 900._dp*(TrYvadjYeTeadjYv) +& 
&  270*(5*gBYp2*M1 + g1*(gBY*M1 + gBL*MBBp)*sqrt10 + gBL*MBp*(5._dp*(gBL) +              & 
&  gYB*sqrt10) + gBY*MBBp*(10._dp*(gBL) + gYB*sqrt10))*TrYvadjYv + 5400._dp*(TrYvadjYvTvadjYv) +& 
&  3600._dp*(TrYvadjYvTxCYx) + 3600._dp*(TrYxCYxTvadjYv))*Yu)/450._dp + (4*g1p2*YuadjYdTd)/5._dp  
betaTu2 =  betaTu2+ (4*gYBp2*YuadjYdTd)/5._dp - gYB*gBL*sqrt2ov5*YuadjYdTd - g1*gBY*sqrt2ov5*YuadjYdTd -  & 
&  6*TrYdadjYd*YuadjYdTd - 2*TrYeadjYe*YuadjYdTd - 4._dp*(YuadjYdTdadjYdYd) -            & 
&  4._dp*(YuadjYdTdadjYuYu) - ((4*g1p2*M1 + 8*g1*gYB*MBBp + 4*gYBp2*MBp - g1*gBY*M1*sqrt10 -& 
&  g1*gBL*MBBp*sqrt10 - gYB*gBY*MBBp*sqrt10 - gYB*gBL*MBp*sqrt10 + 30._dp*(TradjYdTd) +  & 
&  10._dp*(TradjYeTe))*YuadjYdYd)/5._dp - 4._dp*(YuadjYdYdadjYdTd) - 2._dp*(YuadjYdYdadjYuTu) +& 
&  (6*g1p2*YuadjYuTu)/5._dp + 6*g2p2*YuadjYuTu + (6*gYBp2*YuadjYuTu)/5._dp -             & 
&  12*TrYuadjYu*YuadjYuTu - 4*TrYvadjYv*YuadjYuTu - 8._dp*(YuadjYuTuadjYuYu) -           & 
&  (4*g1p2*M1*YuadjYuYu)/5._dp - (8*g1*gYB*MBBp*YuadjYuYu)/5._dp - (4*gYBp2*MBp*YuadjYuYu)/5._dp -& 
&  12*g2p2*M2*YuadjYuYu + g1*gBY*M1*sqrt2ov5*YuadjYuYu + g1*gBL*MBBp*sqrt2ov5*YuadjYuYu +& 
&  gYB*gBY*MBBp*sqrt2ov5*YuadjYuYu + gYB*gBL*MBp*sqrt2ov5*YuadjYuYu - 18*TradjYuTu*YuadjYuYu -& 
&  6*TradjYvTv*YuadjYuYu - 6._dp*(YuadjYuYuadjYuTu) + (2743*g1p4*Tu)/450._dp +           & 
&  g1p2*g2p2*Tu + (15*g2p4*Tu)/2._dp + (136*g1p2*g3p2*Tu)/45._dp + 8*g2p2*g3p2*Tu -      & 
&  (16*g3p4*Tu)/9._dp + (998*g1*gYB*gBL*gBY*Tu)/45._dp + (377*g1p2*gBLp2*Tu)/180._dp +   & 
&  (g2p2*gBLp2*Tu)/4._dp + (8*g3p2*gBLp2*Tu)/9._dp + (109*gBLp4*Tu)/72._dp +             & 
&  (791*g1p2*gBYp2*Tu)/60._dp + (g2p2*gBYp2*Tu)/4._dp + (8*g3p2*gBYp2*Tu)/9._dp +        & 
&  (109*gBLp2*gBYp2*Tu)/36._dp + (109*gBYp4*Tu)/72._dp + (2743*g1p2*gYBp2*Tu)/225._dp +  & 
&  g2p2*gYBp2*Tu + (136*g3p2*gYBp2*Tu)/45._dp + (791*gBLp2*gYBp2*Tu)/60._dp +            & 
&  (377*gBYp2*gYBp2*Tu)/180._dp + (2743*gYBp4*Tu)/450._dp + gYB*g2p2*gBL*ooSqrt10*Tu +   & 
&  g1*g2p2*gBY*ooSqrt10*Tu + (347*g1*gBY*gBLp2*ooSqrt10*Tu)/18._dp + (347*gYB*gBLp3*ooSqrt10*Tu)/18._dp +& 
&  (347*gYB*gBL*gBYp2*ooSqrt10*Tu)/18._dp + (347*g1*gBYp3*ooSqrt10*Tu)/18._dp +          & 
&  (8*gYB*g3p2*gBL*sqrt10*Tu)/9._dp + (8*g1*g3p2*gBY*sqrt10*Tu)/9._dp + (748*gYB*g1p2*gBL*sqrt2ov5*Tu)/45._dp  
betaTu2 =  betaTu2+ (748*g1p3*gBY*sqrt2ov5*Tu)/45._dp + (748*g1*gBY*gYBp2*sqrt2ov5*Tu)/45._dp +           & 
&  (748*gBL*gYBp3*sqrt2ov5*Tu)/45._dp - 3*TrYdadjYuYuadjYd*Tu - TrYeadjYvYvadjYe*Tu +    & 
&  (4*g1p2*TrYuadjYu*Tu)/5._dp + 16*g3p2*TrYuadjYu*Tu + (gBLp2*TrYuadjYu*Tu)/2._dp +     & 
&  (gBYp2*TrYuadjYu*Tu)/2._dp + (4*gYBp2*TrYuadjYu*Tu)/5._dp + gYB*gBL*sqrt5ov2*TrYuadjYu*Tu +& 
&  g1*gBY*sqrt5ov2*TrYuadjYu*Tu - 9*TrYuadjYuYuadjYu*Tu + (3*gBLp2*TrYvadjYv*Tu)/2._dp + & 
&  (3*gBYp2*TrYvadjYv*Tu)/2._dp + 3*gYB*gBL*ooSqrt10*TrYvadjYv*Tu + 3*g1*gBY*ooSqrt10*TrYvadjYv*Tu -& 
&  3*TrYvadjYvYvadjYv*Tu - 4*TrYxCYxYvadjYv*Tu

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Tx 
!-------------------- 
 
betaTx1  = (9*(gBYp2*M1 + 2*gBL*gBY*MBBp + gBLp2*MBp) + 4._dp*(TrCYxTx))              & 
& *Yx + (8._dp*(TvadjYvYx) + 4._dp*(TxCYvTpYv) + 24._dp*(TxCYxYx) + 4._dp*(YvadjYvTx)    & 
&  + 8._dp*(YxCYvTpTv) + 24._dp*(YxCYxTx) - 9*gBLp2*Tx - 9*gBYp2*Tx + 4*TrYxCYx*Tx)/2._dp

 
 
If (TwoLoopRGE) Then 
betaTx2 = -4._dp*(TvadjYeYeadjYvYx) - 4._dp*(TvadjYvYvadjYvYx) + (12*g1p2*TvadjYvYx)/5._dp +    & 
&  12*g2p2*TvadjYvYx + (12*gYBp2*TvadjYvYx)/5._dp + 6*gYB*gBL*sqrt2ov5*TvadjYvYx +       & 
&  6*g1*gBY*sqrt2ov5*TvadjYvYx - 12*TrYuadjYu*TvadjYvYx - 4*TrYvadjYv*TvadjYvYx -        & 
&  2._dp*(TxCYvTpYeCYeTpYv) + (6*g1p2*TxCYvTpYv)/5._dp + 6*g2p2*TxCYvTpYv +              & 
&  (6*gYBp2*TxCYvTpYv)/5._dp + 3*gYB*gBL*sqrt2ov5*TxCYvTpYv + 3*g1*gBY*sqrt2ov5*TxCYvTpYv -& 
&  6*TrYuadjYu*TxCYvTpYv - 2*TrYvadjYv*TxCYvTpYv - 2._dp*(TxCYvTpYvCYvTpYv) -            & 
&  16._dp*(TxCYvTpYvCYxYx) - 8._dp*(TxCYxYvadjYvYx) + 36*gBLp2*TxCYxYx + 36*gBYp2*TxCYxYx -& 
&  24*TrYxCYx*TxCYxYx - 48._dp*(TxCYxYxCYxYx) - ((1188*g1*gYB*gBL*gBY*M1 +               & 
&  1188*g1p2*gBYp2*M1 + 2025*gBLp2*gBYp2*M1 + 2025*gBYp4*M1 + 1188*g1p2*gBL*gBY*MBBp +   & 
&  1188*g1*gYB*gBLp2*MBBp + 4050*gBY*gBLp3*MBBp + 1188*g1*gYB*gBYp2*MBBp +               & 
&  4050*gBL*gBYp3*MBBp + 1188*gBL*gBY*gYBp2*MBBp + 1188*g1*gYB*gBL*gBY*MBp +             & 
&  2025*gBLp4*MBp + 2025*gBLp2*gBYp2*MBp + 1188*gBLp2*gYBp2*MBp + 216*g1*gBY*gBLp2*M1*sqrt10 +& 
&  216*gYB*gBL*gBYp2*M1*sqrt10 + 432*g1*gBYp3*M1*sqrt10 + 648*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  216*g1*gBLp3*MBBp*sqrt10 + 648*g1*gBL*gBYp2*MBBp*sqrt10 + 216*gYB*gBYp3*MBBp*sqrt10 + & 
&  216*g1*gBY*gBLp2*MBp*sqrt10 + 432*gYB*gBLp3*MBp*sqrt10 + 216*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  60*(gBLp2 + gBYp2)*TrCYxTx + 160._dp*(TrYvadjYvTxCYx) - 60*(gBYp2*M1 + 2*gBL*gBY*MBBp +& 
&  gBLp2*MBp)*TrYxCYx + 160._dp*(TrYxCYxTvadjYv) + 640._dp*(TrYxCYxTxCYx))*Yx)/10._dp -  & 
&  4._dp*(YvadjYeTeadjYvYx) - 2._dp*(YvadjYeYeadjYvTx) - 4._dp*(YvadjYvTvadjYvYx) +      & 
&  (6*g1p2*YvadjYvTx)/5._dp + 6*g2p2*YvadjYvTx + (6*gYBp2*YvadjYvTx)/5._dp +             & 
&  3*gYB*gBL*sqrt2ov5*YvadjYvTx + 3*g1*gBY*sqrt2ov5*YvadjYvTx - 6*TrYuadjYu*YvadjYvTx -  & 
&  2*TrYvadjYv*YvadjYvTx - 2._dp*(YvadjYvYvadjYvTx) - (12*g1p2*M1*YvadjYvYx)/5._dp  
betaTx2 =  betaTx2- (24*g1*gYB*MBBp*YvadjYvYx)/5._dp - (12*gYBp2*MBp*YvadjYvYx)/5._dp - 12*g2p2*M2*YvadjYvYx -& 
&  6*g1*gBY*M1*sqrt2ov5*YvadjYvYx - 6*g1*gBL*MBBp*sqrt2ov5*YvadjYvYx - 6*gYB*gBY*MBBp*sqrt2ov5*YvadjYvYx -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YvadjYvYx - 12*TradjYuTu*YvadjYvYx - 4*TradjYvTv*YvadjYvYx -   & 
&  4._dp*(YxCYvTpTeCYeTpYv) + (12*g1p2*YxCYvTpTv)/5._dp + 12*g2p2*YxCYvTpTv +            & 
&  (12*gYBp2*YxCYvTpTv)/5._dp + 6*gYB*gBL*sqrt2ov5*YxCYvTpTv + 6*g1*gBY*sqrt2ov5*YxCYvTpTv -& 
&  12*TrYuadjYu*YxCYvTpTv - 4*TrYvadjYv*YxCYvTpTv - 4._dp*(YxCYvTpTvCYvTpYv) -           & 
&  16._dp*(YxCYvTpTvCYxYx) - 4._dp*(YxCYvTpYeCYeTpTv) - (12*g1p2*M1*YxCYvTpYv)/5._dp -   & 
&  (24*g1*gYB*MBBp*YxCYvTpYv)/5._dp - (12*gYBp2*MBp*YxCYvTpYv)/5._dp - 12*g2p2*M2*YxCYvTpYv -& 
&  6*g1*gBY*M1*sqrt2ov5*YxCYvTpYv - 6*g1*gBL*MBBp*sqrt2ov5*YxCYvTpYv - 6*gYB*gBY*MBBp*sqrt2ov5*YxCYvTpYv -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YxCYvTpYv - 12*TradjYuTu*YxCYvTpYv - 4*TradjYvTv*YxCYvTpYv -   & 
&  4._dp*(YxCYvTpYvCYvTpTv) - 8._dp*(YxCYvTpYvCYxTx) - 16._dp*(YxCYxTvadjYvYx) +         & 
&  36*gBLp2*YxCYxTx + 36*gBYp2*YxCYxTx - 24*TrYxCYx*YxCYxTx - 64._dp*(YxCYxTxCYxYx) -    & 
&  16._dp*(YxCYxYvadjYvTx) - 16*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp +             & 
&  2._dp*(TrCYxTx))*YxCYxYx - 48._dp*(YxCYxYxCYxTx) + (297*g1*gYB*gBL*gBY*Tx)/5._dp +    & 
&  (405*gBLp4*Tx)/8._dp + (297*g1p2*gBYp2*Tx)/10._dp + (405*gBLp2*gBYp2*Tx)/4._dp +      & 
&  (405*gBYp4*Tx)/8._dp + (297*gBLp2*gYBp2*Tx)/10._dp + 54*g1*gBY*gBLp2*sqrt2ov5*Tx +    & 
&  54*gYB*gBLp3*sqrt2ov5*Tx + 54*gYB*gBL*gBYp2*sqrt2ov5*Tx + 54*g1*gBYp3*sqrt2ov5*Tx -   & 
&  3*gBLp2*TrYxCYx*Tx - 3*gBYp2*TrYxCYx*Tx - 8*TrYxCYxYvadjYv*Tx - 16*TrYxCYxYxCYx*Tx

 
DTx = oo16pi2*( betaTx1 + oo16pi2 * betaTx2 ) 

 
Else 
DTx = oo16pi2* betaTx1 
End If 
 
 
Call Chop(DTx) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = TvadjYeYe + 5._dp*(TvadjYvYv) + 8._dp*(TxCYxYv) + ((3*(2*g1p2*M1 +         & 
&  5*gBYp2*M1 + 4*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 2*gYBp2*MBp +            & 
&  10*g2p2*M2 + g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 +            & 
&  gYB*gBL*MBp*sqrt10) + 30._dp*(TradjYuTu) + 10._dp*(TradjYvTv))*Yv)/5._dp +            & 
&  2._dp*(YvadjYeTe) + 4._dp*(YvadjYvTv) + 4._dp*(YxCYxTv) - (3*g1p2*Tv)/5._dp -         & 
&  3*g2p2*Tv - (3*gBLp2*Tv)/2._dp - (3*gBYp2*Tv)/2._dp - (3*gYBp2*Tv)/5._dp -            & 
&  3*gYB*gBL*ooSqrt10*Tv - 3*g1*gBY*ooSqrt10*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv

 
 
If (TwoLoopRGE) Then 
betaTv2 = (6*g1p2*TvadjYeYe)/5._dp + (6*gYBp2*TvadjYeYe)/5._dp + 3*gYB*gBL*ooSqrt10*TvadjYeYe + & 
&  3*g1*gBY*ooSqrt10*TvadjYeYe - 3*TrYdadjYd*TvadjYeYe - TrYeadjYe*TvadjYeYe -           & 
&  2._dp*(TvadjYeYeadjYeYe) - 4._dp*(TvadjYeYeadjYvYv) + (12*g1p2*TvadjYvYv)/5._dp +     & 
&  12*g2p2*TvadjYvYv + (12*gYBp2*TvadjYvYv)/5._dp + 9*gYB*gBL*ooSqrt10*TvadjYvYv +       & 
&  9*g1*gBY*ooSqrt10*TvadjYvYv - 15*TrYuadjYu*TvadjYvYv - 5*TrYvadjYv*TvadjYvYv -        & 
&  6._dp*(TvadjYvYvadjYvYv) - 4._dp*(TvadjYvYxCYxYv) - 16._dp*(TxCYvTpYvCYxYv) +         & 
&  24*gBLp2*TxCYxYv + 24*gBYp2*TxCYxYv - 16*TrYxCYx*TxCYxYv - 32._dp*(TxCYxYxCYxYv) -    & 
&  ((828*g1p4*M1 + 180*g1p2*g2p2*M1 + 3960*g1*gYB*gBL*gBY*M1 + 405*g1p2*gBLp2*M1 +       & 
&  4770*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + 2925*gBLp2*gBYp2*M1 + 2925*gBYp4*M1 +        & 
&  828*g1p2*gYBp2*M1 + 405*gBYp2*gYBp2*M1 + 1656*gYB*g1p3*MBBp + 360*g1*gYB*g2p2*MBBp +  & 
&  4770*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 4770*g1*gYB*gBLp2*MBBp +             & 
&  5850*gBY*gBLp3*MBBp + 4770*g1*gYB*gBYp2*MBBp + 5850*gBL*gBYp3*MBBp + 4770*gBL*gBY*gYBp2*MBBp +& 
&  1656*g1*gYBp3*MBBp + 3960*g1*gYB*gBL*gBY*MBp + 405*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp +& 
&  2925*gBLp4*MBp + 2925*gBLp2*gBYp2*MBp + 828*g1p2*gYBp2*MBp + 180*g2p2*gYBp2*MBp +     & 
&  4770*gBLp2*gYBp2*MBp + 405*gBYp2*gYBp2*MBp + 828*gYBp4*MBp + 180*g1p2*g2p2*M2 +       & 
&  1500*g2p4*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 180*g2p2*gYBp2*M2 +            & 
&  360*gYB*g1p2*gBL*M1*sqrt10 + 720*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +      & 
&  675*g1*gBY*gBLp2*M1*sqrt10 + 675*gYB*gBL*gBYp2*M1*sqrt10 + 1350*g1*gBYp3*M1*sqrt10 +  & 
&  360*g1*gBY*gYBp2*M1*sqrt10 + 360*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 +  & 
&  1080*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 2025*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  675*g1*gBLp3*MBBp*sqrt10 + 2025*g1*gBL*gBYp2*MBBp*sqrt10 + 675*gYB*gBYp3*MBBp*sqrt10 +& 
&  1080*g1*gBL*gYBp2*MBBp*sqrt10 + 360*gBY*gYBp3*MBBp*sqrt10 + 360*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 675*g1*gBY*gBLp2*MBp*sqrt10 + 1350*gYB*gBLp3*MBp*sqrt10 +& 
&  675*gYB*gBL*gBYp2*MBp*sqrt10 + 360*g1*gBY*gYBp2*MBp*sqrt10 + 720*gBL*gYBp3*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 - 80*g1p2*TradjYuTu -            & 
&  1600*g3p2*TradjYuTu - 50*gBLp2*TradjYuTu - 50*gBYp2*TradjYuTu - 80*gYBp2*TradjYuTu -  & 
&  50*gYB*gBL*sqrt10*TradjYuTu - 50*g1*gBY*sqrt10*TradjYuTu - 150*gBLp2*TradjYvTv -      & 
&  150*gBYp2*TradjYvTv - 30*gYB*gBL*sqrt10*TradjYvTv - 30*g1*gBY*sqrt10*TradjYvTv +      & 
&  300._dp*(TrYdadjYuTuadjYd) + 100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) +& 
&  10*(8*g1p2*M1 + 5*gBYp2*M1 + 5*gBLp2*MBp + 8*gYBp2*MBp + 160*g3p2*M3 + 5*gYB*gBL*MBp*sqrt10 +& 
&  5*gBY*MBBp*(2._dp*(gBL) + gYB*sqrt10) + g1*(16*gYB*MBBp + 5*gBY*M1*sqrt10 +           & 
&  5*gBL*MBBp*sqrt10))*TrYuadjYu + 1800._dp*(TrYuadjYuTuadjYu) + 100._dp*(TrYvadjYeTeadjYv) +& 
&  30*(5*gBYp2*M1 + g1*(gBY*M1 + gBL*MBBp)*sqrt10 + gBL*MBp*(5._dp*(gBL) +               & 
&  gYB*sqrt10) + gBY*MBBp*(10._dp*(gBL) + gYB*sqrt10))*TrYvadjYv + 600._dp*(TrYvadjYvTvadjYv) +& 
&  400._dp*(TrYvadjYvTxCYx) + 400._dp*(TrYxCYxTvadjYv))*Yv)/50._dp + (12*g1p2*YvadjYeTe)/5._dp  
betaTv2 =  betaTv2+ (12*gYBp2*YvadjYeTe)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYeTe + 3*g1*gBY*sqrt2ov5*YvadjYeTe -& 
&  6*TrYdadjYd*YvadjYeTe - 2*TrYeadjYe*YvadjYeTe - 4._dp*(YvadjYeTeadjYeYe) -            & 
&  4._dp*(YvadjYeTeadjYvYv) - (12*g1p2*M1*YvadjYeYe)/5._dp - (24*g1*gYB*MBBp*YvadjYeYe)/5._dp -& 
&  (12*gYBp2*MBp*YvadjYeYe)/5._dp - 3*g1*gBY*M1*sqrt2ov5*YvadjYeYe - 3*g1*gBL*MBBp*sqrt2ov5*YvadjYeYe -& 
&  3*gYB*gBY*MBBp*sqrt2ov5*YvadjYeYe - 3*gYB*gBL*MBp*sqrt2ov5*YvadjYeYe - 6*TradjYdTd*YvadjYeYe -& 
&  2*TradjYeTe*YvadjYeYe - 4._dp*(YvadjYeYeadjYeTe) - 2._dp*(YvadjYeYeadjYvTv) +         & 
&  (6*g1p2*YvadjYvTv)/5._dp + 6*g2p2*YvadjYvTv + (6*gYBp2*YvadjYvTv)/5._dp -             & 
&  12*TrYuadjYu*YvadjYvTv - 4*TrYvadjYv*YvadjYvTv - 8._dp*(YvadjYvTvadjYvYv) -           & 
&  8._dp*(YvadjYvTxCYxYv) - (12*g1p2*M1*YvadjYvYv)/5._dp - (24*g1*gYB*MBBp*YvadjYvYv)/5._dp -& 
&  (12*gYBp2*MBp*YvadjYvYv)/5._dp - 12*g2p2*M2*YvadjYvYv - 3*g1*gBY*M1*sqrt2ov5*YvadjYvYv -& 
&  3*g1*gBL*MBBp*sqrt2ov5*YvadjYvYv - 3*gYB*gBY*MBBp*sqrt2ov5*YvadjYvYv - 3*gYB*gBL*MBp*sqrt2ov5*YvadjYvYv -& 
&  18*TradjYuTu*YvadjYvYv - 6*TradjYvTv*YvadjYvYv - 6._dp*(YvadjYvYvadjYvTv) -           & 
&  8._dp*(YvadjYvYxCYxTv) - 16._dp*(YxCYvTpTvCYxYv) - 8._dp*(YxCYvTpYvCYxTv) +           & 
&  12*gBLp2*YxCYxTv + 12*gBYp2*YxCYxTv - 8*TrYxCYx*YxCYxTv - 32._dp*(YxCYxTxCYxYv) -     & 
&  8*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp + 2._dp*(TrCYxTx))*YxCYxYv -             & 
&  16._dp*(YxCYxYxCYxTv) + (207*g1p4*Tv)/50._dp + (9*g1p2*g2p2*Tv)/5._dp +               & 
&  (15*g2p4*Tv)/2._dp + (198*g1*gYB*gBL*gBY*Tv)/5._dp + (81*g1p2*gBLp2*Tv)/20._dp +      & 
&  (9*g2p2*gBLp2*Tv)/4._dp + (117*gBLp4*Tv)/8._dp + (477*g1p2*gBYp2*Tv)/20._dp +         & 
&  (9*g2p2*gBYp2*Tv)/4._dp + (117*gBLp2*gBYp2*Tv)/4._dp + (117*gBYp4*Tv)/8._dp +         & 
&  (207*g1p2*gYBp2*Tv)/25._dp + (9*g2p2*gYBp2*Tv)/5._dp + (477*gBLp2*gYBp2*Tv)/20._dp +  & 
&  (81*gBYp2*gYBp2*Tv)/20._dp + (207*gYBp4*Tv)/50._dp + 9*gYB*g2p2*gBL*ooSqrt10*Tv  
betaTv2 =  betaTv2+ 9*g1*g2p2*gBY*ooSqrt10*Tv + 18*gYB*g1p2*gBL*sqrt2ov5*Tv + 18*g1p3*gBY*sqrt2ov5*Tv +   & 
&  18*g1*gBY*gYBp2*sqrt2ov5*Tv + 18*gBL*gYBp3*sqrt2ov5*Tv + (27*g1*gBY*gBLp2*sqrt5ov2*Tv)/2._dp +& 
&  (27*gYB*gBLp3*sqrt5ov2*Tv)/2._dp + (27*gYB*gBL*gBYp2*sqrt5ov2*Tv)/2._dp +             & 
&  (27*g1*gBYp3*sqrt5ov2*Tv)/2._dp - 3*TrYdadjYuYuadjYd*Tv - TrYeadjYvYvadjYe*Tv +       & 
&  (4*g1p2*TrYuadjYu*Tv)/5._dp + 16*g3p2*TrYuadjYu*Tv + (gBLp2*TrYuadjYu*Tv)/2._dp +     & 
&  (gBYp2*TrYuadjYu*Tv)/2._dp + (4*gYBp2*TrYuadjYu*Tv)/5._dp + gYB*gBL*sqrt5ov2*TrYuadjYu*Tv +& 
&  g1*gBY*sqrt5ov2*TrYuadjYu*Tv - 9*TrYuadjYuYuadjYu*Tv + (3*gBLp2*TrYvadjYv*Tv)/2._dp + & 
&  (3*gBYp2*TrYvadjYv*Tv)/2._dp + 3*gYB*gBL*ooSqrt10*TrYvadjYv*Tv + 3*g1*gBY*ooSqrt10*TrYvadjYv*Tv -& 
&  3*TrYvadjYvYvadjYv*Tv - 4*TrYxCYxYvadjYv*Tv

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! BMuP 
!-------------------- 
 
betaBMuP1  = 2*(2*MuP*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp + TrCYxTx)           & 
&  + (-3*(gBLp2 + gBYp2) + TrYxCYx)*BMuP)

 
 
If (TwoLoopRGE) Then 
betaBMuP2 = (-2*MuP*(15*(gBLp2 + gBYp2)*TrCYxTx - 15*(gBYp2*M1 + 2*gBL*gBY*MBBp + gBLp2*MBp)*TrYxCYx +& 
&  4*(99*g1*gYB*gBL*gBY*M1 + 99*g1p2*gBYp2*M1 + 180*gBLp2*gBYp2*M1 + 180*gBYp4*M1 +      & 
&  99*g1p2*gBL*gBY*MBBp + 99*g1*gYB*gBLp2*MBBp + 360*gBY*gBLp3*MBBp + 99*g1*gYB*gBYp2*MBBp +& 
&  360*gBL*gBYp3*MBBp + 99*gBL*gBY*gYBp2*MBBp + 99*g1*gYB*gBL*gBY*MBp + 180*gBLp4*MBp +  & 
&  180*gBLp2*gBYp2*MBp + 99*gBLp2*gYBp2*MBp + 18*g1*gBY*gBLp2*M1*sqrt10 + 18*gYB*gBL*gBYp2*M1*sqrt10 +& 
&  36*g1*gBYp3*M1*sqrt10 + 54*gYB*gBY*gBLp2*MBBp*sqrt10 + 18*g1*gBLp3*MBBp*sqrt10 +      & 
&  54*g1*gBL*gBYp2*MBBp*sqrt10 + 18*gYB*gBYp3*MBBp*sqrt10 + 18*g1*gBY*gBLp2*MBp*sqrt10 + & 
&  36*gYB*gBLp3*MBp*sqrt10 + 18*gYB*gBL*gBYp2*MBp*sqrt10 + 10._dp*(TrYvadjYvTxCYx) +     & 
&  10._dp*(TrYxCYxTvadjYv) + 40._dp*(TrYxCYxTxCYx))) + (-15*(gBLp2 + gBYp2)*TrYxCYx +    & 
&  2*(9*(20._dp*(gBLp4) + 11*gBLp2*gYBp2 + 4*gBY*gBLp2*(10._dp*(gBY) + g1*sqrt10) +      & 
&  gBYp2*(11._dp*(g1p2) + 20._dp*(gBYp2) + 4*g1*gBY*sqrt10) + gYB*(4*gBLp3*sqrt10 +      & 
&  2*gBL*gBY*(11._dp*(g1) + 2*gBY*sqrt10))) - 20._dp*(TrYxCYxYvadjYv) - 40._dp*(TrYxCYxYxCYx)))*BMuP)/5._dp

 
DBMuP = oo16pi2*( betaBMuP1 + oo16pi2 * betaBMuP2 ) 

 
Else 
DBMuP = oo16pi2* betaBMuP1 
End If 
 
 
Call Chop(DBMuP) 

!-------------------- 
! Bmu 
!-------------------- 
 
betaBmu1  = (2*(3*g1p2*M1 + 6*g1*gYB*MBBp + 3*gYBp2*MBp + 15*g2p2*M2 + 15._dp*(TradjYdTd)& 
&  + 5._dp*(TradjYeTe) + 15._dp*(TradjYuTu) + 5._dp*(TradjYvTv))*Mu)/5._dp +             & 
&  (-3._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 3._dp*(gYBp2)/5._dp + 3._dp*(TrYdadjYd)         & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Bmu

 
 
If (TwoLoopRGE) Then 
betaBmu2 = (-2*(414*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 + 540*g1p2*gBYp2*M1 +      & 
&  414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 180*g1*gYB*g2p2*MBBp + 540*g1p2*gBL*gBY*MBBp +& 
&  540*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp + 540*gBL*gBY*gYBp2*MBBp +              & 
&  828*g1*gYBp3*MBBp + 540*g1*gYB*gBL*gBY*MBp + 414*g1p2*gYBp2*MBp + 90*g2p2*gYBp2*MBp + & 
&  540*gBLp2*gYBp2*MBp + 414*gYBp4*MBp + 90*g1p2*g2p2*M2 + 750*g2p4*M2 + 90*g2p2*gYBp2*M2 +& 
&  72*gYB*g1p2*gBL*M1*sqrt10 + 144*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +      & 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 216*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  72*gBY*gYBp3*MBBp*sqrt10 + 72*gYB*g1p2*gBL*MBp*sqrt10 + 72*g1*gBY*gYBp2*MBp*sqrt10 +  & 
&  144*gBL*gYBp3*MBp*sqrt10 + 20*g1p2*TradjYdTd - 800*g3p2*TradjYdTd - 25*gBLp2*TradjYdTd -& 
&  25*gBYp2*TradjYdTd + 20*gYBp2*TradjYdTd + 5*gYB*gBL*sqrt10*TradjYdTd + 5*g1*gBY*sqrt10*TradjYdTd -& 
&  60*g1p2*TradjYeTe - 75*gBLp2*TradjYeTe - 75*gBYp2*TradjYeTe - 60*gYBp2*TradjYeTe -    & 
&  45*gYB*gBL*sqrt10*TradjYeTe - 45*g1*gBY*sqrt10*TradjYeTe - 40*g1p2*TradjYuTu -        & 
&  800*g3p2*TradjYuTu - 25*gBLp2*TradjYuTu - 25*gBYp2*TradjYuTu - 40*gYBp2*TradjYuTu -   & 
&  25*gYB*gBL*sqrt10*TradjYuTu - 25*g1*gBY*sqrt10*TradjYuTu - 75*gBLp2*TradjYvTv -       & 
&  75*gBYp2*TradjYvTv - 15*gYB*gBL*sqrt10*TradjYvTv - 15*g1*gBY*sqrt10*TradjYvTv -       & 
&  5*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp - 5*gBLp2*MBp + 4*gYBp2*MBp -             & 
&  160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 + g1*(8*gYB*MBBp +             & 
&  gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 900._dp*(TrYdadjYdTdadjYd) +            & 
&  300._dp*(TrYdadjYuTuadjYd) + 15*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +             & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 300._dp*(TrYeadjYeTeadjYe) +& 
&  100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) + 40*g1p2*M1*TrYuadjYu +      & 
&  25*gBYp2*M1*TrYuadjYu + 80*g1*gYB*MBBp*TrYuadjYu + 50*gBL*gBY*MBBp*TrYuadjYu +        & 
&  25*gBLp2*MBp*TrYuadjYu + 40*gYBp2*MBp*TrYuadjYu + 800*g3p2*M3*TrYuadjYu +             & 
&  25*g1*gBY*M1*sqrt10*TrYuadjYu + 25*g1*gBL*MBBp*sqrt10*TrYuadjYu + 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu +& 
&  25*gYB*gBL*MBp*sqrt10*TrYuadjYu + 900._dp*(TrYuadjYuTuadjYu) + 100._dp*(TrYvadjYeTeadjYv) +& 
&  75*gBYp2*M1*TrYvadjYv + 150*gBL*gBY*MBBp*TrYvadjYv + 75*gBLp2*MBp*TrYvadjYv +         & 
&  15*g1*gBY*M1*sqrt10*TrYvadjYv + 15*g1*gBL*MBBp*sqrt10*TrYvadjYv + 15*gYB*gBY*MBBp*sqrt10*TrYvadjYv +& 
&  15*gYB*gBL*MBp*sqrt10*TrYvadjYv + 300._dp*(TrYvadjYvTvadjYv) + 200._dp*(TrYvadjYvTxCYx) +& 
&  200._dp*(TrYxCYxTvadjYv))*Mu + (207._dp*(g1p4) + 90*g1p2*g2p2 + 375._dp*(g2p4) +      & 
&  540*g1*gYB*gBL*gBY + 270*g1p2*gBYp2 + 414*g1p2*gYBp2 + 90*g2p2*gYBp2 + 270*gBLp2*gYBp2 +& 
&  207._dp*(gYBp4) + 72*gYB*g1p2*gBL*sqrt10 + 72*g1p3*gBY*sqrt10 + 72*g1*gBY*gYBp2*sqrt10 +& 
&  72*gBL*gYBp3*sqrt10 - 5*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +           & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 450._dp*(TrYdadjYdYdadjYd) -& 
&  300._dp*(TrYdadjYuYuadjYd) + 15*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) +   & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 150._dp*(TrYeadjYeYeadjYe) -          & 
&  100._dp*(TrYeadjYvYvadjYe) + 40*g1p2*TrYuadjYu + 800*g3p2*TrYuadjYu + 25*gBLp2*TrYuadjYu +& 
&  25*gBYp2*TrYuadjYu + 40*gYBp2*TrYuadjYu + 25*gYB*gBL*sqrt10*TrYuadjYu +               & 
&  25*g1*gBY*sqrt10*TrYuadjYu - 450._dp*(TrYuadjYuYuadjYu) + 75*gBLp2*TrYvadjYv +        & 
&  75*gBYp2*TrYvadjYv + 15*gYB*gBL*sqrt10*TrYvadjYv + 15*g1*gBY*sqrt10*TrYvadjYv -       & 
&  150._dp*(TrYvadjYvYvadjYv) - 200._dp*(TrYxCYxYvadjYv))*Bmu)/50._dp

 
DBmu = oo16pi2*( betaBmu1 + oo16pi2 * betaBmu2 ) 

 
Else 
DBmu = oo16pi2* betaBmu1 
End If 
 
 
Call Chop(DBmu) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = (60._dp*(adjTdTd) + 60._dp*(adjTuTu) + 60._dp*(adjYdmd2Yd) +              & 
&  30._dp*(adjYdYdmq2) + 60._dp*(adjYumu2Yu) + 30._dp*(adjYuYumq2) - 180*AbsM2*g2p2*id3R -& 
&  320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 4*AbsMBp*gYBp2*id3R + 60*adjYdYd*mHd2 +  & 
&  60*adjYuYu*mHu2 + 30._dp*(mq2adjYdYd) + 30._dp*(mq2adjYuYu) - 4*AbsMBp*gYB*gBL*id3R*sqrt10 -& 
&  2*id3R*(2*g1p2*M1 + gBY*(5*gBY*M1 + 5*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(2*gYB*MBBp +  & 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(2*g1p2*MBBp + 2*gYBp2*MBBp +  & 
&  5*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 +        & 
&  MBp))*sqrt10 + g1*(2*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))          & 
& *Conjg(MBBp) - 4*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp)         & 
&  - 2*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp) - 2*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp)        & 
&  + 2*g1*id3R*sqrt15*Tr1(1) + 5*gBY*id3R*sqrt6*Tr1(1) + 2*gYB*id3R*sqrt15*Tr1(4)        & 
&  + 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamq22 = -4._dp*(adjTdTdadjYdYd) - 4._dp*(adjTdYdadjYdTd) - 4._dp*(adjTuTuadjYuYu) -           & 
&  4._dp*(adjTuYuadjYuTu) - 4._dp*(adjYdmd2YdadjYdYd) - 4._dp*(adjYdTdadjTdYd) -         & 
&  4._dp*(adjYdYdadjTdTd) - 4._dp*(adjYdYdadjYdmd2Yd) - 2._dp*(adjYdYdadjYdYdmq2) -      & 
&  4._dp*(adjYdYdmq2adjYdYd) - 4._dp*(adjYumu2YuadjYuYu) - 4._dp*(adjYuTuadjTuYu) -      & 
&  4._dp*(adjYuYuadjTuTu) - 4._dp*(adjYuYuadjYumu2Yu) - 2._dp*(adjYuYuadjYuYumq2) -      & 
&  4._dp*(adjYuYumq2adjYuYu) + (4*adjTdTd*g1p2)/5._dp + (8*adjTuTu*g1p2)/5._dp +         & 
&  (4*adjYdmd2Yd*g1p2)/5._dp + (2*adjYdYdmq2*g1p2)/5._dp + (8*adjYumu2Yu*g1p2)/5._dp +   & 
&  (4*adjYuYumq2*g1p2)/5._dp + (4*adjTdTd*gYBp2)/5._dp + (8*adjTuTu*gYBp2)/5._dp +       & 
&  (4*adjYdmd2Yd*gYBp2)/5._dp + (8*AbsMBp*adjYdYd*gYBp2)/5._dp + (2*adjYdYdmq2*gYBp2)/5._dp +& 
&  (8*adjYumu2Yu*gYBp2)/5._dp + (16*AbsMBp*adjYuYu*gYBp2)/5._dp + (4*adjYuYumq2*gYBp2)/5._dp +& 
&  (2*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + (32*AbsM3*g1p2*g3p2*id3R)/45._dp +& 
&  32*AbsM2*g2p2*g3p2*id3R + 32*AbsM3*g2p2*g3p2*id3R - (128*AbsM3*g3p4*id3R)/3._dp +     & 
&  (454*AbsMBp*g1*gYB*gBL*gBY*id3R)/45._dp + (73*AbsMBp*g1p2*gBLp2*id3R)/45._dp +        & 
&  AbsM2*g2p2*gBLp2*id3R + AbsMBp*g2p2*gBLp2*id3R + (16*AbsM3*g3p2*gBLp2*id3R)/9._dp +   & 
&  (16*AbsMBp*g3p2*gBLp2*id3R)/9._dp + (109*AbsMBp*gBLp4*id3R)/12._dp + AbsM2*g2p2*gBYp2*id3R +& 
&  (16*AbsM3*g3p2*gBYp2*id3R)/9._dp + (109*AbsMBp*gBLp2*gBYp2*id3R)/18._dp +             & 
&  (398*AbsMBp*g1p2*gYBp2*id3R)/225._dp + (2*AbsM2*g2p2*gYBp2*id3R)/5._dp +              & 
&  (2*AbsMBp*g2p2*gYBp2*id3R)/5._dp + (32*AbsM3*g3p2*gYBp2*id3R)/45._dp + (32*AbsMBp*g3p2*gYBp2*id3R)/45._dp +& 
&  20*AbsMBp*gBLp2*gYBp2*id3R + (73*AbsMBp*gBYp2*gYBp2*id3R)/45._dp + (199*AbsMBp*gYBp4*id3R)/75._dp -& 
&  (4*adjTdYd*g1p2*M1)/5._dp - (8*adjTuYu*g1p2*M1)/5._dp - (8*adjTdYd*g1*gYB*MBBp)/5._dp -& 
&  (16*adjTuYu*g1*gYB*MBBp)/5._dp - (4*adjTdYd*gYBp2*MBp)/5._dp - (8*adjTuYu*gYBp2*MBp)/5._dp  
betamq22 =  betamq22- 8*adjYdYdadjYdYd*mHd2 + (4*adjYdYd*g1p2*mHd2)/5._dp + (4*adjYdYd*gYBp2*mHd2)/5._dp -  & 
&  8*adjYuYuadjYuYu*mHu2 + (8*adjYuYu*g1p2*mHu2)/5._dp + (8*adjYuYu*gYBp2*mHu2)/5._dp +  & 
&  (2*g1p2*mq2adjYdYd)/5._dp + (2*gYBp2*mq2adjYdYd)/5._dp - 2._dp*(mq2adjYdYdadjYdYd) +  & 
&  (4*g1p2*mq2adjYuYu)/5._dp + (4*gYBp2*mq2adjYuYu)/5._dp - 2._dp*(mq2adjYuYuadjYuYu) -  & 
&  adjYdYdmq2*gYB*gBL*ooSqrt10 + adjYuYumq2*gYB*gBL*ooSqrt10 - adjYdYdmq2*g1*gBY*ooSqrt10 +& 
&  adjYuYumq2*g1*gBY*ooSqrt10 - gYB*gBL*mq2adjYdYd*ooSqrt10 - g1*gBY*mq2adjYdYd*ooSqrt10 +& 
&  gYB*gBL*mq2adjYuYu*ooSqrt10 + g1*gBY*mq2adjYuYu*ooSqrt10 - adjTdTd*gYB*gBL*sqrt2ov5 + & 
&  adjTuTu*gYB*gBL*sqrt2ov5 - adjYdmd2Yd*gYB*gBL*sqrt2ov5 - 2*AbsMBp*adjYdYd*gYB*gBL*sqrt2ov5 +& 
&  adjYumu2Yu*gYB*gBL*sqrt2ov5 + 2*AbsMBp*adjYuYu*gYB*gBL*sqrt2ov5 - adjTdTd*g1*gBY*sqrt2ov5 +& 
&  adjTuTu*g1*gBY*sqrt2ov5 - adjYdmd2Yd*g1*gBY*sqrt2ov5 + adjYumu2Yu*g1*gBY*sqrt2ov5 +   & 
&  (272*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/45._dp + 2*AbsM2*gYB*g2p2*gBL*id3R*sqrt2ov5 + & 
&  2*AbsMBp*gYB*g2p2*gBL*id3R*sqrt2ov5 + (32*AbsM3*gYB*g3p2*gBL*id3R*sqrt2ov5)/9._dp +   & 
&  (32*AbsMBp*gYB*g3p2*gBL*id3R*sqrt2ov5)/9._dp + 2*AbsM2*g1*g2p2*gBY*id3R*sqrt2ov5 +    & 
&  (32*AbsM3*g1*g3p2*gBY*id3R*sqrt2ov5)/9._dp + (91*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5)/9._dp +& 
&  (91*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5)/3._dp + (91*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5)/9._dp +& 
&  (272*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/45._dp + (272*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/15._dp +& 
&  adjTdYd*g1*gBY*M1*sqrt2ov5 - adjTuYu*g1*gBY*M1*sqrt2ov5 + adjTdYd*g1*gBL*MBBp*sqrt2ov5 -& 
&  adjTuYu*g1*gBL*MBBp*sqrt2ov5 + adjTdYd*gYB*gBY*MBBp*sqrt2ov5 - adjTuYu*gYB*gBY*MBBp*sqrt2ov5 +& 
&  adjTdYd*gYB*gBL*MBp*sqrt2ov5 - adjTuYu*gYB*gBL*MBp*sqrt2ov5 - adjYdYd*gYB*gBL*mHd2*sqrt2ov5 -& 
&  adjYdYd*g1*gBY*mHd2*sqrt2ov5 + adjYuYu*gYB*gBL*mHu2*sqrt2ov5 + adjYuYu*g1*gBY*mHu2*sqrt2ov5 -& 
&  6*adjTdYd*TradjYdTd - 2*adjTdYd*TradjYeTe - 6*adjTuYu*TradjYuTu - 2*adjTuYu*TradjYvTv  
betamq22 =  betamq22- 6*adjYdYd*TrCTdTpTd - 6*adjYdTd*TrCTdTpYd - 2*adjYdYd*TrCTeTpTe - 2*adjYdTd*TrCTeTpYe -& 
&  6*adjYuYu*TrCTuTpTu - 6*adjYuTu*TrCTuTpYu - 2*adjYuYu*TrCTvTpTv - 2*adjYuTu*TrCTvTpYv -& 
&  6*adjYdYd*Trmd2YdadjYd - 2*adjYdYd*Trme2YeadjYe - 2*adjYdYd*Trml2adjYeYe -            & 
&  2*adjYuYu*Trml2adjYvYv - 6*adjYdYd*Trmq2adjYdYd - 6*adjYuYu*Trmq2adjYuYu -            & 
&  6*adjYuYu*Trmu2YuadjYu - 2*adjYuYu*Trmv2YvadjYv - 6*adjTdTd*TrYdadjYd -               & 
&  6*adjYdmd2Yd*TrYdadjYd - 3*adjYdYdmq2*TrYdadjYd - 12*adjYdYd*mHd2*TrYdadjYd -         & 
&  3*mq2adjYdYd*TrYdadjYd - 2*adjTdTd*TrYeadjYe - 2*adjYdmd2Yd*TrYeadjYe -               & 
&  adjYdYdmq2*TrYeadjYe - 4*adjYdYd*mHd2*TrYeadjYe - mq2adjYdYd*TrYeadjYe -              & 
&  6*adjTuTu*TrYuadjYu - 6*adjYumu2Yu*TrYuadjYu - 3*adjYuYumq2*TrYuadjYu -               & 
&  12*adjYuYu*mHu2*TrYuadjYu - 3*mq2adjYuYu*TrYuadjYu - 2*adjTuTu*TrYvadjYv -            & 
&  2*adjYumu2Yu*TrYvadjYv - adjYuYumq2*TrYvadjYv - 4*adjYuYu*mHu2*TrYvadjYv -            & 
&  mq2adjYuYu*TrYvadjYv + ((id3R*(2388*g1p4*M1 + 16*g1p3*(199*gYB*MBBp + 204*gBY*M1*sqrt10 +& 
&  68*gBL*MBBp*sqrt10) + 2*g1p2*(398*gYBp2*(2._dp*(M1) + MBp) + 5*(146*gBLp2*M1 +        & 
&  1800*gBYp2*M1 + 1200*gBL*gBY*MBBp + 73*gBLp2*MBp + 32*g3p2*(2._dp*(M1) +              & 
&  M3) + 18*g2p2*(2._dp*(M1) + M2)) + 272*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) +            & 
&  MBp))*sqrt10) + gBY*(10*gYBp2*(600*gBL*MBBp + 73*gBY*(2._dp*(M1) + MBp)) +            & 
&  25*(109*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +       & 
&  MBp)) + 32*g3p2*(2*gBL*MBBp + gBY*(2._dp*(M1) + M3)) + 18*g2p2*(2*gBL*MBBp +          & 
&  gBY*(2._dp*(M1) + M2))) + 544*gYBp3*MBBp*sqrt10 + 10*gYB*(273*gBLp2*MBBp +            & 
&  2*(9._dp*(g2p2) + 16._dp*(g3p2) + 91._dp*(gBYp2))*MBBp + 91*gBL*gBY*(2._dp*(M1) +     & 
&  MBp))*sqrt10) + 2*g1*(796*gYBp3*MBBp + 10*gYB*(300*gBLp2*MBBp + 2*(9._dp*(g2p2) +     & 
&  16._dp*(g3p2) + 300._dp*(gBYp2))*MBBp + 227*gBL*gBY*(2._dp*(M1) + MBp)) +             & 
&  272*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 5*(91*(6*gBYp3*M1 +          & 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(gBL*MBBp +   & 
&  gBY*(2._dp*(M1) + M3)) + 18*g2p2*(gBL*MBBp + gBY*(2._dp*(M1) + M2)))*sqrt10)) +       & 
&  180*(-8*adjYuTu*g1p2 + 16*adjYuYu*g1p2*M1 + 16*adjYuYu*g1*gYB*MBBp - adjYuTu*g1*gBY*sqrt10 +& 
&  2*adjYuYu*g1*gBY*M1*sqrt10 + adjYuYu*g1*gBL*MBBp*sqrt10 + adjYuYu*gYB*gBY*MBBp*sqrt10 +& 
&  adjYdTd*g1*(-4._dp*(g1) + gBY*sqrt10) + adjYdYd*(8*g1p2*M1 - gYB*gBY*MBBp*sqrt10 -    & 
&  g1*(-8*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))))*Conjg(M1))/900._dp  
betamq22 =  betamq22+ ((id3R*(796*g1p4*MBBp + 796*gYBp4*MBBp + 10*gYBp2*(600*gBLp2*MBBp + (18._dp*(g2p2) +  & 
&  32._dp*(g3p2) + 373._dp*(gBYp2))*MBBp + 300*gBL*gBY*(M1 + 2._dp*(MBp))) +             & 
&  25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +       & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp + M3)) + 18*g2p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +           & 
&  MBp + M2))) + 272*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 5*gYB*(91*(4*gBLp3*MBBp +& 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) +       & 
&  32*g3p2*(2*gBL*MBBp + gBY*(M1 + MBp + M3)) + 18*g2p2*(2*gBL*MBBp + gBY*(M1 +          & 
&  MBp + M2)))*sqrt10 + 4*g1p3*(199*gYB*(2._dp*(M1) + MBp) + 68*(4*gBY*MBBp +            & 
&  gBL*(2._dp*(M1) + MBp))*sqrt10) + 2*g1p2*(1592*gYBp2*MBBp + 5*(373*gBLp2*MBBp +       & 
&  2*(9._dp*(g2p2) + 16._dp*(g3p2) + 300._dp*(gBYp2))*MBBp + 300*gBL*gBY*(2._dp*(M1) +   & 
&  MBp)) + 136*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(796*gYBp3*(M1 + & 
&  2._dp*(MBp)) + 20*gYB*(150*gBLp2*M1 + 300*gBYp2*M1 + 827*gBL*gBY*MBBp +               & 
&  300*gBLp2*MBp + 150*gBYp2*MBp + 16*g3p2*(M1 + MBp + M3) + 9*g2p2*(M1 + MBp +          & 
&  M2)) + 272*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 + 5*(91*(8*gBY*gBLp2*MBBp +& 
&  4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  32*g3p2*(2*gBY*MBBp + gBL*(M1 + MBp + M3)) + 18*g2p2*(2*gBY*MBBp + gBL*(M1 +          & 
&  MBp + M2)))*sqrt10)) + 90*(-16*adjYuTu*g1*gYB + 16*adjYuYu*g1*gYB*M1 + 16*adjYuYu*g1p2*MBBp +& 
&  16*adjYuYu*gYBp2*MBBp + 16*adjYuYu*g1*gYB*MBp - adjYuTu*g1*gBL*sqrt10 -               & 
&  adjYuTu*gYB*gBY*sqrt10 + adjYuYu*g1*gBL*M1*sqrt10 + adjYuYu*gYB*gBY*M1*sqrt10 +       & 
&  2*adjYuYu*gYB*gBL*MBBp*sqrt10 + 2*adjYuYu*g1*gBY*MBBp*sqrt10 + adjYuYu*g1*gBL*MBp*sqrt10 +& 
&  adjYuYu*gYB*gBY*MBp*sqrt10 + adjYdTd*(-8*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10) +   & 
&  adjYdYd*(8*g1p2*MBBp + gYB*(8*gYB*MBBp - 2*gBL*MBBp*sqrt10 - gBY*(M1 + MBp)*sqrt10) + & 
&  g1*(8*gYB*(M1 + MBp) - (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))))*Conjg(MBBp))/450._dp  
betamq22 =  betamq22- (4*adjYdTd*gYBp2*Conjg(MBp))/5._dp - (8*adjYuTu*gYBp2*Conjg(MBp))/5._dp +             & 
&  (227*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/45._dp + (73*g1p2*gBLp2*id3R*M1*Conjg(MBp))/90._dp +& 
&  (109*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/36._dp + (199*g1p2*gYBp2*id3R*M1*Conjg(MBp))/225._dp +& 
&  (73*gBYp2*gYBp2*id3R*M1*Conjg(MBp))/90._dp + (8*adjYdYd*g1*gYB*MBBp*Conjg(MBp))/5._dp +& 
&  (16*adjYuYu*g1*gYB*MBBp*Conjg(MBp))/5._dp + (398*gYB*g1p3*id3R*MBBp*Conjg(MBp))/225._dp +& 
&  (2*g1*gYB*g2p2*id3R*MBBp*Conjg(MBp))/5._dp + (32*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp))/45._dp +& 
&  (20*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/3._dp + g2p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +    & 
&  (16*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/9._dp + (40*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (109*gBY*gBLp3*id3R*MBBp*Conjg(MBp))/9._dp + (20*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (109*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/18._dp + (40*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (796*g1*gYBp3*id3R*MBBp*Conjg(MBp))/225._dp + (8*g3p2*gBLp2*id3R*M3*Conjg(MBp))/9._dp +& 
&  (16*g3p2*gYBp2*id3R*M3*Conjg(MBp))/45._dp + (g2p2*gBLp2*id3R*M2*Conjg(MBp))/2._dp +   & 
&  (g2p2*gYBp2*id3R*M2*Conjg(MBp))/5._dp + (91*g1*gBY*gBLp2*id3R*M1*ooSqrt10*Conjg(MBp))/9._dp +& 
&  (91*gYB*gBL*gBYp2*id3R*M1*ooSqrt10*Conjg(MBp))/9._dp + (91*g1*gBL*gBYp2*id3R*MBBp*ooSqrt10*Conjg(MBp))/3._dp +& 
&  (91*gYB*gBYp3*id3R*MBBp*ooSqrt10*Conjg(MBp))/9._dp + adjYdTd*gYB*gBL*sqrt2ov5*Conjg(MBp) -& 
&  adjYuTu*gYB*gBL*sqrt2ov5*Conjg(MBp) + (136*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/45._dp +& 
&  (136*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/45._dp - adjYdYd*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  adjYuYu*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) - adjYdYd*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) +  & 
&  adjYuYu*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) + (136*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/45._dp +& 
&  g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) + (16*g1*g3p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp +& 
&  (136*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/15._dp + gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp)  
betamq22 =  betamq22+ (16*gYB*g3p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp + (91*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/3._dp +& 
&  (91*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp + (272*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/15._dp +& 
&  (272*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/45._dp + (16*gYB*g3p2*gBL*id3R*M3*sqrt2ov5*Conjg(MBp))/9._dp +& 
&  gYB*g2p2*gBL*id3R*M2*sqrt2ov5*Conjg(MBp) + (16*g1p2*g3p2*id3R*M1*Conjg(M3))/45._dp +  & 
&  (8*g3p2*gBYp2*id3R*M1*Conjg(M3))/9._dp + (32*g1*gYB*g3p2*id3R*MBBp*Conjg(M3))/45._dp +& 
&  (16*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3))/9._dp + (8*g3p2*gBLp2*id3R*MBp*Conjg(M3))/9._dp +& 
&  (16*g3p2*gYBp2*id3R*MBp*Conjg(M3))/45._dp + 16*g2p2*g3p2*id3R*M2*Conjg(M3) +          & 
&  (16*g1*g3p2*gBY*id3R*M1*sqrt2ov5*Conjg(M3))/9._dp + (16*g1*g3p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M3))/9._dp +& 
&  (16*gYB*g3p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M3))/9._dp + (16*gYB*g3p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M3))/9._dp +& 
&  (g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + (g2p2*gBYp2*id3R*M1*Conjg(M2))/2._dp +          & 
&  (2*g1*gYB*g2p2*id3R*MBBp*Conjg(M2))/5._dp + g2p2*gBL*gBY*id3R*MBBp*Conjg(M2) +        & 
&  (g2p2*gBLp2*id3R*MBp*Conjg(M2))/2._dp + (g2p2*gYBp2*id3R*MBp*Conjg(M2))/5._dp +       & 
&  16*g2p2*g3p2*id3R*M3*Conjg(M2) + g1*g2p2*gBY*id3R*M1*sqrt2ov5*Conjg(M2) +             & 
&  g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M2) + gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M2) +& 
&  gYB*g2p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M2) + 6*g2p4*id3R*Tr2(2) + (32*g3p4*id3R*Tr2(3))/3._dp +& 
&  (2*g1p2*id3R*Tr2U1(1,1))/15._dp + (gBYp2*id3R*Tr2U1(1,1))/3._dp + (2*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,& 
& 1))/3._dp + (2*g1*gYB*id3R*Tr2U1(1,4))/15._dp + (gBL*gBY*id3R*Tr2U1(1,4))/3._dp +      & 
&  (g1*gBL*id3R*sqrt2ov5*Tr2U1(1,4))/3._dp + (gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,             & 
& 4))/3._dp + (2*g1*gYB*id3R*Tr2U1(4,1))/15._dp + (gBL*gBY*id3R*Tr2U1(4,1))/3._dp +      & 
&  (g1*gBL*id3R*sqrt2ov5*Tr2U1(4,1))/3._dp + (gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,             & 
& 1))/3._dp + (gBLp2*id3R*Tr2U1(4,4))/3._dp + (2*gYBp2*id3R*Tr2U1(4,4))/15._dp  
betamq22 =  betamq22+ (2*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,4))/3._dp + 4*g1*id3R*ooSqrt15*Tr3(1) +              & 
&  2*gBY*id3R*sqrt2ov3*Tr3(1) + 4*gYB*id3R*ooSqrt15*Tr3(4) + 2*gBL*id3R*sqrt2ov3*Tr3(4)

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjTvTv) + 2._dp*(adjYeme2Ye) + adjYeYeml2 +     & 
&  2._dp*(adjYvmv2Yv) + adjYvYvml2 - 6*AbsM2*g2p2*id3R - 3*AbsMBp*gBLp2*id3R -           & 
&  (6*AbsMBp*gYBp2*id3R)/5._dp + 2*adjYeYe*mHd2 + 2*adjYvYv*mHu2 + ml2adjYeYe +          & 
&  ml2adjYvYv - 6*AbsMBp*gYB*gBL*id3R*sqrt2ov5 - (3*id3R*(2*g1p2*M1 + gBY*(5*gBY*M1 +    & 
&  5*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(2*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))  & 
& *Conjg(M1))/5._dp - (3*id3R*(2*g1p2*MBBp + 2*gYBp2*MBBp + 5*(gBLp2*MBBp +              & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +         & 
&  g1*(2*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp))            & 
& /5._dp - (6*g1*gYB*id3R*MBBp*Conjg(MBp))/5._dp - 3*gBL*gBY*id3R*MBBp*Conjg(MBp)        & 
&  - 3*g1*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) - 3*gYB*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp)    & 
&  - gBY*id3R*sqrt3ov2*Tr1(1) - g1*id3R*sqrt3ov5*Tr1(1) - gBL*id3R*sqrt3ov2*Tr1(4)       & 
&  - gYB*id3R*sqrt3ov5*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betaml22 = -4._dp*(adjTeTeadjYeYe) - 4._dp*(adjTeYeadjYeTe) - 4._dp*(adjTvTvadjYvYv) -           & 
&  8._dp*(adjTvTxCYxYv) - 4._dp*(adjTvYvadjYvTv) - 8._dp*(adjTvYxCYxTv) - 4._dp*(adjYeme2YeadjYeYe) -& 
&  4._dp*(adjYeTeadjTeYe) - 4._dp*(adjYeYeadjTeTe) - 4._dp*(adjYeYeadjYeme2Ye) -         & 
&  2._dp*(adjYeYeadjYeYeml2) - 4._dp*(adjYeYeml2adjYeYe) - 4._dp*(adjYvmv2YvadjYvYv) -   & 
&  8._dp*(adjYvmv2YxCYxYv) - 4._dp*(adjYvTvadjTvYv) - 8._dp*(adjYvTxCTxYv) -             & 
&  4._dp*(adjYvYvadjTvTv) - 4._dp*(adjYvYvadjYvmv2Yv) - 2._dp*(adjYvYvadjYvYvml2) -      & 
&  4._dp*(adjYvYvml2adjYvYv) - 8._dp*(adjYvYxCmv2CYxYv) - 8._dp*(adjYvYxCTxTv) -         & 
&  8._dp*(adjYvYxCYxmv2Yv) - 4._dp*(adjYvYxCYxYvml2) + (12*adjTeTe*g1p2)/5._dp +         & 
&  (12*adjYeme2Ye*g1p2)/5._dp + (6*adjYeYeml2*g1p2)/5._dp + (12*adjTeTe*gYBp2)/5._dp +   & 
&  (12*adjYeme2Ye*gYBp2)/5._dp + (24*AbsMBp*adjYeYe*gYBp2)/5._dp + (6*adjYeYeml2*gYBp2)/5._dp +& 
&  (18*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + (486*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp +& 
&  (81*AbsMBp*g1p2*gBLp2*id3R)/5._dp + 9*AbsM2*g2p2*gBLp2*id3R + 9*AbsMBp*g2p2*gBLp2*id3R +& 
&  (351*AbsMBp*gBLp4*id3R)/4._dp + 9*AbsM2*g2p2*gBYp2*id3R + (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp +& 
&  (414*AbsMBp*g1p2*gYBp2*id3R)/25._dp + (18*AbsM2*g2p2*gYBp2*id3R)/5._dp +              & 
&  (18*AbsMBp*g2p2*gYBp2*id3R)/5._dp + (972*AbsMBp*gBLp2*gYBp2*id3R)/5._dp +             & 
&  (81*AbsMBp*gBYp2*gYBp2*id3R)/5._dp + (621*AbsMBp*gYBp4*id3R)/25._dp - (12*adjTeYe*g1p2*M1)/5._dp -& 
&  (24*adjTeYe*g1*gYB*MBBp)/5._dp - (12*adjTeYe*gYBp2*MBp)/5._dp - 8*adjYvYxCYxYv*mC12 - & 
&  8*adjYeYeadjYeYe*mHd2 + (12*adjYeYe*g1p2*mHd2)/5._dp + (12*adjYeYe*gYBp2*mHd2)/5._dp -& 
&  8*adjYvYvadjYvYv*mHu2 - 8*adjYvYxCYxYv*mHu2 + (6*g1p2*ml2adjYeYe)/5._dp +             & 
&  (6*gYBp2*ml2adjYeYe)/5._dp - 2._dp*(ml2adjYeYeadjYeYe) - 2._dp*(ml2adjYvYvadjYvYv) -  & 
&  4._dp*(ml2adjYvYxCYxYv) + 3*adjYeYeml2*gYB*gBL*ooSqrt10 - 3*adjYvYvml2*gYB*gBL*ooSqrt10  
betaml22 =  betaml22+ 3*adjYeYeml2*g1*gBY*ooSqrt10 - 3*adjYvYvml2*g1*gBY*ooSqrt10 + 3*gYB*gBL*ml2adjYeYe*ooSqrt10 +& 
&  3*g1*gBY*ml2adjYeYe*ooSqrt10 - 3*gYB*gBL*ml2adjYvYv*ooSqrt10 - 3*g1*gBY*ml2adjYvYv*ooSqrt10 +& 
&  3*adjTeTe*gYB*gBL*sqrt2ov5 - 3*adjTvTv*gYB*gBL*sqrt2ov5 + 3*adjYeme2Ye*gYB*gBL*sqrt2ov5 +& 
&  6*AbsMBp*adjYeYe*gYB*gBL*sqrt2ov5 - 3*adjYvmv2Yv*gYB*gBL*sqrt2ov5 - 6*AbsMBp*adjYvYv*gYB*gBL*sqrt2ov5 +& 
&  3*adjTeTe*g1*gBY*sqrt2ov5 - 3*adjTvTv*g1*gBY*sqrt2ov5 + 3*adjYeme2Ye*g1*gBY*sqrt2ov5 -& 
&  3*adjYvmv2Yv*g1*gBY*sqrt2ov5 + (288*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/5._dp +        & 
&  18*AbsM2*gYB*g2p2*gBL*id3R*sqrt2ov5 + 18*AbsMBp*gYB*g2p2*gBL*id3R*sqrt2ov5 +          & 
&  18*AbsM2*g1*g2p2*gBY*id3R*sqrt2ov5 + 99*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 +           & 
&  297*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 + 99*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 +          & 
&  (288*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/5._dp + (864*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/5._dp -& 
&  3*adjTeYe*g1*gBY*M1*sqrt2ov5 + 3*adjTvYv*g1*gBY*M1*sqrt2ov5 - 3*adjTeYe*g1*gBL*MBBp*sqrt2ov5 +& 
&  3*adjTvYv*g1*gBL*MBBp*sqrt2ov5 - 3*adjTeYe*gYB*gBY*MBBp*sqrt2ov5 + 3*adjTvYv*gYB*gBY*MBBp*sqrt2ov5 -& 
&  3*adjTeYe*gYB*gBL*MBp*sqrt2ov5 + 3*adjTvYv*gYB*gBL*MBp*sqrt2ov5 + 3*adjYeYe*gYB*gBL*mHd2*sqrt2ov5 +& 
&  3*adjYeYe*g1*gBY*mHd2*sqrt2ov5 - 3*adjYvYv*gYB*gBL*mHu2*sqrt2ov5 - 3*adjYvYv*g1*gBY*mHu2*sqrt2ov5 -& 
&  6*adjTeYe*TradjYdTd - 2*adjTeYe*TradjYeTe - 6*adjTvYv*TradjYuTu - 2*adjTvYv*TradjYvTv -& 
&  6*adjYeYe*TrCTdTpTd - 6*adjYeTe*TrCTdTpYd - 2*adjYeYe*TrCTeTpTe - 2*adjYeTe*TrCTeTpYe -& 
&  6*adjYvYv*TrCTuTpTu - 6*adjYvTv*TrCTuTpYu - 2*adjYvYv*TrCTvTpTv - 2*adjYvTv*TrCTvTpYv -& 
&  6*adjYeYe*Trmd2YdadjYd - 2*adjYeYe*Trme2YeadjYe - 2*adjYeYe*Trml2adjYeYe -            & 
&  2*adjYvYv*Trml2adjYvYv - 6*adjYeYe*Trmq2adjYdYd - 6*adjYvYv*Trmq2adjYuYu -            & 
&  6*adjYvYv*Trmu2YuadjYu - 2*adjYvYv*Trmv2YvadjYv - 6*adjTeTe*TrYdadjYd -               & 
&  6*adjYeme2Ye*TrYdadjYd - 3*adjYeYeml2*TrYdadjYd - 12*adjYeYe*mHd2*TrYdadjYd  
betaml22 =  betaml22- 3*ml2adjYeYe*TrYdadjYd - 2*adjTeTe*TrYeadjYe - 2*adjYeme2Ye*TrYeadjYe -               & 
&  adjYeYeml2*TrYeadjYe - 4*adjYeYe*mHd2*TrYeadjYe - ml2adjYeYe*TrYeadjYe -              & 
&  6*adjTvTv*TrYuadjYu - 6*adjYvmv2Yv*TrYuadjYu - 3*adjYvYvml2*TrYuadjYu -               & 
&  12*adjYvYv*mHu2*TrYuadjYu - 3*ml2adjYvYv*TrYuadjYu - 2*adjTvTv*TrYvadjYv -            & 
&  2*adjYvmv2Yv*TrYvadjYv - adjYvYvml2*TrYvadjYv - 4*adjYvYv*mHu2*TrYvadjYv -            & 
&  ml2adjYvYv*TrYvadjYv + (3*(3*id3R*(276*g1p4*M1 + 16*g1p3*(23*gYB*MBBp +               & 
&  24*gBY*M1*sqrt10 + 8*gBL*MBBp*sqrt10) + 2*g1p2*(46*gYBp2*(2._dp*(M1) + MBp) +         & 
&  5*(9*(24*gBYp2*M1 + 16*gBL*gBY*MBBp + gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(2._dp*(M1) +& 
&  M2)) + 32*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) + gBY*(90*gYBp2*(8*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + MBp)) + 25*(13*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp +      & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(2*gBL*MBBp + gBY*(2._dp*(M1) + M2))) +        & 
&  64*gYBp3*MBBp*sqrt10 + 10*gYB*(33*gBLp2*MBBp + 2*(g2p2 + 11._dp*(gBYp2))*MBBp +       & 
&  11*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(92*gYBp3*MBBp + 10*gYB*(36*gBLp2*MBBp +& 
&  2*(g2p2 + 36._dp*(gBYp2))*MBBp + 27*gBL*gBY*(2._dp*(M1) + MBp)) + 32*gYBp2*(3*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + MBp))*sqrt10 + 5*(11*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp +  & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(gBL*MBBp + gBY*(2._dp*(M1) + M2)))*sqrt10)) + & 
&  20*((adjYvTv*g1*gBY - adjYvYv*(2*g1*gBY*M1 + g1*gBL*MBBp + gYB*gBY*MBBp))*sqrt10 -    & 
&  adjYeTe*g1*(4._dp*(g1) + gBY*sqrt10) + adjYeYe*(8*g1p2*M1 + gYB*gBY*MBBp*sqrt10 +     & 
&  g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))))*Conjg(M1))/100._dp +           & 
&  (3*(3*id3R*(92*g1p4*MBBp + 92*gYBp4*MBBp + 10*gYBp2*(72*gBLp2*MBBp + (2._dp*(g2p2) +  & 
&  45._dp*(gBYp2))*MBBp + 36*gBL*gBY*(M1 + 2._dp*(MBp))) + 25*(13*(gBLp4*MBBp +          & 
&  4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 +      & 
&  2._dp*(MBp))) + 2*g2p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp + M2))) +         & 
&  32*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 5*gYB*(11*(4*gBLp3*MBBp +     & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) +       & 
&  2*g2p2*(2*gBL*MBBp + gBY*(M1 + MBp + M2)))*sqrt10 + 4*g1p3*(23*gYB*(2._dp*(M1) +      & 
&  MBp) + 8*(2*gBL*M1 + 4*gBY*MBBp + gBL*MBp)*sqrt10) + 2*g1p2*(184*gYBp2*MBBp +         & 
&  5*(45*gBLp2*MBBp + 2*(g2p2 + 36._dp*(gBYp2))*MBBp + 36*gBL*gBY*(2._dp*(M1) +          & 
&  MBp)) + 16*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(92*gYBp3*(M1 +   & 
&  2._dp*(MBp)) + 20*gYB*(9*(11*gBL*gBY*MBBp + 2*gBYp2*(2._dp*(M1) + MBp) +              & 
&  2*gBLp2*(M1 + 2._dp*(MBp))) + g2p2*(M1 + MBp + M2)) + 32*gYBp2*(8*gBY*MBBp +          & 
&  3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 + 5*(11*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp +           & 
&  3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp))) + 2*g2p2*(2*gBY*MBBp +     & 
&  gBL*(M1 + MBp + M2)))*sqrt10)) + 10*((adjYvTv*(g1*gBL + gYB*gBY) - adjYvYv*(g1*(2*gBY*MBBp +& 
&  gBL*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))))*sqrt10 - adjYeTe*(8*g1*gYB +    & 
&  g1*gBL*sqrt10 + gYB*gBY*sqrt10) + adjYeYe*(8*g1p2*MBBp + g1*(8*gYB*(M1 +              & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 + MBp)*sqrt10 +           & 
&  2*MBBp*(4._dp*(gYB) + gBL*sqrt10)))))*Conjg(MBBp))/50._dp - (12*adjYeTe*gYBp2*Conjg(MBp))/5._dp  
betaml22 =  betaml22+ (243*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp + (81*g1p2*gBLp2*id3R*M1*Conjg(MBp))/10._dp +& 
&  (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (207*g1p2*gYBp2*id3R*M1*Conjg(MBp))/25._dp +& 
&  (81*gBYp2*gYBp2*id3R*M1*Conjg(MBp))/10._dp + (24*adjYeYe*g1*gYB*MBBp*Conjg(MBp))/5._dp +& 
&  (414*gYB*g1p3*id3R*MBBp*Conjg(MBp))/25._dp + (18*g1*gYB*g2p2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (324*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp + 9*g2p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + & 
&  (648*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp + 117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) +  & 
&  (324*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp + (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp +& 
&  (648*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp + (828*g1*gYBp3*id3R*MBBp*Conjg(MBp))/25._dp +& 
&  (9*g2p2*gBLp2*id3R*M2*Conjg(MBp))/2._dp + (9*g2p2*gYBp2*id3R*M2*Conjg(MBp))/5._dp +   & 
&  99*g1*gBY*gBLp2*id3R*M1*ooSqrt10*Conjg(MBp) + 99*gYB*gBL*gBYp2*id3R*M1*ooSqrt10*Conjg(MBp) +& 
&  297*g1*gBL*gBYp2*id3R*MBBp*ooSqrt10*Conjg(MBp) + 99*gYB*gBYp3*id3R*MBBp*ooSqrt10*Conjg(MBp) -& 
&  3*adjYeTe*gYB*gBL*sqrt2ov5*Conjg(MBp) + 3*adjYvTv*gYB*gBL*sqrt2ov5*Conjg(MBp) +       & 
&  (144*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp + (144*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  3*adjYeYe*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) - 3*adjYvYv*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  3*adjYeYe*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) - 3*adjYvYv*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (144*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 9*g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (432*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 9*gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  297*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 99*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (864*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + (288*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  9*gYB*g2p2*gBL*id3R*M2*sqrt2ov5*Conjg(MBp) + (9*g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp +  & 
&  (9*g2p2*gBYp2*id3R*M1*Conjg(M2))/2._dp + (18*g1*gYB*g2p2*id3R*MBBp*Conjg(M2))/5._dp  
betaml22 =  betaml22+ 9*g2p2*gBL*gBY*id3R*MBBp*Conjg(M2) + (9*g2p2*gBLp2*id3R*MBp*Conjg(M2))/2._dp +        & 
&  (9*g2p2*gYBp2*id3R*MBp*Conjg(M2))/5._dp + 9*g1*g2p2*gBY*id3R*M1*sqrt2ov5*Conjg(M2) +  & 
&  9*g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M2) + 9*gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M2) +& 
&  9*gYB*g2p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M2) + 6*g2p4*id3R*Tr2(2) + (6*g1p2*id3R*Tr2U1(1,& 
& 1))/5._dp + 3*gBYp2*id3R*Tr2U1(1,1) + 6*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,1) +              & 
&  (6*g1*gYB*id3R*Tr2U1(1,4))/5._dp + 3*gBL*gBY*id3R*Tr2U1(1,4) + 3*g1*gBL*id3R*sqrt2ov5*Tr2U1(1,& 
& 4) + 3*gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,4) + (6*g1*gYB*id3R*Tr2U1(4,1))/5._dp +           & 
&  3*gBL*gBY*id3R*Tr2U1(4,1) + 3*g1*gBL*id3R*sqrt2ov5*Tr2U1(4,1) + 3*gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,& 
& 1) + 3*gBLp2*id3R*Tr2U1(4,4) + (6*gYBp2*id3R*Tr2U1(4,4))/5._dp + 6*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,& 
& 4) - 4*g1*id3R*sqrt3ov5*Tr3(1) - 2*gBY*id3R*sqrt6*Tr3(1) - 4*gYB*id3R*sqrt3ov5*Tr3(4) -& 
&  2*gBL*id3R*sqrt6*Tr3(4)

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = (-30*AbsM2*g2p2 - 6*AbsMBp*gYBp2 + 30._dp*(TrCTdTpTd) + 10._dp*(TrCTeTpTe)& 
&  + 30._dp*(Trmd2YdadjYd) + 10._dp*(Trme2YeadjYe) + 10._dp*(Trml2adjYeYe)               & 
&  + 30._dp*(Trmq2adjYdYd) + 30*mHd2*TrYdadjYd + 10*mHd2*TrYeadjYe - 6*g1*(g1*M1 +       & 
&  gYB*MBBp)*Conjg(M1) - 6*(g1p2*MBBp + gYBp2*MBBp + g1*gYB*(M1 + MBp))*Conjg(MBBp)      & 
&  - 6*g1*gYB*MBBp*Conjg(MBp) - g1*sqrt15*Tr1(1) - gYB*sqrt15*Tr1(4))/5._dp

 
 
If (TwoLoopRGE) Then 
betamHd22 = (90*AbsM2*g1p2*g2p2 + 825*AbsM2*g2p4 + 540*AbsMBp*g1*gYB*gBL*gBY + 414*AbsMBp*g1p2*gYBp2 +& 
&  90*AbsM2*g2p2*gYBp2 + 90*AbsMBp*g2p2*gYBp2 + 810*AbsMBp*gBLp2*gYBp2 + 621*AbsMBp*gYBp4 +& 
&  72*AbsMBp*gYB*g1p2*gBL*sqrt10 + 72*AbsMBp*g1*gBY*gYBp2*sqrt10 + 216*AbsMBp*gBL*gYBp3*sqrt10 -& 
&  20*g1p2*TrCTdTpTd + 800*g3p2*TrCTdTpTd + 25*gBLp2*TrCTdTpTd + 25*gBYp2*TrCTdTpTd -    & 
&  20*gYBp2*TrCTdTpTd - 5*gYB*gBL*sqrt10*TrCTdTpTd - 5*g1*gBY*sqrt10*TrCTdTpTd +         & 
&  20*g1p2*M1*TrCTdTpYd - 25*gBYp2*M1*TrCTdTpYd + 40*g1*gYB*MBBp*TrCTdTpYd -             & 
&  50*gBL*gBY*MBBp*TrCTdTpYd - 25*gBLp2*MBp*TrCTdTpYd + 20*gYBp2*MBp*TrCTdTpYd -         & 
&  800*g3p2*M3*TrCTdTpYd + 5*g1*gBY*M1*sqrt10*TrCTdTpYd + 5*g1*gBL*MBBp*sqrt10*TrCTdTpYd +& 
&  5*gYB*gBY*MBBp*sqrt10*TrCTdTpYd + 5*gYB*gBL*MBp*sqrt10*TrCTdTpYd + 60*g1p2*TrCTeTpTe +& 
&  75*gBLp2*TrCTeTpTe + 75*gBYp2*TrCTeTpTe + 60*gYBp2*TrCTeTpTe + 45*gYB*gBL*sqrt10*TrCTeTpTe +& 
&  45*g1*gBY*sqrt10*TrCTeTpTe - 60*g1p2*M1*TrCTeTpYe - 75*gBYp2*M1*TrCTeTpYe -           & 
&  120*g1*gYB*MBBp*TrCTeTpYe - 150*gBL*gBY*MBBp*TrCTeTpYe - 75*gBLp2*MBp*TrCTeTpYe -     & 
&  60*gYBp2*MBp*TrCTeTpYe - 45*g1*gBY*M1*sqrt10*TrCTeTpYe - 45*g1*gBL*MBBp*sqrt10*TrCTeTpYe -& 
&  45*gYB*gBY*MBBp*sqrt10*TrCTeTpYe - 45*gYB*gBL*MBp*sqrt10*TrCTeTpYe - 20*g1p2*Trmd2YdadjYd +& 
&  800*g3p2*Trmd2YdadjYd + 25*gBLp2*Trmd2YdadjYd + 25*gBYp2*Trmd2YdadjYd -               & 
&  20*gYBp2*Trmd2YdadjYd - 5*gYB*gBL*sqrt10*Trmd2YdadjYd - 5*g1*gBY*sqrt10*Trmd2YdadjYd -& 
&  900._dp*(Trmd2YdadjYdYdadjYd) - 150._dp*(Trmd2YdadjYuYuadjYd) + 60*g1p2*Trme2YeadjYe +& 
&  75*gBLp2*Trme2YeadjYe + 75*gBYp2*Trme2YeadjYe + 60*gYBp2*Trme2YeadjYe +               & 
&  45*gYB*gBL*sqrt10*Trme2YeadjYe + 45*g1*gBY*sqrt10*Trme2YeadjYe - 300._dp*(Trme2YeadjYeYeadjYe) -& 
&  50._dp*(Trme2YeadjYvYvadjYe) + 60*g1p2*Trml2adjYeYe + 75*gBLp2*Trml2adjYeYe +         & 
&  75*gBYp2*Trml2adjYeYe + 60*gYBp2*Trml2adjYeYe + 45*gYB*gBL*sqrt10*Trml2adjYeYe +      & 
&  45*g1*gBY*sqrt10*Trml2adjYeYe - 300._dp*(Trml2adjYeYeadjYeYe) - 50._dp*(Trml2adjYeYeadjYvYv) -& 
&  50._dp*(Trml2adjYvYvadjYeYe) - 20*g1p2*Trmq2adjYdYd + 800*g3p2*Trmq2adjYdYd +         & 
&  25*gBLp2*Trmq2adjYdYd + 25*gBYp2*Trmq2adjYdYd - 20*gYBp2*Trmq2adjYdYd -               & 
&  5*gYB*gBL*sqrt10*Trmq2adjYdYd - 5*g1*gBY*sqrt10*Trmq2adjYdYd - 900._dp*(Trmq2adjYdYdadjYdYd) -& 
&  150._dp*(Trmq2adjYdYdadjYuYu) - 150._dp*(Trmq2adjYuYuadjYdYd) - 150._dp*(Trmu2YuadjYdYdadjYu) -& 
&  50._dp*(Trmv2YvadjYeYeadjYv) - 900._dp*(TrYdadjTdTdadjYd) - 150._dp*(TrYdadjTuTuadjYd) +& 
&  1600*AbsM3*g3p2*TrYdadjYd + 50*AbsMBp*gBLp2*TrYdadjYd - 40*AbsMBp*gYBp2*TrYdadjYd -   & 
&  20*g1p2*mHd2*TrYdadjYd + 800*g3p2*mHd2*TrYdadjYd + 25*gBLp2*mHd2*TrYdadjYd +          & 
&  25*gBYp2*mHd2*TrYdadjYd - 20*gYBp2*mHd2*TrYdadjYd - 10*AbsMBp*gYB*gBL*sqrt10*TrYdadjYd -& 
&  5*gYB*gBL*mHd2*sqrt10*TrYdadjYd - 5*g1*gBY*mHd2*sqrt10*TrYdadjYd - 900._dp*(TrYdadjYdTdadjTd) -& 
&  900*mHd2*TrYdadjYdYdadjYd - 150._dp*(TrYdadjYuTuadjTd) - 150*mHd2*TrYdadjYuYuadjYd -  & 
&  150*mHu2*TrYdadjYuYuadjYd - 300._dp*(TrYeadjTeTeadjYe) - 50._dp*(TrYeadjTvTvadjYe) +  & 
&  150*AbsMBp*gBLp2*TrYeadjYe + 120*AbsMBp*gYBp2*TrYeadjYe + 60*g1p2*mHd2*TrYeadjYe +    & 
&  75*gBLp2*mHd2*TrYeadjYe + 75*gBYp2*mHd2*TrYeadjYe + 60*gYBp2*mHd2*TrYeadjYe +         & 
&  90*AbsMBp*gYB*gBL*sqrt10*TrYeadjYe + 45*gYB*gBL*mHd2*sqrt10*TrYeadjYe +               & 
&  45*g1*gBY*mHd2*sqrt10*TrYeadjYe - 300._dp*(TrYeadjYeTeadjTe) - 300*mHd2*TrYeadjYeYeadjYe -& 
&  50._dp*(TrYeadjYvTvadjTe) - 50*mHd2*TrYeadjYvYvadjYe - 50*mHu2*TrYeadjYvYvadjYe -     & 
&  150._dp*(TrYuadjTdTdadjYu) - 150._dp*(TrYuadjYdTdadjTu) - 50._dp*(TrYvadjTeTeadjYv) - & 
&  50._dp*(TrYvadjYeTeadjTv) + (621*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 +  & 
&  810*g1p2*gBYp2*M1 + 414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 90*g1*gYB*g2p2*MBBp +     & 
&  540*g1p2*gBL*gBY*MBBp + 270*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp +               & 
&  270*gBL*gBY*gYBp2*MBBp + 414*g1*gYBp3*MBBp + 270*g1*gYB*gBL*gBY*MBp + 207*g1p2*gYBp2*MBp +& 
&  45*g1p2*g2p2*M2 + 72*gYB*g1p2*gBL*M1*sqrt10 + 216*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +& 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 108*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  36*gBY*gYBp3*MBBp*sqrt10 + 36*gYB*g1p2*gBL*MBp*sqrt10 + 36*g1*gBY*gYBp2*MBp*sqrt10 +  & 
&  20*g1p2*TradjYdTd - 25*gBYp2*TradjYdTd + 5*g1*gBY*sqrt10*TradjYdTd - 60*g1p2*TradjYeTe -& 
&  75*gBYp2*TradjYeTe - 45*g1*gBY*sqrt10*TradjYeTe - 5*(8*g1p2*M1 + gBY*(-               & 
& 10*gBY*M1 - 10*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 +        & 
&  gBL*MBBp*sqrt10))*TrYdadjYd + 15*(8*g1p2*M1 + gBY*(10*gBY*M1 + 10*gBL*MBBp +          & 
&  3*gYB*MBBp*sqrt10) + g1*(8*gYB*MBBp + 6*gBY*M1*sqrt10 + 3*gBL*MBBp*sqrt10))*TrYeadjYe)*Conjg(M1) +& 
&  (828*gYB*g1p3*M1 + 90*g1*gYB*g2p2*M1 + 540*g1p2*gBL*gBY*M1 + 270*g1*gYB*gBLp2*M1 +    & 
&  540*g1*gYB*gBYp2*M1 + 270*gBL*gBY*gYBp2*M1 + 414*g1*gYBp3*M1 + 414*g1p4*MBBp +        & 
&  90*g1p2*g2p2*MBBp + 1620*g1*gYB*gBL*gBY*MBBp + 270*g1p2*gBLp2*MBBp + 540*g1p2*gBYp2*MBBp +& 
&  1656*g1p2*gYBp2*MBBp + 90*g2p2*gYBp2*MBBp + 540*gBLp2*gYBp2*MBBp + 270*gBYp2*gYBp2*MBBp +& 
&  414*gYBp4*MBBp + 414*gYB*g1p3*MBp + 90*g1*gYB*g2p2*MBp + 270*g1p2*gBL*gBY*MBp +       & 
&  540*g1*gYB*gBLp2*MBp + 270*g1*gYB*gBYp2*MBp + 540*gBL*gBY*gYBp2*MBp + 828*g1*gYBp3*MBp +& 
&  90*g1*gYB*g2p2*M2 + 72*g1p3*gBL*M1*sqrt10 + 216*gYB*g1p2*gBY*M1*sqrt10 +              & 
&  108*g1*gBL*gYBp2*M1*sqrt10 + 36*gBY*gYBp3*M1*sqrt10 + 288*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  144*g1p3*gBY*MBBp*sqrt10 + 288*g1*gBY*gYBp2*MBBp*sqrt10 + 144*gBL*gYBp3*MBBp*sqrt10 + & 
&  36*g1p3*gBL*MBp*sqrt10 + 108*gYB*g1p2*gBY*MBp*sqrt10 + 216*g1*gBL*gYBp2*MBp*sqrt10 +  & 
&  72*gBY*gYBp3*MBp*sqrt10 + 40*g1*gYB*TradjYdTd - 50*gBL*gBY*TradjYdTd + 5*g1*gBL*sqrt10*TradjYdTd +& 
&  5*gYB*gBY*sqrt10*TradjYdTd - 120*g1*gYB*TradjYeTe - 150*gBL*gBY*TradjYeTe -           & 
&  45*g1*gBL*sqrt10*TradjYeTe - 45*gYB*gBY*sqrt10*TradjYeTe - 5*(8*g1p2*MBBp +           & 
&  8*gYBp2*MBBp - 10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp +  & 
&  gBY*(M1 + MBp))*sqrt10 + g1*(8*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 +               & 
&  MBp))*sqrt10))*TrYdadjYd + 15*(8*g1p2*MBBp + 8*gYBp2*MBBp + 10*(gBLp2*MBBp +          & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 3*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(8*gYB*(M1 + MBp) + 3*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYeadjYe)*Conjg(MBBp) +& 
&  270*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 207*g1p2*gYBp2*M1*Conjg(MBp) + 414*gYB*g1p3*MBBp*Conjg(MBp) +& 
&  90*g1*gYB*g2p2*MBBp*Conjg(MBp) + 270*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 540*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  270*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 540*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 828*g1*gYBp3*MBBp*Conjg(MBp) +& 
&  45*g2p2*gYBp2*M2*Conjg(MBp) + 36*gYB*g1p2*gBL*M1*sqrt10*Conjg(MBp) + 36*g1*gBY*gYBp2*M1*sqrt10*Conjg(MBp) +& 
&  36*g1p3*gBL*MBBp*sqrt10*Conjg(MBp) + 108*gYB*g1p2*gBY*MBBp*sqrt10*Conjg(MBp) +        & 
&  216*g1*gBL*gYBp2*MBBp*sqrt10*Conjg(MBp) + 72*gBY*gYBp3*MBBp*sqrt10*Conjg(MBp) -       & 
&  25*gBLp2*TradjYdTd*Conjg(MBp) + 20*gYBp2*TradjYdTd*Conjg(MBp) + 5*gYB*gBL*sqrt10*TradjYdTd*Conjg(MBp) -& 
&  75*gBLp2*TradjYeTe*Conjg(MBp) - 60*gYBp2*TradjYeTe*Conjg(MBp) - 45*gYB*gBL*sqrt10*TradjYeTe*Conjg(MBp) -& 
&  40*g1*gYB*MBBp*TrYdadjYd*Conjg(MBp) + 50*gBL*gBY*MBBp*TrYdadjYd*Conjg(MBp) -          & 
&  5*g1*gBL*MBBp*sqrt10*TrYdadjYd*Conjg(MBp) - 5*gYB*gBY*MBBp*sqrt10*TrYdadjYd*Conjg(MBp) +& 
&  120*g1*gYB*MBBp*TrYeadjYe*Conjg(MBp) + 150*gBL*gBY*MBBp*TrYeadjYe*Conjg(MBp) +        & 
&  45*g1*gBL*MBBp*sqrt10*TrYeadjYe*Conjg(MBp) + 45*gYB*gBY*MBBp*sqrt10*TrYeadjYe*Conjg(MBp) -& 
&  800*g3p2*TradjYdTd*Conjg(M3) + 45*g1p2*g2p2*M1*Conjg(M2) + 90*g1*gYB*g2p2*MBBp*Conjg(M2) +& 
&  45*g2p2*gYBp2*MBp*Conjg(M2) + 150*g2p4*Tr2(2) + 30*g1p2*Tr2U1(1,1) + 30*g1*gYB*Tr2U1(1,& 
& 4) + 30*g1*gYB*Tr2U1(4,1) + 30*gYBp2*Tr2U1(4,4) - 20*g1*sqrt15*Tr3(1) - 20*gYB*sqrt15*Tr3(4))/25._dp

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = (-30*AbsM2*g2p2 - 6*AbsMBp*gYBp2 + 30._dp*(TrCTuTpTu) + 10._dp*(TrCTvTpTv)& 
&  + 10._dp*(Trml2adjYvYv) + 30._dp*(Trmq2adjYuYu) + 30._dp*(Trmu2YuadjYu)               & 
&  + 10._dp*(Trmv2YvadjYv) + 30*mHu2*TrYuadjYu + 10*mHu2*TrYvadjYv - 6*g1*(g1*M1 +       & 
&  gYB*MBBp)*Conjg(M1) - 6*(g1p2*MBBp + gYBp2*MBBp + g1*gYB*(M1 + MBp))*Conjg(MBBp)      & 
&  - 6*g1*gYB*MBBp*Conjg(MBp) + g1*sqrt15*Tr1(1) + gYB*sqrt15*Tr1(4))/5._dp

 
 
If (TwoLoopRGE) Then 
betamHu22 = (90*AbsM2*g1p2*g2p2 + 825*AbsM2*g2p4 + 540*AbsMBp*g1*gYB*gBL*gBY + 414*AbsMBp*g1p2*gYBp2 +& 
&  90*AbsM2*g2p2*gYBp2 + 90*AbsMBp*g2p2*gYBp2 + 810*AbsMBp*gBLp2*gYBp2 + 621*AbsMBp*gYBp4 +& 
&  72*AbsMBp*gYB*g1p2*gBL*sqrt10 + 72*AbsMBp*g1*gBY*gYBp2*sqrt10 + 216*AbsMBp*gBL*gYBp3*sqrt10 +& 
&  40*g1p2*TrCTuTpTu + 800*g3p2*TrCTuTpTu + 25*gBLp2*TrCTuTpTu + 25*gBYp2*TrCTuTpTu +    & 
&  40*gYBp2*TrCTuTpTu + 25*gYB*gBL*sqrt10*TrCTuTpTu + 25*g1*gBY*sqrt10*TrCTuTpTu -       & 
&  40*g1p2*M1*TrCTuTpYu - 25*gBYp2*M1*TrCTuTpYu - 80*g1*gYB*MBBp*TrCTuTpYu -             & 
&  50*gBL*gBY*MBBp*TrCTuTpYu - 25*gBLp2*MBp*TrCTuTpYu - 40*gYBp2*MBp*TrCTuTpYu -         & 
&  800*g3p2*M3*TrCTuTpYu - 25*g1*gBY*M1*sqrt10*TrCTuTpYu - 25*g1*gBL*MBBp*sqrt10*TrCTuTpYu -& 
&  25*gYB*gBY*MBBp*sqrt10*TrCTuTpYu - 25*gYB*gBL*MBp*sqrt10*TrCTuTpYu + 75*gBLp2*TrCTvTpTv +& 
&  75*gBYp2*TrCTvTpTv + 15*gYB*gBL*sqrt10*TrCTvTpTv + 15*g1*gBY*sqrt10*TrCTvTpTv -       & 
&  75*gBYp2*M1*TrCTvTpYv - 150*gBL*gBY*MBBp*TrCTvTpYv - 75*gBLp2*MBp*TrCTvTpYv -         & 
&  15*g1*gBY*M1*sqrt10*TrCTvTpYv - 15*g1*gBL*MBBp*sqrt10*TrCTvTpYv - 15*gYB*gBY*MBBp*sqrt10*TrCTvTpYv -& 
&  15*gYB*gBL*MBp*sqrt10*TrCTvTpYv - 200._dp*(TrCYxTxCTvTpYv) - 150._dp*(Trmd2YdadjYuYuadjYd) -& 
&  50._dp*(Trme2YeadjYvYvadjYe) - 50._dp*(Trml2adjYeYeadjYvYv) + 75*gBLp2*Trml2adjYvYv + & 
&  75*gBYp2*Trml2adjYvYv + 15*gYB*gBL*sqrt10*Trml2adjYvYv + 15*g1*gBY*sqrt10*Trml2adjYvYv -& 
&  50._dp*(Trml2adjYvYvadjYeYe) - 300._dp*(Trml2adjYvYvadjYvYv) - 200._dp*(Trml2adjYvYxCYxYv) -& 
&  150._dp*(Trmq2adjYdYdadjYuYu) + 40*g1p2*Trmq2adjYuYu + 800*g3p2*Trmq2adjYuYu +        & 
&  25*gBLp2*Trmq2adjYuYu + 25*gBYp2*Trmq2adjYuYu + 40*gYBp2*Trmq2adjYuYu +               & 
&  25*gYB*gBL*sqrt10*Trmq2adjYuYu + 25*g1*gBY*sqrt10*Trmq2adjYuYu - 150._dp*(Trmq2adjYuYuadjYdYd) -& 
&  900._dp*(Trmq2adjYuYuadjYuYu) - 150._dp*(Trmu2YuadjYdYdadjYu) + 40*g1p2*Trmu2YuadjYu +& 
&  800*g3p2*Trmu2YuadjYu + 25*gBLp2*Trmu2YuadjYu + 25*gBYp2*Trmu2YuadjYu +               & 
&  40*gYBp2*Trmu2YuadjYu + 25*gYB*gBL*sqrt10*Trmu2YuadjYu + 25*g1*gBY*sqrt10*Trmu2YuadjYu -& 
&  900._dp*(Trmu2YuadjYuYuadjYu) - 50._dp*(Trmv2YvadjYeYeadjYv) + 75*gBLp2*Trmv2YvadjYv +& 
&  75*gBYp2*Trmv2YvadjYv + 15*gYB*gBL*sqrt10*Trmv2YvadjYv + 15*g1*gBY*sqrt10*Trmv2YvadjYv -& 
&  300._dp*(Trmv2YvadjYvYvadjYv) - 200._dp*(Trmv2YvadjYvYxCYx) - 200._dp*(Trmv2YxCYxYvadjYv) -& 
&  150._dp*(TrYdadjTuTuadjYd) - 150._dp*(TrYdadjYuTuadjTd) - 150*mHd2*TrYdadjYuYuadjYd - & 
&  150*mHu2*TrYdadjYuYuadjYd - 50._dp*(TrYeadjTvTvadjYe) - 50._dp*(TrYeadjYvTvadjTe) -   & 
&  50*mHd2*TrYeadjYvYvadjYe - 50*mHu2*TrYeadjYvYvadjYe - 150._dp*(TrYuadjTdTdadjYu) -    & 
&  900._dp*(TrYuadjTuTuadjYu) - 150._dp*(TrYuadjYdTdadjTu) + 1600*AbsM3*g3p2*TrYuadjYu + & 
&  50*AbsMBp*gBLp2*TrYuadjYu + 80*AbsMBp*gYBp2*TrYuadjYu + 40*g1p2*mHu2*TrYuadjYu +      & 
&  800*g3p2*mHu2*TrYuadjYu + 25*gBLp2*mHu2*TrYuadjYu + 25*gBYp2*mHu2*TrYuadjYu +         & 
&  40*gYBp2*mHu2*TrYuadjYu + 50*AbsMBp*gYB*gBL*sqrt10*TrYuadjYu + 25*gYB*gBL*mHu2*sqrt10*TrYuadjYu +& 
&  25*g1*gBY*mHu2*sqrt10*TrYuadjYu - 900._dp*(TrYuadjYuTuadjTu) - 900*mHu2*TrYuadjYuYuadjYu -& 
&  50._dp*(TrYvadjTeTeadjYv) - 300._dp*(TrYvadjTvTvadjYv) - 50._dp*(TrYvadjYeTeadjTv) +  & 
&  150*AbsMBp*gBLp2*TrYvadjYv + 75*gBLp2*mHu2*TrYvadjYv + 75*gBYp2*mHu2*TrYvadjYv +      & 
&  30*AbsMBp*gYB*gBL*sqrt10*TrYvadjYv + 15*gYB*gBL*mHu2*sqrt10*TrYvadjYv +               & 
&  15*g1*gBY*mHu2*sqrt10*TrYvadjYv - 300._dp*(TrYvadjYvTvadjTv) - 200._dp*(TrYvadjYvTxCTx) -& 
&  300*mHu2*TrYvadjYvYvadjYv - 200._dp*(TrYxCmv2CYxYvadjYv) - 200._dp*(TrYxCTxTvadjYv) - & 
&  200._dp*(TrYxCYxTvadjTv) - 200*mC12*TrYxCYxYvadjYv - 200*mHu2*TrYxCYxYvadjYv +        & 
&  (621*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 + 810*g1p2*gBYp2*M1 +          & 
&  414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 90*g1*gYB*g2p2*MBBp + 540*g1p2*gBL*gBY*MBBp + & 
&  270*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp + 270*gBL*gBY*gYBp2*MBBp +              & 
&  414*g1*gYBp3*MBBp + 270*g1*gYB*gBL*gBY*MBp + 207*g1p2*gYBp2*MBp + 45*g1p2*g2p2*M2 +   & 
&  72*gYB*g1p2*gBL*M1*sqrt10 + 216*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +      & 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 108*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  36*gBY*gYBp3*MBBp*sqrt10 + 36*gYB*g1p2*gBL*MBp*sqrt10 + 36*g1*gBY*gYBp2*MBp*sqrt10 -  & 
&  40*g1p2*TradjYuTu - 25*gBYp2*TradjYuTu - 25*g1*gBY*sqrt10*TradjYuTu - 75*gBYp2*TradjYvTv -& 
&  15*g1*gBY*sqrt10*TradjYvTv + 5*(16*g1p2*M1 + 5*gBY*(2*gBY*M1 + 2*gBL*MBBp +           & 
&  gYB*MBBp*sqrt10) + g1*(16*gYB*MBBp + 10*gBY*M1*sqrt10 + 5*gBL*MBBp*sqrt10))*TrYuadjYu +& 
&  15*(g1*(2*gBY*M1 + gBL*MBBp)*sqrt10 + gBY*(10*gBY*M1 + 10*gBL*MBBp + gYB*MBBp*sqrt10))*TrYvadjYv)*Conjg(M1) +& 
&  (828*gYB*g1p3*M1 + 90*g1*gYB*g2p2*M1 + 540*g1p2*gBL*gBY*M1 + 270*g1*gYB*gBLp2*M1 +    & 
&  540*g1*gYB*gBYp2*M1 + 270*gBL*gBY*gYBp2*M1 + 414*g1*gYBp3*M1 + 414*g1p4*MBBp +        & 
&  90*g1p2*g2p2*MBBp + 1620*g1*gYB*gBL*gBY*MBBp + 270*g1p2*gBLp2*MBBp + 540*g1p2*gBYp2*MBBp +& 
&  1656*g1p2*gYBp2*MBBp + 90*g2p2*gYBp2*MBBp + 540*gBLp2*gYBp2*MBBp + 270*gBYp2*gYBp2*MBBp +& 
&  414*gYBp4*MBBp + 414*gYB*g1p3*MBp + 90*g1*gYB*g2p2*MBp + 270*g1p2*gBL*gBY*MBp +       & 
&  540*g1*gYB*gBLp2*MBp + 270*g1*gYB*gBYp2*MBp + 540*gBL*gBY*gYBp2*MBp + 828*g1*gYBp3*MBp +& 
&  90*g1*gYB*g2p2*M2 + 72*g1p3*gBL*M1*sqrt10 + 216*gYB*g1p2*gBY*M1*sqrt10 +              & 
&  108*g1*gBL*gYBp2*M1*sqrt10 + 36*gBY*gYBp3*M1*sqrt10 + 288*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  144*g1p3*gBY*MBBp*sqrt10 + 288*g1*gBY*gYBp2*MBBp*sqrt10 + 144*gBL*gYBp3*MBBp*sqrt10 + & 
&  36*g1p3*gBL*MBp*sqrt10 + 108*gYB*g1p2*gBY*MBp*sqrt10 + 216*g1*gBL*gYBp2*MBp*sqrt10 +  & 
&  72*gBY*gYBp3*MBp*sqrt10 - 80*g1*gYB*TradjYuTu - 50*gBL*gBY*TradjYuTu - 25*g1*gBL*sqrt10*TradjYuTu -& 
&  25*gYB*gBY*sqrt10*TradjYuTu - 150*gBL*gBY*TradjYvTv - 15*g1*gBL*sqrt10*TradjYvTv -    & 
&  15*gYB*gBY*sqrt10*TradjYvTv + 5*(16*g1p2*MBBp + 16*gYBp2*MBBp + 10*(gBLp2*MBBp +      & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 5*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(16*gYB*(M1 + MBp) + 5*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYuadjYu +          & 
&  15*(10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + g1*(2*gBY*MBBp +              & 
&  gBL*(M1 + MBp))*sqrt10 + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10)*TrYvadjYv)*Conjg(MBBp) +& 
&  270*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 207*g1p2*gYBp2*M1*Conjg(MBp) + 414*gYB*g1p3*MBBp*Conjg(MBp) +& 
&  90*g1*gYB*g2p2*MBBp*Conjg(MBp) + 270*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 540*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  270*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 540*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 828*g1*gYBp3*MBBp*Conjg(MBp) +& 
&  45*g2p2*gYBp2*M2*Conjg(MBp) + 36*gYB*g1p2*gBL*M1*sqrt10*Conjg(MBp) + 36*g1*gBY*gYBp2*M1*sqrt10*Conjg(MBp) +& 
&  36*g1p3*gBL*MBBp*sqrt10*Conjg(MBp) + 108*gYB*g1p2*gBY*MBBp*sqrt10*Conjg(MBp) +        & 
&  216*g1*gBL*gYBp2*MBBp*sqrt10*Conjg(MBp) + 72*gBY*gYBp3*MBBp*sqrt10*Conjg(MBp) -       & 
&  25*gBLp2*TradjYuTu*Conjg(MBp) - 40*gYBp2*TradjYuTu*Conjg(MBp) - 25*gYB*gBL*sqrt10*TradjYuTu*Conjg(MBp) -& 
&  75*gBLp2*TradjYvTv*Conjg(MBp) - 15*gYB*gBL*sqrt10*TradjYvTv*Conjg(MBp) +              & 
&  80*g1*gYB*MBBp*TrYuadjYu*Conjg(MBp) + 50*gBL*gBY*MBBp*TrYuadjYu*Conjg(MBp) +          & 
&  25*g1*gBL*MBBp*sqrt10*TrYuadjYu*Conjg(MBp) + 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu*Conjg(MBp) +& 
&  150*gBL*gBY*MBBp*TrYvadjYv*Conjg(MBp) + 15*g1*gBL*MBBp*sqrt10*TrYvadjYv*Conjg(MBp) +  & 
&  15*gYB*gBY*MBBp*sqrt10*TrYvadjYv*Conjg(MBp) - 800*g3p2*TradjYuTu*Conjg(M3) +          & 
&  45*g1p2*g2p2*M1*Conjg(M2) + 90*g1*gYB*g2p2*MBBp*Conjg(M2) + 45*g2p2*gYBp2*MBp*Conjg(M2) +& 
&  150*g2p4*Tr2(2) + 30*g1p2*Tr2U1(1,1) + 30*g1*gYB*Tr2U1(1,4) + 30*g1*gYB*Tr2U1(4,      & 
& 1) + 30*gYBp2*Tr2U1(4,4) + 20*g1*sqrt15*Tr3(1) + 20*gYB*sqrt15*Tr3(4))/25._dp

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 16*AbsMBp*gYBp2*id3R +     & 
&  60._dp*(md2YdadjYd) + 8*AbsMBp*gYB*gBL*id3R*sqrt10 + 120._dp*(TdadjTd) +              & 
&  120*mHd2*YdadjYd + 60._dp*(YdadjYdmd2) + 120._dp*(Ydmq2adjYd) - 2*id3R*(8*g1p2*M1 +   & 
&  gBY*(5*gBY*M1 + 5*gBL*MBBp - 2*gYB*MBBp*sqrt10) - 2*g1*(-4*gYB*MBBp + 2*gBY*M1*sqrt10 +& 
&  gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(8*g1p2*MBBp + 8*gYBp2*MBBp + 5*(gBLp2*MBBp +    & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) - 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(8*gYB*(M1 + MBp) - 2*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp)           & 
&  - 16*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp) + 4*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)& 
&  + 4*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 4*g1*id3R*sqrt15*Tr1(1) - 5*gBY*id3R*sqrt6*Tr1(1)& 
&  + 4*gYB*id3R*sqrt15*Tr1(4) - 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamd22 = (2560*AbsM3*g1p2*g3p2*id3R - 38400._dp*AbsM3*g3p4*id3R + 7160*AbsMBp*g1*gYB*gBL*gBY*id3R -& 
&  2800*AbsMBp*g1p2*gBLp2*id3R + 1600*AbsM3*g3p2*gBLp2*id3R + 1600*AbsMBp*g3p2*gBLp2*id3R +& 
&  8175*AbsMBp*gBLp4*id3R + 1600*AbsM3*g3p2*gBYp2*id3R + 5450*AbsMBp*gBLp2*gBYp2*id3R +  & 
&  6464*AbsMBp*g1p2*gYBp2*id3R + 2560*AbsM3*g3p2*gYBp2*id3R + 2560*AbsMBp*g3p2*gYBp2*id3R +& 
&  2340*AbsMBp*gBLp2*gYBp2*id3R - 2800*AbsMBp*gBYp2*gYBp2*id3R + 9696*AbsMBp*gYBp4*id3R +& 
&  360*g1p2*md2YdadjYd + 5400*g2p2*md2YdadjYd + 360*gYBp2*md2YdadjYd - 1800._dp*(md2YdadjYdYdadjYd) -& 
&  1800._dp*(md2YdadjYuYuadjYd) - 496*AbsMBp*gYB*g1p2*gBL*id3R*sqrt10 - 1280*AbsM3*gYB*g3p2*gBL*id3R*sqrt10 -& 
&  1280*AbsMBp*gYB*g3p2*gBL*id3R*sqrt10 - 1280*AbsM3*g1*g3p2*gBY*id3R*sqrt10 -           & 
&  1480*AbsMBp*g1*gBY*gBLp2*id3R*sqrt10 - 4440*AbsMBp*gYB*gBLp3*id3R*sqrt10 -            & 
&  1480*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt10 - 496*AbsMBp*g1*gBY*gYBp2*id3R*sqrt10 -         & 
&  1488*AbsMBp*gBL*gYBp3*id3R*sqrt10 + 180*gYB*gBL*md2YdadjYd*sqrt10 + 180*g1*gBY*md2YdadjYd*sqrt10 +& 
&  720*g1p2*TdadjTd + 10800._dp*g2p2*TdadjTd + 720*gYBp2*TdadjTd + 360*gYB*gBL*sqrt10*TdadjTd +& 
&  360*g1*gBY*sqrt10*TdadjTd - 3600._dp*(TdadjTdYdadjYd) - 3600._dp*(TdadjTuYuadjYd) -   & 
&  3600._dp*(TdadjYdYdadjTd) - 3600._dp*(TdadjYuYuadjTd) - 10800._dp*TdadjYd*TrCTdTpYd - & 
&  3600*TdadjYd*TrCTeTpYe - 5400*md2YdadjYd*TrYdadjYd - 10800._dp*TdadjTd*TrYdadjYd -    & 
&  1800*md2YdadjYd*TrYeadjYe - 3600*TdadjTd*TrYeadjYe - 720*g1p2*M1*YdadjTd -            & 
&  1440*g1*gYB*MBBp*YdadjTd - 720*gYBp2*MBp*YdadjTd - 10800._dp*g2p2*M2*YdadjTd -        & 
&  360*g1*gBY*M1*sqrt10*YdadjTd - 360*g1*gBL*MBBp*sqrt10*YdadjTd - 360*gYB*gBY*MBBp*sqrt10*YdadjTd -& 
&  360*gYB*gBL*MBp*sqrt10*YdadjTd - 10800._dp*TradjYdTd*YdadjTd - 3600*TradjYeTe*YdadjTd -& 
&  3600._dp*(YdadjTdTdadjYd) - 3600._dp*(YdadjTuTuadjYd) + 21600._dp*AbsM2*g2p2*YdadjYd +& 
&  1440*AbsMBp*gYBp2*YdadjYd + 720*g1p2*mHd2*YdadjYd + 10800._dp*g2p2*mHd2*YdadjYd +     & 
&  720*gYBp2*mHd2*YdadjYd + 720*AbsMBp*gYB*gBL*sqrt10*YdadjYd + 360*gYB*gBL*mHd2*sqrt10*YdadjYd +& 
&  360*g1*gBY*mHd2*sqrt10*YdadjYd - 10800._dp*TrCTdTpTd*YdadjYd - 3600*TrCTeTpTe*YdadjYd -& 
&  10800._dp*Trmd2YdadjYd*YdadjYd - 3600*Trme2YeadjYe*YdadjYd - 3600*Trml2adjYeYe*YdadjYd -& 
&  10800._dp*Trmq2adjYdYd*YdadjYd - 21600._dp*mHd2*TrYdadjYd*YdadjYd - 7200*mHd2*TrYeadjYe*YdadjYd +& 
&  360*g1p2*YdadjYdmd2 + 5400*g2p2*YdadjYdmd2 + 360*gYBp2*YdadjYdmd2 + 180*gYB*gBL*sqrt10*YdadjYdmd2 +& 
&  180*g1*gBY*sqrt10*YdadjYdmd2 - 5400*TrYdadjYd*YdadjYdmd2 - 1800*TrYeadjYe*YdadjYdmd2 -& 
&  3600._dp*(YdadjYdmd2YdadjYd) - 3600._dp*(YdadjYdTdadjTd) - 7200*mHd2*YdadjYdYdadjYd - & 
&  1800._dp*(YdadjYdYdadjYdmd2) - 3600._dp*(YdadjYdYdmq2adjYd) - 3600._dp*(YdadjYumu2YuadjYd) -& 
&  3600._dp*(YdadjYuTuadjTd) - 3600*mHd2*YdadjYuYuadjYd - 3600*mHu2*YdadjYuYuadjYd -     & 
&  1800._dp*(YdadjYuYuadjYdmd2) - 3600._dp*(YdadjYuYumq2adjYd) + 720*g1p2*Ydmq2adjYd +   & 
&  10800._dp*g2p2*Ydmq2adjYd + 720*gYBp2*Ydmq2adjYd + 360*gYB*gBL*sqrt10*Ydmq2adjYd +    & 
&  360*g1*gBY*sqrt10*Ydmq2adjYd - 10800._dp*TrYdadjYd*Ydmq2adjYd - 3600*TrYeadjYe*Ydmq2adjYd -& 
&  3600._dp*(Ydmq2adjYdYdadjYd) - 3600._dp*(Ydmq2adjYuYuadjYd) + (id3R*(9696*g1p4*M1 -   & 
&  16*g1p3*(-808*gYB*MBBp + 93*gBY*M1*sqrt10 + 31*gBL*MBBp*sqrt10) + 4*g1p2*(808*gYBp2*(2._dp*(M1) +& 
&  MBp) + 5*(117*gBYp2*M1 + 78*gBL*gBY*MBBp - 70*gBLp2*(2._dp*(M1) + MBp) +              & 
&  64*g3p2*(2._dp*(M1) + M3)) - 62*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) +   & 
&  gBY*(-20*gYBp2*(-39*gBL*MBBp + 70*gBY*(2._dp*(M1) + MBp)) + 25*(109*(3*gBYp3*M1 +     & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(2*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + M3))) - 248*gYBp3*MBBp*sqrt10 - 20*gYB*(32*g3p2*MBBp +              & 
&  111*gBLp2*MBBp + 74*gBYp2*MBBp + 37*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) -             & 
&  4*g1*(-1616*gYBp3*MBBp - 5*gYB*(39*gBLp2*MBBp + 2*(64._dp*(g3p2) + 39._dp*(gBYp2))*MBBp +& 
&  179*gBL*gBY*(2._dp*(M1) + MBp)) + 62*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) +            & 
&  MBp))*sqrt10 + 5*(37*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +& 
&  MBp)) + 32*g3p2*(gBL*MBBp + gBY*(2._dp*(M1) + M3)))*sqrt10)) + 360*(-(g1*(2._dp*(g1) +& 
&  gBY*sqrt10)*TdadjYd) + (4*g1p2*M1 + gYB*gBY*MBBp*sqrt10 + g1*(4*gYB*MBBp +            & 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*YdadjYd))*Conjg(M1) + 2*(id3R*(3232*g1p4*MBBp +   & 
&  3232*gYBp4*MBBp + 10*gYBp2*(78*gBLp2*MBBp + (128._dp*(g3p2) - 101._dp*(gBYp2))*MBBp + & 
&  39*gBL*gBY*(M1 + 2._dp*(MBp))) + 25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp +           & 
&  gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  32*g3p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp + M3))) - 124*gYBp3*(4*gBL*MBBp +& 
&  gBY*(M1 + 2._dp*(MBp)))*sqrt10 - 10*gYB*(37*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp +        & 
&  gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) + 32*g3p2*(2*gBL*MBBp +    & 
&  gBY*(M1 + MBp + M3)))*sqrt10 + 4*g1p3*(808*gYB*(2._dp*(M1) + MBp) - 31*(4*gBY*MBBp +  & 
&  gBL*(2._dp*(M1) + MBp))*sqrt10) - 2*g1p2*(-6464*gYBp2*MBBp - 5*(-101*gBLp2*MBBp +     & 
&  2*(64._dp*(g3p2) + 39._dp*(gBYp2))*MBBp + 39*gBL*gBY*(2._dp*(M1) + MBp)) +            & 
&  62*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(1616*gYBp3*(M1 +       & 
&  2._dp*(MBp)) + 5*gYB*(514*gBL*gBY*MBBp + 39*gBYp2*(2._dp*(M1) + MBp) + 39*gBLp2*(M1 + & 
&  2._dp*(MBp)) + 128*g3p2*(M1 + MBp + M3)) - 62*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 +         & 
&  2._dp*(MBp)))*sqrt10 - 5*(37*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) +& 
&  MBp) + gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(2*gBY*MBBp + gBL*(M1 + MBp +              & 
&  M3)))*sqrt10)) + 180*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TdadjYd) +        & 
&  (4*g1p2*MBBp + g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) +         & 
&  gYB*(gBY*(M1 + MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YdadjYd))*Conjg(MBBp) +& 
&  3580*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp) - 1400*g1p2*gBLp2*id3R*M1*Conjg(MBp) +         & 
&  2725*gBLp2*gBYp2*id3R*M1*Conjg(MBp) + 3232*g1p2*gYBp2*id3R*M1*Conjg(MBp) -            & 
&  1400*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + 6464*gYB*g1p3*id3R*MBBp*Conjg(MBp) +            & 
&  2560*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp) + 780*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +       & 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + 1560*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp) +     & 
&  10900._dp*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + 780*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp) +    & 
&  5450*gBL*gBYp3*id3R*MBBp*Conjg(MBp) + 1560*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp) +       & 
&  12928._dp*g1*gYBp3*id3R*MBBp*Conjg(MBp) + 800*g3p2*gBLp2*id3R*M3*Conjg(MBp) +         & 
&  1280*g3p2*gYBp2*id3R*M3*Conjg(MBp) - 248*gYB*g1p2*gBL*id3R*M1*sqrt10*Conjg(MBp) -     & 
&  740*g1*gBY*gBLp2*id3R*M1*sqrt10*Conjg(MBp) - 740*gYB*gBL*gBYp2*id3R*M1*sqrt10*Conjg(MBp) -& 
&  248*g1*gBY*gYBp2*id3R*M1*sqrt10*Conjg(MBp) - 248*g1p3*gBL*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  640*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(MBp) - 744*gYB*g1p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  640*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) - 4440*gYB*gBY*gBLp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  1480*g1*gBLp3*id3R*MBBp*sqrt10*Conjg(MBp) - 2220*g1*gBL*gBYp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  740*gYB*gBYp3*id3R*MBBp*sqrt10*Conjg(MBp) - 1488*g1*gBL*gYBp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  496*gBY*gYBp3*id3R*MBBp*sqrt10*Conjg(MBp) - 640*gYB*g3p2*gBL*id3R*M3*sqrt10*Conjg(MBp) -& 
&  720*gYBp2*TdadjYd*Conjg(MBp) - 360*gYB*gBL*sqrt10*TdadjYd*Conjg(MBp) + 1440*g1*gYB*MBBp*YdadjYd*Conjg(MBp) +& 
&  360*g1*gBL*MBBp*sqrt10*YdadjYd*Conjg(MBp) + 360*gYB*gBY*MBBp*sqrt10*YdadjYd*Conjg(MBp) +& 
&  1280*g1p2*g3p2*id3R*M1*Conjg(M3) + 800*g3p2*gBYp2*id3R*M1*Conjg(M3) + 2560*g1*gYB*g3p2*id3R*MBBp*Conjg(M3) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3) + 800*g3p2*gBLp2*id3R*MBp*Conjg(M3) +           & 
&  1280*g3p2*gYBp2*id3R*MBp*Conjg(M3) - 640*g1*g3p2*gBY*id3R*M1*sqrt10*Conjg(M3) -       & 
&  640*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(M3) - 640*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(M3) -& 
&  640*gYB*g3p2*gBL*id3R*MBp*sqrt10*Conjg(M3) - 10800._dp*g2p2*TdadjYd*Conjg(M2) +       & 
&  9600*g3p4*id3R*Tr2(3) + 480*g1p2*id3R*Tr2U1(1,1) + 300*gBYp2*id3R*Tr2U1(1,            & 
& 1) - 240*g1*gBY*id3R*sqrt10*Tr2U1(1,1) + 480*g1*gYB*id3R*Tr2U1(1,4) + 300*gBL*gBY*id3R*Tr2U1(1,& 
& 4) - 120*g1*gBL*id3R*sqrt10*Tr2U1(1,4) - 120*gYB*gBY*id3R*sqrt10*Tr2U1(1,              & 
& 4) + 480*g1*gYB*id3R*Tr2U1(4,1) + 300*gBL*gBY*id3R*Tr2U1(4,1) - 120*g1*gBL*id3R*sqrt10*Tr2U1(4,& 
& 1) - 120*gYB*gBY*id3R*sqrt10*Tr2U1(4,1) + 300*gBLp2*id3R*Tr2U1(4,4) + 480*gYBp2*id3R*Tr2U1(4,& 
& 4) - 240*gYB*gBL*id3R*sqrt10*Tr2U1(4,4) + 480*g1*id3R*sqrt15*Tr3(1) - 600*gBY*id3R*sqrt6*Tr3(1) +& 
&  480*gYB*id3R*sqrt15*Tr3(4) - 600*gBL*id3R*sqrt6*Tr3(4))/900._dp

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 64*AbsMBp*gYBp2*id3R +     & 
&  60._dp*(mu2YuadjYu) - 16*AbsMBp*gYB*gBL*id3R*sqrt10 + 120._dp*(TuadjTu)               & 
&  + 120*mHu2*YuadjYu + 60._dp*(YuadjYumu2) + 120._dp*(Yumq2adjYu) - 2*id3R*(32*g1p2*M1 +& 
&  gBY*(5*gBY*M1 + 5*gBL*MBBp + 4*gYB*MBBp*sqrt10) + 4*g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 +& 
&  gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(32*g1p2*MBBp + 32*gYBp2*MBBp + 5*(gBLp2*MBBp +  & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 4*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  4*g1*(8*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp)           & 
&  - 64*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp) - 8*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)& 
&  - 8*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) - 8*g1*id3R*sqrt15*Tr1(1) - 5*gBY*id3R*sqrt6*Tr1(1)& 
&  - 8*gYB*id3R*sqrt15*Tr1(4) - 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamu22 = (10240._dp*AbsM3*g1p2*g3p2*id3R - 38400._dp*AbsM3*g3p4*id3R + 51320._dp*AbsMBp*g1*gYB*gBL*gBY*id3R +& 
&  6080*AbsMBp*g1p2*gBLp2*id3R + 1600*AbsM3*g3p2*gBLp2*id3R + 1600*AbsMBp*g3p2*gBLp2*id3R +& 
&  8175*AbsMBp*gBLp4*id3R + 1600*AbsM3*g3p2*gBYp2*id3R + 5450*AbsMBp*gBLp2*gBYp2*id3R +  & 
&  27392._dp*AbsMBp*g1p2*gYBp2*id3R + 10240._dp*AbsM3*g3p2*gYBp2*id3R + 10240._dp*AbsMBp*g3p2*gYBp2*id3R +& 
&  95220._dp*AbsMBp*gBLp2*gYBp2*id3R + 6080*AbsMBp*gBYp2*gYBp2*id3R + 41088._dp*AbsMBp*gYBp4*id3R -& 
&  1800._dp*(mu2YuadjYdYdadjYu) - 360*g1p2*mu2YuadjYu + 5400*g2p2*mu2YuadjYu -           & 
&  360*gYBp2*mu2YuadjYu - 1800._dp*(mu2YuadjYuYuadjYu) + 8288*AbsMBp*gYB*g1p2*gBL*id3R*sqrt10 +& 
&  2560*AbsM3*gYB*g3p2*gBL*id3R*sqrt10 + 2560*AbsMBp*gYB*g3p2*gBL*id3R*sqrt10 +          & 
&  2560*AbsM3*g1*g3p2*gBY*id3R*sqrt10 + 5120*AbsMBp*g1*gBY*gBLp2*id3R*sqrt10 +           & 
&  15360._dp*AbsMBp*gYB*gBLp3*id3R*sqrt10 + 5120*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt10 +      & 
&  8288*AbsMBp*g1*gBY*gYBp2*id3R*sqrt10 + 24864._dp*AbsMBp*gBL*gYBp3*id3R*sqrt10 -       & 
&  180*gYB*gBL*mu2YuadjYu*sqrt10 - 180*g1*gBY*mu2YuadjYu*sqrt10 - 5400*mu2YuadjYu*TrYuadjYu -& 
&  1800*mu2YuadjYu*TrYvadjYv - 3600._dp*(TuadjTdYdadjYu) - 720*g1p2*TuadjTu +            & 
&  10800._dp*g2p2*TuadjTu - 720*gYBp2*TuadjTu - 360*gYB*gBL*sqrt10*TuadjTu -             & 
&  360*g1*gBY*sqrt10*TuadjTu - 10800._dp*TrYuadjYu*TuadjTu - 3600*TrYvadjYv*TuadjTu -    & 
&  3600._dp*(TuadjTuYuadjYu) - 3600._dp*(TuadjYdYdadjTu) - 10800._dp*TrCTuTpYu*TuadjYu - & 
&  3600*TrCTvTpYv*TuadjYu - 3600._dp*(TuadjYuYuadjTu) - 3600._dp*(YuadjTdTdadjYu) +      & 
&  720*g1p2*M1*YuadjTu + 1440*g1*gYB*MBBp*YuadjTu + 720*gYBp2*MBp*YuadjTu -              & 
&  10800._dp*g2p2*M2*YuadjTu + 360*g1*gBY*M1*sqrt10*YuadjTu + 360*g1*gBL*MBBp*sqrt10*YuadjTu +& 
&  360*gYB*gBY*MBBp*sqrt10*YuadjTu + 360*gYB*gBL*MBp*sqrt10*YuadjTu - 10800._dp*TradjYuTu*YuadjTu -& 
&  3600*TradjYvTv*YuadjTu - 3600._dp*(YuadjTuTuadjYu) - 3600._dp*(YuadjYdmd2YdadjYu) -   & 
&  3600._dp*(YuadjYdTdadjTu) - 3600*mHd2*YuadjYdYdadjYu - 3600*mHu2*YuadjYdYdadjYu -     & 
&  1800._dp*(YuadjYdYdadjYumu2) - 3600._dp*(YuadjYdYdmq2adjYu) + 21600._dp*AbsM2*g2p2*YuadjYu -& 
&  1440*AbsMBp*gYBp2*YuadjYu - 720*g1p2*mHu2*YuadjYu + 10800._dp*g2p2*mHu2*YuadjYu -     & 
&  720*gYBp2*mHu2*YuadjYu - 720*AbsMBp*gYB*gBL*sqrt10*YuadjYu - 360*gYB*gBL*mHu2*sqrt10*YuadjYu -& 
&  360*g1*gBY*mHu2*sqrt10*YuadjYu - 10800._dp*TrCTuTpTu*YuadjYu - 3600*TrCTvTpTv*YuadjYu -& 
&  3600*Trml2adjYvYv*YuadjYu - 10800._dp*Trmq2adjYuYu*YuadjYu - 10800._dp*Trmu2YuadjYu*YuadjYu -& 
&  3600*Trmv2YvadjYv*YuadjYu - 21600._dp*mHu2*TrYuadjYu*YuadjYu - 7200*mHu2*TrYvadjYv*YuadjYu -& 
&  360*g1p2*YuadjYumu2 + 5400*g2p2*YuadjYumu2 - 360*gYBp2*YuadjYumu2 - 180*gYB*gBL*sqrt10*YuadjYumu2 -& 
&  180*g1*gBY*sqrt10*YuadjYumu2 - 5400*TrYuadjYu*YuadjYumu2 - 1800*TrYvadjYv*YuadjYumu2 -& 
&  3600._dp*(YuadjYumu2YuadjYu) - 3600._dp*(YuadjYuTuadjTu) - 7200*mHu2*YuadjYuYuadjYu - & 
&  1800._dp*(YuadjYuYuadjYumu2) - 3600._dp*(YuadjYuYumq2adjYu) - 3600._dp*(Yumq2adjYdYdadjYu) -& 
&  720*g1p2*Yumq2adjYu + 10800._dp*g2p2*Yumq2adjYu - 720*gYBp2*Yumq2adjYu -              & 
&  360*gYB*gBL*sqrt10*Yumq2adjYu - 360*g1*gBY*sqrt10*Yumq2adjYu - 10800._dp*TrYuadjYu*Yumq2adjYu -& 
&  3600*TrYvadjYv*Yumq2adjYu - 3600._dp*(Yumq2adjYuYuadjYu) + (id3R*(41088._dp*g1p4*M1 + & 
&  32*g1p3*(1712*gYB*MBBp + 777*gBY*M1*sqrt10 + 259*gBL*MBBp*sqrt10) + 4*g1p2*(3424*gYBp2*(2._dp*(M1) +& 
&  MBp) + 5*(4761*gBYp2*M1 + 3174*gBL*gBY*MBBp + 152*gBLp2*(2._dp*(M1) + MBp) +          & 
&  256*g3p2*(2._dp*(M1) + M3)) + 1036*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) +& 
&  gBY*(20*gYBp2*(1587*gBL*MBBp + 152*gBY*(2._dp*(M1) + MBp)) + 25*(109*(3*gBYp3*M1 +    & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(2*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + M3))) + 4144*gYBp3*MBBp*sqrt10 + 1280*gYB*(6*gBLp2*MBBp +           & 
&  (g3p2 + 4._dp*(gBYp2))*MBBp + 2*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + 4*g1*(6848*gYBp3*MBBp +& 
&  5*gYB*(512*g3p2*MBBp + 1587*gBLp2*MBBp + 3174*gBYp2*MBBp + 1283*gBL*gBY*(2._dp*(M1) + & 
&  MBp)) + 1036*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 320*(2*(6*gBYp3*M1 +& 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + g3p2*(gBL*MBBp +      & 
&  gBY*(2._dp*(M1) + M3)))*sqrt10)) - 360*(-(g1*(2._dp*(g1) + gBY*sqrt10)*TuadjYu) +     & 
&  (4*g1p2*M1 + gYB*gBY*MBBp*sqrt10 + g1*(4*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*YuadjYu))*Conjg(M1) +& 
&  2*(id3R*(13696._dp*g1p4*MBBp + 13696._dp*gYBp4*MBBp + 10*gYBp2*(3174*gBLp2*MBBp +     & 
&  (512._dp*(g3p2) + 1891._dp*(gBYp2))*MBBp + 1587*gBL*gBY*(M1 + 2._dp*(MBp))) +         & 
&  25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +       & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp + M3))) + 2072*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + & 
&  640*gYB*(2*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) +              & 
&  3*gBY*gBLp2*(M1 + 2._dp*(MBp))) + g3p2*(2*gBL*MBBp + gBY*(M1 + MBp + M3)))*sqrt10 +   & 
&  8*g1p3*(1712*gYB*(2._dp*(M1) + MBp) + 259*(4*gBY*MBBp + gBL*(2._dp*(M1) +             & 
&  MBp))*sqrt10) + 2*g1p2*(27392._dp*gYBp2*MBBp + 5*(512*g3p2*MBBp + 1891*gBLp2*MBBp +   & 
&  3174*gBYp2*MBBp + 1587*gBL*gBY*(2._dp*(M1) + MBp)) + 1036*gYB*(8*gBL*MBBp +           & 
&  3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(6848*gYBp3*(M1 + 2._dp*(MBp)) +             & 
&  5*gYB*(8914*gBL*gBY*MBBp + 1587*gBYp2*(2._dp*(M1) + MBp) + 1587*gBLp2*(M1 +           & 
&  2._dp*(MBp)) + 512*g3p2*(M1 + MBp + M3)) + 1036*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 +       & 
&  2._dp*(MBp)))*sqrt10 + 320*(2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) +& 
&  MBp) + gBLp3*(M1 + 2._dp*(MBp))) + g3p2*(2*gBY*MBBp + gBL*(M1 + MBp + M3)))*sqrt10)) -& 
&  180*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TuadjYu) + (4*g1p2*MBBp +          & 
&  g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 +         & 
&  MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YuadjYu))*Conjg(MBBp) +             & 
&  25660._dp*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp) + 3040*g1p2*gBLp2*id3R*M1*Conjg(MBp) +    & 
&  2725*gBLp2*gBYp2*id3R*M1*Conjg(MBp) + 13696._dp*g1p2*gYBp2*id3R*M1*Conjg(MBp) +       & 
&  3040*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + 27392._dp*gYB*g1p3*id3R*MBBp*Conjg(MBp) +       & 
&  10240._dp*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp) + 31740._dp*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + 63480._dp*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp) +& 
&  10900._dp*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + 31740._dp*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp) +& 
&  5450*gBL*gBYp3*id3R*MBBp*Conjg(MBp) + 63480._dp*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp) +  & 
&  54784._dp*g1*gYBp3*id3R*MBBp*Conjg(MBp) + 800*g3p2*gBLp2*id3R*M3*Conjg(MBp) +         & 
&  5120*g3p2*gYBp2*id3R*M3*Conjg(MBp) + 4144*gYB*g1p2*gBL*id3R*M1*sqrt10*Conjg(MBp) +    & 
&  2560*g1*gBY*gBLp2*id3R*M1*sqrt10*Conjg(MBp) + 2560*gYB*gBL*gBYp2*id3R*M1*sqrt10*Conjg(MBp) +& 
&  4144*g1*gBY*gYBp2*id3R*M1*sqrt10*Conjg(MBp) + 4144*g1p3*gBL*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  1280*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(MBp) + 12432._dp*gYB*g1p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  1280*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 15360._dp*gYB*gBY*gBLp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  5120*g1*gBLp3*id3R*MBBp*sqrt10*Conjg(MBp) + 7680*g1*gBL*gBYp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  2560*gYB*gBYp3*id3R*MBBp*sqrt10*Conjg(MBp) + 24864._dp*g1*gBL*gYBp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  8288*gBY*gYBp3*id3R*MBBp*sqrt10*Conjg(MBp) + 1280*gYB*g3p2*gBL*id3R*M3*sqrt10*Conjg(MBp) +& 
&  720*gYBp2*TuadjYu*Conjg(MBp) + 360*gYB*gBL*sqrt10*TuadjYu*Conjg(MBp) - 1440*g1*gYB*MBBp*YuadjYu*Conjg(MBp) -& 
&  360*g1*gBL*MBBp*sqrt10*YuadjYu*Conjg(MBp) - 360*gYB*gBY*MBBp*sqrt10*YuadjYu*Conjg(MBp) +& 
&  5120*g1p2*g3p2*id3R*M1*Conjg(M3) + 800*g3p2*gBYp2*id3R*M1*Conjg(M3) + 10240._dp*g1*gYB*g3p2*id3R*MBBp*Conjg(M3) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3) + 800*g3p2*gBLp2*id3R*MBp*Conjg(M3) +           & 
&  5120*g3p2*gYBp2*id3R*MBp*Conjg(M3) + 1280*g1*g3p2*gBY*id3R*M1*sqrt10*Conjg(M3) +      & 
&  1280*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(M3) + 1280*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(M3) +& 
&  1280*gYB*g3p2*gBL*id3R*MBp*sqrt10*Conjg(M3) - 10800._dp*g2p2*TuadjYu*Conjg(M2) +      & 
&  9600*g3p4*id3R*Tr2(3) + 1920*g1p2*id3R*Tr2U1(1,1) + 300*gBYp2*id3R*Tr2U1(1,           & 
& 1) + 480*g1*gBY*id3R*sqrt10*Tr2U1(1,1) + 1920*g1*gYB*id3R*Tr2U1(1,4) + 300*gBL*gBY*id3R*Tr2U1(1,& 
& 4) + 240*g1*gBL*id3R*sqrt10*Tr2U1(1,4) + 240*gYB*gBY*id3R*sqrt10*Tr2U1(1,              & 
& 4) + 1920*g1*gYB*id3R*Tr2U1(4,1) + 300*gBL*gBY*id3R*Tr2U1(4,1) + 240*g1*gBL*id3R*sqrt10*Tr2U1(4,& 
& 1) + 240*gYB*gBY*id3R*sqrt10*Tr2U1(4,1) + 300*gBLp2*id3R*Tr2U1(4,4) + 1920*gYBp2*id3R*Tr2U1(4,& 
& 4) + 480*gYB*gBL*id3R*sqrt10*Tr2U1(4,4) - 960*g1*id3R*sqrt15*Tr3(1) - 600*gBY*id3R*sqrt6*Tr3(1) -& 
&  960*gYB*id3R*sqrt15*Tr3(4) - 600*gBL*id3R*sqrt6*Tr3(4))/900._dp

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-30*AbsMBp*gBLp2*id3R - 48*AbsMBp*gYBp2*id3R + 20._dp*(me2YeadjYe)       & 
&  - 24*AbsMBp*gYB*gBL*id3R*sqrt10 + 40._dp*(TeadjTe) + 40*mHd2*YeadjYe + 20._dp*(YeadjYeme2)& 
&  + 40._dp*(Yeml2adjYe) - 6*id3R*(8*g1p2*M1 + gBY*(5*gBY*M1 + 5*gBL*MBBp +              & 
&  2*gYB*MBBp*sqrt10) + 2*g1*(4*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))           & 
& *Conjg(M1) - 6*id3R*(8*g1p2*MBBp + 8*gYBp2*MBBp + 5*(gBLp2*MBBp + gBYp2*MBBp +         & 
&  gBL*gBY*(M1 + MBp)) + 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + 2*g1*(4*gYB*(M1 +  & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp) - 48*g1*gYB*id3R*MBBp*Conjg(MBp)& 
&  - 30*gBL*gBY*id3R*MBBp*Conjg(MBp) - 12*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)             & 
&  - 12*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 4*g1*id3R*sqrt15*Tr1(1) + 5*gBY*id3R*sqrt6*Tr1(1)& 
&  + 4*gYB*id3R*sqrt15*Tr1(4) + 5*gBL*id3R*sqrt6*Tr1(4))/10._dp

 
 
If (TwoLoopRGE) Then 
betame22 = (1062*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp + 36*AbsMBp*g1p2*gBLp2*id3R + (351*AbsMBp*gBLp4*id3R)/4._dp +& 
&  (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp + (1872*AbsMBp*g1p2*gYBp2*id3R)/25._dp +          & 
&  (2133*AbsMBp*gBLp2*gYBp2*id3R)/5._dp + 36*AbsMBp*gBYp2*gYBp2*id3R + (2808*AbsMBp*gYBp4*id3R)/25._dp -& 
&  (6*g1p2*me2YeadjYe)/5._dp + 6*g2p2*me2YeadjYe - (6*gYBp2*me2YeadjYe)/5._dp -          & 
&  2._dp*(me2YeadjYeYeadjYe) - 2._dp*(me2YeadjYvYvadjYe) + (828*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/5._dp +& 
&  162*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 + 486*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 +          & 
&  162*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 + (828*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/5._dp +& 
&  (2484*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/5._dp - 3*gYB*gBL*me2YeadjYe*sqrt2ov5 -         & 
&  3*g1*gBY*me2YeadjYe*sqrt2ov5 - (12*g1p2*TeadjTe)/5._dp + 12*g2p2*TeadjTe -            & 
&  (12*gYBp2*TeadjTe)/5._dp - 6*gYB*gBL*sqrt2ov5*TeadjTe - 6*g1*gBY*sqrt2ov5*TeadjTe -   & 
&  4._dp*(TeadjTeYeadjYe) - 4._dp*(TeadjTvYvadjYe) - 4._dp*(TeadjYeYeadjTe) -            & 
&  4._dp*(TeadjYvYvadjTe) - 12*TeadjYe*TrCTdTpYd - 4*TeadjYe*TrCTeTpYe - 6*me2YeadjYe*TrYdadjYd -& 
&  12*TeadjTe*TrYdadjYd - 2*me2YeadjYe*TrYeadjYe - 4*TeadjTe*TrYeadjYe + (12*g1p2*M1*YeadjTe)/5._dp +& 
&  (24*g1*gYB*MBBp*YeadjTe)/5._dp + (12*gYBp2*MBp*YeadjTe)/5._dp - 12*g2p2*M2*YeadjTe +  & 
&  6*g1*gBY*M1*sqrt2ov5*YeadjTe + 6*g1*gBL*MBBp*sqrt2ov5*YeadjTe + 6*gYB*gBY*MBBp*sqrt2ov5*YeadjTe +& 
&  6*gYB*gBL*MBp*sqrt2ov5*YeadjTe - 12*TradjYdTd*YeadjTe - 4*TradjYeTe*YeadjTe -         & 
&  4._dp*(YeadjTeTeadjYe) - 4._dp*(YeadjTvTvadjYe) + 24*AbsM2*g2p2*YeadjYe -             & 
&  (24*AbsMBp*gYBp2*YeadjYe)/5._dp - (12*g1p2*mHd2*YeadjYe)/5._dp + 12*g2p2*mHd2*YeadjYe -& 
&  (12*gYBp2*mHd2*YeadjYe)/5._dp - 12*AbsMBp*gYB*gBL*sqrt2ov5*YeadjYe - 6*gYB*gBL*mHd2*sqrt2ov5*YeadjYe -& 
&  6*g1*gBY*mHd2*sqrt2ov5*YeadjYe - 12*TrCTdTpTd*YeadjYe - 4*TrCTeTpTe*YeadjYe -         & 
&  12*Trmd2YdadjYd*YeadjYe - 4*Trme2YeadjYe*YeadjYe - 4*Trml2adjYeYe*YeadjYe  
betame22 =  betame22- 12*Trmq2adjYdYd*YeadjYe - 24*mHd2*TrYdadjYd*YeadjYe - 8*mHd2*TrYeadjYe*YeadjYe -      & 
&  (6*g1p2*YeadjYeme2)/5._dp + 6*g2p2*YeadjYeme2 - (6*gYBp2*YeadjYeme2)/5._dp -          & 
&  3*gYB*gBL*sqrt2ov5*YeadjYeme2 - 3*g1*gBY*sqrt2ov5*YeadjYeme2 - 6*TrYdadjYd*YeadjYeme2 -& 
&  2*TrYeadjYe*YeadjYeme2 - 4._dp*(YeadjYeme2YeadjYe) - 4._dp*(YeadjYeTeadjTe) -         & 
&  8*mHd2*YeadjYeYeadjYe - 2._dp*(YeadjYeYeadjYeme2) - 4._dp*(YeadjYeYeml2adjYe) -       & 
&  4._dp*(YeadjYvmv2YvadjYe) - 4._dp*(YeadjYvTvadjTe) - 4*mHd2*YeadjYvYvadjYe -          & 
&  4*mHu2*YeadjYvYvadjYe - 2._dp*(YeadjYvYvadjYeme2) - 4._dp*(YeadjYvYvml2adjYe) -       & 
&  (12*g1p2*Yeml2adjYe)/5._dp + 12*g2p2*Yeml2adjYe - (12*gYBp2*Yeml2adjYe)/5._dp -       & 
&  6*gYB*gBL*sqrt2ov5*Yeml2adjYe - 6*g1*gBY*sqrt2ov5*Yeml2adjYe - 12*TrYdadjYd*Yeml2adjYe -& 
&  4*TrYeadjYe*Yeml2adjYe - 4._dp*(Yeml2adjYeYeadjYe) - 4._dp*(Yeml2adjYvYvadjYe) +      & 
&  (3*(3*id3R*(1248*g1p4*M1 + 16*g1p3*(104*gYB*MBBp + 69*gBY*M1*sqrt10 + 23*gBL*MBBp*sqrt10) +& 
&  4*g1p2*(104*gYBp2*(2._dp*(M1) + MBp) + 5*(237*gBYp2*M1 + 158*gBL*gBY*MBBp +           & 
&  10*gBLp2*(2._dp*(M1) + MBp)) + 46*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) + & 
&  gBY*(20*gYBp2*(79*gBL*MBBp + 10*gBY*(2._dp*(M1) + MBp)) + 325*(3*gBYp3*M1 +           & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 184*gYBp3*MBBp*sqrt10 +& 
&  180*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) +          & 
&  4*g1*(208*gYBp3*MBBp + 5*gYB*(79*gBLp2*MBBp + 158*gBYp2*MBBp + 59*gBL*gBY*(2._dp*(M1) +& 
&  MBp)) + 46*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 45*(6*gBYp3*M1 +      & 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp))*sqrt10)) -              & 
&  40*(-(g1*(2._dp*(g1) + gBY*sqrt10)*TeadjYe) + (4*g1p2*M1 + 4*g1*gYB*MBBp +            & 
&  2*g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10)*YeadjYe))*Conjg(M1))/100._dp  
betame22 =  betame22+ (3*(3*id3R*(416*g1p4*MBBp + 416*gYBp4*MBBp + 10*gYBp2*(158*gBLp2*MBBp +               & 
&  99*gBYp2*MBBp + 79*gBL*gBY*(M1 + 2._dp*(MBp))) + 325*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp +& 
&  gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  92*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 90*gYB*(4*gBLp3*MBBp +        & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  4*g1p3*(104*gYB*(2._dp*(M1) + MBp) + 23*(2*gBL*M1 + 4*gBY*MBBp + gBL*MBp)*sqrt10) +   & 
&  2*g1p2*(832*gYBp2*MBBp + 5*(99*gBLp2*MBBp + 158*gBYp2*MBBp + 79*gBL*gBY*(2._dp*(M1) + & 
&  MBp)) + 46*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(208*gYBp3*(M1 +& 
&  2._dp*(MBp)) + 5*gYB*(434*gBL*gBY*MBBp + 79*gBYp2*(2._dp*(M1) + MBp) + 79*gBLp2*(M1 + & 
&  2._dp*(MBp))) + 46*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 +             & 
&  45*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +    & 
&  2._dp*(MBp)))*sqrt10)) - 20*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TeadjYe) + & 
&  (4*g1p2*MBBp + g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) +         & 
&  gYB*(gBY*(M1 + MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YeadjYe))*Conjg(MBBp))/50._dp +& 
&  (531*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp + 18*g1p2*gBLp2*id3R*M1*Conjg(MBp) +    & 
&  (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (936*g1p2*gYBp2*id3R*M1*Conjg(MBp))/25._dp +& 
&  18*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + (1872*gYB*g1p3*id3R*MBBp*Conjg(MBp))/25._dp +     & 
&  (711*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp + (1422*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + (711*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp +  & 
&  (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp + (1422*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (3744*g1*gYBp3*id3R*MBBp*Conjg(MBp))/25._dp + (414*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp  
betame22 =  betame22+ 81*g1*gBY*gBLp2*id3R*M1*sqrt2ov5*Conjg(MBp) + 81*gYB*gBL*gBYp2*id3R*M1*sqrt2ov5*Conjg(MBp) +& 
&  (414*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp + (414*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  (1242*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 486*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  162*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 243*g1*gBL*gBYp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  81*gYB*gBYp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + (2484*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  (828*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + (12*gYBp2*TeadjYe*Conjg(MBp))/5._dp +& 
&  6*gYB*gBL*sqrt2ov5*TeadjYe*Conjg(MBp) - (24*g1*gYB*MBBp*YeadjYe*Conjg(MBp))/5._dp -   & 
&  6*g1*gBL*MBBp*sqrt2ov5*YeadjYe*Conjg(MBp) - 6*gYB*gBY*MBBp*sqrt2ov5*YeadjYe*Conjg(MBp) -& 
&  12*g2p2*TeadjYe*Conjg(M2) + (24*g1p2*id3R*Tr2U1(1,1))/5._dp + 3*gBYp2*id3R*Tr2U1(1,   & 
& 1) + 12*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,1) + (24*g1*gYB*id3R*Tr2U1(1,4))/5._dp +          & 
&  3*gBL*gBY*id3R*Tr2U1(1,4) + 6*g1*gBL*id3R*sqrt2ov5*Tr2U1(1,4) + 6*gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,& 
& 4) + (24*g1*gYB*id3R*Tr2U1(4,1))/5._dp + 3*gBL*gBY*id3R*Tr2U1(4,1) + 6*g1*gBL*id3R*sqrt2ov5*Tr2U1(4,& 
& 1) + 6*gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,1) + 3*gBLp2*id3R*Tr2U1(4,4) + (24*gYBp2*id3R*Tr2U1(4,& 
& 4))/5._dp + 12*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,4) + 8*g1*id3R*sqrt3ov5*Tr3(1) +          & 
&  2*gBY*id3R*sqrt6*Tr3(1) + 8*gYB*id3R*sqrt3ov5*Tr3(4) + 2*gBL*id3R*sqrt6*Tr3(4)

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = -3*AbsMBp*gBLp2*id3R + 2._dp*(mv2YvadjYv) + 4._dp*(mv2YxCYx)              & 
&  + 4._dp*(TvadjTv) + 8._dp*(TxCTx) + 4*mHu2*YvadjYv + 2._dp*(YvadjYvmv2)               & 
&  + 4._dp*(Yvml2adjYv) + 8._dp*(YxCmv2CYx) + 8*mC12*YxCYx + 4._dp*(YxCYxmv2)            & 
&  - 3*gBY*id3R*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 3*id3R*(gBLp2*MBBp + gBYp2*MBBp +        & 
&  gBL*gBY*(M1 + MBp))*Conjg(MBBp) - 3*gBL*gBY*id3R*MBBp*Conjg(MBp) + gBY*id3R*sqrt3ov2*Tr1(1)& 
&  + gBL*id3R*sqrt3ov2*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamv22 = (198*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp + (351*AbsMBp*gBLp4*id3R)/4._dp +              & 
&  (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp + (297*AbsMBp*gBLp2*gYBp2*id3R)/5._dp -           & 
&  2._dp*(mv2YvadjYeYeadjYv) + (6*g1p2*mv2YvadjYv)/5._dp + 6*g2p2*mv2YvadjYv +           & 
&  (6*gYBp2*mv2YvadjYv)/5._dp - 2._dp*(mv2YvadjYvYvadjYv) - 8._dp*(mv2YxCYvTpYvCYx) +    & 
&  12*gBLp2*mv2YxCYx + 12*gBYp2*mv2YxCYx - 16._dp*(mv2YxCYxYxCYx) + 36*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 +& 
&  108*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 + 36*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 +          & 
&  3*gYB*gBL*mv2YvadjYv*sqrt2ov5 + 3*g1*gBY*mv2YvadjYv*sqrt2ov5 - 6*mv2YvadjYv*TrYuadjYu -& 
&  2*mv2YvadjYv*TrYvadjYv - 8*mv2YxCYx*TrYxCYx - 4._dp*(TvadjTeYeadjYv) + (12*g1p2*TvadjTv)/5._dp +& 
&  12*g2p2*TvadjTv + (12*gYBp2*TvadjTv)/5._dp + 6*gYB*gBL*sqrt2ov5*TvadjTv +             & 
&  6*g1*gBY*sqrt2ov5*TvadjTv - 12*TrYuadjYu*TvadjTv - 4*TrYvadjYv*TvadjTv -              & 
&  4._dp*(TvadjTvYvadjYv) - 4._dp*(TvadjYeYeadjTv) - 12*TrCTuTpYu*TvadjYv -              & 
&  4*TrCTvTpYv*TvadjYv - 4._dp*(TvadjYvYvadjTv) - 16._dp*(TxCTvTpYvCYx) + 24*gBLp2*TxCTx +& 
&  24*gBYp2*TxCTx - 16*TrYxCYx*TxCTx - 32._dp*(TxCTxYxCYx) - 16._dp*(TxCYvTpYvCTx) -     & 
&  16*TrYxCTx*TxCYx - 32._dp*(TxCYxYxCTx) - 4._dp*(YvadjTeTeadjYv) - (12*g1p2*M1*YvadjTv)/5._dp -& 
&  (24*g1*gYB*MBBp*YvadjTv)/5._dp - (12*gYBp2*MBp*YvadjTv)/5._dp - 12*g2p2*M2*YvadjTv -  & 
&  6*g1*gBY*M1*sqrt2ov5*YvadjTv - 6*g1*gBL*MBBp*sqrt2ov5*YvadjTv - 6*gYB*gBY*MBBp*sqrt2ov5*YvadjTv -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YvadjTv - 12*TradjYuTu*YvadjTv - 4*TradjYvTv*YvadjTv -         & 
&  4._dp*(YvadjTvTvadjYv) - 4._dp*(YvadjYeme2YeadjYv) - 4._dp*(YvadjYeTeadjTv) -         & 
&  4*mHd2*YvadjYeYeadjYv - 4*mHu2*YvadjYeYeadjYv - 2._dp*(YvadjYeYeadjYvmv2) -           & 
&  4._dp*(YvadjYeYeml2adjYv) + 24*AbsM2*g2p2*YvadjYv + (24*AbsMBp*gYBp2*YvadjYv)/5._dp + & 
&  (12*g1p2*mHu2*YvadjYv)/5._dp + 12*g2p2*mHu2*YvadjYv + (12*gYBp2*mHu2*YvadjYv)/5._dp  
betamv22 =  betamv22+ 12*AbsMBp*gYB*gBL*sqrt2ov5*YvadjYv + 6*gYB*gBL*mHu2*sqrt2ov5*YvadjYv + 6*g1*gBY*mHu2*sqrt2ov5*YvadjYv -& 
&  12*TrCTuTpTu*YvadjYv - 4*TrCTvTpTv*YvadjYv - 4*Trml2adjYvYv*YvadjYv - 12*Trmq2adjYuYu*YvadjYv -& 
&  12*Trmu2YuadjYu*YvadjYv - 4*Trmv2YvadjYv*YvadjYv - 24*mHu2*TrYuadjYu*YvadjYv -        & 
&  8*mHu2*TrYvadjYv*YvadjYv + (6*g1p2*YvadjYvmv2)/5._dp + 6*g2p2*YvadjYvmv2 +            & 
&  (6*gYBp2*YvadjYvmv2)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYvmv2 + 3*g1*gBY*sqrt2ov5*YvadjYvmv2 -& 
&  6*TrYuadjYu*YvadjYvmv2 - 2*TrYvadjYv*YvadjYvmv2 - 4._dp*(YvadjYvmv2YvadjYv) -         & 
&  4._dp*(YvadjYvTvadjTv) - 8*mHu2*YvadjYvYvadjYv - 2._dp*(YvadjYvYvadjYvmv2) -          & 
&  4._dp*(YvadjYvYvml2adjYv) - 4._dp*(Yvml2adjYeYeadjYv) + (12*g1p2*Yvml2adjYv)/5._dp +  & 
&  12*g2p2*Yvml2adjYv + (12*gYBp2*Yvml2adjYv)/5._dp + 6*gYB*gBL*sqrt2ov5*Yvml2adjYv +    & 
&  6*g1*gBY*sqrt2ov5*Yvml2adjYv - 12*TrYuadjYu*Yvml2adjYv - 4*TrYvadjYv*Yvml2adjYv -     & 
&  4._dp*(Yvml2adjYvYvadjYv) - 16._dp*(YxCmv2CYvTpYvCYx) + 24*gBLp2*YxCmv2CYx +          & 
&  24*gBYp2*YxCmv2CYx - 16*TrYxCYx*YxCmv2CYx - 32._dp*(YxCmv2CYxYxCYx) - 16._dp*(YxCTvTpTvCYx) -& 
&  24*gBYp2*M1*YxCTx - 48*gBL*gBY*MBBp*YxCTx - 24*gBLp2*MBp*YxCTx - 16*TrCYxTx*YxCTx -   & 
&  32._dp*(YxCTxTxCYx) - 16._dp*(YxCYvCml2TpYvCYx) - 16._dp*(YxCYvTpTvCTx) -             & 
&  16._dp*(YxCYvTpYvCmv2CYx) - 16*mC12*YxCYvTpYvCYx - 16*mHu2*YxCYvTpYvCYx -             & 
&  8._dp*(YxCYvTpYvCYxmv2) + 48*AbsMBp*gBLp2*YxCYx + 24*gBLp2*mC12*YxCYx +               & 
&  24*gBYp2*mC12*YxCYx - 16*TrCTxTx*YxCYx - 32*Trmv2YxCYx*YxCYx - 32*mC12*TrYxCYx*YxCYx +& 
&  12*gBLp2*YxCYxmv2 + 12*gBYp2*YxCYxmv2 - 8*TrYxCYx*YxCYxmv2 - 32._dp*(YxCYxmv2YxCYx) - & 
&  32._dp*(YxCYxTxCTx) - 32._dp*(YxCYxYxCmv2CYx) - 64*mC12*YxCYxYxCYx - 16._dp*(YxCYxYxCYxmv2) +& 
&  (3*(3*id3R*(44*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) + gBY*(44*gBL*gYBp2*MBBp +            & 
&  65*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +            & 
&  MBp)) + 8*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) +    & 
&  4*g1*(11*gYB*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) +               & 
&  2*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +               & 
&  MBp))*sqrt10)) + 8*(-2*g1p2*TvadjYv - g1*gBY*sqrt10*TvadjYv - 20*gBYp2*TxCYx +        & 
&  (4*g1p2*M1 + 4*g1*gYB*MBBp + 2*g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10)*YvadjYv +& 
&  40*gBY*(gBY*M1 + gBL*MBBp)*YxCYx))*Conjg(M1))/20._dp + (3*(3*id3R*(22*g1p2*(gBLp2*MBBp +& 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 22*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp +    & 
&  gBL*gBY*(M1 + 2._dp*(MBp))) + 65*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp +      & 
&  gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 4*gYB*(4*gBLp3*MBBp +  & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  2*g1*(11*gYB*(6*gBL*gBY*MBBp + gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) + & 
&  2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +     & 
&  2._dp*(MBp)))*sqrt10)) + 4*(-4*g1*gYB*TvadjYv - g1*gBL*sqrt10*TvadjYv -               & 
&  gYB*gBY*sqrt10*TvadjYv - 40*gBL*gBY*TxCYx + (4*g1p2*MBBp + g1*(4*gYB*(M1 +            & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 + MBp)*sqrt10 +           & 
&  2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YvadjYv + 40*(gBLp2*MBBp + gBYp2*MBBp +           & 
&  gBL*gBY*(M1 + MBp))*YxCYx))*Conjg(MBBp))/10._dp + (99*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp  
betamv22 =  betamv22+ (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (99*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (198*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp + 117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) +  & 
&  (99*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp + (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp +& 
&  (198*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp + 18*g1*gBY*gBLp2*id3R*M1*sqrt2ov5*Conjg(MBp) +& 
&  18*gYB*gBL*gBYp2*id3R*M1*sqrt2ov5*Conjg(MBp) + 108*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  36*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 54*g1*gBL*gBYp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  18*gYB*gBYp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) - (12*gYBp2*TvadjYv*Conjg(MBp))/5._dp -    & 
&  6*gYB*gBL*sqrt2ov5*TvadjYv*Conjg(MBp) - 24*gBLp2*TxCYx*Conjg(MBp) + (24*g1*gYB*MBBp*YvadjYv*Conjg(MBp))/5._dp +& 
&  6*g1*gBL*MBBp*sqrt2ov5*YvadjYv*Conjg(MBp) + 6*gYB*gBY*MBBp*sqrt2ov5*YvadjYv*Conjg(MBp) +& 
&  48*gBL*gBY*MBBp*YxCYx*Conjg(MBp) - 12*g2p2*TvadjYv*Conjg(M2) + 3*gBYp2*id3R*Tr2U1(1,  & 
& 1) + 3*gBL*gBY*id3R*Tr2U1(1,4) + 3*gBL*gBY*id3R*Tr2U1(4,1) + 3*gBLp2*id3R*Tr2U1(4,     & 
& 4) + 2*gBY*id3R*sqrt6*Tr3(1) + 2*gBL*id3R*sqrt6*Tr3(4)

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! mC12 
!-------------------- 
 
betamC121  = -12*AbsMBp*gBLp2 + 4._dp*(TrCTxTx) + 8._dp*(Trmv2YxCYx) + 4*mC12*TrYxCYx -& 
&  12*gBY*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 12*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +    & 
&  MBp))*Conjg(MBBp) - 12*gBL*gBY*MBBp*Conjg(MBp) - gBY*sqrt6*Tr1(1) - gBL*sqrt6*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamC122 = (2*(396*AbsMBp*g1*gYB*gBL*gBY + 1080*AbsMBp*gBLp4 + 720*AbsMBp*gBLp2*gBYp2 +          & 
&  594*AbsMBp*gBLp2*gYBp2 + 72*AbsMBp*g1*gBY*gBLp2*sqrt10 + 216*AbsMBp*gYB*gBLp3*sqrt10 +& 
&  72*AbsMBp*gYB*gBL*gBYp2*sqrt10 - 15*gBLp2*TrCTxTx - 15*gBYp2*TrCTxTx - 40._dp*(TrCYxTxCTvTpYv) -& 
&  40._dp*(Trml2adjYvYxCYxYv) - 40._dp*(Trmv2YvadjYvYxCYx) - 30*gBLp2*Trmv2YxCYx -       & 
&  30*gBYp2*Trmv2YxCYx - 40._dp*(Trmv2YxCYxYvadjYv) - 320._dp*(Trmv2YxCYxYxCYx) -        & 
&  40._dp*(TrYvadjYvTxCTx) - 40._dp*(TrYxCmv2CYxYvadjYv) + 15*gBYp2*M1*TrYxCTx +         & 
&  30*gBL*gBY*MBBp*TrYxCTx + 15*gBLp2*MBp*TrYxCTx - 40._dp*(TrYxCTxTvadjYv) -            & 
&  160._dp*(TrYxCTxTxCYx) - 30*AbsMBp*gBLp2*TrYxCYx - 15*gBLp2*mC12*TrYxCYx -            & 
&  15*gBYp2*mC12*TrYxCYx - 40._dp*(TrYxCYxTvadjTv) - 160._dp*(TrYxCYxTxCTx) -            & 
&  40*mC12*TrYxCYxYvadjYv - 40*mHu2*TrYxCYxYvadjYv - 160*mC12*TrYxCYxYxCYx +             & 
&  3*(6*(11*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) + gBY*(11*gBL*gYBp2*MBBp + 20*(3*gBYp3*M1 + & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*gYB*(3*gBLp2*MBBp +& 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(11*gYB*(gBLp2*MBBp +         & 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 2*(6*gBYp3*M1 + gBLp3*MBBp +             & 
&  6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp))*sqrt10)) + 5*gBYp2*TrCYxTx -         & 
&  10*gBY*(gBY*M1 + gBL*MBBp)*TrYxCYx)*Conjg(M1) + 6*(3*(11*g1p2*(gBLp2*MBBp +           & 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 11*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp +    & 
&  gBL*gBY*(M1 + 2._dp*(MBp))) + 40*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp +      & 
&  gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 2*gYB*(4*gBLp3*MBBp +  & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  g1*(11*gYB*(6*gBL*gBY*MBBp + gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) +   & 
&  2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +     & 
&  2._dp*(MBp)))*sqrt10)) + 5*gBL*gBY*TrCYxTx - 5*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp))*TrYxCYx)*Conjg(MBBp) + 198*g1*gYB*gBL*gBY*M1*Conjg(MBp) +         & 
&  360*gBLp2*gBYp2*M1*Conjg(MBp) + 198*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 396*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  1440*gBY*gBLp3*MBBp*Conjg(MBp) + 198*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 720*gBL*gBYp3*MBBp*Conjg(MBp) +& 
&  396*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 36*g1*gBY*gBLp2*M1*sqrt10*Conjg(MBp) +            & 
&  36*gYB*gBL*gBYp2*M1*sqrt10*Conjg(MBp) + 216*gYB*gBY*gBLp2*MBBp*sqrt10*Conjg(MBp) +    & 
&  72*g1*gBLp3*MBBp*sqrt10*Conjg(MBp) + 108*g1*gBL*gBYp2*MBBp*sqrt10*Conjg(MBp) +        & 
&  36*gYB*gBYp3*MBBp*sqrt10*Conjg(MBp) + 15*gBLp2*TrCYxTx*Conjg(MBp) - 30*gBL*gBY*MBBp*TrYxCYx*Conjg(MBp) +& 
&  30*gBYp2*Tr2U1(1,1) + 30*gBL*gBY*Tr2U1(1,4) + 30*gBL*gBY*Tr2U1(4,1) + 30*gBLp2*Tr2U1(4,& 
& 4) - 10*gBY*sqrt6*Tr3(1) - 10*gBL*sqrt6*Tr3(4)))/5._dp

 
DmC12 = oo16pi2*( betamC121 + oo16pi2 * betamC122 ) 

 
Else 
DmC12 = oo16pi2* betamC121 
End If 
 
 
!-------------------- 
! mC22 
!-------------------- 
 
betamC221  = -12*AbsMBp*gBLp2 - 12*gBY*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 12*(gBLp2*MBBp +& 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp))*Conjg(MBBp) - 12*gBL*gBY*MBBp*Conjg(MBp)             & 
&  + gBY*sqrt6*Tr1(1) + gBL*sqrt6*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamC222 = (4*(198*AbsMBp*g1*gYB*gBL*gBY + 540*AbsMBp*gBLp4 + 360*AbsMBp*gBLp2*gBYp2 +           & 
&  297*AbsMBp*gBLp2*gYBp2 + 36*AbsMBp*g1*gBY*gBLp2*sqrt10 + 108*AbsMBp*gYB*gBLp3*sqrt10 +& 
&  36*AbsMBp*gYB*gBL*gBYp2*sqrt10 + 9*(11*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) +             & 
&  gBY*(11*gBL*gYBp2*MBBp + 20*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp +           & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +& 
&  MBp))*sqrt10) + g1*(11*gYB*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +         & 
&  MBp)) + 2*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +       & 
&  MBp))*sqrt10))*Conjg(M1) + 9*(11*g1p2*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +& 
&  MBp)) + 11*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + 2._dp*(MBp))) +           & 
&  40*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +            & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 2*gYB*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp +       & 
&  gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 + g1*(11*gYB*(6*gBL*gBY*MBBp +& 
&  gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) + 2*(8*gBY*gBLp2*MBBp +          & 
&  4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp)))*sqrt10))*Conjg(MBBp) +& 
&  99*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 180*gBLp2*gBYp2*M1*Conjg(MBp) + 99*g1p2*gBL*gBY*MBBp*Conjg(MBp) +& 
&  198*g1*gYB*gBLp2*MBBp*Conjg(MBp) + 720*gBY*gBLp3*MBBp*Conjg(MBp) + 99*g1*gYB*gBYp2*MBBp*Conjg(MBp) +& 
&  360*gBL*gBYp3*MBBp*Conjg(MBp) + 198*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 18*g1*gBY*gBLp2*M1*sqrt10*Conjg(MBp) +& 
&  18*gYB*gBL*gBYp2*M1*sqrt10*Conjg(MBp) + 108*gYB*gBY*gBLp2*MBBp*sqrt10*Conjg(MBp) +    & 
&  36*g1*gBLp3*MBBp*sqrt10*Conjg(MBp) + 54*g1*gBL*gBYp2*MBBp*sqrt10*Conjg(MBp) +         & 
&  18*gYB*gBYp3*MBBp*sqrt10*Conjg(MBp) + 15*gBYp2*Tr2U1(1,1) + 15*gBL*gBY*Tr2U1(1,       & 
& 4) + 15*gBL*gBY*Tr2U1(4,1) + 15*gBLp2*Tr2U1(4,4) + 5*gBY*sqrt6*Tr3(1) + 5*gBL*sqrt6*Tr3(4)))/5._dp

 
DmC22 = oo16pi2*( betamC221 + oo16pi2 * betamC222 ) 

 
Else 
DmC22 = oo16pi2* betamC221 
End If 
 
 
!-------------------- 
! MBBp 
!-------------------- 
 
betaMBBp1  = (3*(11*g1p2*MBBp + 11*gYBp2*MBBp + 15*(gBLp2*MBBp + gBYp2*MBBp +         & 
&  gBL*gBY*(M1 + MBp)) + 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + g1*(11*gYB*(M1 +   & 
&  MBp) + 2*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaMBBp2 = (1194*gYB*g1p3*M1 + 270*g1*gYB*g2p2*M1 + 880*g1*gYB*g3p2*M1 + 2070*g1p2*gBL*gBY*M1 +  & 
&  450*g2p2*gBL*gBY*M1 + 400*g3p2*gBL*gBY*M1 + 690*g1*gYB*gBLp2*M1 + 1250*gBY*gBLp3*M1 + & 
&  2070*g1*gYB*gBYp2*M1 + 3750*gBL*gBYp3*M1 + 690*gBL*gBY*gYBp2*M1 + 398*g1*gYBp3*M1 +   & 
&  398*g1p4*MBBp + 270*g1p2*g2p2*MBBp + 880*g1p2*g3p2*MBBp + 5520*g1*gYB*gBL*gBY*MBBp +  & 
&  1380*g1p2*gBLp2*MBBp + 450*g2p2*gBLp2*MBBp + 400*g3p2*gBLp2*MBBp + 1250*gBLp4*MBBp +  & 
&  1380*g1p2*gBYp2*MBBp + 450*g2p2*gBYp2*MBBp + 400*g3p2*gBYp2*MBBp + 7500*gBLp2*gBYp2*MBBp +& 
&  1250*gBYp4*MBBp + 2388*g1p2*gYBp2*MBBp + 270*g2p2*gYBp2*MBBp + 880*g3p2*gYBp2*MBBp +  & 
&  1380*gBLp2*gYBp2*MBBp + 1380*gBYp2*gYBp2*MBBp + 398*gYBp4*MBBp + 398*gYB*g1p3*MBp +   & 
&  270*g1*gYB*g2p2*MBp + 880*g1*gYB*g3p2*MBp + 690*g1p2*gBL*gBY*MBp + 450*g2p2*gBL*gBY*MBp +& 
&  400*g3p2*gBL*gBY*MBp + 2070*g1*gYB*gBLp2*MBp + 3750*gBY*gBLp3*MBp + 690*g1*gYB*gBYp2*MBp +& 
&  1250*gBL*gBYp3*MBp + 2070*gBL*gBY*gYBp2*MBp + 1194*g1*gYBp3*MBp + 1760*g1*gYB*g3p2*M3 +& 
&  800*g3p2*gBL*gBY*M3 + 540*g1*gYB*g2p2*M2 + 900*g2p2*gBL*gBY*M2 + 246*g1p3*gBL*M1*sqrt10 +& 
&  90*g1*g2p2*gBL*M1*sqrt10 + 80*g1*g3p2*gBL*M1*sqrt10 + 738*gYB*g1p2*gBY*M1*sqrt10 +    & 
&  90*gYB*g2p2*gBY*M1*sqrt10 + 80*gYB*g3p2*gBY*M1*sqrt10 + 210*gYB*gBY*gBLp2*M1*sqrt10 + & 
&  70*g1*gBLp3*M1*sqrt10 + 630*g1*gBL*gBYp2*M1*sqrt10 + 210*gYB*gBYp3*M1*sqrt10 +        & 
&  246*g1*gBL*gYBp2*M1*sqrt10 + 82*gBY*gYBp3*M1*sqrt10 + 984*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  180*gYB*g2p2*gBL*MBBp*sqrt10 + 160*gYB*g3p2*gBL*MBBp*sqrt10 + 328*g1p3*gBY*MBBp*sqrt10 +& 
&  180*g1*g2p2*gBY*MBBp*sqrt10 + 160*g1*g3p2*gBY*MBBp*sqrt10 + 840*g1*gBY*gBLp2*MBBp*sqrt10 +& 
&  280*gYB*gBLp3*MBBp*sqrt10 + 840*gYB*gBL*gBYp2*MBBp*sqrt10 + 280*g1*gBYp3*MBBp*sqrt10 +& 
&  984*g1*gBY*gYBp2*MBBp*sqrt10 + 328*gBL*gYBp3*MBBp*sqrt10 + 82*g1p3*gBL*MBp*sqrt10 +   & 
&  90*g1*g2p2*gBL*MBp*sqrt10 + 80*g1*g3p2*gBL*MBp*sqrt10 + 246*gYB*g1p2*gBY*MBp*sqrt10 + & 
&  90*gYB*g2p2*gBY*MBp*sqrt10 + 80*gYB*g3p2*gBY*MBp*sqrt10 + 630*gYB*gBY*gBLp2*MBp*sqrt10 +& 
&  210*g1*gBLp3*MBp*sqrt10 + 210*g1*gBL*gBYp2*MBp*sqrt10 + 70*gYB*gBYp3*MBp*sqrt10 +     & 
&  738*g1*gBL*gYBp2*MBp*sqrt10 + 246*gBY*gYBp3*MBp*sqrt10 + 160*g1*g3p2*gBL*M3*sqrt10 +  & 
&  160*gYB*g3p2*gBY*M3*sqrt10 + 180*g1*g2p2*gBL*M2*sqrt10 + 180*gYB*g2p2*gBY*M2*sqrt10 + & 
&  280*g1*gYB*TradjYdTd + 100*gBL*gBY*TradjYdTd - 10*g1*gBL*sqrt10*TradjYdTd -           & 
&  10*gYB*gBY*sqrt10*TradjYdTd + 360*g1*gYB*TradjYeTe + 300*gBL*gBY*TradjYeTe +          & 
&  90*g1*gBL*sqrt10*TradjYeTe + 90*gYB*gBY*sqrt10*TradjYeTe + 520*g1*gYB*TradjYuTu +     & 
&  100*gBL*gBY*TradjYuTu + 50*g1*gBL*sqrt10*TradjYuTu + 50*gYB*gBY*sqrt10*TradjYuTu +    & 
&  120*g1*gYB*TradjYvTv + 300*gBL*gBY*TradjYvTv + 30*g1*gBL*sqrt10*TradjYvTv +           & 
&  30*gYB*gBY*sqrt10*TradjYvTv + 900*gBL*gBY*TrCYxTx - 5*(28*g1p2*MBBp + 28*gYBp2*MBBp + & 
&  10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) - gYB*(2*gBL*MBBp + gBY*(M1 +       & 
&  MBp))*sqrt10 + g1*(28*gYB*(M1 + MBp) - (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*MBBp + 12*gYBp2*MBBp + 10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +        & 
&  MBp)) + 3*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + 3*g1*(4*gYB*(M1 + MBp) +         & 
&  (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYeadjYe - 260*g1*gYB*M1*TrYuadjYu -          & 
&  50*gBL*gBY*M1*TrYuadjYu - 260*g1p2*MBBp*TrYuadjYu - 50*gBLp2*MBBp*TrYuadjYu -         & 
&  50*gBYp2*MBBp*TrYuadjYu - 260*gYBp2*MBBp*TrYuadjYu - 260*g1*gYB*MBp*TrYuadjYu -       & 
&  50*gBL*gBY*MBp*TrYuadjYu - 25*g1*gBL*M1*sqrt10*TrYuadjYu - 25*gYB*gBY*M1*sqrt10*TrYuadjYu -& 
&  50*gYB*gBL*MBBp*sqrt10*TrYuadjYu - 50*g1*gBY*MBBp*sqrt10*TrYuadjYu - 25*g1*gBL*MBp*sqrt10*TrYuadjYu -& 
&  25*gYB*gBY*MBp*sqrt10*TrYuadjYu - 60*g1*gYB*M1*TrYvadjYv - 150*gBL*gBY*M1*TrYvadjYv - & 
&  60*g1p2*MBBp*TrYvadjYv - 150*gBLp2*MBBp*TrYvadjYv - 150*gBYp2*MBBp*TrYvadjYv -        & 
&  60*gYBp2*MBBp*TrYvadjYv - 60*g1*gYB*MBp*TrYvadjYv - 150*gBL*gBY*MBp*TrYvadjYv -       & 
&  15*g1*gBL*M1*sqrt10*TrYvadjYv - 15*gYB*gBY*M1*sqrt10*TrYvadjYv - 30*gYB*gBL*MBBp*sqrt10*TrYvadjYv -& 
&  30*g1*gBY*MBBp*sqrt10*TrYvadjYv - 15*g1*gBL*MBp*sqrt10*TrYvadjYv - 15*gYB*gBY*MBp*sqrt10*TrYvadjYv -& 
&  450*gBL*gBY*M1*TrYxCYx - 450*gBLp2*MBBp*TrYxCYx - 450*gBYp2*MBBp*TrYxCYx -            & 
&  450*gBL*gBY*MBp*TrYxCYx)/50._dp

 
DMBBp = oo16pi2*( betaMBBp1 + oo16pi2 * betaMBBp2 ) 

 
Else 
DMBBp = oo16pi2* betaMBBp1 
End If 
 
 
Call Chop(DMBBp) 

If (.not.KineticMixing) DMBBp  = 0._dp 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (6*(11*g1p2*M1 + gBY*(15*gBY*M1 + 15*gBL*MBBp + 2*gYB*MBBp*sqrt10)         & 
&  + g1*(11*gYB*MBBp + 4*gBY*M1*sqrt10 + 2*gBL*MBBp*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = (796*g1p4*M1 + 270*g1p2*g2p2*M1 + 880*g1p2*g3p2*M1 + 920*g1*gYB*gBL*gBY*M1 +          & 
&  230*g1p2*gBLp2*M1 + 2760*g1p2*gBYp2*M1 + 450*g2p2*gBYp2*M1 + 400*g3p2*gBYp2*M1 +      & 
&  1250*gBLp2*gBYp2*M1 + 2500*gBYp4*M1 + 398*g1p2*gYBp2*M1 + 230*gBYp2*gYBp2*M1 +        & 
&  1194*gYB*g1p3*MBBp + 270*g1*gYB*g2p2*MBBp + 880*g1*gYB*g3p2*MBBp + 2070*g1p2*gBL*gBY*MBBp +& 
&  450*g2p2*gBL*gBY*MBBp + 400*g3p2*gBL*gBY*MBBp + 690*g1*gYB*gBLp2*MBBp +               & 
&  1250*gBY*gBLp3*MBBp + 2070*g1*gYB*gBYp2*MBBp + 3750*gBL*gBYp3*MBBp + 690*gBL*gBY*gYBp2*MBBp +& 
&  398*g1*gYBp3*MBBp + 920*g1*gYB*gBL*gBY*MBp + 230*g1p2*gBLp2*MBp + 1250*gBLp2*gBYp2*MBp +& 
&  398*g1p2*gYBp2*MBp + 230*gBYp2*gYBp2*MBp + 880*g1p2*g3p2*M3 + 400*g3p2*gBYp2*M3 +     & 
&  270*g1p2*g2p2*M2 + 450*g2p2*gBYp2*M2 + 164*gYB*g1p2*gBL*M1*sqrt10 + 656*g1p3*gBY*M1*sqrt10 +& 
&  180*g1*g2p2*gBY*M1*sqrt10 + 160*g1*g3p2*gBY*M1*sqrt10 + 140*g1*gBY*gBLp2*M1*sqrt10 +  & 
&  140*gYB*gBL*gBYp2*M1*sqrt10 + 560*g1*gBYp3*M1*sqrt10 + 164*g1*gBY*gYBp2*M1*sqrt10 +   & 
&  246*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 + 80*g1*g3p2*gBL*MBBp*sqrt10 +  & 
&  738*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 80*gYB*g3p2*gBY*MBBp*sqrt10 +& 
&  210*gYB*gBY*gBLp2*MBBp*sqrt10 + 70*g1*gBLp3*MBBp*sqrt10 + 630*g1*gBL*gBYp2*MBBp*sqrt10 +& 
&  210*gYB*gBYp3*MBBp*sqrt10 + 246*g1*gBL*gYBp2*MBBp*sqrt10 + 82*gBY*gYBp3*MBBp*sqrt10 + & 
&  164*gYB*g1p2*gBL*MBp*sqrt10 + 140*g1*gBY*gBLp2*MBp*sqrt10 + 140*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  164*g1*gBY*gYBp2*MBp*sqrt10 + 160*g1*g3p2*gBY*M3*sqrt10 + 180*g1*g2p2*gBY*M2*sqrt10 + & 
&  140*g1p2*TradjYdTd + 50*gBYp2*TradjYdTd - 10*g1*gBY*sqrt10*TradjYdTd + 180*g1p2*TradjYeTe +& 
&  150*gBYp2*TradjYeTe + 90*g1*gBY*sqrt10*TradjYeTe + 260*g1p2*TradjYuTu +               & 
&  50*gBYp2*TradjYuTu + 50*g1*gBY*sqrt10*TradjYuTu + 60*g1p2*TradjYvTv + 150*gBYp2*TradjYvTv +& 
&  30*g1*gBY*sqrt10*TradjYvTv + 450*gBYp2*TrCYxTx - 5*(28*g1p2*M1 + gBY*(10*gBY*M1 +     & 
&  10*gBL*MBBp - gYB*MBBp*sqrt10) - g1*(-28*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*M1 + gBY*(10*gBY*M1 + 10*gBL*MBBp + 3*gYB*MBBp*sqrt10) + 3*g1*(4*gYB*MBBp +& 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYeadjYe - 260*g1p2*M1*TrYuadjYu -               & 
&  50*gBYp2*M1*TrYuadjYu - 260*g1*gYB*MBBp*TrYuadjYu - 50*gBL*gBY*MBBp*TrYuadjYu -       & 
&  50*g1*gBY*M1*sqrt10*TrYuadjYu - 25*g1*gBL*MBBp*sqrt10*TrYuadjYu - 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu -& 
&  60*g1p2*M1*TrYvadjYv - 150*gBYp2*M1*TrYvadjYv - 60*g1*gYB*MBBp*TrYvadjYv -            & 
&  150*gBL*gBY*MBBp*TrYvadjYv - 30*g1*gBY*M1*sqrt10*TrYvadjYv - 15*g1*gBL*MBBp*sqrt10*TrYvadjYv -& 
&  15*gYB*gBY*MBBp*sqrt10*TrYvadjYv - 450*gBYp2*M1*TrYxCYx - 450*gBL*gBY*MBBp*TrYxCYx)/25._dp

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = (2*g2p2*(9*g1p2*M1 + 15*gBLp2*MBp + 120*g3p2*M3 + 9*g1p2*M2 + 250*g2p2*M2 +           & 
&  120*g3p2*M2 + 15*gBLp2*M2 + 30._dp*(TradjYdTd) + 10._dp*(TradjYeTe) + 30._dp*(TradjYuTu) +& 
&  10._dp*(TradjYvTv) - 30*M2*TrYdadjYd - 10*M2*TrYeadjYe - 30*M2*TrYuadjYu -            & 
&  10*M2*TrYvadjYv))/5._dp

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = (2*g3p2*(11*g1p2*M1 + 5*gBLp2*MBp + 11*g1p2*M3 + 45*g2p2*M3 + 140*g3p2*M3 +           & 
&  5*gBLp2*M3 + 45*g2p2*M2 + 20._dp*(TradjYdTd) + 20._dp*(TradjYuTu) - 20*M3*TrYdadjYd - & 
&  20*M3*TrYuadjYu))/5._dp

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! MBp 
!-------------------- 
 
betaMBp1  = (6*(11*gYBp2*MBp + 15*gBL*(gBY*MBBp + gBL*MBp) + 2*gYB*(gBY*MBBp +        & 
&  2*gBL*MBp)*sqrt10 + g1*MBBp*(11._dp*(gYB) + 2*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaMBp2 = (920*g1*gYB*gBL*gBY*M1 + 230*g1p2*gBLp2*M1 + 1250*gBLp2*gBYp2*M1 + 398*g1p2*gYBp2*M1 +& 
&  230*gBYp2*gYBp2*M1 + 398*gYB*g1p3*MBBp + 270*g1*gYB*g2p2*MBBp + 880*g1*gYB*g3p2*MBBp +& 
&  690*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 400*g3p2*gBL*gBY*MBBp +               & 
&  2070*g1*gYB*gBLp2*MBBp + 3750*gBY*gBLp3*MBBp + 690*g1*gYB*gBYp2*MBBp + 1250*gBL*gBYp3*MBBp +& 
&  2070*gBL*gBY*gYBp2*MBBp + 1194*g1*gYBp3*MBBp + 920*g1*gYB*gBL*gBY*MBp +               & 
&  230*g1p2*gBLp2*MBp + 450*g2p2*gBLp2*MBp + 400*g3p2*gBLp2*MBp + 2500*gBLp4*MBp +       & 
&  1250*gBLp2*gBYp2*MBp + 398*g1p2*gYBp2*MBp + 270*g2p2*gYBp2*MBp + 880*g3p2*gYBp2*MBp + & 
&  2760*gBLp2*gYBp2*MBp + 230*gBYp2*gYBp2*MBp + 796*gYBp4*MBp + 400*g3p2*gBLp2*M3 +      & 
&  880*g3p2*gYBp2*M3 + 450*g2p2*gBLp2*M2 + 270*g2p2*gYBp2*M2 + 164*gYB*g1p2*gBL*M1*sqrt10 +& 
&  140*g1*gBY*gBLp2*M1*sqrt10 + 140*gYB*gBL*gBYp2*M1*sqrt10 + 164*g1*gBY*gYBp2*M1*sqrt10 +& 
&  82*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 + 80*g1*g3p2*gBL*MBBp*sqrt10 +   & 
&  246*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 80*gYB*g3p2*gBY*MBBp*sqrt10 +& 
&  630*gYB*gBY*gBLp2*MBBp*sqrt10 + 210*g1*gBLp3*MBBp*sqrt10 + 210*g1*gBL*gBYp2*MBBp*sqrt10 +& 
&  70*gYB*gBYp3*MBBp*sqrt10 + 738*g1*gBL*gYBp2*MBBp*sqrt10 + 246*gBY*gYBp3*MBBp*sqrt10 + & 
&  164*gYB*g1p2*gBL*MBp*sqrt10 + 180*gYB*g2p2*gBL*MBp*sqrt10 + 160*gYB*g3p2*gBL*MBp*sqrt10 +& 
&  140*g1*gBY*gBLp2*MBp*sqrt10 + 560*gYB*gBLp3*MBp*sqrt10 + 140*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  164*g1*gBY*gYBp2*MBp*sqrt10 + 656*gBL*gYBp3*MBp*sqrt10 + 160*gYB*g3p2*gBL*M3*sqrt10 + & 
&  180*gYB*g2p2*gBL*M2*sqrt10 + 50*gBLp2*TradjYdTd + 140*gYBp2*TradjYdTd -               & 
&  10*gYB*gBL*sqrt10*TradjYdTd + 150*gBLp2*TradjYeTe + 180*gYBp2*TradjYeTe +             & 
&  90*gYB*gBL*sqrt10*TradjYeTe + 50*gBLp2*TradjYuTu + 260*gYBp2*TradjYuTu +              & 
&  50*gYB*gBL*sqrt10*TradjYuTu + 150*gBLp2*TradjYvTv + 60*gYBp2*TradjYvTv +              & 
&  30*gYB*gBL*sqrt10*TradjYvTv + 450*gBLp2*TrCYxTx - 5*(28*gYBp2*MBp + 10*gBL*(gBY*MBBp +& 
&  gBL*MBp) - gYB*(gBY*MBBp + 2*gBL*MBp)*sqrt10 + g1*MBBp*(28._dp*(gYB) - gBL*sqrt10))*TrYdadjYd -& 
&  15*(12*gYBp2*MBp + 10*gBL*(gBY*MBBp + gBL*MBp) + 3*gYB*(gBY*MBBp + 2*gBL*MBp)*sqrt10 +& 
&  3*g1*MBBp*(4._dp*(gYB) + gBL*sqrt10))*TrYeadjYe - 260*g1*gYB*MBBp*TrYuadjYu -         & 
&  50*gBL*gBY*MBBp*TrYuadjYu - 50*gBLp2*MBp*TrYuadjYu - 260*gYBp2*MBp*TrYuadjYu -        & 
&  25*g1*gBL*MBBp*sqrt10*TrYuadjYu - 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu - 50*gYB*gBL*MBp*sqrt10*TrYuadjYu -& 
&  60*g1*gYB*MBBp*TrYvadjYv - 150*gBL*gBY*MBBp*TrYvadjYv - 150*gBLp2*MBp*TrYvadjYv -     & 
&  60*gYBp2*MBp*TrYvadjYv - 15*g1*gBL*MBBp*sqrt10*TrYvadjYv - 15*gYB*gBY*MBBp*sqrt10*TrYvadjYv -& 
&  30*gYB*gBL*MBp*sqrt10*TrYvadjYv - 450*gBL*gBY*MBBp*TrYxCYx - 450*gBLp2*MBp*TrYxCYx)/25._dp

 
DMBp = oo16pi2*( betaMBp1 + oo16pi2 * betaMBp2 ) 

 
Else 
DMBp = oo16pi2* betaMBp1 
End If 
 
 
Call Chop(DMBp) 

Call ParametersToG316(Dg1,Dg2,Dg3,DgBL,DgYB,DgBY,DYd,DYe,DYu,DYx,DYv,DMuP,            & 
& DMu,DTd,DTe,DTu,DTx,DTv,DBMuP,DBmu,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,               & 
& Dmv2,DmC12,DmC22,DMBBp,DM1,DM2,DM3,DMBp,f)

Iname = Iname - 1 
 
End Subroutine rge316  

Subroutine GToParameters320(g,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,             & 
& Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,              & 
& M1,M2,M3,MBp,vd,vu,x1,x2)

Implicit None 
Real(dp), Intent(in) :: g(320) 
Real(dp),Intent(out) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters320' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
gBL= g(4) 
gYB= g(5) 
gBY= g(6) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+7), g(SumI+8), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+25), g(SumI+26), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yx(i1,i2) = Cmplx( g(SumI+61), g(SumI+62), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+79), g(SumI+80), dp) 
End Do 
 End Do 
 
MuP= Cmplx(g(97),g(98),dp) 
Mu= Cmplx(g(99),g(100),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+101), g(SumI+102), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+119), g(SumI+120), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+137), g(SumI+138), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tx(i1,i2) = Cmplx( g(SumI+155), g(SumI+156), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+173), g(SumI+174), dp) 
End Do 
 End Do 
 
BMuP= Cmplx(g(191),g(192),dp) 
Bmu= Cmplx(g(193),g(194),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+195), g(SumI+196), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+213), g(SumI+214), dp) 
End Do 
 End Do 
 
mHd2= g(231) 
mHu2= g(232) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+233), g(SumI+234), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+251), g(SumI+252), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+269), g(SumI+270), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+287), g(SumI+288), dp) 
End Do 
 End Do 
 
mC12= g(305) 
mC22= g(306) 
MBBp= Cmplx(g(307),g(308),dp) 
M1= Cmplx(g(309),g(310),dp) 
M2= Cmplx(g(311),g(312),dp) 
M3= Cmplx(g(313),g(314),dp) 
MBp= Cmplx(g(315),g(316),dp) 
vd= g(317) 
vu= g(318) 
x1= g(319) 
x2= g(320) 
Do i1=1,320 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters320

Subroutine ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,               & 
& Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,              & 
& M1,M2,M3,MBp,vd,vu,x1,x2,g)

Implicit None 
Real(dp), Intent(out) :: g(320) 
Real(dp), Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG320' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = gBL  
g(5) = gYB  
g(6) = gBY  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+7) = Real(Yd(i1,i2), dp) 
g(SumI+8) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+25) = Real(Ye(i1,i2), dp) 
g(SumI+26) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yu(i1,i2), dp) 
g(SumI+44) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+61) = Real(Yx(i1,i2), dp) 
g(SumI+62) = Aimag(Yx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+79) = Real(Yv(i1,i2), dp) 
g(SumI+80) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

g(97) = Real(MuP,dp)  
g(98) = Aimag(MuP)  
g(99) = Real(Mu,dp)  
g(100) = Aimag(Mu)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+101) = Real(Td(i1,i2), dp) 
g(SumI+102) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+119) = Real(Te(i1,i2), dp) 
g(SumI+120) = Aimag(Te(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+137) = Real(Tu(i1,i2), dp) 
g(SumI+138) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+155) = Real(Tx(i1,i2), dp) 
g(SumI+156) = Aimag(Tx(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+173) = Real(Tv(i1,i2), dp) 
g(SumI+174) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

g(191) = Real(BMuP,dp)  
g(192) = Aimag(BMuP)  
g(193) = Real(Bmu,dp)  
g(194) = Aimag(Bmu)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+195) = Real(mq2(i1,i2), dp) 
g(SumI+196) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+213) = Real(ml2(i1,i2), dp) 
g(SumI+214) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(231) = mHd2  
g(232) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+233) = Real(md2(i1,i2), dp) 
g(SumI+234) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+251) = Real(mu2(i1,i2), dp) 
g(SumI+252) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+269) = Real(me2(i1,i2), dp) 
g(SumI+270) = Aimag(me2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+287) = Real(mv2(i1,i2), dp) 
g(SumI+288) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(305) = mC12  
g(306) = mC22  
g(307) = Real(MBBp,dp)  
g(308) = Aimag(MBBp)  
g(309) = Real(M1,dp)  
g(310) = Aimag(M1)  
g(311) = Real(M2,dp)  
g(312) = Aimag(M2)  
g(313) = Real(M3,dp)  
g(314) = Aimag(M3)  
g(315) = Real(MBp,dp)  
g(316) = Aimag(MBp)  
g(317) = vd  
g(318) = vu  
g(319) = x1  
g(320) = x2  
Iname = Iname - 1 
 
End Subroutine ParametersToG320

Subroutine rge320(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,gBL,betagBL1,betagBL2,DgBL,gYB,betagYB1,betagYB2,DgYB,gBY,betagBY1,betagBY2,       & 
& DgBY,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,betamHu22,DmHu2,mC12,               & 
& betamC121,betamC122,DmC12,mC22,betamC221,betamC222,DmC22,vd,betavd1,betavd2,           & 
& Dvd,vu,betavu1,betavu2,Dvu,x1,betax11,betax12,Dx1,x2,betax21,betax22,Dx2
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3)       & 
& ,DYu(3,3),adjYu(3,3),Yx(3,3),betaYx1(3,3),betaYx2(3,3),DYx(3,3),adjYx(3,3)             & 
& ,Yv(3,3),betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),MuP,betaMuP1,betaMuP2,          & 
& DMuP,Mu,betaMu1,betaMu2,DMu,Td(3,3),betaTd1(3,3),betaTd2(3,3),DTd(3,3),adjTd(3,3)      & 
& ,Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3),adjTe(3,3),Tu(3,3),betaTu1(3,3)            & 
& ,betaTu2(3,3),DTu(3,3),adjTu(3,3),Tx(3,3),betaTx1(3,3),betaTx2(3,3),DTx(3,3)           & 
& ,adjTx(3,3),Tv(3,3),betaTv1(3,3),betaTv2(3,3),DTv(3,3),adjTv(3,3),BMuP,betaBMuP1,      & 
& betaBMuP2,DBMuP,Bmu,betaBmu1,betaBmu2,DBmu,mq2(3,3),betamq21(3,3),betamq22(3,3)        & 
& ,Dmq2(3,3),ml2(3,3),betaml21(3,3),betaml22(3,3),Dml2(3,3),md2(3,3),betamd21(3,3)       & 
& ,betamd22(3,3),Dmd2(3,3),mu2(3,3),betamu21(3,3),betamu22(3,3),Dmu2(3,3),               & 
& me2(3,3),betame21(3,3),betame22(3,3),Dme2(3,3),mv2(3,3),betamv21(3,3),betamv22(3,3)    & 
& ,Dmv2(3,3),MBBp,betaMBBp1,betaMBBp2,DMBBp,M1,betaM11,betaM12,DM1,M2,betaM21,           & 
& betaM22,DM2,M3,betaM31,betaM32,DM3,MBp,betaMBp1,betaMBp2,DMBp
Real(dp) :: Tr1(4),Tr2(4),Tr3(4) 
Real(dp) :: Tr2U1(4,4) 
Real(dp) :: AbsM2,AbsM3,AbsMBp
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2adjYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),        & 
& mu2Yu(3,3),mv2Yv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),YxCYx(3,3),      & 
& Yumq2(3,3),YuadjYu(3,3),Yvml2(3,3),YvadjYv(3,3),adjYdmd2(3,3),adjYdYd(3,3),            & 
& adjYdTd(3,3),adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),       & 
& adjYuTu(3,3),adjYvmv2(3,3),adjYvYx(3,3),adjYvYv(3,3),adjYvTx(3,3),adjYvTv(3,3),        & 
& adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),adjTvTv(3,3),Cmv2CYx(3,3),CYxmv2(3,3),          & 
& CYxYx(3,3),CYxYv(3,3),CYxTx(3,3),CYxTv(3,3),CYvTpYv(3,3),CYvTpTv(3,3),CTdTpTd(3,3),    & 
& CTeTpTe(3,3),CTxTx(3,3),CTuTpTu(3,3),CTvTpTv(3,3),TdadjTd(3,3),TeadjTe(3,3),           & 
& TxCTx(3,3),TuadjTu(3,3),TvadjTv(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),ml2adjYeYe(3,3),  & 
& ml2adjYvYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),mv2YxCYx(3,3),         & 
& mv2YvadjYv(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),         & 
& YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),YeadjYeYe(3,3),          & 
& YeadjYeTe(3,3),YeadjYvYv(3,3),YeadjYvTv(3,3),YxCmv2CYx(3,3),YxCYxmv2(3,3),             & 
& YxCYxYx(3,3),YxCYxYv(3,3),YxCYxTx(3,3),YxCYxTv(3,3),YxCYvTpYv(3,3),YxCYvTpTv(3,3),     & 
& Yumq2adjYu(3,3),YuadjYdYd(3,3),YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),          & 
& YuadjYuTu(3,3),Yvml2adjYv(3,3),YvadjYeYe(3,3),YvadjYeTe(3,3),YvadjYvmv2(3,3),          & 
& YvadjYvYx(3,3),YvadjYvYv(3,3),YvadjYvTx(3,3),YvadjYvTv(3,3),adjYdmd2Yd(3,3),           & 
& adjYdYdmq2(3,3),adjYeme2Ye(3,3),adjYeYeml2(3,3),adjYumu2Yu(3,3),adjYuYumq2(3,3),       & 
& adjYvmv2Yv(3,3),adjYvYvml2(3,3),TdadjYdYd(3,3),TdadjYuYu(3,3),TeadjYeYe(3,3),          & 
& TeadjYvYv(3,3),TxCYxYx(3,3),TxCYxYv(3,3),TxCYvTpYv(3,3),TuadjYdYd(3,3),TuadjYuYu(3,3), & 
& TvadjYeYe(3,3),TvadjYvYx(3,3),TvadjYvYv(3,3)

Complex(dp) :: YdadjYu(3,3),YdadjTd(3,3),YdadjTu(3,3),YeadjYv(3,3),YeadjTe(3,3),YeadjTv(3,3),        & 
& YxCTx(3,3),YuadjYd(3,3),YuadjTd(3,3),YuadjTu(3,3),YvadjYe(3,3),YvadjTe(3,3),           & 
& YvadjTv(3,3),adjYdCmd2(3,3),adjYeCme2(3,3),adjYuCmu2(3,3),adjYvCmv2(3,3),              & 
& adjTdYd(3,3),adjTeYe(3,3),adjTuYu(3,3),adjTvYv(3,3),Cml2adjYe(3,3),Cml2adjYv(3,3),     & 
& Cmq2adjYd(3,3),Cmq2adjYu(3,3),CYeTpYv(3,3),CYeTpTv(3,3),CTdTpYd(3,3),CTeTpYe(3,3),     & 
& CTxYv(3,3),CTxTv(3,3),CTuTpYu(3,3),CTvTpYv(3,3),TdadjYd(3,3),TdadjYu(3,3),             & 
& TdadjTu(3,3),TeadjYe(3,3),TeadjYv(3,3),TeadjTv(3,3),TxCYx(3,3),TuadjYd(3,3),           & 
& TuadjYu(3,3),TuadjTd(3,3),TvadjYe(3,3),TvadjYv(3,3),TvadjTe(3,3),TpYvCYx(3,3),         & 
& TpYvCTx(3,3),TpTvCYx(3,3),TpTvCTx(3,3),md2YdadjYu(3,3),me2YeadjYv(3,3),mu2YuadjYd(3,3),& 
& mv2YvadjYe(3,3),mv2CYxYx(3,3),Ydmq2adjYu(3,3),YdadjYdCmd2(3,3),YdadjYumu2(3,3),        & 
& YdadjTdTd(3,3),YdCmq2adjYd(3,3),Yeml2adjYv(3,3),YeadjYeCme2(3,3),YeadjYvmv2(3,3),      & 
& YeadjYvYx(3,3),YeadjYvTx(3,3),YeadjTeTe(3,3),YeCml2adjYe(3,3),YxCTxTv(3,3),            & 
& Yumq2adjYd(3,3),YuadjYdmd2(3,3),YuadjYuCmu2(3,3),YuadjTuTu(3,3),YuCmq2adjYu(3,3),      & 
& Yvml2adjYe(3,3),YvadjYeme2(3,3),YvadjYvCmv2(3,3),YvadjTvTv(3,3),YvCml2adjYv(3,3),      & 
& adjYdYdadjYd(3,3),adjYdYdadjYu(3,3),adjYdYdadjTd(3,3),adjYdYdadjTu(3,3),               & 
& adjYdTdadjYd(3,3),adjYdTdadjYu(3,3),adjYdTdadjTd(3,3),adjYdTdadjTu(3,3),               & 
& adjYeYeadjYe(3,3),adjYeYeadjYv(3,3),adjYeYeadjTe(3,3),adjYeYeadjTv(3,3),               & 
& adjYeTeadjYe(3,3),adjYeTeadjYv(3,3),adjYeTeadjTe(3,3),adjYeTeadjTv(3,3),               & 
& adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),adjYuYuadjTd(3,3),adjYuYuadjTu(3,3),               & 
& adjYuTuadjYd(3,3),adjYuTuadjYu(3,3),adjYuTuadjTd(3,3),adjYuTuadjTu(3,3),               & 
& adjYvYxCYx(3,3),adjYvYvadjYe(3,3),adjYvYvadjYv(3,3),adjYvYvadjTe(3,3),adjYvYvadjTv(3,3),& 
& adjYvTxCYx(3,3),adjYvTxCTx(3,3),adjYvTvadjYe(3,3),adjYvTvadjYv(3,3),adjYvTvadjTe(3,3), & 
& adjYvTvadjTv(3,3),adjTdYdadjYd(3,3),adjTdYdadjYu(3,3),adjTdTdadjYd(3,3),               & 
& adjTdTdadjYu(3,3),adjTeYeadjYe(3,3),adjTeYeadjYv(3,3),adjTeTeadjYe(3,3),               & 
& adjTeTeadjYv(3,3),adjTuYuadjYd(3,3),adjTuYuadjYu(3,3),adjTuTuadjYd(3,3),               & 
& adjTuTuadjYu(3,3),adjTvYvadjYe(3,3),adjTvYvadjYv(3,3),adjTvTvadjYe(3,3),               & 
& adjTvTvadjYv(3,3),Cml2TpYvCYx(3,3),Cmv2CYxYv(3,3),CYxmv2Yv(3,3),CYxYxCYx(3,3),         & 
& CYxYxCTx(3,3),CYxYvml2(3,3),CYxYvadjYv(3,3),CYxTxCYx(3,3),CYxTxCTx(3,3),               & 
& CYxTvadjYv(3,3),CYxTvadjTv(3,3),CYvTpYvCYx(3,3),CYvTpYvCTx(3,3),CYvTpTvCTx(3,3),       & 
& CTxYxCYx(3,3),CTxTxCYx(3,3),CTxTvadjYv(3,3),CTvTpYvCYx(3,3),CTvTpTvCYx(3,3),           & 
& TdadjTdYd(3,3),TeadjYvYx(3,3),TeadjTeYe(3,3),TxCTxYv(3,3),TxCTvTpYv(3,3),              & 
& TuadjTuYu(3,3),TvadjTvYv(3,3),TpYeCYeTpYv(3,3),TpYeCYeTpTv(3,3),TpYvCmv2CYx(3,3),      & 
& TpYvCYxmv2(3,3),TpYvCYxYx(3,3),TpYvCYxYv(3,3),TpYvCYxTx(3,3),TpYvCYxTv(3,3),           & 
& TpYvCYvTpYv(3,3),TpYvCYvTpTv(3,3),TpTeCYeTpYv(3,3),TpTvCYxYx(3,3),TpTvCYxYv(3,3),      & 
& TpTvCYvTpYv(3,3),md2YdadjYdYd(3,3),me2YeadjYeYe(3,3),ml2adjYeYeadjYe(3,3),             & 
& ml2adjYeYeadjYv(3,3),ml2adjYvYvadjYe(3,3),ml2adjYvYvadjYv(3,3),mq2adjYdYdadjYd(3,3),   & 
& mq2adjYdYdadjYu(3,3),mq2adjYuYuadjYd(3,3),mq2adjYuYuadjYu(3,3),mu2YuadjYuYu(3,3)

Complex(dp) :: mv2YxCYxYv(3,3),mv2YvadjYvYv(3,3),Ydmq2adjYdYd(3,3),YdadjYdmd2Yd(3,3),YdadjYdYdmq2(3,3),& 
& YdadjYdYdadjYd(3,3),YdadjYdTdadjYd(3,3),YdadjYdTdadjTd(3,3),YdadjYuYuadjYd(3,3),       & 
& YdadjYuTuadjYd(3,3),YdadjYuTuadjTd(3,3),YdadjTdTdadjYd(3,3),YdadjTuTuadjYd(3,3),       & 
& Yeml2adjYeYe(3,3),YeadjYeme2Ye(3,3),YeadjYeYeml2(3,3),YeadjYeYeadjYe(3,3),             & 
& YeadjYeTeadjYe(3,3),YeadjYeTeadjTe(3,3),YeadjYvYvadjYe(3,3),YeadjYvTvadjYe(3,3),       & 
& YeadjYvTvadjTe(3,3),YeadjTeTeadjYe(3,3),YeadjTvTvadjYe(3,3),YxCmv2CYxYv(3,3),          & 
& YxCYxmv2Yv(3,3),YxCYxYxCYx(3,3),YxCYxYvml2(3,3),YxCYxYvadjYv(3,3),YxCYxTxCYx(3,3),     & 
& YxCYxTxCTx(3,3),YxCYxTvadjYv(3,3),YxCYxTvadjTv(3,3),YxCYvTpYvCYx(3,3),YxCYvTpTvCTx(3,3),& 
& YxCTxTxCYx(3,3),YxCTxTvadjYv(3,3),YxCTvTpTvCYx(3,3),Yumq2adjYuYu(3,3),YuadjYdYdadjYu(3,3),& 
& YuadjYdTdadjYu(3,3),YuadjYdTdadjTu(3,3),YuadjYumu2Yu(3,3),YuadjYuYumq2(3,3),           & 
& YuadjYuYuadjYu(3,3),YuadjYuTuadjYu(3,3),YuadjYuTuadjTu(3,3),YuadjTdTdadjYu(3,3),       & 
& YuadjTuTuadjYu(3,3),Yvml2adjYvYv(3,3),YvadjYeYeadjYv(3,3),YvadjYeTeadjYv(3,3),         & 
& YvadjYeTeadjTv(3,3),YvadjYvmv2Yv(3,3),YvadjYvYxCYx(3,3),YvadjYvYvml2(3,3),             & 
& YvadjYvYvadjYv(3,3),YvadjYvTxCYx(3,3),YvadjYvTxCTx(3,3),YvadjYvTvadjYv(3,3),           & 
& YvadjYvTvadjTv(3,3),YvadjTeTeadjYv(3,3),YvadjTvTvadjYv(3,3),adjYdmd2YdadjYd(3,3),      & 
& adjYdmd2YdadjYu(3,3),adjYdYdmq2adjYd(3,3),adjYdYdmq2adjYu(3,3),adjYdYdadjYdmd2(3,3),   & 
& adjYdYdadjYdYd(3,3),adjYdYdadjYdTd(3,3),adjYdYdadjYumu2(3,3),adjYdYdadjYuYu(3,3),      & 
& adjYdYdadjYuTu(3,3),adjYdYdadjTdTd(3,3),adjYdTdadjYdYd(3,3),adjYdTdadjYuYu(3,3),       & 
& adjYdTdadjTdYd(3,3),adjYeme2YeadjYe(3,3),adjYeme2YeadjYv(3,3),adjYeYeml2adjYe(3,3),    & 
& adjYeYeml2adjYv(3,3),adjYeYeadjYeme2(3,3),adjYeYeadjYeYe(3,3),adjYeYeadjYeTe(3,3),     & 
& adjYeYeadjYvmv2(3,3),adjYeYeadjYvYx(3,3),adjYeYeadjYvYv(3,3),adjYeYeadjYvTx(3,3),      & 
& adjYeYeadjYvTv(3,3),adjYeYeadjTeTe(3,3),adjYeTeadjYeYe(3,3),adjYeTeadjYvYx(3,3),       & 
& adjYeTeadjYvYv(3,3),adjYeTeadjTeYe(3,3),adjYumu2YuadjYd(3,3),adjYumu2YuadjYu(3,3),     & 
& adjYuYumq2adjYd(3,3),adjYuYumq2adjYu(3,3),adjYuYuadjYdmd2(3,3),adjYuYuadjYdYd(3,3),    & 
& adjYuYuadjYdTd(3,3),adjYuYuadjYumu2(3,3),adjYuYuadjYuYu(3,3),adjYuYuadjYuTu(3,3),      & 
& adjYuYuadjTuTu(3,3),adjYuTuadjYdYd(3,3),adjYuTuadjYuYu(3,3),adjYuTuadjTuYu(3,3),       & 
& adjYvmv2YvadjYe(3,3),adjYvmv2YvadjYv(3,3),adjYvYxCYxYv(3,3),adjYvYxCYxTv(3,3),         & 
& adjYvYxCTxTv(3,3),adjYvYvml2adjYe(3,3),adjYvYvml2adjYv(3,3),adjYvYvadjYeme2(3,3),      & 
& adjYvYvadjYeYe(3,3),adjYvYvadjYeTe(3,3),adjYvYvadjYvmv2(3,3),adjYvYvadjYvYx(3,3),      & 
& adjYvYvadjYvYv(3,3),adjYvYvadjYvTx(3,3),adjYvYvadjYvTv(3,3),adjYvYvadjTvTv(3,3),       & 
& adjYvTxCYxYv(3,3),adjYvTxCTxYv(3,3),adjYvTvadjYeYe(3,3),adjYvTvadjYvYx(3,3),           & 
& adjYvTvadjYvYv(3,3),adjYvTvadjTvYv(3,3),adjTdYdadjYdTd(3,3),adjTdTdadjYdYd(3,3),       & 
& adjTeYeadjYeTe(3,3),adjTeTeadjYeYe(3,3),adjTuYuadjYuTu(3,3),adjTuTuadjYuYu(3,3),       & 
& adjTvYxCYxTv(3,3),adjTvYvadjYvTv(3,3),adjTvTxCYxYv(3,3),adjTvTvadjYvYv(3,3),           & 
& Cmv2CYxYxCYx(3,3),Cmv2CYxYvadjYv(3,3),Cmv2CYvTpYvCYx(3,3),CYxmv2YxCYx(3,3),            & 
& CYxYxCmv2CYx(3,3),CYxYxCYxmv2(3,3),CYxYxCYxYx(3,3),CYxYxCYxYv(3,3),CYxYxCYxTx(3,3),    & 
& CYxYxCYxTv(3,3),CYxYvadjYvYx(3,3),CYxYvadjYvTx(3,3),CYxTxCYxYx(3,3),CYxTxCYxYv(3,3)

Complex(dp) :: CYxTxCTvTpYv(3,3),CYxTvadjYvYx(3,3),CYvCml2TpYvCYx(3,3),CYvTpYeCYeTpYv(3,3),           & 
& CYvTpYeCYeTpTv(3,3),CYvTpYvCmv2CYx(3,3),CYvTpYvCYxmv2(3,3),CYvTpYvCYxYx(3,3),          & 
& CYvTpYvCYxYv(3,3),CYvTpYvCYxTx(3,3),CYvTpYvCYxTv(3,3),CYvTpYvCYvTpYv(3,3),             & 
& CYvTpYvCYvTpTv(3,3),CYvTpTeCYeTpYv(3,3),CYvTpTvCYxYx(3,3),CYvTpTvCYxYv(3,3),           & 
& CYvTpTvCYvTpYv(3,3),TdadjYdYdadjTd(3,3),TdadjYuYuadjTd(3,3),TdadjTdYdadjYd(3,3),       & 
& TdadjTuYuadjYd(3,3),TeadjYeYeadjTe(3,3),TeadjYvYvadjTe(3,3),TeadjTeYeadjYe(3,3),       & 
& TeadjTvYvadjYe(3,3),TxCYxYxCTx(3,3),TxCYvTpYvCTx(3,3),TxCTxYxCYx(3,3),TxCTvTpYvCYx(3,3),& 
& TuadjYdYdadjTu(3,3),TuadjYuYuadjTu(3,3),TuadjTdYdadjYu(3,3),TuadjTuYuadjYu(3,3),       & 
& TvadjYeYeadjTv(3,3),TvadjYvYvadjTv(3,3),TvadjTeYeadjYv(3,3),TvadjTvYvadjYv(3,3),       & 
& md2YdadjYdYdadjYd(3,3),md2YdadjYuYuadjYd(3,3),me2YeadjYeYeadjYe(3,3),me2YeadjYvYvadjYe(3,3),& 
& ml2adjYeYeadjYeYe(3,3),ml2adjYeYeadjYvYv(3,3),ml2adjYvYxCYxYv(3,3),ml2adjYvYvadjYeYe(3,3),& 
& ml2adjYvYvadjYvYv(3,3),mq2adjYdYdadjYdYd(3,3),mq2adjYdYdadjYuYu(3,3),mq2adjYuYuadjYdYd(3,3),& 
& mq2adjYuYuadjYuYu(3,3),mu2YuadjYdYdadjYu(3,3),mu2YuadjYuYuadjYu(3,3),mv2YxCYxYxCYx(3,3),& 
& mv2YxCYxYvadjYv(3,3),mv2YxCYvTpYvCYx(3,3),mv2YvadjYeYeadjYv(3,3),mv2YvadjYvYxCYx(3,3), & 
& mv2YvadjYvYvadjYv(3,3),Ydmq2adjYdYdadjYd(3,3),Ydmq2adjYuYuadjYd(3,3),YdadjYdmd2YdadjYd(3,3),& 
& YdadjYdYdmq2adjYd(3,3),YdadjYdYdadjYdmd2(3,3),YdadjYdYdadjYdYd(3,3),YdadjYdYdadjYdTd(3,3),& 
& YdadjYdTdadjYdYd(3,3),YdadjYumu2YuadjYd(3,3),YdadjYuYumq2adjYd(3,3),YdadjYuYuadjYdmd2(3,3),& 
& YdadjYuYuadjYdYd(3,3),YdadjYuYuadjYdTd(3,3),YdadjYuYuadjYuYu(3,3),YdadjYuYuadjYuTu(3,3),& 
& YdadjYuTuadjYdYd(3,3),YdadjYuTuadjYuYu(3,3),Yeml2adjYeYeadjYe(3,3),Yeml2adjYvYvadjYe(3,3),& 
& YeadjYeme2YeadjYe(3,3),YeadjYeYeml2adjYe(3,3),YeadjYeYeadjYeme2(3,3),YeadjYeYeadjYeYe(3,3),& 
& YeadjYeYeadjYeTe(3,3),YeadjYeTeadjYeYe(3,3),YeadjYvmv2YvadjYe(3,3),YeadjYvYxCYxYv(3,3),& 
& YeadjYvYxCYxTv(3,3),YeadjYvYvml2adjYe(3,3),YeadjYvYvadjYeme2(3,3),YeadjYvYvadjYeYe(3,3),& 
& YeadjYvYvadjYeTe(3,3),YeadjYvYvadjYvYv(3,3),YeadjYvYvadjYvTv(3,3),YeadjYvTxCYxYv(3,3), & 
& YeadjYvTvadjYeYe(3,3),YeadjYvTvadjYvYv(3,3),YxCmv2CYxYxCYx(3,3),YxCmv2CYxYvadjYv(3,3), & 
& YxCmv2CYvTpYvCYx(3,3),YxCYxmv2YxCYx(3,3),YxCYxYxCmv2CYx(3,3),YxCYxYxCYxmv2(3,3),       & 
& YxCYxYxCYxYx(3,3),YxCYxYxCYxYv(3,3),YxCYxYxCYxTx(3,3),YxCYxYxCYxTv(3,3),               & 
& YxCYxYvadjYvYx(3,3),YxCYxYvadjYvTx(3,3),YxCYxTxCYxYx(3,3),YxCYxTxCYxYv(3,3),           & 
& YxCYxTvadjYvYx(3,3),YxCYvCml2TpYvCYx(3,3),YxCYvTpYeCYeTpYv(3,3),YxCYvTpYeCYeTpTv(3,3), & 
& YxCYvTpYvCmv2CYx(3,3),YxCYvTpYvCYxmv2(3,3),YxCYvTpYvCYxYx(3,3),YxCYvTpYvCYxYv(3,3),    & 
& YxCYvTpYvCYxTx(3,3),YxCYvTpYvCYxTv(3,3),YxCYvTpYvCYvTpYv(3,3),YxCYvTpYvCYvTpTv(3,3),   & 
& YxCYvTpTeCYeTpYv(3,3),YxCYvTpTvCYxYx(3,3),YxCYvTpTvCYxYv(3,3),YxCYvTpTvCYvTpYv(3,3),   & 
& Yumq2adjYdYdadjYu(3,3),Yumq2adjYuYuadjYu(3,3),YuadjYdmd2YdadjYu(3,3),YuadjYdYdmq2adjYu(3,3),& 
& YuadjYdYdadjYdYd(3,3),YuadjYdYdadjYdTd(3,3),YuadjYdYdadjYumu2(3,3),YuadjYdYdadjYuYu(3,3),& 
& YuadjYdYdadjYuTu(3,3),YuadjYdTdadjYdYd(3,3),YuadjYdTdadjYuYu(3,3),YuadjYumu2YuadjYu(3,3),& 
& YuadjYuYumq2adjYu(3,3),YuadjYuYuadjYumu2(3,3),YuadjYuYuadjYuYu(3,3),YuadjYuYuadjYuTu(3,3),& 
& YuadjYuTuadjYuYu(3,3),Yvml2adjYeYeadjYv(3,3),Yvml2adjYvYvadjYv(3,3),YvadjYeme2YeadjYv(3,3),& 
& YvadjYeYeml2adjYv(3,3),YvadjYeYeadjYeYe(3,3),YvadjYeYeadjYeTe(3,3),YvadjYeYeadjYvmv2(3,3)

Complex(dp) :: YvadjYeYeadjYvYx(3,3),YvadjYeYeadjYvYv(3,3),YvadjYeYeadjYvTx(3,3),YvadjYeYeadjYvTv(3,3),& 
& YvadjYeTeadjYeYe(3,3),YvadjYeTeadjYvYx(3,3),YvadjYeTeadjYvYv(3,3),YvadjYvmv2YvadjYv(3,3),& 
& YvadjYvYxCYxYv(3,3),YvadjYvYxCYxTv(3,3),YvadjYvYvml2adjYv(3,3),YvadjYvYvadjYvmv2(3,3), & 
& YvadjYvYvadjYvYx(3,3),YvadjYvYvadjYvYv(3,3),YvadjYvYvadjYvTx(3,3),YvadjYvYvadjYvTv(3,3),& 
& YvadjYvTxCYxYv(3,3),YvadjYvTvadjYvYx(3,3),YvadjYvTvadjYvYv(3,3),adjYdmd2YdadjYdYd(3,3),& 
& adjYdYdmq2adjYdYd(3,3),adjYdYdadjYdmd2Yd(3,3),adjYdYdadjYdYdmq2(3,3),adjYeme2YeadjYeYe(3,3),& 
& adjYeYeml2adjYeYe(3,3),adjYeYeadjYeme2Ye(3,3),adjYeYeadjYeYeml2(3,3),adjYumu2YuadjYuYu(3,3),& 
& adjYuYumq2adjYuYu(3,3),adjYuYuadjYumu2Yu(3,3),adjYuYuadjYuYumq2(3,3),adjYvmv2YxCYxYv(3,3),& 
& adjYvmv2YvadjYvYv(3,3),adjYvYxCmv2CYxYv(3,3),adjYvYxCYxmv2Yv(3,3),adjYvYxCYxYvml2(3,3),& 
& adjYvYvml2adjYvYv(3,3),adjYvYvadjYvmv2Yv(3,3),adjYvYvadjYvYvml2(3,3),TdadjYdYdadjYdYd(3,3),& 
& TdadjYuYuadjYdYd(3,3),TdadjYuYuadjYuYu(3,3),TeadjYeYeadjYeYe(3,3),TeadjYvYxCYxYv(3,3), & 
& TeadjYvYvadjYeYe(3,3),TeadjYvYvadjYvYv(3,3),TxCYxYxCYxYx(3,3),TxCYxYxCYxYv(3,3),       & 
& TxCYxYvadjYvYx(3,3),TxCYvTpYeCYeTpYv(3,3),TxCYvTpYvCYxYx(3,3),TxCYvTpYvCYxYv(3,3),     & 
& TxCYvTpYvCYvTpYv(3,3),TuadjYdYdadjYdYd(3,3),TuadjYdYdadjYuYu(3,3),TuadjYuYuadjYuYu(3,3),& 
& TvadjYeYeadjYeYe(3,3),TvadjYeYeadjYvYx(3,3),TvadjYeYeadjYvYv(3,3),TvadjYvYxCYxYv(3,3), & 
& TvadjYvYvadjYvYx(3,3),TvadjYvYvadjYvYv(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,Trmv2,TrYdadjYd,TrYeadjYe,TrYxCYx,TrYuadjYu,            & 
& TrYvadjYv,TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrCYxTx,TrCTdTpTd,TrCTeTpTe,         & 
& TrCTxTx,TrCTuTpTu,TrCTvTpTv,Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trml2adjYvYv,       & 
& Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,Trmv2YxCYx,Trmv2YvadjYv

Complex(dp) :: TrYxCTx,TrCTdTpYd,TrCTeTpYe,TrCTuTpYu,TrCTvTpYv,Trmv2CYxYx,TrYdadjYdCmd2,             & 
& TrYdCmq2adjYd,TrYeadjYeCme2,TrYeCml2adjYe,TrYuadjYuCmu2,TrYuCmq2adjYu,TrYvadjYvCmv2,   & 
& TrYvCml2adjYv,TrYdadjYdYdadjYd,TrYdadjYdTdadjYd,TrYdadjYdTdadjTd,TrYdadjYuYuadjYd,     & 
& TrYdadjYuTuadjYd,TrYdadjYuTuadjTd,TrYdadjTdTdadjYd,TrYdadjTuTuadjYd,TrYeadjYeYeadjYe,  & 
& TrYeadjYeTeadjYe,TrYeadjYeTeadjTe,TrYeadjYvYvadjYe,TrYeadjYvTvadjYe,TrYeadjYvTvadjTe,  & 
& TrYeadjTeTeadjYe,TrYeadjTvTvadjYe,TrYxCYxYxCYx,TrYxCYxYvadjYv,TrYxCYxTxCYx,            & 
& TrYxCYxTxCTx,TrYxCYxTvadjYv,TrYxCYxTvadjTv,TrYxCTxTxCYx,TrYxCTxTvadjYv,TrYuadjYdTdadjYu,& 
& TrYuadjYdTdadjTu,TrYuadjYuYuadjYu,TrYuadjYuTuadjYu,TrYuadjYuTuadjTu,TrYuadjTdTdadjYu,  & 
& TrYuadjTuTuadjYu,TrYvadjYeTeadjYv,TrYvadjYeTeadjTv,TrYvadjYvYvadjYv,TrYvadjYvTxCYx,    & 
& TrYvadjYvTxCTx,TrYvadjYvTvadjYv,TrYvadjYvTvadjTv,TrYvadjTeTeadjYv,TrYvadjTvTvadjYv,    & 
& TrCYxTxCTvTpYv,Trmd2YdadjYdYdadjYd,Trmd2YdadjYuYuadjYd,Trme2YeadjYeYeadjYe,            & 
& Trme2YeadjYvYvadjYe,Trml2adjYeYeadjYeYe,Trml2adjYeYeadjYvYv,Trml2adjYvYxCYxYv,         & 
& Trml2adjYvYvadjYeYe,Trml2adjYvYvadjYvYv,Trmq2adjYdYdadjYdYd,Trmq2adjYdYdadjYuYu,       & 
& Trmq2adjYuYuadjYdYd,Trmq2adjYuYuadjYuYu,Trmu2YuadjYdYdadjYu,Trmu2YuadjYuYuadjYu,       & 
& Trmv2YxCYxYxCYx,Trmv2YxCYxYvadjYv,Trmv2YvadjYeYeadjYv,Trmv2YvadjYvYxCYx,               & 
& Trmv2YvadjYvYvadjYv,TrYxCmv2CYxYvadjYv

Real(dp) :: g1p2,g1p3,gYBp2,g2p2,g2p3,g3p2,g3p3,gBLp2,gBLp3,gBYp2

Complex(dp) :: sqrt2ov5,sqrt3ov5,sqrt3ov2,sqrt2,sqrt3,sqrt5,sqrt6,ooSqrt10,sqrt10,sqrt15

Real(dp) :: g1p4,g1p5,gYBp3,gYBp4,gYBp5,g2p4,g3p4,gBLp4,gBLp5,gBYp3,gBYp4,gBYp5

Complex(dp) :: sqrt2ov3,sqrt5ov2,ooSqrt3,ooSqrt15,Xip2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge320' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters320(gy,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)

AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
AbsMBp = Conjg(MBp)*MBp
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yu,adjYu)
Call Adjungate(Yx,adjYx)
Call Adjungate(Yv,adjYv)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tu,adjTu)
Call Adjungate(Tx,adjTx)
Call Adjungate(Tv,adjTv)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2adjYv = Matmul2(ml2,adjYv,OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2Yv = Matmul2(mv2,Yv,OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YxCYx = Matmul2(Yx,adjYx,OnlyDiagonal) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 Yvml2 = Matmul2(Yv,ml2,OnlyDiagonal) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvmv2 = Matmul2(adjYv,mv2,OnlyDiagonal) 
 adjYvYx = Matmul2(adjYv,Yx,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvTx = Matmul2(adjYv,Tx,OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 adjTvTv = Matmul2(adjTv,Tv,OnlyDiagonal) 
 Cmv2CYx = Matmul2(Conjg(mv2),adjYx,OnlyDiagonal) 
 CYxmv2 = Matmul2(adjYx,mv2,OnlyDiagonal) 
 CYxYx = Matmul2(adjYx,Yx,OnlyDiagonal) 
 CYxYv = Matmul2(adjYx,Yv,OnlyDiagonal) 
 CYxTx = Matmul2(adjYx,Tx,OnlyDiagonal) 
 CYxTv = Matmul2(adjYx,Tv,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTxTx = Matmul2(adjTx,Tx,OnlyDiagonal) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TxCTx = Matmul2(Tx,adjTx,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2adjYvYv = Matmul2(ml2,adjYvYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2YxCYx = Matmul2(mv2,YxCYx,OnlyDiagonal) 
 mv2YvadjYv = Matmul2(mv2,YvadjYv,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeadjYvYv = Matmul2(Ye,adjYvYv,OnlyDiagonal) 
 YeadjYvTv = Matmul2(Ye,adjYvTv,OnlyDiagonal) 
 YxCmv2CYx = Matmul2(Yx,Cmv2CYx,OnlyDiagonal) 
 YxCYxmv2 = Matmul2(Yx,CYxmv2,OnlyDiagonal) 
 YxCYxYx = Matmul2(Yx,CYxYx,OnlyDiagonal) 
 YxCYxYv = Matmul2(Yx,CYxYv,OnlyDiagonal) 
 YxCYxTx = Matmul2(Yx,CYxTx,OnlyDiagonal) 
 YxCYxTv = Matmul2(Yx,CYxTv,OnlyDiagonal) 
 YxCYvTpYv = Matmul2(Yx,CYvTpYv,OnlyDiagonal) 
 YxCYvTpTv = Matmul2(Yx,CYvTpTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 Yvml2adjYv = Matmul2(Yv,ml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  Yvml2adjYv(i2,i2) =  Real(Yvml2adjYv(i2,i2),dp) 
 YvadjYeYe = Matmul2(Yv,adjYeYe,OnlyDiagonal) 
 YvadjYeTe = Matmul2(Yv,adjYeTe,OnlyDiagonal) 
 YvadjYvmv2 = Matmul2(Yv,adjYvmv2,OnlyDiagonal) 
 YvadjYvYx = Matmul2(Yv,adjYvYx,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvTx = Matmul2(Yv,adjYvTx,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 adjYvmv2Yv = Matmul2(adjYv,mv2Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvmv2Yv(i2,i2) =  Real(adjYvmv2Yv(i2,i2),dp) 
 adjYvYvml2 = Matmul2(adjYv,Yvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeadjYvYv = Matmul2(Te,adjYvYv,OnlyDiagonal) 
 TxCYxYx = Matmul2(Tx,CYxYx,OnlyDiagonal) 
 TxCYxYv = Matmul2(Tx,CYxYv,OnlyDiagonal) 
 TxCYvTpYv = Matmul2(Tx,CYvTpYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYeYe = Matmul2(Tv,adjYeYe,OnlyDiagonal) 
 TvadjYvYx = Matmul2(Tv,adjYvYx,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 Trmv2 = Real(cTrace(mv2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYxCYx = cTrace(YxCYx) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrCYxTx = cTrace(CYxTx) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTxTx = cTrace(CTxTx) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trml2adjYvYv = cTrace(ml2adjYvYv) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 Trmv2YxCYx = cTrace(mv2YxCYx) 
 Trmv2YvadjYv = cTrace(mv2YvadjYv) 
 sqrt2ov5 =Sqrt(2._dp/5._dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 sqrt3ov2 =Sqrt(3._dp/2._dp) 
 sqrt2 =sqrt(2._dp) 
 sqrt3 =sqrt(3._dp) 
 sqrt5 =sqrt(5._dp) 
 sqrt6 =sqrt(6._dp) 
 ooSqrt10 =1._dp/sqrt(10._dp) 
 sqrt10 =sqrt(10._dp) 
 sqrt15 =sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 gYBp2 =gYB**2 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gBLp2 =gBL**2 
 gBLp3 =gBL**3 
 gBYp2 =gBY**2 
 sqrt2ov3 =Sqrt(2._dp/3._dp) 
 sqrt5ov2 =Sqrt(5._dp/2._dp) 
 ooSqrt3 =1._dp/sqrt(3._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 
 Xip2 =Xi**2 


If (TwoLoopRGE) Then 
 YdadjYu = Matmul2(Yd,adjYu,OnlyDiagonal) 
 YdadjTd = Matmul2(Yd,adjTd,OnlyDiagonal) 
 YdadjTu = Matmul2(Yd,adjTu,OnlyDiagonal) 
 YeadjYv = Matmul2(Ye,adjYv,OnlyDiagonal) 
 YeadjTe = Matmul2(Ye,adjTe,OnlyDiagonal) 
 YeadjTv = Matmul2(Ye,adjTv,OnlyDiagonal) 
 YxCTx = Matmul2(Yx,adjTx,OnlyDiagonal) 
 YuadjYd = Matmul2(Yu,adjYd,OnlyDiagonal) 
 YuadjTd = Matmul2(Yu,adjTd,OnlyDiagonal) 
 YuadjTu = Matmul2(Yu,adjTu,OnlyDiagonal) 
 YvadjYe = Matmul2(Yv,adjYe,OnlyDiagonal) 
 YvadjTe = Matmul2(Yv,adjTe,OnlyDiagonal) 
 YvadjTv = Matmul2(Yv,adjTv,OnlyDiagonal) 
 adjYdCmd2 = Matmul2(adjYd,Conjg(md2),OnlyDiagonal) 
 adjYeCme2 = Matmul2(adjYe,Conjg(me2),OnlyDiagonal) 
 adjYuCmu2 = Matmul2(adjYu,Conjg(mu2),OnlyDiagonal) 
 adjYvCmv2 = Matmul2(adjYv,Conjg(mv2),OnlyDiagonal) 
 adjTdYd = Matmul2(adjTd,Yd,OnlyDiagonal) 
 adjTeYe = Matmul2(adjTe,Ye,OnlyDiagonal) 
 adjTuYu = Matmul2(adjTu,Yu,OnlyDiagonal) 
 adjTvYv = Matmul2(adjTv,Yv,OnlyDiagonal) 
 Cml2adjYe = Matmul2(Conjg(ml2),adjYe,OnlyDiagonal) 
 Cml2adjYv = Matmul2(Conjg(ml2),adjYv,OnlyDiagonal) 
 Cmq2adjYd = Matmul2(Conjg(mq2),adjYd,OnlyDiagonal) 
 Cmq2adjYu = Matmul2(Conjg(mq2),adjYu,OnlyDiagonal) 
 CYeTpYv = Matmul2(Conjg(Ye),Transpose(Yv),OnlyDiagonal) 
 CYeTpTv = Matmul2(Conjg(Ye),Transpose(Tv),OnlyDiagonal) 
 CTdTpYd = Matmul2(Conjg(Td),Transpose(Yd),OnlyDiagonal) 
 CTeTpYe = Matmul2(Conjg(Te),Transpose(Ye),OnlyDiagonal) 
 CTxYv = Matmul2(adjTx,Yv,OnlyDiagonal) 
 CTxTv = Matmul2(adjTx,Tv,OnlyDiagonal) 
 CTuTpYu = Matmul2(Conjg(Tu),Transpose(Yu),OnlyDiagonal) 
 CTvTpYv = Matmul2(Conjg(Tv),Transpose(Yv),OnlyDiagonal) 
 TdadjYd = Matmul2(Td,adjYd,OnlyDiagonal) 
 TdadjYu = Matmul2(Td,adjYu,OnlyDiagonal) 
 TdadjTu = Matmul2(Td,adjTu,OnlyDiagonal) 
 TeadjYe = Matmul2(Te,adjYe,OnlyDiagonal) 
 TeadjYv = Matmul2(Te,adjYv,OnlyDiagonal) 
 TeadjTv = Matmul2(Te,adjTv,OnlyDiagonal) 
 TxCYx = Matmul2(Tx,adjYx,OnlyDiagonal) 
 TuadjYd = Matmul2(Tu,adjYd,OnlyDiagonal) 
 TuadjYu = Matmul2(Tu,adjYu,OnlyDiagonal) 
 TuadjTd = Matmul2(Tu,adjTd,OnlyDiagonal) 
 TvadjYe = Matmul2(Tv,adjYe,OnlyDiagonal) 
 TvadjYv = Matmul2(Tv,adjYv,OnlyDiagonal) 
 TvadjTe = Matmul2(Tv,adjTe,OnlyDiagonal) 
 TpYvCYx = Matmul2(Transpose(Yv),adjYx,OnlyDiagonal) 
 TpYvCTx = Matmul2(Transpose(Yv),adjTx,OnlyDiagonal) 
 TpTvCYx = Matmul2(Transpose(Tv),adjYx,OnlyDiagonal) 
 TpTvCTx = Matmul2(Transpose(Tv),adjTx,OnlyDiagonal) 
 md2YdadjYu = Matmul2(md2,YdadjYu,OnlyDiagonal) 
 me2YeadjYv = Matmul2(me2,YeadjYv,OnlyDiagonal) 
 mu2YuadjYd = Matmul2(mu2,YuadjYd,OnlyDiagonal) 
 mv2YvadjYe = Matmul2(mv2,YvadjYe,OnlyDiagonal) 
 mv2CYxYx = Matmul2(mv2,CYxYx,OnlyDiagonal) 
 Ydmq2adjYu = Matmul2(Yd,mq2adjYu,OnlyDiagonal) 
 YdadjYdCmd2 = Matmul2(Yd,adjYdCmd2,OnlyDiagonal) 
 YdadjYumu2 = Matmul2(Yd,adjYumu2,OnlyDiagonal) 
 YdadjTdTd = Matmul2(Yd,adjTdTd,OnlyDiagonal) 
 YdCmq2adjYd = Matmul2(Yd,Cmq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdCmq2adjYd(i2,i2) =  Real(YdCmq2adjYd(i2,i2),dp) 
 Yeml2adjYv = Matmul2(Ye,ml2adjYv,OnlyDiagonal) 
 YeadjYeCme2 = Matmul2(Ye,adjYeCme2,OnlyDiagonal) 
 YeadjYvmv2 = Matmul2(Ye,adjYvmv2,OnlyDiagonal) 
 YeadjYvYx = Matmul2(Ye,adjYvYx,OnlyDiagonal) 
 YeadjYvTx = Matmul2(Ye,adjYvTx,OnlyDiagonal) 
 YeadjTeTe = Matmul2(Ye,adjTeTe,OnlyDiagonal) 
 YeCml2adjYe = Matmul2(Ye,Cml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCml2adjYe(i2,i2) =  Real(YeCml2adjYe(i2,i2),dp) 
 YxCTxTv = Matmul2(Yx,CTxTv,OnlyDiagonal) 
 Yumq2adjYd = Matmul2(Yu,mq2adjYd,OnlyDiagonal) 
 YuadjYdmd2 = Matmul2(Yu,adjYdmd2,OnlyDiagonal) 
 YuadjYuCmu2 = Matmul2(Yu,adjYuCmu2,OnlyDiagonal) 
 YuadjTuTu = Matmul2(Yu,adjTuTu,OnlyDiagonal) 
 YuCmq2adjYu = Matmul2(Yu,Cmq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuCmq2adjYu(i2,i2) =  Real(YuCmq2adjYu(i2,i2),dp) 
 Yvml2adjYe = Matmul2(Yv,ml2adjYe,OnlyDiagonal) 
 YvadjYeme2 = Matmul2(Yv,adjYeme2,OnlyDiagonal) 
 YvadjYvCmv2 = Matmul2(Yv,adjYvCmv2,OnlyDiagonal) 
 YvadjTvTv = Matmul2(Yv,adjTvTv,OnlyDiagonal) 
 YvCml2adjYv = Matmul2(Yv,Cml2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvCml2adjYv(i2,i2) =  Real(YvCml2adjYv(i2,i2),dp) 
 adjYdYdadjYd = Matmul2(adjYd,YdadjYd,OnlyDiagonal) 
 adjYdYdadjYu = Matmul2(adjYd,YdadjYu,OnlyDiagonal) 
 adjYdYdadjTd = Matmul2(adjYd,YdadjTd,OnlyDiagonal) 
 adjYdYdadjTu = Matmul2(adjYd,YdadjTu,OnlyDiagonal) 
 adjYdTdadjYd = Matmul2(adjYd,TdadjYd,OnlyDiagonal) 
 adjYdTdadjYu = Matmul2(adjYd,TdadjYu,OnlyDiagonal) 
 adjYdTdadjTd = Matmul2(adjYd,TdadjTd,OnlyDiagonal) 
 adjYdTdadjTu = Matmul2(adjYd,TdadjTu,OnlyDiagonal) 
 adjYeYeadjYe = Matmul2(adjYe,YeadjYe,OnlyDiagonal) 
 adjYeYeadjYv = Matmul2(adjYe,YeadjYv,OnlyDiagonal) 
 adjYeYeadjTe = Matmul2(adjYe,YeadjTe,OnlyDiagonal) 
 adjYeYeadjTv = Matmul2(adjYe,YeadjTv,OnlyDiagonal) 
 adjYeTeadjYe = Matmul2(adjYe,TeadjYe,OnlyDiagonal) 
 adjYeTeadjYv = Matmul2(adjYe,TeadjYv,OnlyDiagonal) 
 adjYeTeadjTe = Matmul2(adjYe,TeadjTe,OnlyDiagonal) 
 adjYeTeadjTv = Matmul2(adjYe,TeadjTv,OnlyDiagonal) 
 adjYuYuadjYd = Matmul2(adjYu,YuadjYd,OnlyDiagonal) 
 adjYuYuadjYu = Matmul2(adjYu,YuadjYu,OnlyDiagonal) 
 adjYuYuadjTd = Matmul2(adjYu,YuadjTd,OnlyDiagonal) 
 adjYuYuadjTu = Matmul2(adjYu,YuadjTu,OnlyDiagonal) 
 adjYuTuadjYd = Matmul2(adjYu,TuadjYd,OnlyDiagonal) 
 adjYuTuadjYu = Matmul2(adjYu,TuadjYu,OnlyDiagonal) 
 adjYuTuadjTd = Matmul2(adjYu,TuadjTd,OnlyDiagonal) 
 adjYuTuadjTu = Matmul2(adjYu,TuadjTu,OnlyDiagonal) 
 adjYvYxCYx = Matmul2(adjYv,YxCYx,OnlyDiagonal) 
 adjYvYvadjYe = Matmul2(adjYv,YvadjYe,OnlyDiagonal) 
 adjYvYvadjYv = Matmul2(adjYv,YvadjYv,OnlyDiagonal) 
 adjYvYvadjTe = Matmul2(adjYv,YvadjTe,OnlyDiagonal) 
 adjYvYvadjTv = Matmul2(adjYv,YvadjTv,OnlyDiagonal) 
 adjYvTxCYx = Matmul2(adjYv,TxCYx,OnlyDiagonal) 
 adjYvTxCTx = Matmul2(adjYv,TxCTx,OnlyDiagonal) 
 adjYvTvadjYe = Matmul2(adjYv,TvadjYe,OnlyDiagonal) 
 adjYvTvadjYv = Matmul2(adjYv,TvadjYv,OnlyDiagonal) 
 adjYvTvadjTe = Matmul2(adjYv,TvadjTe,OnlyDiagonal) 
 adjYvTvadjTv = Matmul2(adjYv,TvadjTv,OnlyDiagonal) 
 adjTdYdadjYd = Matmul2(adjTd,YdadjYd,OnlyDiagonal) 
 adjTdYdadjYu = Matmul2(adjTd,YdadjYu,OnlyDiagonal) 
 adjTdTdadjYd = Matmul2(adjTd,TdadjYd,OnlyDiagonal) 
 adjTdTdadjYu = Matmul2(adjTd,TdadjYu,OnlyDiagonal) 
 adjTeYeadjYe = Matmul2(adjTe,YeadjYe,OnlyDiagonal) 
 adjTeYeadjYv = Matmul2(adjTe,YeadjYv,OnlyDiagonal) 
 adjTeTeadjYe = Matmul2(adjTe,TeadjYe,OnlyDiagonal) 
 adjTeTeadjYv = Matmul2(adjTe,TeadjYv,OnlyDiagonal) 
 adjTuYuadjYd = Matmul2(adjTu,YuadjYd,OnlyDiagonal) 
 adjTuYuadjYu = Matmul2(adjTu,YuadjYu,OnlyDiagonal) 
 adjTuTuadjYd = Matmul2(adjTu,TuadjYd,OnlyDiagonal) 
 adjTuTuadjYu = Matmul2(adjTu,TuadjYu,OnlyDiagonal) 
 adjTvYvadjYe = Matmul2(adjTv,YvadjYe,OnlyDiagonal) 
 adjTvYvadjYv = Matmul2(adjTv,YvadjYv,OnlyDiagonal) 
 adjTvTvadjYe = Matmul2(adjTv,TvadjYe,OnlyDiagonal) 
 adjTvTvadjYv = Matmul2(adjTv,TvadjYv,OnlyDiagonal) 
 Cml2TpYvCYx = Matmul2(Conjg(ml2),TpYvCYx,OnlyDiagonal) 
 Cmv2CYxYv = Matmul2(Conjg(mv2),CYxYv,OnlyDiagonal) 
 CYxmv2Yv = Matmul2(adjYx,mv2Yv,OnlyDiagonal) 
 CYxYxCYx = Matmul2(adjYx,YxCYx,OnlyDiagonal) 
 CYxYxCTx = Matmul2(adjYx,YxCTx,OnlyDiagonal) 
 CYxYvml2 = Matmul2(adjYx,Yvml2,OnlyDiagonal) 
 CYxYvadjYv = Matmul2(adjYx,YvadjYv,OnlyDiagonal) 
 CYxTxCYx = Matmul2(adjYx,TxCYx,OnlyDiagonal) 
 CYxTxCTx = Matmul2(adjYx,TxCTx,OnlyDiagonal) 
 CYxTvadjYv = Matmul2(adjYx,TvadjYv,OnlyDiagonal) 
 CYxTvadjTv = Matmul2(adjYx,TvadjTv,OnlyDiagonal) 
 CYvTpYvCYx = Matmul2(Conjg(Yv),TpYvCYx,OnlyDiagonal) 
 CYvTpYvCTx = Matmul2(Conjg(Yv),TpYvCTx,OnlyDiagonal) 
 CYvTpTvCTx = Matmul2(Conjg(Yv),TpTvCTx,OnlyDiagonal) 
 CTxYxCYx = Matmul2(adjTx,YxCYx,OnlyDiagonal) 
 CTxTxCYx = Matmul2(adjTx,TxCYx,OnlyDiagonal) 
 CTxTvadjYv = Matmul2(adjTx,TvadjYv,OnlyDiagonal) 
 CTvTpYvCYx = Matmul2(Conjg(Tv),TpYvCYx,OnlyDiagonal) 
 CTvTpTvCYx = Matmul2(Conjg(Tv),TpTvCYx,OnlyDiagonal) 
 TdadjTdYd = Matmul2(Td,adjTdYd,OnlyDiagonal) 
 TeadjYvYx = Matmul2(Te,adjYvYx,OnlyDiagonal) 
 TeadjTeYe = Matmul2(Te,adjTeYe,OnlyDiagonal) 
 TxCTxYv = Matmul2(Tx,CTxYv,OnlyDiagonal) 
 TxCTvTpYv = Matmul2(Tx,CTvTpYv,OnlyDiagonal) 
 TuadjTuYu = Matmul2(Tu,adjTuYu,OnlyDiagonal) 
 TvadjTvYv = Matmul2(Tv,adjTvYv,OnlyDiagonal) 
 TpYeCYeTpYv = Matmul2(Transpose(Ye),CYeTpYv,OnlyDiagonal) 
 TpYeCYeTpTv = Matmul2(Transpose(Ye),CYeTpTv,OnlyDiagonal) 
 TpYvCmv2CYx = Matmul2(Transpose(Yv),Cmv2CYx,OnlyDiagonal) 
 TpYvCYxmv2 = Matmul2(Transpose(Yv),CYxmv2,OnlyDiagonal) 
 TpYvCYxYx = Matmul2(Transpose(Yv),CYxYx,OnlyDiagonal) 
 TpYvCYxYv = Matmul2(Transpose(Yv),CYxYv,OnlyDiagonal) 
 TpYvCYxTx = Matmul2(Transpose(Yv),CYxTx,OnlyDiagonal) 
 TpYvCYxTv = Matmul2(Transpose(Yv),CYxTv,OnlyDiagonal) 
 TpYvCYvTpYv = Matmul2(Transpose(Yv),CYvTpYv,OnlyDiagonal) 
 TpYvCYvTpTv = Matmul2(Transpose(Yv),CYvTpTv,OnlyDiagonal) 
 TpTeCYeTpYv = Matmul2(Transpose(Te),CYeTpYv,OnlyDiagonal) 
 TpTvCYxYx = Matmul2(Transpose(Tv),CYxYx,OnlyDiagonal) 
 TpTvCYxYv = Matmul2(Transpose(Tv),CYxYv,OnlyDiagonal) 
 TpTvCYvTpYv = Matmul2(Transpose(Tv),CYvTpYv,OnlyDiagonal) 
 md2YdadjYdYd = Matmul2(md2,YdadjYdYd,OnlyDiagonal) 
 me2YeadjYeYe = Matmul2(me2,YeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYe = Matmul2(ml2,adjYeYeadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYv = Matmul2(ml2,adjYeYeadjYv,OnlyDiagonal) 
 ml2adjYvYvadjYe = Matmul2(ml2,adjYvYvadjYe,OnlyDiagonal) 
 ml2adjYvYvadjYv = Matmul2(ml2,adjYvYvadjYv,OnlyDiagonal) 
 mq2adjYdYdadjYd = Matmul2(mq2,adjYdYdadjYd,OnlyDiagonal) 
 mq2adjYdYdadjYu = Matmul2(mq2,adjYdYdadjYu,OnlyDiagonal) 
 mq2adjYuYuadjYd = Matmul2(mq2,adjYuYuadjYd,OnlyDiagonal) 
 mq2adjYuYuadjYu = Matmul2(mq2,adjYuYuadjYu,OnlyDiagonal) 
 mu2YuadjYuYu = Matmul2(mu2,YuadjYuYu,OnlyDiagonal) 
 mv2YxCYxYv = Matmul2(mv2,YxCYxYv,OnlyDiagonal) 
 mv2YvadjYvYv = Matmul2(mv2,YvadjYvYv,OnlyDiagonal) 
 Ydmq2adjYdYd = Matmul2(Yd,mq2adjYdYd,OnlyDiagonal) 
 YdadjYdmd2Yd = Matmul2(Yd,adjYdmd2Yd,OnlyDiagonal) 
 YdadjYdYdmq2 = Matmul2(Yd,adjYdYdmq2,OnlyDiagonal) 
 YdadjYdYdadjYd = Matmul2(Yd,adjYdYdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYdTdadjYd = Matmul2(Yd,adjYdTdadjYd,OnlyDiagonal) 
 YdadjYdTdadjTd = Matmul2(Yd,adjYdTdadjTd,OnlyDiagonal) 
 YdadjYuYuadjYd = Matmul2(Yd,adjYuYuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YdadjYuTuadjYd = Matmul2(Yd,adjYuTuadjYd,OnlyDiagonal) 
 YdadjYuTuadjTd = Matmul2(Yd,adjYuTuadjTd,OnlyDiagonal) 
 YdadjTdTdadjYd = Matmul2(Yd,adjTdTdadjYd,OnlyDiagonal) 
 YdadjTuTuadjYd = Matmul2(Yd,adjTuTuadjYd,OnlyDiagonal) 
 Yeml2adjYeYe = Matmul2(Ye,ml2adjYeYe,OnlyDiagonal) 
 YeadjYeme2Ye = Matmul2(Ye,adjYeme2Ye,OnlyDiagonal) 
 YeadjYeYeml2 = Matmul2(Ye,adjYeYeml2,OnlyDiagonal) 
 YeadjYeYeadjYe = Matmul2(Ye,adjYeYeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTeadjYe = Matmul2(Ye,adjYeTeadjYe,OnlyDiagonal) 
 YeadjYeTeadjTe = Matmul2(Ye,adjYeTeadjTe,OnlyDiagonal) 
 YeadjYvYvadjYe = Matmul2(Ye,adjYvYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYvYvadjYe(i2,i2) =  Real(YeadjYvYvadjYe(i2,i2),dp) 
 YeadjYvTvadjYe = Matmul2(Ye,adjYvTvadjYe,OnlyDiagonal) 
 YeadjYvTvadjTe = Matmul2(Ye,adjYvTvadjTe,OnlyDiagonal) 
 YeadjTeTeadjYe = Matmul2(Ye,adjTeTeadjYe,OnlyDiagonal) 
 YeadjTvTvadjYe = Matmul2(Ye,adjTvTvadjYe,OnlyDiagonal) 
 YxCmv2CYxYv = Matmul2(Yx,Cmv2CYxYv,OnlyDiagonal) 
 YxCYxmv2Yv = Matmul2(Yx,CYxmv2Yv,OnlyDiagonal) 
 YxCYxYxCYx = Matmul2(Yx,CYxYxCYx,OnlyDiagonal) 
 YxCYxYvml2 = Matmul2(Yx,CYxYvml2,OnlyDiagonal) 
 YxCYxYvadjYv = Matmul2(Yx,CYxYvadjYv,OnlyDiagonal) 
 YxCYxTxCYx = Matmul2(Yx,CYxTxCYx,OnlyDiagonal) 
 YxCYxTxCTx = Matmul2(Yx,CYxTxCTx,OnlyDiagonal) 
 YxCYxTvadjYv = Matmul2(Yx,CYxTvadjYv,OnlyDiagonal) 
 YxCYxTvadjTv = Matmul2(Yx,CYxTvadjTv,OnlyDiagonal) 
 YxCYvTpYvCYx = Matmul2(Yx,CYvTpYvCYx,OnlyDiagonal) 
 YxCYvTpTvCTx = Matmul2(Yx,CYvTpTvCTx,OnlyDiagonal) 
 YxCTxTxCYx = Matmul2(Yx,CTxTxCYx,OnlyDiagonal) 
 YxCTxTvadjYv = Matmul2(Yx,CTxTvadjYv,OnlyDiagonal) 
 YxCTvTpTvCYx = Matmul2(Yx,CTvTpTvCYx,OnlyDiagonal) 
 Yumq2adjYuYu = Matmul2(Yu,mq2adjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYu = Matmul2(Yu,adjYdYdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdYdadjYu(i2,i2) =  Real(YuadjYdYdadjYu(i2,i2),dp) 
 YuadjYdTdadjYu = Matmul2(Yu,adjYdTdadjYu,OnlyDiagonal) 
 YuadjYdTdadjTu = Matmul2(Yu,adjYdTdadjTu,OnlyDiagonal) 
 YuadjYumu2Yu = Matmul2(Yu,adjYumu2Yu,OnlyDiagonal) 
 YuadjYuYumq2 = Matmul2(Yu,adjYuYumq2,OnlyDiagonal) 
 YuadjYuYuadjYu = Matmul2(Yu,adjYuYuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 YuadjYuTuadjYu = Matmul2(Yu,adjYuTuadjYu,OnlyDiagonal) 
 YuadjYuTuadjTu = Matmul2(Yu,adjYuTuadjTu,OnlyDiagonal) 
 YuadjTdTdadjYu = Matmul2(Yu,adjTdTdadjYu,OnlyDiagonal) 
 YuadjTuTuadjYu = Matmul2(Yu,adjTuTuadjYu,OnlyDiagonal) 
 Yvml2adjYvYv = Matmul2(Yv,ml2adjYvYv,OnlyDiagonal) 
 YvadjYeYeadjYv = Matmul2(Yv,adjYeYeadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYeYeadjYv(i2,i2) =  Real(YvadjYeYeadjYv(i2,i2),dp) 
 YvadjYeTeadjYv = Matmul2(Yv,adjYeTeadjYv,OnlyDiagonal) 
 YvadjYeTeadjTv = Matmul2(Yv,adjYeTeadjTv,OnlyDiagonal) 
 YvadjYvmv2Yv = Matmul2(Yv,adjYvmv2Yv,OnlyDiagonal) 
 YvadjYvYxCYx = Matmul2(Yv,adjYvYxCYx,OnlyDiagonal) 
 YvadjYvYvml2 = Matmul2(Yv,adjYvYvml2,OnlyDiagonal) 
 YvadjYvYvadjYv = Matmul2(Yv,adjYvYvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvYvadjYv(i2,i2) =  Real(YvadjYvYvadjYv(i2,i2),dp) 
 YvadjYvTxCYx = Matmul2(Yv,adjYvTxCYx,OnlyDiagonal) 
 YvadjYvTxCTx = Matmul2(Yv,adjYvTxCTx,OnlyDiagonal) 
 YvadjYvTvadjYv = Matmul2(Yv,adjYvTvadjYv,OnlyDiagonal) 
 YvadjYvTvadjTv = Matmul2(Yv,adjYvTvadjTv,OnlyDiagonal) 
 YvadjTeTeadjYv = Matmul2(Yv,adjTeTeadjYv,OnlyDiagonal) 
 YvadjTvTvadjYv = Matmul2(Yv,adjTvTvadjYv,OnlyDiagonal) 
 adjYdmd2YdadjYd = Matmul2(adjYd,md2YdadjYd,OnlyDiagonal) 
 adjYdmd2YdadjYu = Matmul2(adjYd,md2YdadjYu,OnlyDiagonal) 
 adjYdYdmq2adjYd = Matmul2(adjYd,Ydmq2adjYd,OnlyDiagonal) 
 adjYdYdmq2adjYu = Matmul2(adjYd,Ydmq2adjYu,OnlyDiagonal) 
 adjYdYdadjYdmd2 = Matmul2(adjYd,YdadjYdmd2,OnlyDiagonal) 
 adjYdYdadjYdYd = Matmul2(adjYd,YdadjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdadjYdYd(i2,i2) =  Real(adjYdYdadjYdYd(i2,i2),dp) 
 adjYdYdadjYdTd = Matmul2(adjYd,YdadjYdTd,OnlyDiagonal) 
 adjYdYdadjYumu2 = Matmul2(adjYd,YdadjYumu2,OnlyDiagonal) 
 adjYdYdadjYuYu = Matmul2(adjYd,YdadjYuYu,OnlyDiagonal) 
 adjYdYdadjYuTu = Matmul2(adjYd,YdadjYuTu,OnlyDiagonal) 
 adjYdYdadjTdTd = Matmul2(adjYd,YdadjTdTd,OnlyDiagonal) 
 adjYdTdadjYdYd = Matmul2(adjYd,TdadjYdYd,OnlyDiagonal) 
 adjYdTdadjYuYu = Matmul2(adjYd,TdadjYuYu,OnlyDiagonal) 
 adjYdTdadjTdYd = Matmul2(adjYd,TdadjTdYd,OnlyDiagonal) 
 adjYeme2YeadjYe = Matmul2(adjYe,me2YeadjYe,OnlyDiagonal) 
 adjYeme2YeadjYv = Matmul2(adjYe,me2YeadjYv,OnlyDiagonal) 
 adjYeYeml2adjYe = Matmul2(adjYe,Yeml2adjYe,OnlyDiagonal) 
 adjYeYeml2adjYv = Matmul2(adjYe,Yeml2adjYv,OnlyDiagonal) 
 adjYeYeadjYeme2 = Matmul2(adjYe,YeadjYeme2,OnlyDiagonal) 
 adjYeYeadjYeYe = Matmul2(adjYe,YeadjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeadjYeYe(i2,i2) =  Real(adjYeYeadjYeYe(i2,i2),dp) 
 adjYeYeadjYeTe = Matmul2(adjYe,YeadjYeTe,OnlyDiagonal) 
 adjYeYeadjYvmv2 = Matmul2(adjYe,YeadjYvmv2,OnlyDiagonal) 
 adjYeYeadjYvYx = Matmul2(adjYe,YeadjYvYx,OnlyDiagonal) 
 adjYeYeadjYvYv = Matmul2(adjYe,YeadjYvYv,OnlyDiagonal) 
 adjYeYeadjYvTx = Matmul2(adjYe,YeadjYvTx,OnlyDiagonal) 
 adjYeYeadjYvTv = Matmul2(adjYe,YeadjYvTv,OnlyDiagonal) 
 adjYeYeadjTeTe = Matmul2(adjYe,YeadjTeTe,OnlyDiagonal) 
 adjYeTeadjYeYe = Matmul2(adjYe,TeadjYeYe,OnlyDiagonal) 
 adjYeTeadjYvYx = Matmul2(adjYe,TeadjYvYx,OnlyDiagonal) 
 adjYeTeadjYvYv = Matmul2(adjYe,TeadjYvYv,OnlyDiagonal) 
 adjYeTeadjTeYe = Matmul2(adjYe,TeadjTeYe,OnlyDiagonal) 
 adjYumu2YuadjYd = Matmul2(adjYu,mu2YuadjYd,OnlyDiagonal) 
 adjYumu2YuadjYu = Matmul2(adjYu,mu2YuadjYu,OnlyDiagonal) 
 adjYuYumq2adjYd = Matmul2(adjYu,Yumq2adjYd,OnlyDiagonal) 
 adjYuYumq2adjYu = Matmul2(adjYu,Yumq2adjYu,OnlyDiagonal) 
 adjYuYuadjYdmd2 = Matmul2(adjYu,YuadjYdmd2,OnlyDiagonal) 
 adjYuYuadjYdYd = Matmul2(adjYu,YuadjYdYd,OnlyDiagonal) 
 adjYuYuadjYdTd = Matmul2(adjYu,YuadjYdTd,OnlyDiagonal) 
 adjYuYuadjYumu2 = Matmul2(adjYu,YuadjYumu2,OnlyDiagonal) 
 adjYuYuadjYuYu = Matmul2(adjYu,YuadjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYuadjYuYu(i2,i2) =  Real(adjYuYuadjYuYu(i2,i2),dp) 
 adjYuYuadjYuTu = Matmul2(adjYu,YuadjYuTu,OnlyDiagonal) 
 adjYuYuadjTuTu = Matmul2(adjYu,YuadjTuTu,OnlyDiagonal) 
 adjYuTuadjYdYd = Matmul2(adjYu,TuadjYdYd,OnlyDiagonal) 
 adjYuTuadjYuYu = Matmul2(adjYu,TuadjYuYu,OnlyDiagonal) 
 adjYuTuadjTuYu = Matmul2(adjYu,TuadjTuYu,OnlyDiagonal) 
 adjYvmv2YvadjYe = Matmul2(adjYv,mv2YvadjYe,OnlyDiagonal) 
 adjYvmv2YvadjYv = Matmul2(adjYv,mv2YvadjYv,OnlyDiagonal) 
 adjYvYxCYxYv = Matmul2(adjYv,YxCYxYv,OnlyDiagonal) 
 adjYvYxCYxTv = Matmul2(adjYv,YxCYxTv,OnlyDiagonal) 
 adjYvYxCTxTv = Matmul2(adjYv,YxCTxTv,OnlyDiagonal) 
 adjYvYvml2adjYe = Matmul2(adjYv,Yvml2adjYe,OnlyDiagonal) 
 adjYvYvml2adjYv = Matmul2(adjYv,Yvml2adjYv,OnlyDiagonal) 
 adjYvYvadjYeme2 = Matmul2(adjYv,YvadjYeme2,OnlyDiagonal) 
 adjYvYvadjYeYe = Matmul2(adjYv,YvadjYeYe,OnlyDiagonal) 
 adjYvYvadjYeTe = Matmul2(adjYv,YvadjYeTe,OnlyDiagonal) 
 adjYvYvadjYvmv2 = Matmul2(adjYv,YvadjYvmv2,OnlyDiagonal) 
 adjYvYvadjYvYx = Matmul2(adjYv,YvadjYvYx,OnlyDiagonal) 
 adjYvYvadjYvYv = Matmul2(adjYv,YvadjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvadjYvYv(i2,i2) =  Real(adjYvYvadjYvYv(i2,i2),dp) 
 adjYvYvadjYvTx = Matmul2(adjYv,YvadjYvTx,OnlyDiagonal) 
 adjYvYvadjYvTv = Matmul2(adjYv,YvadjYvTv,OnlyDiagonal) 
 adjYvYvadjTvTv = Matmul2(adjYv,YvadjTvTv,OnlyDiagonal) 
 adjYvTxCYxYv = Matmul2(adjYv,TxCYxYv,OnlyDiagonal) 
 adjYvTxCTxYv = Matmul2(adjYv,TxCTxYv,OnlyDiagonal) 
 adjYvTvadjYeYe = Matmul2(adjYv,TvadjYeYe,OnlyDiagonal) 
 adjYvTvadjYvYx = Matmul2(adjYv,TvadjYvYx,OnlyDiagonal) 
 adjYvTvadjYvYv = Matmul2(adjYv,TvadjYvYv,OnlyDiagonal) 
 adjYvTvadjTvYv = Matmul2(adjYv,TvadjTvYv,OnlyDiagonal) 
 adjTdYdadjYdTd = Matmul2(adjTd,YdadjYdTd,OnlyDiagonal) 
 adjTdTdadjYdYd = Matmul2(adjTd,TdadjYdYd,OnlyDiagonal) 
 adjTeYeadjYeTe = Matmul2(adjTe,YeadjYeTe,OnlyDiagonal) 
 adjTeTeadjYeYe = Matmul2(adjTe,TeadjYeYe,OnlyDiagonal) 
 adjTuYuadjYuTu = Matmul2(adjTu,YuadjYuTu,OnlyDiagonal) 
 adjTuTuadjYuYu = Matmul2(adjTu,TuadjYuYu,OnlyDiagonal) 
 adjTvYxCYxTv = Matmul2(adjTv,YxCYxTv,OnlyDiagonal) 
 adjTvYvadjYvTv = Matmul2(adjTv,YvadjYvTv,OnlyDiagonal) 
 adjTvTxCYxYv = Matmul2(adjTv,TxCYxYv,OnlyDiagonal) 
 adjTvTvadjYvYv = Matmul2(adjTv,TvadjYvYv,OnlyDiagonal) 
 Cmv2CYxYxCYx = Matmul2(Conjg(mv2),CYxYxCYx,OnlyDiagonal) 
 Cmv2CYxYvadjYv = Matmul2(Conjg(mv2),CYxYvadjYv,OnlyDiagonal) 
 Cmv2CYvTpYvCYx = Matmul2(Conjg(mv2),CYvTpYvCYx,OnlyDiagonal) 
 CYxmv2YxCYx = Matmul2(adjYx,mv2YxCYx,OnlyDiagonal) 
 CYxYxCmv2CYx = Matmul2(adjYx,YxCmv2CYx,OnlyDiagonal) 
 CYxYxCYxmv2 = Matmul2(adjYx,YxCYxmv2,OnlyDiagonal) 
 CYxYxCYxYx = Matmul2(adjYx,YxCYxYx,OnlyDiagonal) 
 CYxYxCYxYv = Matmul2(adjYx,YxCYxYv,OnlyDiagonal) 
 CYxYxCYxTx = Matmul2(adjYx,YxCYxTx,OnlyDiagonal) 
 CYxYxCYxTv = Matmul2(adjYx,YxCYxTv,OnlyDiagonal) 
 CYxYvadjYvYx = Matmul2(adjYx,YvadjYvYx,OnlyDiagonal) 
 CYxYvadjYvTx = Matmul2(adjYx,YvadjYvTx,OnlyDiagonal) 
 CYxTxCYxYx = Matmul2(adjYx,TxCYxYx,OnlyDiagonal) 
 CYxTxCYxYv = Matmul2(adjYx,TxCYxYv,OnlyDiagonal) 
 CYxTxCTvTpYv = Matmul2(adjYx,TxCTvTpYv,OnlyDiagonal) 
 CYxTvadjYvYx = Matmul2(adjYx,TvadjYvYx,OnlyDiagonal) 
 CYvCml2TpYvCYx = Matmul2(Conjg(Yv),Cml2TpYvCYx,OnlyDiagonal) 
 CYvTpYeCYeTpYv = Matmul2(Conjg(Yv),TpYeCYeTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYeCYeTpYv(i2,i2) =  Real(CYvTpYeCYeTpYv(i2,i2),dp) 
 CYvTpYeCYeTpTv = Matmul2(Conjg(Yv),TpYeCYeTpTv,OnlyDiagonal) 
 CYvTpYvCmv2CYx = Matmul2(Conjg(Yv),TpYvCmv2CYx,OnlyDiagonal) 
 CYvTpYvCYxmv2 = Matmul2(Conjg(Yv),TpYvCYxmv2,OnlyDiagonal) 
 CYvTpYvCYxYx = Matmul2(Conjg(Yv),TpYvCYxYx,OnlyDiagonal) 
 CYvTpYvCYxYv = Matmul2(Conjg(Yv),TpYvCYxYv,OnlyDiagonal) 
 CYvTpYvCYxTx = Matmul2(Conjg(Yv),TpYvCYxTx,OnlyDiagonal) 
 CYvTpYvCYxTv = Matmul2(Conjg(Yv),TpYvCYxTv,OnlyDiagonal) 
 CYvTpYvCYvTpYv = Matmul2(Conjg(Yv),TpYvCYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvCYvTpYv(i2,i2) =  Real(CYvTpYvCYvTpYv(i2,i2),dp) 
 CYvTpYvCYvTpTv = Matmul2(Conjg(Yv),TpYvCYvTpTv,OnlyDiagonal) 
 CYvTpTeCYeTpYv = Matmul2(Conjg(Yv),TpTeCYeTpYv,OnlyDiagonal) 
 CYvTpTvCYxYx = Matmul2(Conjg(Yv),TpTvCYxYx,OnlyDiagonal) 
 CYvTpTvCYxYv = Matmul2(Conjg(Yv),TpTvCYxYv,OnlyDiagonal) 
 CYvTpTvCYvTpYv = Matmul2(Conjg(Yv),TpTvCYvTpYv,OnlyDiagonal) 
 TdadjYdYdadjTd = Matmul2(Td,adjYdYdadjTd,OnlyDiagonal) 
 TdadjYuYuadjTd = Matmul2(Td,adjYuYuadjTd,OnlyDiagonal) 
 TdadjTdYdadjYd = Matmul2(Td,adjTdYdadjYd,OnlyDiagonal) 
 TdadjTuYuadjYd = Matmul2(Td,adjTuYuadjYd,OnlyDiagonal) 
 TeadjYeYeadjTe = Matmul2(Te,adjYeYeadjTe,OnlyDiagonal) 
 TeadjYvYvadjTe = Matmul2(Te,adjYvYvadjTe,OnlyDiagonal) 
 TeadjTeYeadjYe = Matmul2(Te,adjTeYeadjYe,OnlyDiagonal) 
 TeadjTvYvadjYe = Matmul2(Te,adjTvYvadjYe,OnlyDiagonal) 
 TxCYxYxCTx = Matmul2(Tx,CYxYxCTx,OnlyDiagonal) 
 TxCYvTpYvCTx = Matmul2(Tx,CYvTpYvCTx,OnlyDiagonal) 
 TxCTxYxCYx = Matmul2(Tx,CTxYxCYx,OnlyDiagonal) 
 TxCTvTpYvCYx = Matmul2(Tx,CTvTpYvCYx,OnlyDiagonal) 
 TuadjYdYdadjTu = Matmul2(Tu,adjYdYdadjTu,OnlyDiagonal) 
 TuadjYuYuadjTu = Matmul2(Tu,adjYuYuadjTu,OnlyDiagonal) 
 TuadjTdYdadjYu = Matmul2(Tu,adjTdYdadjYu,OnlyDiagonal) 
 TuadjTuYuadjYu = Matmul2(Tu,adjTuYuadjYu,OnlyDiagonal) 
 TvadjYeYeadjTv = Matmul2(Tv,adjYeYeadjTv,OnlyDiagonal) 
 TvadjYvYvadjTv = Matmul2(Tv,adjYvYvadjTv,OnlyDiagonal) 
 TvadjTeYeadjYv = Matmul2(Tv,adjTeYeadjYv,OnlyDiagonal) 
 TvadjTvYvadjYv = Matmul2(Tv,adjTvYvadjYv,OnlyDiagonal) 
 md2YdadjYdYdadjYd = Matmul2(md2,YdadjYdYdadjYd,OnlyDiagonal) 
 md2YdadjYuYuadjYd = Matmul2(md2,YdadjYuYuadjYd,OnlyDiagonal) 
 me2YeadjYeYeadjYe = Matmul2(me2,YeadjYeYeadjYe,OnlyDiagonal) 
 me2YeadjYvYvadjYe = Matmul2(me2,YeadjYvYvadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYeYe = Matmul2(ml2,adjYeYeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYvYv = Matmul2(ml2,adjYeYeadjYvYv,OnlyDiagonal) 
 ml2adjYvYxCYxYv = Matmul2(ml2,adjYvYxCYxYv,OnlyDiagonal) 
 ml2adjYvYvadjYeYe = Matmul2(ml2,adjYvYvadjYeYe,OnlyDiagonal) 
 ml2adjYvYvadjYvYv = Matmul2(ml2,adjYvYvadjYvYv,OnlyDiagonal) 
 mq2adjYdYdadjYdYd = Matmul2(mq2,adjYdYdadjYdYd,OnlyDiagonal) 
 mq2adjYdYdadjYuYu = Matmul2(mq2,adjYdYdadjYuYu,OnlyDiagonal) 
 mq2adjYuYuadjYdYd = Matmul2(mq2,adjYuYuadjYdYd,OnlyDiagonal) 
 mq2adjYuYuadjYuYu = Matmul2(mq2,adjYuYuadjYuYu,OnlyDiagonal) 
 mu2YuadjYdYdadjYu = Matmul2(mu2,YuadjYdYdadjYu,OnlyDiagonal) 
 mu2YuadjYuYuadjYu = Matmul2(mu2,YuadjYuYuadjYu,OnlyDiagonal) 
 mv2YxCYxYxCYx = Matmul2(mv2,YxCYxYxCYx,OnlyDiagonal) 
 mv2YxCYxYvadjYv = Matmul2(mv2,YxCYxYvadjYv,OnlyDiagonal) 
 mv2YxCYvTpYvCYx = Matmul2(mv2,YxCYvTpYvCYx,OnlyDiagonal) 
 mv2YvadjYeYeadjYv = Matmul2(mv2,YvadjYeYeadjYv,OnlyDiagonal) 
 mv2YvadjYvYxCYx = Matmul2(mv2,YvadjYvYxCYx,OnlyDiagonal) 
 mv2YvadjYvYvadjYv = Matmul2(mv2,YvadjYvYvadjYv,OnlyDiagonal) 
 Ydmq2adjYdYdadjYd = Matmul2(Yd,mq2adjYdYdadjYd,OnlyDiagonal) 
 Ydmq2adjYuYuadjYd = Matmul2(Yd,mq2adjYuYuadjYd,OnlyDiagonal) 
 YdadjYdmd2YdadjYd = Matmul2(Yd,adjYdmd2YdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdmd2YdadjYd(i2,i2) =  Real(YdadjYdmd2YdadjYd(i2,i2),dp) 
 YdadjYdYdmq2adjYd = Matmul2(Yd,adjYdYdmq2adjYd,OnlyDiagonal) 
 YdadjYdYdadjYdmd2 = Matmul2(Yd,adjYdYdadjYdmd2,OnlyDiagonal) 
 YdadjYdYdadjYdYd = Matmul2(Yd,adjYdYdadjYdYd,OnlyDiagonal) 
 YdadjYdYdadjYdTd = Matmul2(Yd,adjYdYdadjYdTd,OnlyDiagonal) 
 YdadjYdTdadjYdYd = Matmul2(Yd,adjYdTdadjYdYd,OnlyDiagonal) 
 YdadjYumu2YuadjYd = Matmul2(Yd,adjYumu2YuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYumu2YuadjYd(i2,i2) =  Real(YdadjYumu2YuadjYd(i2,i2),dp) 
 YdadjYuYumq2adjYd = Matmul2(Yd,adjYuYumq2adjYd,OnlyDiagonal) 
 YdadjYuYuadjYdmd2 = Matmul2(Yd,adjYuYuadjYdmd2,OnlyDiagonal) 
 YdadjYuYuadjYdYd = Matmul2(Yd,adjYuYuadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYdTd = Matmul2(Yd,adjYuYuadjYdTd,OnlyDiagonal) 
 YdadjYuYuadjYuYu = Matmul2(Yd,adjYuYuadjYuYu,OnlyDiagonal) 
 YdadjYuYuadjYuTu = Matmul2(Yd,adjYuYuadjYuTu,OnlyDiagonal) 
 YdadjYuTuadjYdYd = Matmul2(Yd,adjYuTuadjYdYd,OnlyDiagonal) 
 YdadjYuTuadjYuYu = Matmul2(Yd,adjYuTuadjYuYu,OnlyDiagonal) 
 Yeml2adjYeYeadjYe = Matmul2(Ye,ml2adjYeYeadjYe,OnlyDiagonal) 
 Yeml2adjYvYvadjYe = Matmul2(Ye,ml2adjYvYvadjYe,OnlyDiagonal) 
 YeadjYeme2YeadjYe = Matmul2(Ye,adjYeme2YeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeme2YeadjYe(i2,i2) =  Real(YeadjYeme2YeadjYe(i2,i2),dp) 
 YeadjYeYeml2adjYe = Matmul2(Ye,adjYeYeml2adjYe,OnlyDiagonal) 
 YeadjYeYeadjYeme2 = Matmul2(Ye,adjYeYeadjYeme2,OnlyDiagonal) 
 YeadjYeYeadjYeYe = Matmul2(Ye,adjYeYeadjYeYe,OnlyDiagonal) 
 YeadjYeYeadjYeTe = Matmul2(Ye,adjYeYeadjYeTe,OnlyDiagonal) 
 YeadjYeTeadjYeYe = Matmul2(Ye,adjYeTeadjYeYe,OnlyDiagonal) 
 YeadjYvmv2YvadjYe = Matmul2(Ye,adjYvmv2YvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYvmv2YvadjYe(i2,i2) =  Real(YeadjYvmv2YvadjYe(i2,i2),dp) 
 YeadjYvYxCYxYv = Matmul2(Ye,adjYvYxCYxYv,OnlyDiagonal) 
 YeadjYvYxCYxTv = Matmul2(Ye,adjYvYxCYxTv,OnlyDiagonal) 
 YeadjYvYvml2adjYe = Matmul2(Ye,adjYvYvml2adjYe,OnlyDiagonal) 
 YeadjYvYvadjYeme2 = Matmul2(Ye,adjYvYvadjYeme2,OnlyDiagonal) 
 YeadjYvYvadjYeYe = Matmul2(Ye,adjYvYvadjYeYe,OnlyDiagonal) 
 YeadjYvYvadjYeTe = Matmul2(Ye,adjYvYvadjYeTe,OnlyDiagonal) 
 YeadjYvYvadjYvYv = Matmul2(Ye,adjYvYvadjYvYv,OnlyDiagonal) 
 YeadjYvYvadjYvTv = Matmul2(Ye,adjYvYvadjYvTv,OnlyDiagonal) 
 YeadjYvTxCYxYv = Matmul2(Ye,adjYvTxCYxYv,OnlyDiagonal) 
 YeadjYvTvadjYeYe = Matmul2(Ye,adjYvTvadjYeYe,OnlyDiagonal) 
 YeadjYvTvadjYvYv = Matmul2(Ye,adjYvTvadjYvYv,OnlyDiagonal) 
 YxCmv2CYxYxCYx = Matmul2(Yx,Cmv2CYxYxCYx,OnlyDiagonal) 
 YxCmv2CYxYvadjYv = Matmul2(Yx,Cmv2CYxYvadjYv,OnlyDiagonal) 
 YxCmv2CYvTpYvCYx = Matmul2(Yx,Cmv2CYvTpYvCYx,OnlyDiagonal) 
 YxCYxmv2YxCYx = Matmul2(Yx,CYxmv2YxCYx,OnlyDiagonal) 
 YxCYxYxCmv2CYx = Matmul2(Yx,CYxYxCmv2CYx,OnlyDiagonal) 
 YxCYxYxCYxmv2 = Matmul2(Yx,CYxYxCYxmv2,OnlyDiagonal) 
 YxCYxYxCYxYx = Matmul2(Yx,CYxYxCYxYx,OnlyDiagonal) 
 YxCYxYxCYxYv = Matmul2(Yx,CYxYxCYxYv,OnlyDiagonal) 
 YxCYxYxCYxTx = Matmul2(Yx,CYxYxCYxTx,OnlyDiagonal) 
 YxCYxYxCYxTv = Matmul2(Yx,CYxYxCYxTv,OnlyDiagonal) 
 YxCYxYvadjYvYx = Matmul2(Yx,CYxYvadjYvYx,OnlyDiagonal) 
 YxCYxYvadjYvTx = Matmul2(Yx,CYxYvadjYvTx,OnlyDiagonal) 
 YxCYxTxCYxYx = Matmul2(Yx,CYxTxCYxYx,OnlyDiagonal) 
 YxCYxTxCYxYv = Matmul2(Yx,CYxTxCYxYv,OnlyDiagonal) 
 YxCYxTvadjYvYx = Matmul2(Yx,CYxTvadjYvYx,OnlyDiagonal) 
 YxCYvCml2TpYvCYx = Matmul2(Yx,CYvCml2TpYvCYx,OnlyDiagonal) 
 YxCYvTpYeCYeTpYv = Matmul2(Yx,CYvTpYeCYeTpYv,OnlyDiagonal) 
 YxCYvTpYeCYeTpTv = Matmul2(Yx,CYvTpYeCYeTpTv,OnlyDiagonal) 
 YxCYvTpYvCmv2CYx = Matmul2(Yx,CYvTpYvCmv2CYx,OnlyDiagonal) 
 YxCYvTpYvCYxmv2 = Matmul2(Yx,CYvTpYvCYxmv2,OnlyDiagonal) 
 YxCYvTpYvCYxYx = Matmul2(Yx,CYvTpYvCYxYx,OnlyDiagonal) 
 YxCYvTpYvCYxYv = Matmul2(Yx,CYvTpYvCYxYv,OnlyDiagonal) 
 YxCYvTpYvCYxTx = Matmul2(Yx,CYvTpYvCYxTx,OnlyDiagonal) 
 YxCYvTpYvCYxTv = Matmul2(Yx,CYvTpYvCYxTv,OnlyDiagonal) 
 YxCYvTpYvCYvTpYv = Matmul2(Yx,CYvTpYvCYvTpYv,OnlyDiagonal) 
 YxCYvTpYvCYvTpTv = Matmul2(Yx,CYvTpYvCYvTpTv,OnlyDiagonal) 
 YxCYvTpTeCYeTpYv = Matmul2(Yx,CYvTpTeCYeTpYv,OnlyDiagonal) 
 YxCYvTpTvCYxYx = Matmul2(Yx,CYvTpTvCYxYx,OnlyDiagonal) 
 YxCYvTpTvCYxYv = Matmul2(Yx,CYvTpTvCYxYv,OnlyDiagonal) 
 YxCYvTpTvCYvTpYv = Matmul2(Yx,CYvTpTvCYvTpYv,OnlyDiagonal) 
 Yumq2adjYdYdadjYu = Matmul2(Yu,mq2adjYdYdadjYu,OnlyDiagonal) 
 Yumq2adjYuYuadjYu = Matmul2(Yu,mq2adjYuYuadjYu,OnlyDiagonal) 
 YuadjYdmd2YdadjYu = Matmul2(Yu,adjYdmd2YdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdmd2YdadjYu(i2,i2) =  Real(YuadjYdmd2YdadjYu(i2,i2),dp) 
 YuadjYdYdmq2adjYu = Matmul2(Yu,adjYdYdmq2adjYu,OnlyDiagonal) 
 YuadjYdYdadjYdYd = Matmul2(Yu,adjYdYdadjYdYd,OnlyDiagonal) 
 YuadjYdYdadjYdTd = Matmul2(Yu,adjYdYdadjYdTd,OnlyDiagonal) 
 YuadjYdYdadjYumu2 = Matmul2(Yu,adjYdYdadjYumu2,OnlyDiagonal) 
 YuadjYdYdadjYuYu = Matmul2(Yu,adjYdYdadjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYuTu = Matmul2(Yu,adjYdYdadjYuTu,OnlyDiagonal) 
 YuadjYdTdadjYdYd = Matmul2(Yu,adjYdTdadjYdYd,OnlyDiagonal) 
 YuadjYdTdadjYuYu = Matmul2(Yu,adjYdTdadjYuYu,OnlyDiagonal) 
 YuadjYumu2YuadjYu = Matmul2(Yu,adjYumu2YuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYumu2YuadjYu(i2,i2) =  Real(YuadjYumu2YuadjYu(i2,i2),dp) 
 YuadjYuYumq2adjYu = Matmul2(Yu,adjYuYumq2adjYu,OnlyDiagonal) 
 YuadjYuYuadjYumu2 = Matmul2(Yu,adjYuYuadjYumu2,OnlyDiagonal) 
 YuadjYuYuadjYuYu = Matmul2(Yu,adjYuYuadjYuYu,OnlyDiagonal) 
 YuadjYuYuadjYuTu = Matmul2(Yu,adjYuYuadjYuTu,OnlyDiagonal) 
 YuadjYuTuadjYuYu = Matmul2(Yu,adjYuTuadjYuYu,OnlyDiagonal) 
 Yvml2adjYeYeadjYv = Matmul2(Yv,ml2adjYeYeadjYv,OnlyDiagonal) 
 Yvml2adjYvYvadjYv = Matmul2(Yv,ml2adjYvYvadjYv,OnlyDiagonal) 
 YvadjYeme2YeadjYv = Matmul2(Yv,adjYeme2YeadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYeme2YeadjYv(i2,i2) =  Real(YvadjYeme2YeadjYv(i2,i2),dp) 
 YvadjYeYeml2adjYv = Matmul2(Yv,adjYeYeml2adjYv,OnlyDiagonal) 
 YvadjYeYeadjYeYe = Matmul2(Yv,adjYeYeadjYeYe,OnlyDiagonal) 
 YvadjYeYeadjYeTe = Matmul2(Yv,adjYeYeadjYeTe,OnlyDiagonal) 
 YvadjYeYeadjYvmv2 = Matmul2(Yv,adjYeYeadjYvmv2,OnlyDiagonal) 
 YvadjYeYeadjYvYx = Matmul2(Yv,adjYeYeadjYvYx,OnlyDiagonal) 
 YvadjYeYeadjYvYv = Matmul2(Yv,adjYeYeadjYvYv,OnlyDiagonal) 
 YvadjYeYeadjYvTx = Matmul2(Yv,adjYeYeadjYvTx,OnlyDiagonal) 
 YvadjYeYeadjYvTv = Matmul2(Yv,adjYeYeadjYvTv,OnlyDiagonal) 
 YvadjYeTeadjYeYe = Matmul2(Yv,adjYeTeadjYeYe,OnlyDiagonal) 
 YvadjYeTeadjYvYx = Matmul2(Yv,adjYeTeadjYvYx,OnlyDiagonal) 
 YvadjYeTeadjYvYv = Matmul2(Yv,adjYeTeadjYvYv,OnlyDiagonal) 
 YvadjYvmv2YvadjYv = Matmul2(Yv,adjYvmv2YvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvmv2YvadjYv(i2,i2) =  Real(YvadjYvmv2YvadjYv(i2,i2),dp) 
 YvadjYvYxCYxYv = Matmul2(Yv,adjYvYxCYxYv,OnlyDiagonal) 
 YvadjYvYxCYxTv = Matmul2(Yv,adjYvYxCYxTv,OnlyDiagonal) 
 YvadjYvYvml2adjYv = Matmul2(Yv,adjYvYvml2adjYv,OnlyDiagonal) 
 YvadjYvYvadjYvmv2 = Matmul2(Yv,adjYvYvadjYvmv2,OnlyDiagonal) 
 YvadjYvYvadjYvYx = Matmul2(Yv,adjYvYvadjYvYx,OnlyDiagonal) 
 YvadjYvYvadjYvYv = Matmul2(Yv,adjYvYvadjYvYv,OnlyDiagonal) 
 YvadjYvYvadjYvTx = Matmul2(Yv,adjYvYvadjYvTx,OnlyDiagonal) 
 YvadjYvYvadjYvTv = Matmul2(Yv,adjYvYvadjYvTv,OnlyDiagonal) 
 YvadjYvTxCYxYv = Matmul2(Yv,adjYvTxCYxYv,OnlyDiagonal) 
 YvadjYvTvadjYvYx = Matmul2(Yv,adjYvTvadjYvYx,OnlyDiagonal) 
 YvadjYvTvadjYvYv = Matmul2(Yv,adjYvTvadjYvYv,OnlyDiagonal) 
 adjYdmd2YdadjYdYd = Matmul2(adjYd,md2YdadjYdYd,OnlyDiagonal) 
 adjYdYdmq2adjYdYd = Matmul2(adjYd,Ydmq2adjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdmq2adjYdYd(i2,i2) =  Real(adjYdYdmq2adjYdYd(i2,i2),dp) 
 adjYdYdadjYdmd2Yd = Matmul2(adjYd,YdadjYdmd2Yd,OnlyDiagonal) 
 adjYdYdadjYdYdmq2 = Matmul2(adjYd,YdadjYdYdmq2,OnlyDiagonal) 
 adjYeme2YeadjYeYe = Matmul2(adjYe,me2YeadjYeYe,OnlyDiagonal) 
 adjYeYeml2adjYeYe = Matmul2(adjYe,Yeml2adjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeml2adjYeYe(i2,i2) =  Real(adjYeYeml2adjYeYe(i2,i2),dp) 
 adjYeYeadjYeme2Ye = Matmul2(adjYe,YeadjYeme2Ye,OnlyDiagonal) 
 adjYeYeadjYeYeml2 = Matmul2(adjYe,YeadjYeYeml2,OnlyDiagonal) 
 adjYumu2YuadjYuYu = Matmul2(adjYu,mu2YuadjYuYu,OnlyDiagonal) 
 adjYuYumq2adjYuYu = Matmul2(adjYu,Yumq2adjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYumq2adjYuYu(i2,i2) =  Real(adjYuYumq2adjYuYu(i2,i2),dp) 
 adjYuYuadjYumu2Yu = Matmul2(adjYu,YuadjYumu2Yu,OnlyDiagonal) 
 adjYuYuadjYuYumq2 = Matmul2(adjYu,YuadjYuYumq2,OnlyDiagonal) 
 adjYvmv2YxCYxYv = Matmul2(adjYv,mv2YxCYxYv,OnlyDiagonal) 
 adjYvmv2YvadjYvYv = Matmul2(adjYv,mv2YvadjYvYv,OnlyDiagonal) 
 adjYvYxCmv2CYxYv = Matmul2(adjYv,YxCmv2CYxYv,OnlyDiagonal) 
 adjYvYxCYxmv2Yv = Matmul2(adjYv,YxCYxmv2Yv,OnlyDiagonal) 
 adjYvYxCYxYvml2 = Matmul2(adjYv,YxCYxYvml2,OnlyDiagonal) 
 adjYvYvml2adjYvYv = Matmul2(adjYv,Yvml2adjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvml2adjYvYv(i2,i2) =  Real(adjYvYvml2adjYvYv(i2,i2),dp) 
 adjYvYvadjYvmv2Yv = Matmul2(adjYv,YvadjYvmv2Yv,OnlyDiagonal) 
 adjYvYvadjYvYvml2 = Matmul2(adjYv,YvadjYvYvml2,OnlyDiagonal) 
 TdadjYdYdadjYdYd = Matmul2(Td,adjYdYdadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYdYd = Matmul2(Td,adjYuYuadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYuYu = Matmul2(Td,adjYuYuadjYuYu,OnlyDiagonal) 
 TeadjYeYeadjYeYe = Matmul2(Te,adjYeYeadjYeYe,OnlyDiagonal) 
 TeadjYvYxCYxYv = Matmul2(Te,adjYvYxCYxYv,OnlyDiagonal) 
 TeadjYvYvadjYeYe = Matmul2(Te,adjYvYvadjYeYe,OnlyDiagonal) 
 TeadjYvYvadjYvYv = Matmul2(Te,adjYvYvadjYvYv,OnlyDiagonal) 
 TxCYxYxCYxYx = Matmul2(Tx,CYxYxCYxYx,OnlyDiagonal) 
 TxCYxYxCYxYv = Matmul2(Tx,CYxYxCYxYv,OnlyDiagonal) 
 TxCYxYvadjYvYx = Matmul2(Tx,CYxYvadjYvYx,OnlyDiagonal) 
 TxCYvTpYeCYeTpYv = Matmul2(Tx,CYvTpYeCYeTpYv,OnlyDiagonal) 
 TxCYvTpYvCYxYx = Matmul2(Tx,CYvTpYvCYxYx,OnlyDiagonal) 
 TxCYvTpYvCYxYv = Matmul2(Tx,CYvTpYvCYxYv,OnlyDiagonal) 
 TxCYvTpYvCYvTpYv = Matmul2(Tx,CYvTpYvCYvTpYv,OnlyDiagonal) 
 TuadjYdYdadjYdYd = Matmul2(Tu,adjYdYdadjYdYd,OnlyDiagonal) 
 TuadjYdYdadjYuYu = Matmul2(Tu,adjYdYdadjYuYu,OnlyDiagonal) 
 TuadjYuYuadjYuYu = Matmul2(Tu,adjYuYuadjYuYu,OnlyDiagonal) 
 TvadjYeYeadjYeYe = Matmul2(Tv,adjYeYeadjYeYe,OnlyDiagonal) 
 TvadjYeYeadjYvYx = Matmul2(Tv,adjYeYeadjYvYx,OnlyDiagonal) 
 TvadjYeYeadjYvYv = Matmul2(Tv,adjYeYeadjYvYv,OnlyDiagonal) 
 TvadjYvYxCYxYv = Matmul2(Tv,adjYvYxCYxYv,OnlyDiagonal) 
 TvadjYvYvadjYvYx = Matmul2(Tv,adjYvYvadjYvYx,OnlyDiagonal) 
 TvadjYvYvadjYvYv = Matmul2(Tv,adjYvYvadjYvYv,OnlyDiagonal) 
 TrYxCTx = cTrace(YxCTx)
 TrCTdTpYd = cTrace(CTdTpYd)
 TrCTeTpYe = cTrace(CTeTpYe)
 TrCTuTpYu = cTrace(CTuTpYu)
 TrCTvTpYv = cTrace(CTvTpYv)
 Trmv2CYxYx = cTrace(mv2CYxYx)
 TrYdadjYdCmd2 = cTrace(YdadjYdCmd2)
 TrYdCmq2adjYd = Real(cTrace(YdCmq2adjYd),dp)  
 TrYeadjYeCme2 = cTrace(YeadjYeCme2)
 TrYeCml2adjYe = Real(cTrace(YeCml2adjYe),dp)  
 TrYuadjYuCmu2 = cTrace(YuadjYuCmu2)
 TrYuCmq2adjYu = Real(cTrace(YuCmq2adjYu),dp)  
 TrYvadjYvCmv2 = cTrace(YvadjYvCmv2)
 TrYvCml2adjYv = Real(cTrace(YvCml2adjYv),dp)  
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp)  
 TrYdadjYdTdadjYd = cTrace(YdadjYdTdadjYd)
 TrYdadjYdTdadjTd = cTrace(YdadjYdTdadjTd)
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp)  
 TrYdadjYuTuadjYd = cTrace(YdadjYuTuadjYd)
 TrYdadjYuTuadjTd = cTrace(YdadjYuTuadjTd)
 TrYdadjTdTdadjYd = cTrace(YdadjTdTdadjYd)
 TrYdadjTuTuadjYd = cTrace(YdadjTuTuadjYd)
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp)  
 TrYeadjYeTeadjYe = cTrace(YeadjYeTeadjYe)
 TrYeadjYeTeadjTe = cTrace(YeadjYeTeadjTe)
 TrYeadjYvYvadjYe = Real(cTrace(YeadjYvYvadjYe),dp)  
 TrYeadjYvTvadjYe = cTrace(YeadjYvTvadjYe)
 TrYeadjYvTvadjTe = cTrace(YeadjYvTvadjTe)
 TrYeadjTeTeadjYe = cTrace(YeadjTeTeadjYe)
 TrYeadjTvTvadjYe = cTrace(YeadjTvTvadjYe)
 TrYxCYxYxCYx = cTrace(YxCYxYxCYx)
 TrYxCYxYvadjYv = cTrace(YxCYxYvadjYv)
 TrYxCYxTxCYx = cTrace(YxCYxTxCYx)
 TrYxCYxTxCTx = cTrace(YxCYxTxCTx)
 TrYxCYxTvadjYv = cTrace(YxCYxTvadjYv)
 TrYxCYxTvadjTv = cTrace(YxCYxTvadjTv)
 TrYxCTxTxCYx = cTrace(YxCTxTxCYx)
 TrYxCTxTvadjYv = cTrace(YxCTxTvadjYv)
 TrYuadjYdTdadjYu = cTrace(YuadjYdTdadjYu)
 TrYuadjYdTdadjTu = cTrace(YuadjYdTdadjTu)
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp)  
 TrYuadjYuTuadjYu = cTrace(YuadjYuTuadjYu)
 TrYuadjYuTuadjTu = cTrace(YuadjYuTuadjTu)
 TrYuadjTdTdadjYu = cTrace(YuadjTdTdadjYu)
 TrYuadjTuTuadjYu = cTrace(YuadjTuTuadjYu)
 TrYvadjYeTeadjYv = cTrace(YvadjYeTeadjYv)
 TrYvadjYeTeadjTv = cTrace(YvadjYeTeadjTv)
 TrYvadjYvYvadjYv = Real(cTrace(YvadjYvYvadjYv),dp)  
 TrYvadjYvTxCYx = cTrace(YvadjYvTxCYx)
 TrYvadjYvTxCTx = cTrace(YvadjYvTxCTx)
 TrYvadjYvTvadjYv = cTrace(YvadjYvTvadjYv)
 TrYvadjYvTvadjTv = cTrace(YvadjYvTvadjTv)
 TrYvadjTeTeadjYv = cTrace(YvadjTeTeadjYv)
 TrYvadjTvTvadjYv = cTrace(YvadjTvTvadjYv)
 TrCYxTxCTvTpYv = cTrace(CYxTxCTvTpYv)
 Trmd2YdadjYdYdadjYd = cTrace(md2YdadjYdYdadjYd)
 Trmd2YdadjYuYuadjYd = cTrace(md2YdadjYuYuadjYd)
 Trme2YeadjYeYeadjYe = cTrace(me2YeadjYeYeadjYe)
 Trme2YeadjYvYvadjYe = cTrace(me2YeadjYvYvadjYe)
 Trml2adjYeYeadjYeYe = cTrace(ml2adjYeYeadjYeYe)
 Trml2adjYeYeadjYvYv = cTrace(ml2adjYeYeadjYvYv)
 Trml2adjYvYxCYxYv = cTrace(ml2adjYvYxCYxYv)
 Trml2adjYvYvadjYeYe = cTrace(ml2adjYvYvadjYeYe)
 Trml2adjYvYvadjYvYv = cTrace(ml2adjYvYvadjYvYv)
 Trmq2adjYdYdadjYdYd = cTrace(mq2adjYdYdadjYdYd)
 Trmq2adjYdYdadjYuYu = cTrace(mq2adjYdYdadjYuYu)
 Trmq2adjYuYuadjYdYd = cTrace(mq2adjYuYuadjYdYd)
 Trmq2adjYuYuadjYuYu = cTrace(mq2adjYuYuadjYuYu)
 Trmu2YuadjYdYdadjYu = cTrace(mu2YuadjYdYdadjYu)
 Trmu2YuadjYuYuadjYu = cTrace(mu2YuadjYuYuadjYu)
 Trmv2YxCYxYxCYx = cTrace(mv2YxCYxYxCYx)
 Trmv2YxCYxYvadjYv = cTrace(mv2YxCYxYvadjYv)
 Trmv2YvadjYeYeadjYv = cTrace(mv2YvadjYeYeadjYv)
 Trmv2YvadjYvYxCYx = cTrace(mv2YvadjYvYxCYx)
 Trmv2YvadjYvYvadjYv = cTrace(mv2YvadjYvYvadjYv)
 TrYxCmv2CYxYvadjYv = cTrace(YxCmv2CYxYvadjYv)
 sqrt2ov3 =Sqrt(2._dp/3._dp) 
 sqrt5ov2 =Sqrt(5._dp/2._dp) 
 ooSqrt3 =1._dp/sqrt(3._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p4 =g1**4 
 g1p5 =g1**5 
 gYBp3 =gYB**3 
 gYBp4 =gYB**4 
 gYBp5 =gYB**5 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gBLp4 =gBL**4 
 gBLp5 =gBL**5 
 gBYp3 =gBY**3 
 gBYp4 =gBY**4 
 gBYp5 =gBY**5 
 Xip2 =Xi**2 
End If 
 
 
Tr1(1) = (sqrt3*(4*g1*sqrt5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 +           & 
&  Trmq2 - 2._dp*(Trmu2)) - 5*gBY*sqrt2*(2._dp*(mC12) - 2._dp*(mC22) + Trmd2 -           & 
&  Trme2 + 2._dp*(Trml2) - 2._dp*(Trmq2) + Trmu2 - Trmv2)))/20._dp

Tr1(4) = (sqrt3*(4*gYB*sqrt5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 +          & 
&  Trmq2 - 2._dp*(Trmu2)) - 5*gBL*sqrt2*(2._dp*(mC12) - 2._dp*(mC22) + Trmd2 -           & 
&  Trme2 + 2._dp*(Trml2) - 2._dp*(Trmq2) + Trmu2 - Trmv2)))/20._dp

If (TwoLoopRGE) Then 
Tr2U1(1, 1) = (60*gBYp2*mC12 + 60*gBYp2*mC22 + 12*g1p2*mHd2 + 12*g1p2*mHu2 +          & 
&  (8._dp*(g1p2) + 5._dp*(gBYp2) - 4*g1*gBY*sqrt10)*Trmd2 + 3*(8._dp*(g1p2)              & 
&  + 5._dp*(gBYp2) + 4*g1*gBY*sqrt10)*Trme2 + 12*g1p2*Trml2 + 30*gBYp2*Trml2 +           & 
&  12*g1*gBY*sqrt10*Trml2 + 4*g1p2*Trmq2 + 10*gBYp2*Trmq2 + 4*g1*gBY*sqrt10*Trmq2 +      & 
&  32*g1p2*Trmu2 + 5*gBYp2*Trmu2 + 8*g1*gBY*sqrt10*Trmu2 + 15*gBYp2*Trmv2)/40._dp

Tr2U1(1, 4) = (60*gBL*gBY*mC12 + 60*gBL*gBY*mC22 + 12*g1*gYB*mHd2 + 12*g1*gYB*mHu2 +  & 
&  (8*g1*gYB + 5*gBL*gBY - 2*g1*gBL*sqrt10 - 2*gYB*gBY*sqrt10)*Trmd2 + 3*(8*g1*gYB +     & 
&  5*gBL*gBY + 2*g1*gBL*sqrt10 + 2*gYB*gBY*sqrt10)*Trme2 + 12*g1*gYB*Trml2 +             & 
&  30*gBL*gBY*Trml2 + 6*g1*gBL*sqrt10*Trml2 + 6*gYB*gBY*sqrt10*Trml2 + 4*g1*gYB*Trmq2 +  & 
&  10*gBL*gBY*Trmq2 + 2*g1*gBL*sqrt10*Trmq2 + 2*gYB*gBY*sqrt10*Trmq2 + 32*g1*gYB*Trmu2 + & 
&  5*gBL*gBY*Trmu2 + 4*g1*gBL*sqrt10*Trmu2 + 4*gYB*gBY*sqrt10*Trmu2 + 15*gBL*gBY*Trmv2)/40._dp

Tr3(1) = (ooSqrt3*(-1800*gBY*gBLp2*mC12*sqrt2 - 1800*gBYp3*mC12*sqrt2 +               & 
&  1800*gBY*gBLp2*mC22*sqrt2 + 1800*gBYp3*mC22*sqrt2 - 72*g1p3*mHd2*sqrt5 -              & 
&  360*g1*g2p2*mHd2*sqrt5 - 72*g1*gYBp2*mHd2*sqrt5 + 72*g1p3*mHu2*sqrt5 + 360*g1*g2p2*mHu2*sqrt5 +& 
&  72*g1*gYBp2*mHu2*sqrt5 + (-120*g1p2*gBY*sqrt2 + 32*g1p3*sqrt5 - 5*gBY*(5*(32._dp*(g3p2)& 
&  + gBLp2 + gBYp2)*sqrt2 + 8*gYBp2*sqrt2 - 8*gYB*gBL*sqrt5) + 4*g1*(-20*gYB*gBL*sqrt2 + & 
&  5*(32._dp*(g3p2) + gBLp2 + 3._dp*(gBYp2))*sqrt5 + 8*gYBp2*sqrt5))*Trmd2 +             & 
&  9*(120*g1p2*gBY*sqrt2 + 32*g1p3*sqrt5 + 5*gBY*(5*(gBLp2 + gBYp2)*sqrt2 +              & 
&  8*gYBp2*sqrt2 + 8*gYB*gBL*sqrt5) + 4*g1*(20*gYB*gBL*sqrt2 + 5*(gBLp2 + 3._dp*(gBYp2)) & 
& *sqrt5 + 8*gYBp2*sqrt5))*Trme2 - 360*g1*gYB*gBL*sqrt2*Trml2 - 540*g1p2*gBY*sqrt2*Trml2 -& 
&  900*g2p2*gBY*sqrt2*Trml2 - 450*gBY*gBLp2*sqrt2*Trml2 - 450*gBYp3*sqrt2*Trml2 -        & 
&  180*gBY*gYBp2*sqrt2*Trml2 - 72*g1p3*sqrt5*Trml2 - 360*g1*g2p2*sqrt5*Trml2 -           & 
&  360*gYB*gBL*gBY*sqrt5*Trml2 - 180*g1*gBLp2*sqrt5*Trml2 - 540*g1*gBYp2*sqrt5*Trml2 -   & 
&  72*g1*gYBp2*sqrt5*Trml2 + 40*g1*gYB*gBL*sqrt2*Trmq2 + 60*g1p2*gBY*sqrt2*Trmq2 +       & 
&  900*g2p2*gBY*sqrt2*Trmq2 + 1600*g3p2*gBY*sqrt2*Trmq2 + 50*gBY*gBLp2*sqrt2*Trmq2 +     & 
&  50*gBYp3*sqrt2*Trmq2 + 20*gBY*gYBp2*sqrt2*Trmq2 + 8*g1p3*sqrt5*Trmq2 + 360*g1*g2p2*sqrt5*Trmq2 +& 
&  640*g1*g3p2*sqrt5*Trmq2 + 40*gYB*gBL*gBY*sqrt5*Trmq2 + 20*g1*gBLp2*sqrt5*Trmq2 +      & 
&  60*g1*gBYp2*sqrt5*Trmq2 + 8*g1*gYBp2*sqrt5*Trmq2 - 320*g1*gYB*gBL*sqrt2*Trmu2 -       & 
&  480*g1p2*gBY*sqrt2*Trmu2 - 800*g3p2*gBY*sqrt2*Trmu2 - 25*gBY*gBLp2*sqrt2*Trmu2 -      & 
&  25*gBYp3*sqrt2*Trmu2 - 160*gBY*gYBp2*sqrt2*Trmu2 - 256*g1p3*sqrt5*Trmu2 -             & 
&  1280*g1*g3p2*sqrt5*Trmu2 - 80*gYB*gBL*gBY*sqrt5*Trmu2 - 40*g1*gBLp2*sqrt5*Trmu2 -     & 
&  120*g1*gBYp2*sqrt5*Trmu2 - 256*g1*gYBp2*sqrt5*Trmu2 + 225*gBY*gBLp2*sqrt2*Trmv2 +     & 
&  225*gBYp3*sqrt2*Trmv2 - 1200*gBY*sqrt2*Trmv2CYxYx + 720*g1*mHd2*sqrt5*TrYdadjYd +     & 
&  600*gBY*sqrt2*TrYdadjYdCmd2 - 480*g1*sqrt5*TrYdadjYdCmd2 - 600*gBY*sqrt2*TrYdCmq2adjYd -& 
&  240*g1*sqrt5*TrYdCmq2adjYd + 240*g1*mHd2*sqrt5*TrYeadjYe - 600*gBY*sqrt2*TrYeadjYeCme2 -& 
&  480*g1*sqrt5*TrYeadjYeCme2 + 600*gBY*sqrt2*TrYeCml2adjYe + 240*g1*sqrt5*TrYeCml2adjYe -& 
&  720*g1*mHu2*sqrt5*TrYuadjYu + 600*gBY*sqrt2*TrYuadjYuCmu2 + 960*g1*sqrt5*TrYuadjYuCmu2 -& 
&  600*gBY*sqrt2*TrYuCmq2adjYu - 240*g1*sqrt5*TrYuCmq2adjYu - 240*g1*mHu2*sqrt5*TrYvadjYv -& 
&  600*gBY*sqrt2*TrYvadjYvCmv2 + 600*gBY*sqrt2*TrYvCml2adjYv + 240*g1*sqrt5*TrYvCml2adjYv +& 
&  1200*gBY*mC12*sqrt2*TrYxCYx))/800._dp

Tr2(2) = (mHd2 + mHu2 + Trml2 + 3._dp*(Trmq2))/2._dp

Tr2(3) = (Trmd2 + 2._dp*(Trmq2) + Trmu2)/2._dp

Tr2U1(4, 1) = (60*gBL*gBY*mC12 + 60*gBL*gBY*mC22 + 12*g1*gYB*mHd2 + 12*g1*gYB*mHu2 +  & 
&  (8*g1*gYB + 5*gBL*gBY - 2*g1*gBL*sqrt10 - 2*gYB*gBY*sqrt10)*Trmd2 + 3*(8*g1*gYB +     & 
&  5*gBL*gBY + 2*g1*gBL*sqrt10 + 2*gYB*gBY*sqrt10)*Trme2 + 12*g1*gYB*Trml2 +             & 
&  30*gBL*gBY*Trml2 + 6*g1*gBL*sqrt10*Trml2 + 6*gYB*gBY*sqrt10*Trml2 + 4*g1*gYB*Trmq2 +  & 
&  10*gBL*gBY*Trmq2 + 2*g1*gBL*sqrt10*Trmq2 + 2*gYB*gBY*sqrt10*Trmq2 + 32*g1*gYB*Trmu2 + & 
&  5*gBL*gBY*Trmu2 + 4*g1*gBL*sqrt10*Trmu2 + 4*gYB*gBY*sqrt10*Trmu2 + 15*gBL*gBY*Trmv2)/40._dp

Tr2U1(4, 4) = (60*gBLp2*mC12 + 60*gBLp2*mC22 + 12*gYBp2*mHd2 + 12*gYBp2*mHu2 +        & 
&  (5._dp*(gBLp2) + 8._dp*(gYBp2) - 4*gYB*gBL*sqrt10)*Trmd2 + 3*(5._dp*(gBLp2)           & 
&  + 8._dp*(gYBp2) + 4*gYB*gBL*sqrt10)*Trme2 + 30*gBLp2*Trml2 + 12*gYBp2*Trml2 +         & 
&  12*gYB*gBL*sqrt10*Trml2 + 10*gBLp2*Trmq2 + 4*gYBp2*Trmq2 + 4*gYB*gBL*sqrt10*Trmq2 +   & 
&  5*gBLp2*Trmu2 + 32*gYBp2*Trmu2 + 8*gYB*gBL*sqrt10*Trmu2 + 15*gBLp2*Trmv2)/40._dp

Tr3(4) = (ooSqrt3*(-1800*gBLp3*mC12*sqrt2 - 1800*gBL*gBYp2*mC12*sqrt2 +               & 
&  1800*gBLp3*mC22*sqrt2 + 1800*gBL*gBYp2*mC22*sqrt2 - 72*gYB*g1p2*mHd2*sqrt5 -          & 
&  360*gYB*g2p2*mHd2*sqrt5 - 72*gYBp3*mHd2*sqrt5 + 72*gYB*g1p2*mHu2*sqrt5 +              & 
&  360*gYB*g2p2*mHu2*sqrt5 + 72*gYBp3*mHu2*sqrt5 + (-25*gBL*(32._dp*(g3p2)               & 
&  + gBLp2 + gBYp2)*sqrt2 - 120*gBL*gYBp2*sqrt2 + 20*gYB*(32._dp*(g3p2) + 3._dp*(gBLp2)  & 
&  + gBYp2)*sqrt5 + 32*gYBp3*sqrt5 + 8*g1p2*(-5*gBL*sqrt2 + 4*gYB*sqrt5) +               & 
&  40*g1*gBY*(-2*gYB*sqrt2 + gBL*sqrt5))*Trmd2 + 9*(25*gBL*(gBLp2 + gBYp2)               & 
& *sqrt2 + 120*gBL*gYBp2*sqrt2 + 20*gYB*(3._dp*(gBLp2) + gBYp2)*sqrt5 + 32*gYBp3*sqrt5 + & 
&  8*g1p2*(5*gBL*sqrt2 + 4*gYB*sqrt5) + 40*g1*gBY*(2*gYB*sqrt2 + gBL*sqrt5))             & 
& *Trme2 - 180*g1p2*gBL*sqrt2*Trml2 - 900*g2p2*gBL*sqrt2*Trml2 - 360*g1*gYB*gBY*sqrt2*Trml2 -& 
&  450*gBLp3*sqrt2*Trml2 - 450*gBL*gBYp2*sqrt2*Trml2 - 540*gBL*gYBp2*sqrt2*Trml2 -       & 
&  72*gYB*g1p2*sqrt5*Trml2 - 360*gYB*g2p2*sqrt5*Trml2 - 360*g1*gBL*gBY*sqrt5*Trml2 -     & 
&  540*gYB*gBLp2*sqrt5*Trml2 - 180*gYB*gBYp2*sqrt5*Trml2 - 72*gYBp3*sqrt5*Trml2 +        & 
&  20*g1p2*gBL*sqrt2*Trmq2 + 900*g2p2*gBL*sqrt2*Trmq2 + 1600*g3p2*gBL*sqrt2*Trmq2 +      & 
&  40*g1*gYB*gBY*sqrt2*Trmq2 + 50*gBLp3*sqrt2*Trmq2 + 50*gBL*gBYp2*sqrt2*Trmq2 +         & 
&  60*gBL*gYBp2*sqrt2*Trmq2 + 8*gYB*g1p2*sqrt5*Trmq2 + 360*gYB*g2p2*sqrt5*Trmq2 +        & 
&  640*gYB*g3p2*sqrt5*Trmq2 + 40*g1*gBL*gBY*sqrt5*Trmq2 + 60*gYB*gBLp2*sqrt5*Trmq2 +     & 
&  20*gYB*gBYp2*sqrt5*Trmq2 + 8*gYBp3*sqrt5*Trmq2 - 160*g1p2*gBL*sqrt2*Trmu2 -           & 
&  800*g3p2*gBL*sqrt2*Trmu2 - 320*g1*gYB*gBY*sqrt2*Trmu2 - 25*gBLp3*sqrt2*Trmu2 -        & 
&  25*gBL*gBYp2*sqrt2*Trmu2 - 480*gBL*gYBp2*sqrt2*Trmu2 - 256*gYB*g1p2*sqrt5*Trmu2 -     & 
&  1280*gYB*g3p2*sqrt5*Trmu2 - 80*g1*gBL*gBY*sqrt5*Trmu2 - 120*gYB*gBLp2*sqrt5*Trmu2 -   & 
&  40*gYB*gBYp2*sqrt5*Trmu2 - 256*gYBp3*sqrt5*Trmu2 + 225*gBLp3*sqrt2*Trmv2 +            & 
&  225*gBL*gBYp2*sqrt2*Trmv2 - 1200*gBL*sqrt2*Trmv2CYxYx + 720*gYB*mHd2*sqrt5*TrYdadjYd +& 
&  600*gBL*sqrt2*TrYdadjYdCmd2 - 480*gYB*sqrt5*TrYdadjYdCmd2 - 600*gBL*sqrt2*TrYdCmq2adjYd -& 
&  240*gYB*sqrt5*TrYdCmq2adjYd + 240*gYB*mHd2*sqrt5*TrYeadjYe - 600*gBL*sqrt2*TrYeadjYeCme2 -& 
&  480*gYB*sqrt5*TrYeadjYeCme2 + 600*gBL*sqrt2*TrYeCml2adjYe + 240*gYB*sqrt5*TrYeCml2adjYe -& 
&  720*gYB*mHu2*sqrt5*TrYuadjYu + 600*gBL*sqrt2*TrYuadjYuCmu2 + 960*gYB*sqrt5*TrYuadjYuCmu2 -& 
&  600*gBL*sqrt2*TrYuCmq2adjYu - 240*gYB*sqrt5*TrYuCmq2adjYu - 240*gYB*mHu2*sqrt5*TrYvadjYv -& 
&  600*gBL*sqrt2*TrYvadjYvCmv2 + 600*gBL*sqrt2*TrYvCml2adjYv + 240*gYB*sqrt5*TrYvCml2adjYv +& 
&  1200*gBL*mC12*sqrt2*TrYxCYx))/800._dp

End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = (3*(11._dp*(g1p3) + 4*g1p2*gBY*sqrt10 + gYB*gBY*(15._dp*(gBL)              & 
&  + 2*gYB*sqrt10) + g1*(15._dp*(gBYp2) + 11._dp*(gYBp2) + 2*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = (-14._dp*(g1p3)/5._dp - gYB*gBL*gBY + gBY*gYBp2*ooSqrt10 + g1*(-1._dp*(gBYp2) -       & 
&  14._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10) + g1p2*gBY*sqrt2ov5)*TrYdadjYd +             & 
&  (398._dp*(g1p5) + 270*g1p3*g2p2 + 880*g1p3*g3p2 + 1610*gYB*g1p2*gBL*gBY +             & 
&  450*gYB*g2p2*gBL*gBY + 400*gYB*g3p2*gBL*gBY + 230*g1p3*gBLp2 + 1250*gYB*gBY*gBLp3 +   & 
&  1380*g1p3*gBYp2 + 450*g1*g2p2*gBYp2 + 400*g1*g3p2*gBYp2 + 1250*g1*gBLp2*gBYp2 +       & 
&  1250*gYB*gBL*gBYp3 + 1250*g1*gBYp4 + 796*g1p3*gYBp2 + 270*g1*g2p2*gYBp2 +             & 
&  880*g1*g3p2*gYBp2 + 690*g1*gBLp2*gYBp2 + 920*g1*gBYp2*gYBp2 + 690*gBL*gBY*gYBp3 +     & 
&  398*g1*gYBp4 + 246*gYB*g1p3*gBL*sqrt10 + 90*g1*gYB*g2p2*gBL*sqrt10 + 80*g1*gYB*g3p2*gBL*sqrt10 +& 
&  328*g1p4*gBY*sqrt10 + 180*g1p2*g2p2*gBY*sqrt10 + 160*g1p2*g3p2*gBY*sqrt10 +           & 
&  140*g1p2*gBY*gBLp2*sqrt10 + 70*g1*gYB*gBLp3*sqrt10 + 350*g1*gYB*gBL*gBYp2*sqrt10 +    & 
&  280*g1p2*gBYp3*sqrt10 + 410*g1p2*gBY*gYBp2*sqrt10 + 90*g2p2*gBY*gYBp2*sqrt10 +        & 
&  80*g3p2*gBY*gYBp2*sqrt10 + 210*gBY*gBLp2*gYBp2*sqrt10 + 70*gBYp3*gYBp2*sqrt10 +       & 
&  246*g1*gBL*gYBp3*sqrt10 + 82*gBY*gYBp4*sqrt10 - 15*(12._dp*(g1p3) + 6*g1p2*gBY*sqrt10 +& 
&  gYB*gBY*(10._dp*(gBL) + 3*gYB*sqrt10) + g1*(10._dp*(gBYp2) + 12._dp*(gYBp2) +         & 
&  3*gYB*gBL*sqrt10))*TrYeadjYe - 260*g1p3*TrYuadjYu - 50*gYB*gBL*gBY*TrYuadjYu -        & 
&  50*g1*gBYp2*TrYuadjYu - 260*g1*gYBp2*TrYuadjYu - 25*g1*gYB*gBL*sqrt10*TrYuadjYu -     & 
&  50*g1p2*gBY*sqrt10*TrYuadjYu - 25*gBY*gYBp2*sqrt10*TrYuadjYu - 60*g1p3*TrYvadjYv -    & 
&  150*gYB*gBL*gBY*TrYvadjYv - 150*g1*gBYp2*TrYvadjYv - 60*g1*gYBp2*TrYvadjYv -          & 
&  15*g1*gYB*gBL*sqrt10*TrYvadjYv - 30*g1p2*gBY*sqrt10*TrYvadjYv - 15*gBY*gYBp2*sqrt10*TrYvadjYv -& 
&  450*gBY*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = (g2p3*(9._dp*(g1p2) + 125._dp*(g2p2) + 120._dp*(g3p2) + 15._dp*(gBLp2) -              & 
&  30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv)))/5._dp

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = (g3p3*(11._dp*(g1p2) + 45._dp*(g2p2) + 70._dp*(g3p2) + 5._dp*(gBLp2) - 20._dp*(TrYdadjYd) -& 
&  20._dp*(TrYuadjYu)))/5._dp

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = (3*(11*g1*gYB*gBY + 15._dp*(gBLp3) + 15*gBL*gBYp2 + 11*gBL*gYBp2 +        & 
&  2*g1*gBL*gBY*sqrt10 + 4*gYB*gBLp2*sqrt10 + 2*gYB*gBYp2*sqrt10))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBL2 = (398*gYB*g1p3*gBY + 270*g1*gYB*g2p2*gBY + 880*g1*gYB*g3p2*gBY + 1610*g1*gYB*gBY*gBLp2 +& 
&  230*g1p2*gBLp3 + 450*g2p2*gBLp3 + 400*g3p2*gBLp3 + 1250._dp*(gBLp5) + 690*g1p2*gBL*gBYp2 +& 
&  450*g2p2*gBL*gBYp2 + 400*g3p2*gBL*gBYp2 + 2500*gBLp3*gBYp2 + 690*g1*gYB*gBYp3 +       & 
&  1250*gBL*gBYp4 + 398*g1p2*gBL*gYBp2 + 270*g2p2*gBL*gYBp2 + 880*g3p2*gBL*gYBp2 +       & 
&  1380*gBLp3*gYBp2 + 920*gBL*gBYp2*gYBp2 + 398*g1*gBY*gYBp3 + 398*gBL*gYBp4 +           & 
&  82*g1p3*gBL*gBY*sqrt10 + 90*g1*g2p2*gBL*gBY*sqrt10 + 80*g1*g3p2*gBL*gBY*sqrt10 +      & 
&  164*gYB*g1p2*gBLp2*sqrt10 + 180*gYB*g2p2*gBLp2*sqrt10 + 160*gYB*g3p2*gBLp2*sqrt10 +   & 
&  210*g1*gBY*gBLp3*sqrt10 + 280*gYB*gBLp4*sqrt10 + 246*gYB*g1p2*gBYp2*sqrt10 +          & 
&  90*gYB*g2p2*gBYp2*sqrt10 + 80*gYB*g3p2*gBYp2*sqrt10 + 350*gYB*gBLp2*gBYp2*sqrt10 +    & 
&  210*g1*gBL*gBYp3*sqrt10 + 70*gYB*gBYp4*sqrt10 + 410*g1*gBL*gBY*gYBp2*sqrt10 +         & 
&  328*gBLp2*gYBp3*sqrt10 + 82*gBYp2*gYBp3*sqrt10 - 5*(28*g1*gYB*gBY + 10._dp*(gBLp3) +  & 
&  10*gBL*gBYp2 + 28*gBL*gYBp2 - g1*gBL*gBY*sqrt10 - 2*gYB*gBLp2*sqrt10 - gYB*gBYp2*sqrt10)*TrYdadjYd -& 
&  15*(12*g1*gYB*gBY + 10._dp*(gBLp3) + 10*gBL*gBYp2 + 12*gBL*gYBp2 + 3*g1*gBL*gBY*sqrt10 +& 
&  6*gYB*gBLp2*sqrt10 + 3*gYB*gBYp2*sqrt10)*TrYeadjYe - 260*g1*gYB*gBY*TrYuadjYu -       & 
&  50*gBLp3*TrYuadjYu - 50*gBL*gBYp2*TrYuadjYu - 260*gBL*gYBp2*TrYuadjYu -               & 
&  25*g1*gBL*gBY*sqrt10*TrYuadjYu - 50*gYB*gBLp2*sqrt10*TrYuadjYu - 25*gYB*gBYp2*sqrt10*TrYuadjYu -& 
&  60*g1*gYB*gBY*TrYvadjYv - 150*gBLp3*TrYvadjYv - 150*gBL*gBYp2*TrYvadjYv -             & 
&  60*gBL*gYBp2*TrYvadjYv - 15*g1*gBL*gBY*sqrt10*TrYvadjYv - 30*gYB*gBLp2*sqrt10*TrYvadjYv -& 
&  15*gYB*gBYp2*sqrt10*TrYvadjYv - 450*gBLp3*TrYxCYx - 450*gBL*gBYp2*TrYxCYx)/50._dp

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! gYB 
!-------------------- 
 
betagYB1  = (3*(g1*gBY*(15._dp*(gBL) + 2*gYB*sqrt10) + g1p2*(11._dp*(gYB)             & 
&  + 2*gBL*sqrt10) + gYB*(15._dp*(gBLp2) + 11._dp*(gYBp2) + 4*gYB*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagYB2 = (g1p2*(-14._dp*(gYB)/5._dp + gBL*ooSqrt10) + g1*(-(gBL*gBY) + gYB*gBY*ooSqrt10) +     & 
&  (gYB*(-5._dp*(gBLp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10))/5._dp)*TrYdadjYd +           & 
&  (398*gYB*g1p4 + 270*gYB*g1p2*g2p2 + 880*gYB*g1p2*g3p2 + 690*g1p3*gBL*gBY +            & 
&  450*g1*g2p2*gBL*gBY + 400*g1*g3p2*gBL*gBY + 920*gYB*g1p2*gBLp2 + 450*gYB*g2p2*gBLp2 + & 
&  400*gYB*g3p2*gBLp2 + 1250*g1*gBY*gBLp3 + 1250*gYB*gBLp4 + 690*gYB*g1p2*gBYp2 +        & 
&  1250*gYB*gBLp2*gBYp2 + 1250*g1*gBL*gBYp3 + 1610*g1*gBL*gBY*gYBp2 + 796*g1p2*gYBp3 +   & 
&  270*g2p2*gYBp3 + 880*g3p2*gYBp3 + 1380*gBLp2*gYBp3 + 230*gBYp2*gYBp3 + 398._dp*(gYBp5) +& 
&  82*g1p4*gBL*sqrt10 + 90*g1p2*g2p2*gBL*sqrt10 + 80*g1p2*g3p2*gBL*sqrt10 +              & 
&  246*gYB*g1p3*gBY*sqrt10 + 90*g1*gYB*g2p2*gBY*sqrt10 + 80*g1*gYB*g3p2*gBY*sqrt10 +     & 
&  350*g1*gYB*gBY*gBLp2*sqrt10 + 70*g1p2*gBLp3*sqrt10 + 210*g1p2*gBL*gBYp2*sqrt10 +      & 
&  70*g1*gYB*gBYp3*sqrt10 + 410*g1p2*gBL*gYBp2*sqrt10 + 180*g2p2*gBL*gYBp2*sqrt10 +      & 
&  160*g3p2*gBL*gYBp2*sqrt10 + 280*gBLp3*gYBp2*sqrt10 + 140*gBL*gBYp2*gYBp2*sqrt10 +     & 
&  246*g1*gBY*gYBp3*sqrt10 + 328*gBL*gYBp4*sqrt10 - 15*(g1*gBY*(10._dp*(gBL) +           & 
&  3*gYB*sqrt10) + 3*g1p2*(4._dp*(gYB) + gBL*sqrt10) + 2*gYB*(5._dp*(gBLp2) +            & 
&  6._dp*(gYBp2) + 3*gYB*gBL*sqrt10))*TrYeadjYe - 260*gYB*g1p2*TrYuadjYu -               & 
&  50*g1*gBL*gBY*TrYuadjYu - 50*gYB*gBLp2*TrYuadjYu - 260*gYBp3*TrYuadjYu -              & 
&  25*g1p2*gBL*sqrt10*TrYuadjYu - 25*g1*gYB*gBY*sqrt10*TrYuadjYu - 50*gBL*gYBp2*sqrt10*TrYuadjYu -& 
&  60*gYB*g1p2*TrYvadjYv - 150*g1*gBL*gBY*TrYvadjYv - 150*gYB*gBLp2*TrYvadjYv -          & 
&  60*gYBp3*TrYvadjYv - 15*g1p2*gBL*sqrt10*TrYvadjYv - 15*g1*gYB*gBY*sqrt10*TrYvadjYv -  & 
&  30*gBL*gYBp2*sqrt10*TrYvadjYv - 450*gBL*(gYB*gBL + g1*gBY)*TrYxCYx)/50._dp

 
DgYB = oo16pi2*( betagYB1 + oo16pi2 * betagYB2 ) 

 
Else 
DgYB = oo16pi2* betagYB1 
End If 
 
 
If (.not.KineticMixing) DgYB  = 0._dp 
!-------------------- 
! gBY 
!-------------------- 
 
betagBY1  = (3*(11*g1p2*gBY + gBY*(15*(gBLp2 + gBYp2) + 2*gYB*gBL*sqrt10)             & 
&  + g1*(11*gYB*gBL + 2*(gBLp2 + 2._dp*(gBYp2))*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betagBY2 = (398*gYB*g1p3*gBL + 270*g1*gYB*g2p2*gBL + 880*g1*gYB*g3p2*gBL + 398*g1p4*gBY +        & 
&  270*g1p2*g2p2*gBY + 880*g1p2*g3p2*gBY + 920*g1p2*gBY*gBLp2 + 450*g2p2*gBY*gBLp2 +     & 
&  400*g3p2*gBY*gBLp2 + 690*g1*gYB*gBLp3 + 1250*gBY*gBLp4 + 1610*g1*gYB*gBL*gBYp2 +      & 
&  1380*g1p2*gBYp3 + 450*g2p2*gBYp3 + 400*g3p2*gBYp3 + 2500*gBLp2*gBYp3 + 1250._dp*(gBYp5) +& 
&  398*g1p2*gBY*gYBp2 + 690*gBY*gBLp2*gYBp2 + 230*gBYp3*gYBp2 + 398*g1*gBL*gYBp3 +       & 
&  410*gYB*g1p2*gBL*gBY*sqrt10 + 90*gYB*g2p2*gBL*gBY*sqrt10 + 80*gYB*g3p2*gBL*gBY*sqrt10 +& 
&  82*g1p3*gBLp2*sqrt10 + 90*g1*g2p2*gBLp2*sqrt10 + 80*g1*g3p2*gBLp2*sqrt10 +            & 
&  210*gYB*gBY*gBLp3*sqrt10 + 70*g1*gBLp4*sqrt10 + 328*g1p3*gBYp2*sqrt10 +               & 
&  180*g1*g2p2*gBYp2*sqrt10 + 160*g1*g3p2*gBYp2*sqrt10 + 350*g1*gBLp2*gBYp2*sqrt10 +     & 
&  210*gYB*gBL*gBYp3*sqrt10 + 280*g1*gBYp4*sqrt10 + 246*g1*gBLp2*gYBp2*sqrt10 +          & 
&  164*g1*gBYp2*gYBp2*sqrt10 + 82*gBL*gBY*gYBp3*sqrt10 - 5*(28*g1p2*gBY + 10*gBY*(gBLp2 +& 
&  gBYp2) - gYB*gBL*gBY*sqrt10 + g1*(28*gYB*gBL - (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*gBY + gBY*(10*(gBLp2 + gBYp2) + 3*gYB*gBL*sqrt10) + 3*g1*(4*gYB*gBL +     & 
&  (gBLp2 + 2._dp*(gBYp2))*sqrt10))*TrYeadjYe - 260*g1*gYB*gBL*TrYuadjYu -               & 
&  260*g1p2*gBY*TrYuadjYu - 50*gBY*gBLp2*TrYuadjYu - 50*gBYp3*TrYuadjYu - 25*gYB*gBL*gBY*sqrt10*TrYuadjYu -& 
&  25*g1*gBLp2*sqrt10*TrYuadjYu - 50*g1*gBYp2*sqrt10*TrYuadjYu - 60*g1*gYB*gBL*TrYvadjYv -& 
&  60*g1p2*gBY*TrYvadjYv - 150*gBY*gBLp2*TrYvadjYv - 150*gBYp3*TrYvadjYv -               & 
&  15*gYB*gBL*gBY*sqrt10*TrYvadjYv - 15*g1*gBLp2*sqrt10*TrYvadjYv - 30*g1*gBYp2*sqrt10*TrYvadjYv -& 
&  450*gBY*gBLp2*TrYxCYx - 450*gBYp3*TrYxCYx)/50._dp

 
DgBY = oo16pi2*( betagBY1 + oo16pi2 * betagBY2 ) 

 
Else 
DgBY = oo16pi2* betagBY1 
End If 
 
 
If (.not.KineticMixing) DgBY  = 0._dp 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = ((-14._dp*(g1p2) - 90._dp*(g2p2) - 160._dp*(g3p2) - 5._dp*(gBLp2)          & 
&  - 5._dp*(gBYp2) - 14._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10 + 90._dp*(TrYdadjYd)& 
&  + 30._dp*(TrYeadjYe))*Yd + 30*(3._dp*(YdadjYdYd) + YdadjYuYu))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = ((5740._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 1600*g1p2*g3p2 +              & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 17840._dp*g1*gYB*gBL*gBY - 670*g1p2*gBLp2 +   & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 8250*g1p2*gBYp2 +               & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  11480._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 1600*g3p2*gYBp2 + 8250*gBLp2*gYBp2 -         & 
&  670*gBYp2*gYBp2 + 5740._dp*(gYBp4) + 1592*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 -& 
&  320*gYB*g3p2*gBL*sqrt10 + 1592*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 -             & 
&  320*g1*g3p2*gBY*sqrt10 + 170*g1*gBY*gBLp2*sqrt10 + 170*gYB*gBLp3*sqrt10 +             & 
&  170*gYB*gBL*gBYp2*sqrt10 + 170*g1*gBYp3*sqrt10 + 1592*g1*gBY*gYBp2*sqrt10 +           & 
&  1592*gBL*gYBp3*sqrt10 - 180*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +       & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 16200._dp*(TrYdadjYdYdadjYd) -& 
&  5400._dp*(TrYdadjYuYuadjYd) + 540*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) + & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 5400._dp*(TrYeadjYeYeadjYe) -         & 
&  1800._dp*(TrYeadjYvYvadjYe))*Yd)/1800._dp + (4._dp*(g1p2)/5._dp + 6._dp*(g2p2) +      & 
&  4._dp*(gYBp2)/5._dp + gYB*gBL*ooSqrt10 + g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) -        & 
&  3._dp*(TrYeadjYe))*YdadjYdYd - 4._dp*(YdadjYdYdadjYdYd) + (4*g1p2*YdadjYuYu)/5._dp +  & 
&  (4*gYBp2*YdadjYuYu)/5._dp + gYB*gBL*ooSqrt10*YdadjYuYu + g1*gBY*ooSqrt10*YdadjYuYu -  & 
&  3*TrYuadjYu*YdadjYuYu - TrYvadjYv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdYd) -              & 
&  2._dp*(YdadjYuYuadjYuYu)

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = -((3*(6._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 6._dp*(gYBp2)      & 
&  + 3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10) - 30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe))      & 
& *Ye)/10._dp + 3._dp*(YeadjYeYe) + YeadjYvYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = ((2700._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 16560._dp*g1*gYB*gBL*gBY +      & 
&  2610*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 10890._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 5400*g1p2*gYBp2 +              & 
&  360*g2p2*gYBp2 + 10890._dp*gBLp2*gYBp2 + 2610*gBYp2*gYBp2 + 2700._dp*(gYBp4) +        & 
&  2376*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 + 2376*g1p3*gBY*sqrt10 +           & 
&  180*g1*g2p2*gBY*sqrt10 + 2610*g1*gBY*gBLp2*sqrt10 + 2610*gYB*gBLp3*sqrt10 +           & 
&  2610*gYB*gBL*gBYp2*sqrt10 + 2610*g1*gBYp3*sqrt10 + 2376*g1*gBY*gYBp2*sqrt10 +         & 
&  2376*gBL*gYBp3*sqrt10 - 20*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +        & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 1800._dp*(TrYdadjYdYdadjYd) -& 
&  600._dp*(TrYdadjYuYuadjYd) + 60*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) +   & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 600._dp*(TrYeadjYeYeadjYe) -          & 
&  200._dp*(TrYeadjYvYvadjYe))*Ye)/200._dp + (6._dp*(g2p2) - 3*gYB*gBL*ooSqrt10 -        & 
&  3*g1*gBY*ooSqrt10 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YeadjYeYe - 4._dp*(YeadjYeYeadjYeYe) -& 
&  3*gYB*gBL*ooSqrt10*YeadjYvYv - 3*g1*gBY*ooSqrt10*YeadjYvYv - 3*TrYuadjYu*YeadjYvYv -  & 
&  TrYvadjYv*YeadjYvYv - 2._dp*(YeadjYvYvadjYeYe) - 2._dp*(YeadjYvYvadjYvYv) -           & 
&  4._dp*(YeadjYvYxCYxYv)

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (-((26._dp*(g1p2) + 90._dp*(g2p2) + 160._dp*(g3p2) + 5._dp*(gBLp2)         & 
&  + 5._dp*(gBYp2) + 26._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10 -               & 
&  90._dp*(TrYuadjYu) - 30._dp*(TrYvadjYv))*Yu) + 30*(YuadjYdYd + 3._dp*(YuadjYuYu)))/30._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = ((10972._dp*(g1p4) + 1800*g1p2*g2p2 + 13500._dp*(g2p4) + 5440*g1p2*g3p2 +             & 
&  14400._dp*g2p2*g3p2 - 3200._dp*(g3p4) + 39920._dp*g1*gYB*gBL*gBY + 3770*g1p2*gBLp2 +  & 
&  450*g2p2*gBLp2 + 1600*g3p2*gBLp2 + 2725._dp*(gBLp4) + 23730._dp*g1p2*gBYp2 +          & 
&  450*g2p2*gBYp2 + 1600*g3p2*gBYp2 + 5450*gBLp2*gBYp2 + 2725._dp*(gBYp4) +              & 
&  21944._dp*g1p2*gYBp2 + 1800*g2p2*gYBp2 + 5440*g3p2*gYBp2 + 23730._dp*gBLp2*gYBp2 +    & 
&  3770*gBYp2*gYBp2 + 10972._dp*(gYBp4) + 5984*gYB*g1p2*gBL*sqrt10 + 180*gYB*g2p2*gBL*sqrt10 +& 
&  1600*gYB*g3p2*gBL*sqrt10 + 5984*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +            & 
&  1600*g1*g3p2*gBY*sqrt10 + 3470*g1*gBY*gBLp2*sqrt10 + 3470*gYB*gBLp3*sqrt10 +          & 
&  3470*gYB*gBL*gBYp2*sqrt10 + 3470*g1*gBYp3*sqrt10 + 5984*g1*gBY*gYBp2*sqrt10 +         & 
&  5984*gBL*gYBp3*sqrt10 - 5400._dp*(TrYdadjYuYuadjYd) - 1800._dp*(TrYeadjYvYvadjYe) +   & 
&  180*(8._dp*(g1p2) + 5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) +               & 
&  5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu - 16200._dp*(TrYuadjYuYuadjYu) +        & 
&  540*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + g1*sqrt10))*TrYvadjYv -      & 
&  5400._dp*(TrYvadjYvYvadjYv) - 7200._dp*(TrYxCYxYvadjYv))*Yu)/1800._dp +               & 
&  ((4._dp*(g1p2) + 4._dp*(gYBp2) - gYB*gBL*sqrt10 - g1*gBY*sqrt10 - 30._dp*(TrYdadjYd) -& 
&  10._dp*(TrYeadjYe))*YuadjYdYd)/10._dp - 2._dp*(YuadjYdYdadjYdYd) - 2._dp*(YuadjYdYdadjYuYu) +& 
&  (2*g1p2*YuadjYuYu)/5._dp + 6*g2p2*YuadjYuYu + (2*gYBp2*YuadjYuYu)/5._dp -             & 
&  gYB*gBL*ooSqrt10*YuadjYuYu - g1*gBY*ooSqrt10*YuadjYuYu - 9*TrYuadjYu*YuadjYuYu -      & 
&  3*TrYvadjYv*YuadjYuYu - 4._dp*(YuadjYuYuadjYuYu)

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yx 
!-------------------- 
 
betaYx1  = -((9*(gBLp2 + gBYp2) - 4._dp*(TrYxCYx))*Yx)/2._dp + 2*(YvadjYvYx +         & 
&  YxCYvTpYv + 4._dp*(YxCYxYx))

 
 
If (TwoLoopRGE) Then 
betaYx2 = ((2376*g1*gYB*gBL*gBY + 2025._dp*(gBLp4) + 1188*g1p2*gBYp2 + 4050*gBLp2*gBYp2 +       & 
&  2025._dp*(gBYp4) + 1188*gBLp2*gYBp2 + 432*g1*gBY*gBLp2*sqrt10 + 432*gYB*gBLp3*sqrt10 +& 
&  432*gYB*gBL*gBYp2*sqrt10 + 432*g1*gBYp3*sqrt10 - 120*(gBLp2 + gBYp2)*TrYxCYx -        & 
&  320._dp*(TrYxCYxYvadjYv) - 640._dp*(TrYxCYxYxCYx))*Yx)/40._dp - 2._dp*(YvadjYeYeadjYvYx) -& 
&  2._dp*(YvadjYvYvadjYvYx) + (6*g1p2*YvadjYvYx)/5._dp + 6*g2p2*YvadjYvYx +              & 
&  (6*gYBp2*YvadjYvYx)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYvYx + 3*g1*gBY*sqrt2ov5*YvadjYvYx -& 
&  6*TrYuadjYu*YvadjYvYx - 2*TrYvadjYv*YvadjYvYx - 2._dp*(YxCYvTpYeCYeTpYv) +            & 
&  (6*g1p2*YxCYvTpYv)/5._dp + 6*g2p2*YxCYvTpYv + (6*gYBp2*YxCYvTpYv)/5._dp +             & 
&  3*gYB*gBL*sqrt2ov5*YxCYvTpYv + 3*g1*gBY*sqrt2ov5*YxCYvTpYv - 6*TrYuadjYu*YxCYvTpYv -  & 
&  2*TrYvadjYv*YxCYvTpYv - 2._dp*(YxCYvTpYvCYvTpYv) - 8._dp*(YxCYvTpYvCYxYx) -           & 
&  8._dp*(YxCYxYvadjYvYx) + 8*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYx -            & 
&  32._dp*(YxCYxYxCYxYx)

 
DYx = oo16pi2*( betaYx1 + oo16pi2 * betaYx2 ) 

 
Else 
DYx = oo16pi2* betaYx1 
End If 
 
 
Call Chop(DYx) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = -((3*(2._dp*(g1p2) + 5*(2._dp*(g2p2) + gBLp2 + gBYp2) + 2._dp*(gYBp2)      & 
&  + gYB*gBL*sqrt10 + g1*gBY*sqrt10) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv))          & 
& *Yv)/10._dp + YvadjYeYe + 3._dp*(YvadjYvYv) + 4._dp*(YxCYxYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = ((828._dp*(g1p4) + 360*g1p2*g2p2 + 1500._dp*(g2p4) + 7920*g1*gYB*gBL*gBY +            & 
&  810*g1p2*gBLp2 + 450*g2p2*gBLp2 + 2925._dp*(gBLp4) + 4770*g1p2*gBYp2 + 450*g2p2*gBYp2 +& 
&  5850*gBLp2*gBYp2 + 2925._dp*(gBYp4) + 1656*g1p2*gYBp2 + 360*g2p2*gYBp2 +              & 
&  4770*gBLp2*gYBp2 + 810*gBYp2*gYBp2 + 828._dp*(gYBp4) + 720*gYB*g1p2*gBL*sqrt10 +      & 
&  180*gYB*g2p2*gBL*sqrt10 + 720*g1p3*gBY*sqrt10 + 180*g1*g2p2*gBY*sqrt10 +              & 
&  1350*g1*gBY*gBLp2*sqrt10 + 1350*gYB*gBLp3*sqrt10 + 1350*gYB*gBL*gBYp2*sqrt10 +        & 
&  1350*g1*gBYp3*sqrt10 + 720*g1*gBY*gYBp2*sqrt10 + 720*gBL*gYBp3*sqrt10 -               & 
&  600._dp*(TrYdadjYuYuadjYd) - 200._dp*(TrYeadjYvYvadjYe) + 20*(8._dp*(g1p2) +          & 
&  5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 8._dp*(gYBp2) + 5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10)*TrYuadjYu -& 
&  1800._dp*(TrYuadjYuYuadjYu) + 60*(5._dp*(gBLp2) + gYB*gBL*sqrt10 + gBY*(5._dp*(gBY) + & 
&  g1*sqrt10))*TrYvadjYv - 600._dp*(TrYvadjYvYvadjYv) - 800._dp*(TrYxCYxYvadjYv))*Yv)/200._dp +& 
&  (6*g1p2*YvadjYeYe)/5._dp + (6*gYBp2*YvadjYeYe)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYeYe + & 
&  3*g1*gBY*ooSqrt10*YvadjYeYe - 3*TrYdadjYd*YvadjYeYe - TrYeadjYe*YvadjYeYe -           & 
&  2._dp*(YvadjYeYeadjYeYe) - 2._dp*(YvadjYeYeadjYvYv) + (6*g1p2*YvadjYvYv)/5._dp +      & 
&  6*g2p2*YvadjYvYv + (6*gYBp2*YvadjYvYv)/5._dp + 3*gYB*gBL*ooSqrt10*YvadjYvYv +         & 
&  3*g1*gBY*ooSqrt10*YvadjYvYv - 9*TrYuadjYu*YvadjYvYv - 3*TrYvadjYv*YvadjYvYv -         & 
&  4._dp*(YvadjYvYvadjYvYv) - 4._dp*(YvadjYvYxCYxYv) - 8._dp*(YxCYvTpYvCYxYv) +          & 
&  4*(3*(gBLp2 + gBYp2) - 2._dp*(TrYxCYx))*YxCYxYv - 16._dp*(YxCYxYxCYxYv)

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! MuP 
!-------------------- 
 
betaMuP1  = 2*MuP*(-3*(gBLp2 + gBYp2) + TrYxCYx)

 
 
If (TwoLoopRGE) Then 
betaMuP2 = (MuP*(-15*(gBLp2 + gBYp2)*TrYxCYx + 2*(9*(20._dp*(gBLp4) + 11*gBLp2*gYBp2 +           & 
&  4*gBY*gBLp2*(10._dp*(gBY) + g1*sqrt10) + gBYp2*(11._dp*(g1p2) + 20._dp*(gBYp2) +      & 
&  4*g1*gBY*sqrt10) + gYB*(4*gBLp3*sqrt10 + 2*gBL*gBY*(11._dp*(g1) + 2*gBY*sqrt10))) -   & 
&  20._dp*(TrYxCYxYvadjYv) - 40._dp*(TrYxCYxYxCYx))))/5._dp

 
DMuP = oo16pi2*( betaMuP1 + oo16pi2 * betaMuP2 ) 

 
Else 
DMuP = oo16pi2* betaMuP1 
End If 
 
 
Call Chop(DMuP) 

!-------------------- 
! Mu 
!-------------------- 
 
betaMu1  = ((-3._dp*(g1p2) - 15._dp*(g2p2) - 3._dp*(gYBp2) + 15._dp*(TrYdadjYd)       & 
&  + 5._dp*(TrYeadjYe) + 15._dp*(TrYuadjYu) + 5._dp*(TrYvadjYv))*Mu)/5._dp

 
 
If (TwoLoopRGE) Then 
betaMu2 = ((207._dp*(g1p4) + 90*g1p2*g2p2 + 375._dp*(g2p4) + 540*g1*gYB*gBL*gBY +               & 
&  270*g1p2*gBYp2 + 414*g1p2*gYBp2 + 90*g2p2*gYBp2 + 270*gBLp2*gYBp2 + 207._dp*(gYBp4) + & 
&  72*gYB*g1p2*gBL*sqrt10 + 72*g1p3*gBY*sqrt10 + 72*g1*gBY*gYBp2*sqrt10 + 72*gBL*gYBp3*sqrt10 -& 
&  5*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) + 4._dp*(gYBp2) + gYB*gBL*sqrt10 +& 
&  g1*gBY*sqrt10)*TrYdadjYd - 450._dp*(TrYdadjYdYdadjYd) - 300._dp*(TrYdadjYuYuadjYd) +  & 
&  15*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) + 3*gYB*gBL*sqrt10 +             & 
&  3*g1*gBY*sqrt10)*TrYeadjYe - 150._dp*(TrYeadjYeYeadjYe) - 100._dp*(TrYeadjYvYvadjYe) +& 
&  40*g1p2*TrYuadjYu + 800*g3p2*TrYuadjYu + 25*gBLp2*TrYuadjYu + 25*gBYp2*TrYuadjYu +    & 
&  40*gYBp2*TrYuadjYu + 25*gYB*gBL*sqrt10*TrYuadjYu + 25*g1*gBY*sqrt10*TrYuadjYu -       & 
&  450._dp*(TrYuadjYuYuadjYu) + 75*gBLp2*TrYvadjYv + 75*gBYp2*TrYvadjYv + 15*gYB*gBL*sqrt10*TrYvadjYv +& 
&  15*g1*gBY*sqrt10*TrYvadjYv - 150._dp*(TrYvadjYvYvadjYv) - 200._dp*(TrYxCYxYvadjYv))*Mu)/50._dp

 
DMu = oo16pi2*( betaMu1 + oo16pi2 * betaMu2 ) 

 
Else 
DMu = oo16pi2* betaMu1 
End If 
 
 
Call Chop(DMu) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = (150._dp*(TdadjYdYd) + 30._dp*(TdadjYuYu) + 2*(14*g1p2*M1 + 5*gBYp2*M1 +   & 
&  28*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 14*gYBp2*MBp + 160*g3p2*M3 +         & 
&  90*g2p2*M2 - g1*gBY*M1*sqrt10 - g1*gBL*MBBp*sqrt10 - gYB*gBY*MBBp*sqrt10 -            & 
&  gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYdTd) + 30._dp*(TradjYeTe))*Yd + 120._dp*(YdadjYdTd)& 
&  + 60._dp*(YdadjYuTu) - 14*g1p2*Td - 90*g2p2*Td - 160*g3p2*Td - 5*gBLp2*Td -           & 
&  5*gBYp2*Td - 14*gYBp2*Td + gYB*gBL*sqrt10*Td + g1*gBY*sqrt10*Td + 90*TrYdadjYd*Td +   & 
&  30*TrYeadjYe*Td)/30._dp

 
 
If (TwoLoopRGE) Then 
betaTd2 = (6*g1p2*TdadjYdYd)/5._dp + 12*g2p2*TdadjYdYd + (6*gYBp2*TdadjYdYd)/5._dp +            & 
&  3*gYB*gBL*ooSqrt10*TdadjYdYd + 3*g1*gBY*ooSqrt10*TdadjYdYd - 6._dp*(TdadjYdYdadjYdYd) +& 
&  (4*g1p2*TdadjYuYu)/5._dp + (4*gYBp2*TdadjYuYu)/5._dp + gYB*gBL*ooSqrt10*TdadjYuYu +   & 
&  g1*gBY*ooSqrt10*TdadjYuYu - 4._dp*(TdadjYuYuadjYdYd) - 2._dp*(TdadjYuYuadjYuYu) -     & 
&  15*TdadjYdYd*TrYdadjYd - 5*TdadjYdYd*TrYeadjYe - 3*TdadjYuYu*TrYuadjYu -              & 
&  TdadjYuYu*TrYvadjYv - ((5740*g1p4*M1 + 900*g1p2*g2p2*M1 + 800*g1p2*g3p2*M1 +          & 
&  8920*g1*gYB*gBL*gBY*M1 - 335*g1p2*gBLp2*M1 + 8250*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + & 
&  800*g3p2*gBYp2*M1 + 2725*gBLp2*gBYp2*M1 + 2725*gBYp4*M1 + 5740*g1p2*gYBp2*M1 -        & 
&  335*gBYp2*gYBp2*M1 + 11480._dp*gYB*g1p3*MBBp + 1800*g1*gYB*g2p2*MBBp + 1600*g1*gYB*g3p2*MBBp +& 
&  8250*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 1600*g3p2*gBL*gBY*MBBp +             & 
&  8250*g1*gYB*gBLp2*MBBp + 5450*gBY*gBLp3*MBBp + 8250*g1*gYB*gBYp2*MBBp +               & 
&  5450*gBL*gBYp3*MBBp + 8250*gBL*gBY*gYBp2*MBBp + 11480._dp*g1*gYBp3*MBBp +             & 
&  8920*g1*gYB*gBL*gBY*MBp - 335*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp + 800*g3p2*gBLp2*MBp +& 
&  2725*gBLp4*MBp + 2725*gBLp2*gBYp2*MBp + 5740*g1p2*gYBp2*MBp + 900*g2p2*gYBp2*MBp +    & 
&  800*g3p2*gYBp2*MBp + 8250*gBLp2*gYBp2*MBp - 335*gBYp2*gYBp2*MBp + 5740*gYBp4*MBp +    & 
&  800*g1p2*g3p2*M3 + 7200*g2p2*g3p2*M3 - 3200*g3p4*M3 + 800*g3p2*gBLp2*M3 +             & 
&  800*g3p2*gBYp2*M3 + 800*g3p2*gYBp2*M3 + 900*g1p2*g2p2*M2 + 13500._dp*g2p4*M2 +        & 
&  7200*g2p2*g3p2*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 900*g2p2*gYBp2*M2 +       & 
&  796*gYB*g1p2*gBL*M1*sqrt10 + 1592*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 -     & 
&  160*g1*g3p2*gBY*M1*sqrt10 + 85*g1*gBY*gBLp2*M1*sqrt10 + 85*gYB*gBL*gBYp2*M1*sqrt10 +  & 
&  170*g1*gBYp3*M1*sqrt10 + 796*g1*gBY*gYBp2*M1*sqrt10 + 796*g1p3*gBL*MBBp*sqrt10 +      & 
&  90*g1*g2p2*gBL*MBBp*sqrt10 - 160*g1*g3p2*gBL*MBBp*sqrt10 + 2388*gYB*g1p2*gBY*MBBp*sqrt10 +& 
&  90*gYB*g2p2*gBY*MBBp*sqrt10 - 160*gYB*g3p2*gBY*MBBp*sqrt10 + 255*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  85*g1*gBLp3*MBBp*sqrt10 + 255*g1*gBL*gBYp2*MBBp*sqrt10 + 85*gYB*gBYp3*MBBp*sqrt10 +   & 
&  2388*g1*gBL*gYBp2*MBBp*sqrt10 + 796*gBY*gYBp3*MBBp*sqrt10 + 796*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 - 160*gYB*g3p2*gBL*MBp*sqrt10 + 85*g1*gBY*gBLp2*MBp*sqrt10 +& 
&  170*gYB*gBLp3*MBp*sqrt10 + 85*gYB*gBL*gBYp2*MBp*sqrt10 + 796*g1*gBY*gYBp2*MBp*sqrt10 +& 
&  1592*gBL*gYBp3*MBp*sqrt10 - 160*gYB*g3p2*gBL*M3*sqrt10 - 160*g1*g3p2*gBY*M3*sqrt10 +  & 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 + 360*g1p2*TradjYdTd -           & 
&  14400._dp*g3p2*TradjYdTd - 450*gBLp2*TradjYdTd - 450*gBYp2*TradjYdTd + 360*gYBp2*TradjYdTd +& 
&  90*gYB*gBL*sqrt10*TradjYdTd + 90*g1*gBY*sqrt10*TradjYdTd - 1080*g1p2*TradjYeTe -      & 
&  1350*gBLp2*TradjYeTe - 1350*gBYp2*TradjYeTe - 1080*gYBp2*TradjYeTe - 810*gYB*gBL*sqrt10*TradjYeTe -& 
&  810*g1*gBY*sqrt10*TradjYeTe - 90*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp -          & 
&  5*gBLp2*MBp + 4*gYBp2*MBp - 160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 +  & 
&  g1*(8*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 16200._dp*(TrYdadjYdTdadjYd) +& 
&  2700._dp*(TrYdadjYuTuadjYd) + 270*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +           & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 5400._dp*(TrYeadjYeTeadjYe) +& 
&  900._dp*(TrYeadjYvTvadjYe) + 2700._dp*(TrYuadjYdTdadjYu) + 900._dp*(TrYvadjYeTeadjYv))*Yd)/450._dp  
betaTd2 =  betaTd2+ (6*g1p2*YdadjYdTd)/5._dp + 6*g2p2*YdadjYdTd + (6*gYBp2*YdadjYdTd)/5._dp -             & 
&  12*TrYdadjYd*YdadjYdTd - 4*TrYeadjYe*YdadjYdTd - 8._dp*(YdadjYdTdadjYdYd) -           & 
&  ((8*g1p2*M1 + 16*g1*gYB*MBBp + 8*gYBp2*MBp + 60*g2p2*M2 + g1*gBY*M1*sqrt10 +          & 
&  g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYdTd) +  & 
&  30._dp*(TradjYeTe))*YdadjYdYd)/5._dp - 6._dp*(YdadjYdYdadjYdTd) + (8*g1p2*YdadjYuTu)/5._dp +& 
&  (8*gYBp2*YdadjYuTu)/5._dp + gYB*gBL*sqrt2ov5*YdadjYuTu + g1*gBY*sqrt2ov5*YdadjYuTu -  & 
&  6*TrYuadjYu*YdadjYuTu - 2*TrYvadjYv*YdadjYuTu - 4._dp*(YdadjYuTuadjYdYd) -            & 
&  4._dp*(YdadjYuTuadjYuYu) - (8*g1p2*M1*YdadjYuYu)/5._dp - (16*g1*gYB*MBBp*YdadjYuYu)/5._dp -& 
&  (8*gYBp2*MBp*YdadjYuYu)/5._dp - g1*gBY*M1*sqrt2ov5*YdadjYuYu - g1*gBL*MBBp*sqrt2ov5*YdadjYuYu -& 
&  gYB*gBY*MBBp*sqrt2ov5*YdadjYuYu - gYB*gBL*MBp*sqrt2ov5*YdadjYuYu - 6*TradjYuTu*YdadjYuYu -& 
&  2*TradjYvTv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdTd) - 4._dp*(YdadjYuYuadjYuTu) +         & 
&  (287*g1p4*Td)/90._dp + g1p2*g2p2*Td + (15*g2p4*Td)/2._dp + (8*g1p2*g3p2*Td)/9._dp +   & 
&  8*g2p2*g3p2*Td - (16*g3p4*Td)/9._dp + (446*g1*gYB*gBL*gBY*Td)/45._dp - (67*g1p2*gBLp2*Td)/180._dp +& 
&  (g2p2*gBLp2*Td)/4._dp + (8*g3p2*gBLp2*Td)/9._dp + (109*gBLp4*Td)/72._dp +             & 
&  (55*g1p2*gBYp2*Td)/12._dp + (g2p2*gBYp2*Td)/4._dp + (8*g3p2*gBYp2*Td)/9._dp +         & 
&  (109*gBLp2*gBYp2*Td)/36._dp + (109*gBYp4*Td)/72._dp + (287*g1p2*gYBp2*Td)/45._dp +    & 
&  g2p2*gYBp2*Td + (8*g3p2*gYBp2*Td)/9._dp + (55*gBLp2*gYBp2*Td)/12._dp - (67*gBYp2*gYBp2*Td)/180._dp +& 
&  (287*gYBp4*Td)/90._dp + gYB*g2p2*gBL*ooSqrt10*Td + g1*g2p2*gBY*ooSqrt10*Td +          & 
&  (17*g1*gBY*gBLp2*ooSqrt10*Td)/18._dp + (17*gYB*gBLp3*ooSqrt10*Td)/18._dp +            & 
&  (17*gYB*gBL*gBYp2*ooSqrt10*Td)/18._dp + (17*g1*gBYp3*ooSqrt10*Td)/18._dp +            & 
&  (199*gYB*g1p2*gBL*sqrt2ov5*Td)/45._dp - (8*gYB*g3p2*gBL*sqrt2ov5*Td)/9._dp  
betaTd2 =  betaTd2+ (199*g1p3*gBY*sqrt2ov5*Td)/45._dp - (8*g1*g3p2*gBY*sqrt2ov5*Td)/9._dp +               & 
&  (199*g1*gBY*gYBp2*sqrt2ov5*Td)/45._dp + (199*gBL*gYBp3*sqrt2ov5*Td)/45._dp -          & 
&  (2*g1p2*TrYdadjYd*Td)/5._dp + 16*g3p2*TrYdadjYd*Td + (gBLp2*TrYdadjYd*Td)/2._dp +     & 
&  (gBYp2*TrYdadjYd*Td)/2._dp - (2*gYBp2*TrYdadjYd*Td)/5._dp - gYB*gBL*ooSqrt10*TrYdadjYd*Td -& 
&  g1*gBY*ooSqrt10*TrYdadjYd*Td - 9*TrYdadjYdYdadjYd*Td - 3*TrYdadjYuYuadjYd*Td +        & 
&  (6*g1p2*TrYeadjYe*Td)/5._dp + (3*gBLp2*TrYeadjYe*Td)/2._dp + (3*gBYp2*TrYeadjYe*Td)/2._dp +& 
&  (6*gYBp2*TrYeadjYe*Td)/5._dp + 9*gYB*gBL*ooSqrt10*TrYeadjYe*Td + 9*g1*gBY*ooSqrt10*TrYeadjYe*Td -& 
&  3*TrYeadjYeYeadjYe*Td - TrYeadjYvYvadjYe*Td

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeadjYvYv + ((3*(6*g1p2*M1 + 5*gBYp2*M1 +              & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 6*gYBp2*MBp + 10*g2p2*M2 + 3*gYB*gBY*MBBp*sqrt10 +    & 
&  3*gYB*gBL*MBp*sqrt10 + 3*g1*(4*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))           & 
&  + 30._dp*(TradjYdTd) + 10._dp*(TradjYeTe))*Ye)/5._dp + 4._dp*(YeadjYeTe)              & 
&  + 2._dp*(YeadjYvTv) - (9*g1p2*Te)/5._dp - 3*g2p2*Te - (3*gBLp2*Te)/2._dp -            & 
&  (3*gBYp2*Te)/2._dp - (9*gYBp2*Te)/5._dp - 9*gYB*gBL*ooSqrt10*Te - 9*g1*gBY*ooSqrt10*Te +& 
&  3*TrYdadjYd*Te + TrYeadjYe*Te

 
 
If (TwoLoopRGE) Then 
betaTe2 = (-6*g1p2*TeadjYeYe)/5._dp + 12*g2p2*TeadjYeYe - (6*gYBp2*TeadjYeYe)/5._dp -           & 
&  9*gYB*gBL*ooSqrt10*TeadjYeYe - 9*g1*gBY*ooSqrt10*TeadjYeYe - 6._dp*(TeadjYeYeadjYeYe) -& 
&  3*gYB*gBL*ooSqrt10*TeadjYvYv - 3*g1*gBY*ooSqrt10*TeadjYvYv - 4._dp*(TeadjYvYvadjYeYe) -& 
&  2._dp*(TeadjYvYvadjYvYv) - 4._dp*(TeadjYvYxCYxYv) - 15*TeadjYeYe*TrYdadjYd -          & 
&  5*TeadjYeYe*TrYeadjYe - 3*TeadjYvYv*TrYuadjYu - TeadjYvYv*TrYvadjYv - ((2700*g1p4*M1 +& 
&  180*g1p2*g2p2*M1 + 8280*g1*gYB*gBL*gBY*M1 + 1305*g1p2*gBLp2*M1 + 10890._dp*g1p2*gBYp2*M1 +& 
&  225*g2p2*gBYp2*M1 + 2925*gBLp2*gBYp2*M1 + 2925*gBYp4*M1 + 2700*g1p2*gYBp2*M1 +        & 
&  1305*gBYp2*gYBp2*M1 + 5400*gYB*g1p3*MBBp + 360*g1*gYB*g2p2*MBBp + 10890._dp*g1p2*gBL*gBY*MBBp +& 
&  450*g2p2*gBL*gBY*MBBp + 10890._dp*g1*gYB*gBLp2*MBBp + 5850*gBY*gBLp3*MBBp +           & 
&  10890._dp*g1*gYB*gBYp2*MBBp + 5850*gBL*gBYp3*MBBp + 10890._dp*gBL*gBY*gYBp2*MBBp +    & 
&  5400*g1*gYBp3*MBBp + 8280*g1*gYB*gBL*gBY*MBp + 1305*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp +& 
&  2925*gBLp4*MBp + 2925*gBLp2*gBYp2*MBp + 2700*g1p2*gYBp2*MBp + 180*g2p2*gYBp2*MBp +    & 
&  10890._dp*gBLp2*gYBp2*MBp + 1305*gBYp2*gYBp2*MBp + 2700*gYBp4*MBp + 180*g1p2*g2p2*M2 +& 
&  1500*g2p4*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 180*g2p2*gYBp2*M2 +            & 
&  1188*gYB*g1p2*gBL*M1*sqrt10 + 2376*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +    & 
&  1305*g1*gBY*gBLp2*M1*sqrt10 + 1305*gYB*gBL*gBYp2*M1*sqrt10 + 2610*g1*gBYp3*M1*sqrt10 +& 
&  1188*g1*gBY*gYBp2*M1*sqrt10 + 1188*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 +& 
&  3564*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 3915*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  1305*g1*gBLp3*MBBp*sqrt10 + 3915*g1*gBL*gBYp2*MBBp*sqrt10 + 1305*gYB*gBYp3*MBBp*sqrt10 +& 
&  3564*g1*gBL*gYBp2*MBBp*sqrt10 + 1188*gBY*gYBp3*MBBp*sqrt10 + 1188*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 1305*g1*gBY*gBLp2*MBp*sqrt10 + 2610*gYB*gBLp3*MBp*sqrt10 +& 
&  1305*gYB*gBL*gBYp2*MBp*sqrt10 + 1188*g1*gBY*gYBp2*MBp*sqrt10 + 2376*gBL*gYBp3*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 + 40*g1p2*TradjYdTd -            & 
&  1600*g3p2*TradjYdTd - 50*gBLp2*TradjYdTd - 50*gBYp2*TradjYdTd + 40*gYBp2*TradjYdTd +  & 
&  10*gYB*gBL*sqrt10*TradjYdTd + 10*g1*gBY*sqrt10*TradjYdTd - 120*g1p2*TradjYeTe -       & 
&  150*gBLp2*TradjYeTe - 150*gBYp2*TradjYeTe - 120*gYBp2*TradjYeTe - 90*gYB*gBL*sqrt10*TradjYeTe -& 
&  90*g1*gBY*sqrt10*TradjYeTe - 10*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp -           & 
&  5*gBLp2*MBp + 4*gYBp2*MBp - 160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 +  & 
&  g1*(8*gYB*MBBp + gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 1800._dp*(TrYdadjYdTdadjYd) +& 
&  300._dp*(TrYdadjYuTuadjYd) + 30*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +             & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 600._dp*(TrYeadjYeTeadjYe) +& 
&  100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) + 100._dp*(TrYvadjYeTeadjYv))*Ye)/50._dp  
betaTe2 =  betaTe2+ (6*g1p2*YeadjYeTe)/5._dp + 6*g2p2*YeadjYeTe + (6*gYBp2*YeadjYeTe)/5._dp -             & 
&  12*TrYdadjYd*YeadjYeTe - 4*TrYeadjYe*YeadjYeTe - 8._dp*(YeadjYeTeadjYeYe) +           & 
&  (3*(-20*g2p2*M2 + g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 +       & 
&  gYB*gBL*MBp*sqrt10 - 30._dp*(TradjYdTd) - 10._dp*(TradjYeTe))*YeadjYeYe)/5._dp -      & 
&  6._dp*(YeadjYeYeadjYeTe) - 3*gYB*gBL*sqrt2ov5*YeadjYvTv - 3*g1*gBY*sqrt2ov5*YeadjYvTv -& 
&  6*TrYuadjYu*YeadjYvTv - 2*TrYvadjYv*YeadjYvTv - 4._dp*(YeadjYvTvadjYeYe) -            & 
&  4._dp*(YeadjYvTvadjYvYv) - 8._dp*(YeadjYvTxCYxYv) + 3*g1*gBY*M1*sqrt2ov5*YeadjYvYv +  & 
&  3*g1*gBL*MBBp*sqrt2ov5*YeadjYvYv + 3*gYB*gBY*MBBp*sqrt2ov5*YeadjYvYv + 3*gYB*gBL*MBp*sqrt2ov5*YeadjYvYv -& 
&  6*TradjYuTu*YeadjYvYv - 2*TradjYvTv*YeadjYvYv - 2._dp*(YeadjYvYvadjYeTe) -            & 
&  4._dp*(YeadjYvYvadjYvTv) - 8._dp*(YeadjYvYxCYxTv) + (27*g1p4*Te)/2._dp +              & 
&  (9*g1p2*g2p2*Te)/5._dp + (15*g2p4*Te)/2._dp + (414*g1*gYB*gBL*gBY*Te)/5._dp +         & 
&  (261*g1p2*gBLp2*Te)/20._dp + (9*g2p2*gBLp2*Te)/4._dp + (117*gBLp4*Te)/8._dp +         & 
&  (1089*g1p2*gBYp2*Te)/20._dp + (9*g2p2*gBYp2*Te)/4._dp + (117*gBLp2*gBYp2*Te)/4._dp +  & 
&  (117*gBYp4*Te)/8._dp + 27*g1p2*gYBp2*Te + (9*g2p2*gYBp2*Te)/5._dp + (1089*gBLp2*gYBp2*Te)/20._dp +& 
&  (261*gBYp2*gYBp2*Te)/20._dp + (27*gYBp4*Te)/2._dp + 9*gYB*g2p2*gBL*ooSqrt10*Te +      & 
&  9*g1*g2p2*gBY*ooSqrt10*Te + (261*g1*gBY*gBLp2*ooSqrt10*Te)/2._dp + (261*gYB*gBLp3*ooSqrt10*Te)/2._dp +& 
&  (261*gYB*gBL*gBYp2*ooSqrt10*Te)/2._dp + (261*g1*gBYp3*ooSqrt10*Te)/2._dp +            & 
&  (297*gYB*g1p2*gBL*sqrt2ov5*Te)/5._dp + (297*g1p3*gBY*sqrt2ov5*Te)/5._dp +             & 
&  (297*g1*gBY*gYBp2*sqrt2ov5*Te)/5._dp + (297*gBL*gYBp3*sqrt2ov5*Te)/5._dp -            & 
&  (2*g1p2*TrYdadjYd*Te)/5._dp + 16*g3p2*TrYdadjYd*Te + (gBLp2*TrYdadjYd*Te)/2._dp +     & 
&  (gBYp2*TrYdadjYd*Te)/2._dp - (2*gYBp2*TrYdadjYd*Te)/5._dp - gYB*gBL*ooSqrt10*TrYdadjYd*Te  
betaTe2 =  betaTe2- g1*gBY*ooSqrt10*TrYdadjYd*Te - 9*TrYdadjYdYdadjYd*Te - 3*TrYdadjYuYuadjYd*Te +        & 
&  (6*g1p2*TrYeadjYe*Te)/5._dp + (3*gBLp2*TrYeadjYe*Te)/2._dp + (3*gBYp2*TrYeadjYe*Te)/2._dp +& 
&  (6*gYBp2*TrYeadjYe*Te)/5._dp + 9*gYB*gBL*ooSqrt10*TrYeadjYe*Te + 9*g1*gBY*ooSqrt10*TrYeadjYe*Te -& 
&  3*TrYeadjYeYeadjYe*Te - TrYeadjYvYvadjYe*Te

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = (30._dp*(TuadjYdYd) + 150._dp*(TuadjYuYu) + 2*(26*g1p2*M1 + 5*gBYp2*M1 +   & 
&  52*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 26*gYBp2*MBp + 160*g3p2*M3 +         & 
&  90*g2p2*M2 + 5*g1*gBY*M1*sqrt10 + 5*g1*gBL*MBBp*sqrt10 + 5*gYB*gBY*MBBp*sqrt10 +      & 
&  5*gYB*gBL*MBp*sqrt10 + 90._dp*(TradjYuTu) + 30._dp*(TradjYvTv))*Yu + 60._dp*(YuadjYdTd)& 
&  + 120._dp*(YuadjYuTu) - 26*g1p2*Tu - 90*g2p2*Tu - 160*g3p2*Tu - 5*gBLp2*Tu -          & 
&  5*gBYp2*Tu - 26*gYBp2*Tu - 5*gYB*gBL*sqrt10*Tu - 5*g1*gBY*sqrt10*Tu + 90*TrYuadjYu*Tu +& 
&  30*TrYvadjYv*Tu)/30._dp

 
 
If (TwoLoopRGE) Then 
betaTu2 = (2*g1p2*TuadjYdYd)/5._dp + (2*gYBp2*TuadjYdYd)/5._dp - gYB*gBL*ooSqrt10*TuadjYdYd -   & 
&  g1*gBY*ooSqrt10*TuadjYdYd - 3*TrYdadjYd*TuadjYdYd - TrYeadjYe*TuadjYdYd -             & 
&  2._dp*(TuadjYdYdadjYdYd) - 4._dp*(TuadjYdYdadjYuYu) + 12*g2p2*TuadjYuYu -             & 
&  3*gYB*gBL*ooSqrt10*TuadjYuYu - 3*g1*gBY*ooSqrt10*TuadjYuYu - 15*TrYuadjYu*TuadjYuYu - & 
&  5*TrYvadjYv*TuadjYuYu - 6._dp*(TuadjYuYuadjYuYu) - ((10972._dp*g1p4*M1 +              & 
&  900*g1p2*g2p2*M1 + 2720*g1p2*g3p2*M1 + 19960._dp*g1*gYB*gBL*gBY*M1 + 1885*g1p2*gBLp2*M1 +& 
&  23730._dp*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + 800*g3p2*gBYp2*M1 + 2725*gBLp2*gBYp2*M1 +& 
&  2725*gBYp4*M1 + 10972._dp*g1p2*gYBp2*M1 + 1885*gBYp2*gYBp2*M1 + 21944._dp*gYB*g1p3*MBBp +& 
&  1800*g1*gYB*g2p2*MBBp + 5440*g1*gYB*g3p2*MBBp + 23730._dp*g1p2*gBL*gBY*MBBp +         & 
&  450*g2p2*gBL*gBY*MBBp + 1600*g3p2*gBL*gBY*MBBp + 23730._dp*g1*gYB*gBLp2*MBBp +        & 
&  5450*gBY*gBLp3*MBBp + 23730._dp*g1*gYB*gBYp2*MBBp + 5450*gBL*gBYp3*MBBp +             & 
&  23730._dp*gBL*gBY*gYBp2*MBBp + 21944._dp*g1*gYBp3*MBBp + 19960._dp*g1*gYB*gBL*gBY*MBp +& 
&  1885*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp + 800*g3p2*gBLp2*MBp + 2725*gBLp4*MBp +      & 
&  2725*gBLp2*gBYp2*MBp + 10972._dp*g1p2*gYBp2*MBp + 900*g2p2*gYBp2*MBp + 2720*g3p2*gYBp2*MBp +& 
&  23730._dp*gBLp2*gYBp2*MBp + 1885*gBYp2*gYBp2*MBp + 10972._dp*gYBp4*MBp +              & 
&  2720*g1p2*g3p2*M3 + 7200*g2p2*g3p2*M3 - 3200*g3p4*M3 + 800*g3p2*gBLp2*M3 +            & 
&  800*g3p2*gBYp2*M3 + 2720*g3p2*gYBp2*M3 + 900*g1p2*g2p2*M2 + 13500._dp*g2p4*M2 +       & 
&  7200*g2p2*g3p2*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 900*g2p2*gYBp2*M2 +       & 
&  2992*gYB*g1p2*gBL*M1*sqrt10 + 5984*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +    & 
&  800*g1*g3p2*gBY*M1*sqrt10 + 1735*g1*gBY*gBLp2*M1*sqrt10 + 1735*gYB*gBL*gBYp2*M1*sqrt10 +& 
&  3470*g1*gBYp3*M1*sqrt10 + 2992*g1*gBY*gYBp2*M1*sqrt10 + 2992*g1p3*gBL*MBBp*sqrt10 +   & 
&  90*g1*g2p2*gBL*MBBp*sqrt10 + 800*g1*g3p2*gBL*MBBp*sqrt10 + 8976*gYB*g1p2*gBY*MBBp*sqrt10 +& 
&  90*gYB*g2p2*gBY*MBBp*sqrt10 + 800*gYB*g3p2*gBY*MBBp*sqrt10 + 5205*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  1735*g1*gBLp3*MBBp*sqrt10 + 5205*g1*gBL*gBYp2*MBBp*sqrt10 + 1735*gYB*gBYp3*MBBp*sqrt10 +& 
&  8976*g1*gBL*gYBp2*MBBp*sqrt10 + 2992*gBY*gYBp3*MBBp*sqrt10 + 2992*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 800*gYB*g3p2*gBL*MBp*sqrt10 + 1735*g1*gBY*gBLp2*MBp*sqrt10 +& 
&  3470*gYB*gBLp3*MBp*sqrt10 + 1735*gYB*gBL*gBYp2*MBp*sqrt10 + 2992*g1*gBY*gYBp2*MBp*sqrt10 +& 
&  5984*gBL*gYBp3*MBp*sqrt10 + 800*gYB*g3p2*gBL*M3*sqrt10 + 800*g1*g3p2*gBY*M3*sqrt10 +  & 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 - 720*g1p2*TradjYuTu -           & 
&  14400._dp*g3p2*TradjYuTu - 450*gBLp2*TradjYuTu - 450*gBYp2*TradjYuTu - 720*gYBp2*TradjYuTu -& 
&  450*gYB*gBL*sqrt10*TradjYuTu - 450*g1*gBY*sqrt10*TradjYuTu - 1350*gBLp2*TradjYvTv -   & 
&  1350*gBYp2*TradjYvTv - 270*gYB*gBL*sqrt10*TradjYvTv - 270*g1*gBY*sqrt10*TradjYvTv +   & 
&  2700._dp*(TrYdadjYuTuadjYd) + 900._dp*(TrYeadjYvTvadjYe) + 2700._dp*(TrYuadjYdTdadjYu) +& 
&  90*(8*g1p2*M1 + 5*gBYp2*M1 + 5*gBLp2*MBp + 8*gYBp2*MBp + 160*g3p2*M3 + 5*gYB*gBL*MBp*sqrt10 +& 
&  5*gBY*MBBp*(2._dp*(gBL) + gYB*sqrt10) + g1*(16*gYB*MBBp + 5*gBY*M1*sqrt10 +           & 
&  5*gBL*MBBp*sqrt10))*TrYuadjYu + 16200._dp*(TrYuadjYuTuadjYu) + 900._dp*(TrYvadjYeTeadjYv) +& 
&  270*(5*gBYp2*M1 + g1*(gBY*M1 + gBL*MBBp)*sqrt10 + gBL*MBp*(5._dp*(gBL) +              & 
&  gYB*sqrt10) + gBY*MBBp*(10._dp*(gBL) + gYB*sqrt10))*TrYvadjYv + 5400._dp*(TrYvadjYvTvadjYv) +& 
&  3600._dp*(TrYvadjYvTxCYx) + 3600._dp*(TrYxCYxTvadjYv))*Yu)/450._dp + (4*g1p2*YuadjYdTd)/5._dp  
betaTu2 =  betaTu2+ (4*gYBp2*YuadjYdTd)/5._dp - gYB*gBL*sqrt2ov5*YuadjYdTd - g1*gBY*sqrt2ov5*YuadjYdTd -  & 
&  6*TrYdadjYd*YuadjYdTd - 2*TrYeadjYe*YuadjYdTd - 4._dp*(YuadjYdTdadjYdYd) -            & 
&  4._dp*(YuadjYdTdadjYuYu) - ((4*g1p2*M1 + 8*g1*gYB*MBBp + 4*gYBp2*MBp - g1*gBY*M1*sqrt10 -& 
&  g1*gBL*MBBp*sqrt10 - gYB*gBY*MBBp*sqrt10 - gYB*gBL*MBp*sqrt10 + 30._dp*(TradjYdTd) +  & 
&  10._dp*(TradjYeTe))*YuadjYdYd)/5._dp - 4._dp*(YuadjYdYdadjYdTd) - 2._dp*(YuadjYdYdadjYuTu) +& 
&  (6*g1p2*YuadjYuTu)/5._dp + 6*g2p2*YuadjYuTu + (6*gYBp2*YuadjYuTu)/5._dp -             & 
&  12*TrYuadjYu*YuadjYuTu - 4*TrYvadjYv*YuadjYuTu - 8._dp*(YuadjYuTuadjYuYu) -           & 
&  (4*g1p2*M1*YuadjYuYu)/5._dp - (8*g1*gYB*MBBp*YuadjYuYu)/5._dp - (4*gYBp2*MBp*YuadjYuYu)/5._dp -& 
&  12*g2p2*M2*YuadjYuYu + g1*gBY*M1*sqrt2ov5*YuadjYuYu + g1*gBL*MBBp*sqrt2ov5*YuadjYuYu +& 
&  gYB*gBY*MBBp*sqrt2ov5*YuadjYuYu + gYB*gBL*MBp*sqrt2ov5*YuadjYuYu - 18*TradjYuTu*YuadjYuYu -& 
&  6*TradjYvTv*YuadjYuYu - 6._dp*(YuadjYuYuadjYuTu) + (2743*g1p4*Tu)/450._dp +           & 
&  g1p2*g2p2*Tu + (15*g2p4*Tu)/2._dp + (136*g1p2*g3p2*Tu)/45._dp + 8*g2p2*g3p2*Tu -      & 
&  (16*g3p4*Tu)/9._dp + (998*g1*gYB*gBL*gBY*Tu)/45._dp + (377*g1p2*gBLp2*Tu)/180._dp +   & 
&  (g2p2*gBLp2*Tu)/4._dp + (8*g3p2*gBLp2*Tu)/9._dp + (109*gBLp4*Tu)/72._dp +             & 
&  (791*g1p2*gBYp2*Tu)/60._dp + (g2p2*gBYp2*Tu)/4._dp + (8*g3p2*gBYp2*Tu)/9._dp +        & 
&  (109*gBLp2*gBYp2*Tu)/36._dp + (109*gBYp4*Tu)/72._dp + (2743*g1p2*gYBp2*Tu)/225._dp +  & 
&  g2p2*gYBp2*Tu + (136*g3p2*gYBp2*Tu)/45._dp + (791*gBLp2*gYBp2*Tu)/60._dp +            & 
&  (377*gBYp2*gYBp2*Tu)/180._dp + (2743*gYBp4*Tu)/450._dp + gYB*g2p2*gBL*ooSqrt10*Tu +   & 
&  g1*g2p2*gBY*ooSqrt10*Tu + (347*g1*gBY*gBLp2*ooSqrt10*Tu)/18._dp + (347*gYB*gBLp3*ooSqrt10*Tu)/18._dp +& 
&  (347*gYB*gBL*gBYp2*ooSqrt10*Tu)/18._dp + (347*g1*gBYp3*ooSqrt10*Tu)/18._dp +          & 
&  (8*gYB*g3p2*gBL*sqrt10*Tu)/9._dp + (8*g1*g3p2*gBY*sqrt10*Tu)/9._dp + (748*gYB*g1p2*gBL*sqrt2ov5*Tu)/45._dp  
betaTu2 =  betaTu2+ (748*g1p3*gBY*sqrt2ov5*Tu)/45._dp + (748*g1*gBY*gYBp2*sqrt2ov5*Tu)/45._dp +           & 
&  (748*gBL*gYBp3*sqrt2ov5*Tu)/45._dp - 3*TrYdadjYuYuadjYd*Tu - TrYeadjYvYvadjYe*Tu +    & 
&  (4*g1p2*TrYuadjYu*Tu)/5._dp + 16*g3p2*TrYuadjYu*Tu + (gBLp2*TrYuadjYu*Tu)/2._dp +     & 
&  (gBYp2*TrYuadjYu*Tu)/2._dp + (4*gYBp2*TrYuadjYu*Tu)/5._dp + gYB*gBL*sqrt5ov2*TrYuadjYu*Tu +& 
&  g1*gBY*sqrt5ov2*TrYuadjYu*Tu - 9*TrYuadjYuYuadjYu*Tu + (3*gBLp2*TrYvadjYv*Tu)/2._dp + & 
&  (3*gBYp2*TrYvadjYv*Tu)/2._dp + 3*gYB*gBL*ooSqrt10*TrYvadjYv*Tu + 3*g1*gBY*ooSqrt10*TrYvadjYv*Tu -& 
&  3*TrYvadjYvYvadjYv*Tu - 4*TrYxCYxYvadjYv*Tu

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! Tx 
!-------------------- 
 
betaTx1  = (9*(gBYp2*M1 + 2*gBL*gBY*MBBp + gBLp2*MBp) + 4._dp*(TrCYxTx))              & 
& *Yx + (8._dp*(TvadjYvYx) + 4._dp*(TxCYvTpYv) + 24._dp*(TxCYxYx) + 4._dp*(YvadjYvTx)    & 
&  + 8._dp*(YxCYvTpTv) + 24._dp*(YxCYxTx) - 9*gBLp2*Tx - 9*gBYp2*Tx + 4*TrYxCYx*Tx)/2._dp

 
 
If (TwoLoopRGE) Then 
betaTx2 = -4._dp*(TvadjYeYeadjYvYx) - 4._dp*(TvadjYvYvadjYvYx) + (12*g1p2*TvadjYvYx)/5._dp +    & 
&  12*g2p2*TvadjYvYx + (12*gYBp2*TvadjYvYx)/5._dp + 6*gYB*gBL*sqrt2ov5*TvadjYvYx +       & 
&  6*g1*gBY*sqrt2ov5*TvadjYvYx - 12*TrYuadjYu*TvadjYvYx - 4*TrYvadjYv*TvadjYvYx -        & 
&  2._dp*(TxCYvTpYeCYeTpYv) + (6*g1p2*TxCYvTpYv)/5._dp + 6*g2p2*TxCYvTpYv +              & 
&  (6*gYBp2*TxCYvTpYv)/5._dp + 3*gYB*gBL*sqrt2ov5*TxCYvTpYv + 3*g1*gBY*sqrt2ov5*TxCYvTpYv -& 
&  6*TrYuadjYu*TxCYvTpYv - 2*TrYvadjYv*TxCYvTpYv - 2._dp*(TxCYvTpYvCYvTpYv) -            & 
&  16._dp*(TxCYvTpYvCYxYx) - 8._dp*(TxCYxYvadjYvYx) + 36*gBLp2*TxCYxYx + 36*gBYp2*TxCYxYx -& 
&  24*TrYxCYx*TxCYxYx - 48._dp*(TxCYxYxCYxYx) - ((1188*g1*gYB*gBL*gBY*M1 +               & 
&  1188*g1p2*gBYp2*M1 + 2025*gBLp2*gBYp2*M1 + 2025*gBYp4*M1 + 1188*g1p2*gBL*gBY*MBBp +   & 
&  1188*g1*gYB*gBLp2*MBBp + 4050*gBY*gBLp3*MBBp + 1188*g1*gYB*gBYp2*MBBp +               & 
&  4050*gBL*gBYp3*MBBp + 1188*gBL*gBY*gYBp2*MBBp + 1188*g1*gYB*gBL*gBY*MBp +             & 
&  2025*gBLp4*MBp + 2025*gBLp2*gBYp2*MBp + 1188*gBLp2*gYBp2*MBp + 216*g1*gBY*gBLp2*M1*sqrt10 +& 
&  216*gYB*gBL*gBYp2*M1*sqrt10 + 432*g1*gBYp3*M1*sqrt10 + 648*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  216*g1*gBLp3*MBBp*sqrt10 + 648*g1*gBL*gBYp2*MBBp*sqrt10 + 216*gYB*gBYp3*MBBp*sqrt10 + & 
&  216*g1*gBY*gBLp2*MBp*sqrt10 + 432*gYB*gBLp3*MBp*sqrt10 + 216*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  60*(gBLp2 + gBYp2)*TrCYxTx + 160._dp*(TrYvadjYvTxCYx) - 60*(gBYp2*M1 + 2*gBL*gBY*MBBp +& 
&  gBLp2*MBp)*TrYxCYx + 160._dp*(TrYxCYxTvadjYv) + 640._dp*(TrYxCYxTxCYx))*Yx)/10._dp -  & 
&  4._dp*(YvadjYeTeadjYvYx) - 2._dp*(YvadjYeYeadjYvTx) - 4._dp*(YvadjYvTvadjYvYx) +      & 
&  (6*g1p2*YvadjYvTx)/5._dp + 6*g2p2*YvadjYvTx + (6*gYBp2*YvadjYvTx)/5._dp +             & 
&  3*gYB*gBL*sqrt2ov5*YvadjYvTx + 3*g1*gBY*sqrt2ov5*YvadjYvTx - 6*TrYuadjYu*YvadjYvTx -  & 
&  2*TrYvadjYv*YvadjYvTx - 2._dp*(YvadjYvYvadjYvTx) - (12*g1p2*M1*YvadjYvYx)/5._dp  
betaTx2 =  betaTx2- (24*g1*gYB*MBBp*YvadjYvYx)/5._dp - (12*gYBp2*MBp*YvadjYvYx)/5._dp - 12*g2p2*M2*YvadjYvYx -& 
&  6*g1*gBY*M1*sqrt2ov5*YvadjYvYx - 6*g1*gBL*MBBp*sqrt2ov5*YvadjYvYx - 6*gYB*gBY*MBBp*sqrt2ov5*YvadjYvYx -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YvadjYvYx - 12*TradjYuTu*YvadjYvYx - 4*TradjYvTv*YvadjYvYx -   & 
&  4._dp*(YxCYvTpTeCYeTpYv) + (12*g1p2*YxCYvTpTv)/5._dp + 12*g2p2*YxCYvTpTv +            & 
&  (12*gYBp2*YxCYvTpTv)/5._dp + 6*gYB*gBL*sqrt2ov5*YxCYvTpTv + 6*g1*gBY*sqrt2ov5*YxCYvTpTv -& 
&  12*TrYuadjYu*YxCYvTpTv - 4*TrYvadjYv*YxCYvTpTv - 4._dp*(YxCYvTpTvCYvTpYv) -           & 
&  16._dp*(YxCYvTpTvCYxYx) - 4._dp*(YxCYvTpYeCYeTpTv) - (12*g1p2*M1*YxCYvTpYv)/5._dp -   & 
&  (24*g1*gYB*MBBp*YxCYvTpYv)/5._dp - (12*gYBp2*MBp*YxCYvTpYv)/5._dp - 12*g2p2*M2*YxCYvTpYv -& 
&  6*g1*gBY*M1*sqrt2ov5*YxCYvTpYv - 6*g1*gBL*MBBp*sqrt2ov5*YxCYvTpYv - 6*gYB*gBY*MBBp*sqrt2ov5*YxCYvTpYv -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YxCYvTpYv - 12*TradjYuTu*YxCYvTpYv - 4*TradjYvTv*YxCYvTpYv -   & 
&  4._dp*(YxCYvTpYvCYvTpTv) - 8._dp*(YxCYvTpYvCYxTx) - 16._dp*(YxCYxTvadjYvYx) +         & 
&  36*gBLp2*YxCYxTx + 36*gBYp2*YxCYxTx - 24*TrYxCYx*YxCYxTx - 64._dp*(YxCYxTxCYxYx) -    & 
&  16._dp*(YxCYxYvadjYvTx) - 16*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp +             & 
&  2._dp*(TrCYxTx))*YxCYxYx - 48._dp*(YxCYxYxCYxTx) + (297*g1*gYB*gBL*gBY*Tx)/5._dp +    & 
&  (405*gBLp4*Tx)/8._dp + (297*g1p2*gBYp2*Tx)/10._dp + (405*gBLp2*gBYp2*Tx)/4._dp +      & 
&  (405*gBYp4*Tx)/8._dp + (297*gBLp2*gYBp2*Tx)/10._dp + 54*g1*gBY*gBLp2*sqrt2ov5*Tx +    & 
&  54*gYB*gBLp3*sqrt2ov5*Tx + 54*gYB*gBL*gBYp2*sqrt2ov5*Tx + 54*g1*gBYp3*sqrt2ov5*Tx -   & 
&  3*gBLp2*TrYxCYx*Tx - 3*gBYp2*TrYxCYx*Tx - 8*TrYxCYxYvadjYv*Tx - 16*TrYxCYxYxCYx*Tx

 
DTx = oo16pi2*( betaTx1 + oo16pi2 * betaTx2 ) 

 
Else 
DTx = oo16pi2* betaTx1 
End If 
 
 
Call Chop(DTx) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = TvadjYeYe + 5._dp*(TvadjYvYv) + 8._dp*(TxCYxYv) + ((3*(2*g1p2*M1 +         & 
&  5*gBYp2*M1 + 4*g1*gYB*MBBp + 10*gBL*gBY*MBBp + 5*gBLp2*MBp + 2*gYBp2*MBp +            & 
&  10*g2p2*M2 + g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10 +            & 
&  gYB*gBL*MBp*sqrt10) + 30._dp*(TradjYuTu) + 10._dp*(TradjYvTv))*Yv)/5._dp +            & 
&  2._dp*(YvadjYeTe) + 4._dp*(YvadjYvTv) + 4._dp*(YxCYxTv) - (3*g1p2*Tv)/5._dp -         & 
&  3*g2p2*Tv - (3*gBLp2*Tv)/2._dp - (3*gBYp2*Tv)/2._dp - (3*gYBp2*Tv)/5._dp -            & 
&  3*gYB*gBL*ooSqrt10*Tv - 3*g1*gBY*ooSqrt10*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv

 
 
If (TwoLoopRGE) Then 
betaTv2 = (6*g1p2*TvadjYeYe)/5._dp + (6*gYBp2*TvadjYeYe)/5._dp + 3*gYB*gBL*ooSqrt10*TvadjYeYe + & 
&  3*g1*gBY*ooSqrt10*TvadjYeYe - 3*TrYdadjYd*TvadjYeYe - TrYeadjYe*TvadjYeYe -           & 
&  2._dp*(TvadjYeYeadjYeYe) - 4._dp*(TvadjYeYeadjYvYv) + (12*g1p2*TvadjYvYv)/5._dp +     & 
&  12*g2p2*TvadjYvYv + (12*gYBp2*TvadjYvYv)/5._dp + 9*gYB*gBL*ooSqrt10*TvadjYvYv +       & 
&  9*g1*gBY*ooSqrt10*TvadjYvYv - 15*TrYuadjYu*TvadjYvYv - 5*TrYvadjYv*TvadjYvYv -        & 
&  6._dp*(TvadjYvYvadjYvYv) - 4._dp*(TvadjYvYxCYxYv) - 16._dp*(TxCYvTpYvCYxYv) +         & 
&  24*gBLp2*TxCYxYv + 24*gBYp2*TxCYxYv - 16*TrYxCYx*TxCYxYv - 32._dp*(TxCYxYxCYxYv) -    & 
&  ((828*g1p4*M1 + 180*g1p2*g2p2*M1 + 3960*g1*gYB*gBL*gBY*M1 + 405*g1p2*gBLp2*M1 +       & 
&  4770*g1p2*gBYp2*M1 + 225*g2p2*gBYp2*M1 + 2925*gBLp2*gBYp2*M1 + 2925*gBYp4*M1 +        & 
&  828*g1p2*gYBp2*M1 + 405*gBYp2*gYBp2*M1 + 1656*gYB*g1p3*MBBp + 360*g1*gYB*g2p2*MBBp +  & 
&  4770*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 4770*g1*gYB*gBLp2*MBBp +             & 
&  5850*gBY*gBLp3*MBBp + 4770*g1*gYB*gBYp2*MBBp + 5850*gBL*gBYp3*MBBp + 4770*gBL*gBY*gYBp2*MBBp +& 
&  1656*g1*gYBp3*MBBp + 3960*g1*gYB*gBL*gBY*MBp + 405*g1p2*gBLp2*MBp + 225*g2p2*gBLp2*MBp +& 
&  2925*gBLp4*MBp + 2925*gBLp2*gBYp2*MBp + 828*g1p2*gYBp2*MBp + 180*g2p2*gYBp2*MBp +     & 
&  4770*gBLp2*gYBp2*MBp + 405*gBYp2*gYBp2*MBp + 828*gYBp4*MBp + 180*g1p2*g2p2*M2 +       & 
&  1500*g2p4*M2 + 225*g2p2*gBLp2*M2 + 225*g2p2*gBYp2*M2 + 180*g2p2*gYBp2*M2 +            & 
&  360*gYB*g1p2*gBL*M1*sqrt10 + 720*g1p3*gBY*M1*sqrt10 + 90*g1*g2p2*gBY*M1*sqrt10 +      & 
&  675*g1*gBY*gBLp2*M1*sqrt10 + 675*gYB*gBL*gBYp2*M1*sqrt10 + 1350*g1*gBYp3*M1*sqrt10 +  & 
&  360*g1*gBY*gYBp2*M1*sqrt10 + 360*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 +  & 
&  1080*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 2025*gYB*gBY*gBLp2*MBBp*sqrt10 +& 
&  675*g1*gBLp3*MBBp*sqrt10 + 2025*g1*gBL*gBYp2*MBBp*sqrt10 + 675*gYB*gBYp3*MBBp*sqrt10 +& 
&  1080*g1*gBL*gYBp2*MBBp*sqrt10 + 360*gBY*gYBp3*MBBp*sqrt10 + 360*gYB*g1p2*gBL*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*MBp*sqrt10 + 675*g1*gBY*gBLp2*MBp*sqrt10 + 1350*gYB*gBLp3*MBp*sqrt10 +& 
&  675*gYB*gBL*gBYp2*MBp*sqrt10 + 360*g1*gBY*gYBp2*MBp*sqrt10 + 720*gBL*gYBp3*MBp*sqrt10 +& 
&  90*gYB*g2p2*gBL*M2*sqrt10 + 90*g1*g2p2*gBY*M2*sqrt10 - 80*g1p2*TradjYuTu -            & 
&  1600*g3p2*TradjYuTu - 50*gBLp2*TradjYuTu - 50*gBYp2*TradjYuTu - 80*gYBp2*TradjYuTu -  & 
&  50*gYB*gBL*sqrt10*TradjYuTu - 50*g1*gBY*sqrt10*TradjYuTu - 150*gBLp2*TradjYvTv -      & 
&  150*gBYp2*TradjYvTv - 30*gYB*gBL*sqrt10*TradjYvTv - 30*g1*gBY*sqrt10*TradjYvTv +      & 
&  300._dp*(TrYdadjYuTuadjYd) + 100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) +& 
&  10*(8*g1p2*M1 + 5*gBYp2*M1 + 5*gBLp2*MBp + 8*gYBp2*MBp + 160*g3p2*M3 + 5*gYB*gBL*MBp*sqrt10 +& 
&  5*gBY*MBBp*(2._dp*(gBL) + gYB*sqrt10) + g1*(16*gYB*MBBp + 5*gBY*M1*sqrt10 +           & 
&  5*gBL*MBBp*sqrt10))*TrYuadjYu + 1800._dp*(TrYuadjYuTuadjYu) + 100._dp*(TrYvadjYeTeadjYv) +& 
&  30*(5*gBYp2*M1 + g1*(gBY*M1 + gBL*MBBp)*sqrt10 + gBL*MBp*(5._dp*(gBL) +               & 
&  gYB*sqrt10) + gBY*MBBp*(10._dp*(gBL) + gYB*sqrt10))*TrYvadjYv + 600._dp*(TrYvadjYvTvadjYv) +& 
&  400._dp*(TrYvadjYvTxCYx) + 400._dp*(TrYxCYxTvadjYv))*Yv)/50._dp + (12*g1p2*YvadjYeTe)/5._dp  
betaTv2 =  betaTv2+ (12*gYBp2*YvadjYeTe)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYeTe + 3*g1*gBY*sqrt2ov5*YvadjYeTe -& 
&  6*TrYdadjYd*YvadjYeTe - 2*TrYeadjYe*YvadjYeTe - 4._dp*(YvadjYeTeadjYeYe) -            & 
&  4._dp*(YvadjYeTeadjYvYv) - (12*g1p2*M1*YvadjYeYe)/5._dp - (24*g1*gYB*MBBp*YvadjYeYe)/5._dp -& 
&  (12*gYBp2*MBp*YvadjYeYe)/5._dp - 3*g1*gBY*M1*sqrt2ov5*YvadjYeYe - 3*g1*gBL*MBBp*sqrt2ov5*YvadjYeYe -& 
&  3*gYB*gBY*MBBp*sqrt2ov5*YvadjYeYe - 3*gYB*gBL*MBp*sqrt2ov5*YvadjYeYe - 6*TradjYdTd*YvadjYeYe -& 
&  2*TradjYeTe*YvadjYeYe - 4._dp*(YvadjYeYeadjYeTe) - 2._dp*(YvadjYeYeadjYvTv) +         & 
&  (6*g1p2*YvadjYvTv)/5._dp + 6*g2p2*YvadjYvTv + (6*gYBp2*YvadjYvTv)/5._dp -             & 
&  12*TrYuadjYu*YvadjYvTv - 4*TrYvadjYv*YvadjYvTv - 8._dp*(YvadjYvTvadjYvYv) -           & 
&  8._dp*(YvadjYvTxCYxYv) - (12*g1p2*M1*YvadjYvYv)/5._dp - (24*g1*gYB*MBBp*YvadjYvYv)/5._dp -& 
&  (12*gYBp2*MBp*YvadjYvYv)/5._dp - 12*g2p2*M2*YvadjYvYv - 3*g1*gBY*M1*sqrt2ov5*YvadjYvYv -& 
&  3*g1*gBL*MBBp*sqrt2ov5*YvadjYvYv - 3*gYB*gBY*MBBp*sqrt2ov5*YvadjYvYv - 3*gYB*gBL*MBp*sqrt2ov5*YvadjYvYv -& 
&  18*TradjYuTu*YvadjYvYv - 6*TradjYvTv*YvadjYvYv - 6._dp*(YvadjYvYvadjYvTv) -           & 
&  8._dp*(YvadjYvYxCYxTv) - 16._dp*(YxCYvTpTvCYxYv) - 8._dp*(YxCYvTpYvCYxTv) +           & 
&  12*gBLp2*YxCYxTv + 12*gBYp2*YxCYxTv - 8*TrYxCYx*YxCYxTv - 32._dp*(YxCYxTxCYxYv) -     & 
&  8*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp + 2._dp*(TrCYxTx))*YxCYxYv -             & 
&  16._dp*(YxCYxYxCYxTv) + (207*g1p4*Tv)/50._dp + (9*g1p2*g2p2*Tv)/5._dp +               & 
&  (15*g2p4*Tv)/2._dp + (198*g1*gYB*gBL*gBY*Tv)/5._dp + (81*g1p2*gBLp2*Tv)/20._dp +      & 
&  (9*g2p2*gBLp2*Tv)/4._dp + (117*gBLp4*Tv)/8._dp + (477*g1p2*gBYp2*Tv)/20._dp +         & 
&  (9*g2p2*gBYp2*Tv)/4._dp + (117*gBLp2*gBYp2*Tv)/4._dp + (117*gBYp4*Tv)/8._dp +         & 
&  (207*g1p2*gYBp2*Tv)/25._dp + (9*g2p2*gYBp2*Tv)/5._dp + (477*gBLp2*gYBp2*Tv)/20._dp +  & 
&  (81*gBYp2*gYBp2*Tv)/20._dp + (207*gYBp4*Tv)/50._dp + 9*gYB*g2p2*gBL*ooSqrt10*Tv  
betaTv2 =  betaTv2+ 9*g1*g2p2*gBY*ooSqrt10*Tv + 18*gYB*g1p2*gBL*sqrt2ov5*Tv + 18*g1p3*gBY*sqrt2ov5*Tv +   & 
&  18*g1*gBY*gYBp2*sqrt2ov5*Tv + 18*gBL*gYBp3*sqrt2ov5*Tv + (27*g1*gBY*gBLp2*sqrt5ov2*Tv)/2._dp +& 
&  (27*gYB*gBLp3*sqrt5ov2*Tv)/2._dp + (27*gYB*gBL*gBYp2*sqrt5ov2*Tv)/2._dp +             & 
&  (27*g1*gBYp3*sqrt5ov2*Tv)/2._dp - 3*TrYdadjYuYuadjYd*Tv - TrYeadjYvYvadjYe*Tv +       & 
&  (4*g1p2*TrYuadjYu*Tv)/5._dp + 16*g3p2*TrYuadjYu*Tv + (gBLp2*TrYuadjYu*Tv)/2._dp +     & 
&  (gBYp2*TrYuadjYu*Tv)/2._dp + (4*gYBp2*TrYuadjYu*Tv)/5._dp + gYB*gBL*sqrt5ov2*TrYuadjYu*Tv +& 
&  g1*gBY*sqrt5ov2*TrYuadjYu*Tv - 9*TrYuadjYuYuadjYu*Tv + (3*gBLp2*TrYvadjYv*Tv)/2._dp + & 
&  (3*gBYp2*TrYvadjYv*Tv)/2._dp + 3*gYB*gBL*ooSqrt10*TrYvadjYv*Tv + 3*g1*gBY*ooSqrt10*TrYvadjYv*Tv -& 
&  3*TrYvadjYvYvadjYv*Tv - 4*TrYxCYxYvadjYv*Tv

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! BMuP 
!-------------------- 
 
betaBMuP1  = 2*(2*MuP*(3*gBYp2*M1 + 6*gBL*gBY*MBBp + 3*gBLp2*MBp + TrCYxTx)           & 
&  + (-3*(gBLp2 + gBYp2) + TrYxCYx)*BMuP)

 
 
If (TwoLoopRGE) Then 
betaBMuP2 = (-2*MuP*(15*(gBLp2 + gBYp2)*TrCYxTx - 15*(gBYp2*M1 + 2*gBL*gBY*MBBp + gBLp2*MBp)*TrYxCYx +& 
&  4*(99*g1*gYB*gBL*gBY*M1 + 99*g1p2*gBYp2*M1 + 180*gBLp2*gBYp2*M1 + 180*gBYp4*M1 +      & 
&  99*g1p2*gBL*gBY*MBBp + 99*g1*gYB*gBLp2*MBBp + 360*gBY*gBLp3*MBBp + 99*g1*gYB*gBYp2*MBBp +& 
&  360*gBL*gBYp3*MBBp + 99*gBL*gBY*gYBp2*MBBp + 99*g1*gYB*gBL*gBY*MBp + 180*gBLp4*MBp +  & 
&  180*gBLp2*gBYp2*MBp + 99*gBLp2*gYBp2*MBp + 18*g1*gBY*gBLp2*M1*sqrt10 + 18*gYB*gBL*gBYp2*M1*sqrt10 +& 
&  36*g1*gBYp3*M1*sqrt10 + 54*gYB*gBY*gBLp2*MBBp*sqrt10 + 18*g1*gBLp3*MBBp*sqrt10 +      & 
&  54*g1*gBL*gBYp2*MBBp*sqrt10 + 18*gYB*gBYp3*MBBp*sqrt10 + 18*g1*gBY*gBLp2*MBp*sqrt10 + & 
&  36*gYB*gBLp3*MBp*sqrt10 + 18*gYB*gBL*gBYp2*MBp*sqrt10 + 10._dp*(TrYvadjYvTxCYx) +     & 
&  10._dp*(TrYxCYxTvadjYv) + 40._dp*(TrYxCYxTxCYx))) + (-15*(gBLp2 + gBYp2)*TrYxCYx +    & 
&  2*(9*(20._dp*(gBLp4) + 11*gBLp2*gYBp2 + 4*gBY*gBLp2*(10._dp*(gBY) + g1*sqrt10) +      & 
&  gBYp2*(11._dp*(g1p2) + 20._dp*(gBYp2) + 4*g1*gBY*sqrt10) + gYB*(4*gBLp3*sqrt10 +      & 
&  2*gBL*gBY*(11._dp*(g1) + 2*gBY*sqrt10))) - 20._dp*(TrYxCYxYvadjYv) - 40._dp*(TrYxCYxYxCYx)))*BMuP)/5._dp

 
DBMuP = oo16pi2*( betaBMuP1 + oo16pi2 * betaBMuP2 ) 

 
Else 
DBMuP = oo16pi2* betaBMuP1 
End If 
 
 
Call Chop(DBMuP) 

!-------------------- 
! Bmu 
!-------------------- 
 
betaBmu1  = (2*(3*g1p2*M1 + 6*g1*gYB*MBBp + 3*gYBp2*MBp + 15*g2p2*M2 + 15._dp*(TradjYdTd)& 
&  + 5._dp*(TradjYeTe) + 15._dp*(TradjYuTu) + 5._dp*(TradjYvTv))*Mu)/5._dp +             & 
&  (-3._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 3._dp*(gYBp2)/5._dp + 3._dp*(TrYdadjYd)         & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Bmu

 
 
If (TwoLoopRGE) Then 
betaBmu2 = (-2*(414*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 + 540*g1p2*gBYp2*M1 +      & 
&  414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 180*g1*gYB*g2p2*MBBp + 540*g1p2*gBL*gBY*MBBp +& 
&  540*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp + 540*gBL*gBY*gYBp2*MBBp +              & 
&  828*g1*gYBp3*MBBp + 540*g1*gYB*gBL*gBY*MBp + 414*g1p2*gYBp2*MBp + 90*g2p2*gYBp2*MBp + & 
&  540*gBLp2*gYBp2*MBp + 414*gYBp4*MBp + 90*g1p2*g2p2*M2 + 750*g2p4*M2 + 90*g2p2*gYBp2*M2 +& 
&  72*gYB*g1p2*gBL*M1*sqrt10 + 144*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +      & 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 216*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  72*gBY*gYBp3*MBBp*sqrt10 + 72*gYB*g1p2*gBL*MBp*sqrt10 + 72*g1*gBY*gYBp2*MBp*sqrt10 +  & 
&  144*gBL*gYBp3*MBp*sqrt10 + 20*g1p2*TradjYdTd - 800*g3p2*TradjYdTd - 25*gBLp2*TradjYdTd -& 
&  25*gBYp2*TradjYdTd + 20*gYBp2*TradjYdTd + 5*gYB*gBL*sqrt10*TradjYdTd + 5*g1*gBY*sqrt10*TradjYdTd -& 
&  60*g1p2*TradjYeTe - 75*gBLp2*TradjYeTe - 75*gBYp2*TradjYeTe - 60*gYBp2*TradjYeTe -    & 
&  45*gYB*gBL*sqrt10*TradjYeTe - 45*g1*gBY*sqrt10*TradjYeTe - 40*g1p2*TradjYuTu -        & 
&  800*g3p2*TradjYuTu - 25*gBLp2*TradjYuTu - 25*gBYp2*TradjYuTu - 40*gYBp2*TradjYuTu -   & 
&  25*gYB*gBL*sqrt10*TradjYuTu - 25*g1*gBY*sqrt10*TradjYuTu - 75*gBLp2*TradjYvTv -       & 
&  75*gBYp2*TradjYvTv - 15*gYB*gBL*sqrt10*TradjYvTv - 15*g1*gBY*sqrt10*TradjYvTv -       & 
&  5*(4*g1p2*M1 - 5*gBYp2*M1 - 10*gBL*gBY*MBBp - 5*gBLp2*MBp + 4*gYBp2*MBp -             & 
&  160*g3p2*M3 + gYB*gBY*MBBp*sqrt10 + gYB*gBL*MBp*sqrt10 + g1*(8*gYB*MBBp +             & 
&  gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd + 900._dp*(TrYdadjYdTdadjYd) +            & 
&  300._dp*(TrYdadjYuTuadjYd) + 15*(4*g1p2*M1 + 5*gBYp2*M1 + 8*g1*gYB*MBBp +             & 
&  10*gBL*gBY*MBBp + 5*gBLp2*MBp + 4*gYBp2*MBp + 3*g1*gBY*M1*sqrt10 + 3*g1*gBL*MBBp*sqrt10 +& 
&  3*gYB*gBY*MBBp*sqrt10 + 3*gYB*gBL*MBp*sqrt10)*TrYeadjYe + 300._dp*(TrYeadjYeTeadjYe) +& 
&  100._dp*(TrYeadjYvTvadjYe) + 300._dp*(TrYuadjYdTdadjYu) + 40*g1p2*M1*TrYuadjYu +      & 
&  25*gBYp2*M1*TrYuadjYu + 80*g1*gYB*MBBp*TrYuadjYu + 50*gBL*gBY*MBBp*TrYuadjYu +        & 
&  25*gBLp2*MBp*TrYuadjYu + 40*gYBp2*MBp*TrYuadjYu + 800*g3p2*M3*TrYuadjYu +             & 
&  25*g1*gBY*M1*sqrt10*TrYuadjYu + 25*g1*gBL*MBBp*sqrt10*TrYuadjYu + 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu +& 
&  25*gYB*gBL*MBp*sqrt10*TrYuadjYu + 900._dp*(TrYuadjYuTuadjYu) + 100._dp*(TrYvadjYeTeadjYv) +& 
&  75*gBYp2*M1*TrYvadjYv + 150*gBL*gBY*MBBp*TrYvadjYv + 75*gBLp2*MBp*TrYvadjYv +         & 
&  15*g1*gBY*M1*sqrt10*TrYvadjYv + 15*g1*gBL*MBBp*sqrt10*TrYvadjYv + 15*gYB*gBY*MBBp*sqrt10*TrYvadjYv +& 
&  15*gYB*gBL*MBp*sqrt10*TrYvadjYv + 300._dp*(TrYvadjYvTvadjYv) + 200._dp*(TrYvadjYvTxCYx) +& 
&  200._dp*(TrYxCYxTvadjYv))*Mu + (207._dp*(g1p4) + 90*g1p2*g2p2 + 375._dp*(g2p4) +      & 
&  540*g1*gYB*gBL*gBY + 270*g1p2*gBYp2 + 414*g1p2*gYBp2 + 90*g2p2*gYBp2 + 270*gBLp2*gYBp2 +& 
&  207._dp*(gYBp4) + 72*gYB*g1p2*gBL*sqrt10 + 72*g1p3*gBY*sqrt10 + 72*g1*gBY*gYBp2*sqrt10 +& 
&  72*gBL*gYBp3*sqrt10 - 5*(4._dp*(g1p2) - 5*(32._dp*(g3p2) + gBLp2 + gBYp2) +           & 
&  4._dp*(gYBp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10)*TrYdadjYd - 450._dp*(TrYdadjYdYdadjYd) -& 
&  300._dp*(TrYdadjYuYuadjYd) + 15*(4._dp*(g1p2) + 5*(gBLp2 + gBYp2) + 4._dp*(gYBp2) +   & 
&  3*gYB*gBL*sqrt10 + 3*g1*gBY*sqrt10)*TrYeadjYe - 150._dp*(TrYeadjYeYeadjYe) -          & 
&  100._dp*(TrYeadjYvYvadjYe) + 40*g1p2*TrYuadjYu + 800*g3p2*TrYuadjYu + 25*gBLp2*TrYuadjYu +& 
&  25*gBYp2*TrYuadjYu + 40*gYBp2*TrYuadjYu + 25*gYB*gBL*sqrt10*TrYuadjYu +               & 
&  25*g1*gBY*sqrt10*TrYuadjYu - 450._dp*(TrYuadjYuYuadjYu) + 75*gBLp2*TrYvadjYv +        & 
&  75*gBYp2*TrYvadjYv + 15*gYB*gBL*sqrt10*TrYvadjYv + 15*g1*gBY*sqrt10*TrYvadjYv -       & 
&  150._dp*(TrYvadjYvYvadjYv) - 200._dp*(TrYxCYxYvadjYv))*Bmu)/50._dp

 
DBmu = oo16pi2*( betaBmu1 + oo16pi2 * betaBmu2 ) 

 
Else 
DBmu = oo16pi2* betaBmu1 
End If 
 
 
Call Chop(DBmu) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = (60._dp*(adjTdTd) + 60._dp*(adjTuTu) + 60._dp*(adjYdmd2Yd) +              & 
&  30._dp*(adjYdYdmq2) + 60._dp*(adjYumu2Yu) + 30._dp*(adjYuYumq2) - 180*AbsM2*g2p2*id3R -& 
&  320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 4*AbsMBp*gYBp2*id3R + 60*adjYdYd*mHd2 +  & 
&  60*adjYuYu*mHu2 + 30._dp*(mq2adjYdYd) + 30._dp*(mq2adjYuYu) - 4*AbsMBp*gYB*gBL*id3R*sqrt10 -& 
&  2*id3R*(2*g1p2*M1 + gBY*(5*gBY*M1 + 5*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(2*gYB*MBBp +  & 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(2*g1p2*MBBp + 2*gYBp2*MBBp +  & 
&  5*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 +        & 
&  MBp))*sqrt10 + g1*(2*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))          & 
& *Conjg(MBBp) - 4*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp)         & 
&  - 2*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp) - 2*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp)        & 
&  + 2*g1*id3R*sqrt15*Tr1(1) + 5*gBY*id3R*sqrt6*Tr1(1) + 2*gYB*id3R*sqrt15*Tr1(4)        & 
&  + 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamq22 = -4._dp*(adjTdTdadjYdYd) - 4._dp*(adjTdYdadjYdTd) - 4._dp*(adjTuTuadjYuYu) -           & 
&  4._dp*(adjTuYuadjYuTu) - 4._dp*(adjYdmd2YdadjYdYd) - 4._dp*(adjYdTdadjTdYd) -         & 
&  4._dp*(adjYdYdadjTdTd) - 4._dp*(adjYdYdadjYdmd2Yd) - 2._dp*(adjYdYdadjYdYdmq2) -      & 
&  4._dp*(adjYdYdmq2adjYdYd) - 4._dp*(adjYumu2YuadjYuYu) - 4._dp*(adjYuTuadjTuYu) -      & 
&  4._dp*(adjYuYuadjTuTu) - 4._dp*(adjYuYuadjYumu2Yu) - 2._dp*(adjYuYuadjYuYumq2) -      & 
&  4._dp*(adjYuYumq2adjYuYu) + (4*adjTdTd*g1p2)/5._dp + (8*adjTuTu*g1p2)/5._dp +         & 
&  (4*adjYdmd2Yd*g1p2)/5._dp + (2*adjYdYdmq2*g1p2)/5._dp + (8*adjYumu2Yu*g1p2)/5._dp +   & 
&  (4*adjYuYumq2*g1p2)/5._dp + (4*adjTdTd*gYBp2)/5._dp + (8*adjTuTu*gYBp2)/5._dp +       & 
&  (4*adjYdmd2Yd*gYBp2)/5._dp + (8*AbsMBp*adjYdYd*gYBp2)/5._dp + (2*adjYdYdmq2*gYBp2)/5._dp +& 
&  (8*adjYumu2Yu*gYBp2)/5._dp + (16*AbsMBp*adjYuYu*gYBp2)/5._dp + (4*adjYuYumq2*gYBp2)/5._dp +& 
&  (2*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + (32*AbsM3*g1p2*g3p2*id3R)/45._dp +& 
&  32*AbsM2*g2p2*g3p2*id3R + 32*AbsM3*g2p2*g3p2*id3R - (128*AbsM3*g3p4*id3R)/3._dp +     & 
&  (454*AbsMBp*g1*gYB*gBL*gBY*id3R)/45._dp + (73*AbsMBp*g1p2*gBLp2*id3R)/45._dp +        & 
&  AbsM2*g2p2*gBLp2*id3R + AbsMBp*g2p2*gBLp2*id3R + (16*AbsM3*g3p2*gBLp2*id3R)/9._dp +   & 
&  (16*AbsMBp*g3p2*gBLp2*id3R)/9._dp + (109*AbsMBp*gBLp4*id3R)/12._dp + AbsM2*g2p2*gBYp2*id3R +& 
&  (16*AbsM3*g3p2*gBYp2*id3R)/9._dp + (109*AbsMBp*gBLp2*gBYp2*id3R)/18._dp +             & 
&  (398*AbsMBp*g1p2*gYBp2*id3R)/225._dp + (2*AbsM2*g2p2*gYBp2*id3R)/5._dp +              & 
&  (2*AbsMBp*g2p2*gYBp2*id3R)/5._dp + (32*AbsM3*g3p2*gYBp2*id3R)/45._dp + (32*AbsMBp*g3p2*gYBp2*id3R)/45._dp +& 
&  20*AbsMBp*gBLp2*gYBp2*id3R + (73*AbsMBp*gBYp2*gYBp2*id3R)/45._dp + (199*AbsMBp*gYBp4*id3R)/75._dp -& 
&  (4*adjTdYd*g1p2*M1)/5._dp - (8*adjTuYu*g1p2*M1)/5._dp - (8*adjTdYd*g1*gYB*MBBp)/5._dp -& 
&  (16*adjTuYu*g1*gYB*MBBp)/5._dp - (4*adjTdYd*gYBp2*MBp)/5._dp - (8*adjTuYu*gYBp2*MBp)/5._dp  
betamq22 =  betamq22- 8*adjYdYdadjYdYd*mHd2 + (4*adjYdYd*g1p2*mHd2)/5._dp + (4*adjYdYd*gYBp2*mHd2)/5._dp -  & 
&  8*adjYuYuadjYuYu*mHu2 + (8*adjYuYu*g1p2*mHu2)/5._dp + (8*adjYuYu*gYBp2*mHu2)/5._dp +  & 
&  (2*g1p2*mq2adjYdYd)/5._dp + (2*gYBp2*mq2adjYdYd)/5._dp - 2._dp*(mq2adjYdYdadjYdYd) +  & 
&  (4*g1p2*mq2adjYuYu)/5._dp + (4*gYBp2*mq2adjYuYu)/5._dp - 2._dp*(mq2adjYuYuadjYuYu) -  & 
&  adjYdYdmq2*gYB*gBL*ooSqrt10 + adjYuYumq2*gYB*gBL*ooSqrt10 - adjYdYdmq2*g1*gBY*ooSqrt10 +& 
&  adjYuYumq2*g1*gBY*ooSqrt10 - gYB*gBL*mq2adjYdYd*ooSqrt10 - g1*gBY*mq2adjYdYd*ooSqrt10 +& 
&  gYB*gBL*mq2adjYuYu*ooSqrt10 + g1*gBY*mq2adjYuYu*ooSqrt10 - adjTdTd*gYB*gBL*sqrt2ov5 + & 
&  adjTuTu*gYB*gBL*sqrt2ov5 - adjYdmd2Yd*gYB*gBL*sqrt2ov5 - 2*AbsMBp*adjYdYd*gYB*gBL*sqrt2ov5 +& 
&  adjYumu2Yu*gYB*gBL*sqrt2ov5 + 2*AbsMBp*adjYuYu*gYB*gBL*sqrt2ov5 - adjTdTd*g1*gBY*sqrt2ov5 +& 
&  adjTuTu*g1*gBY*sqrt2ov5 - adjYdmd2Yd*g1*gBY*sqrt2ov5 + adjYumu2Yu*g1*gBY*sqrt2ov5 +   & 
&  (272*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/45._dp + 2*AbsM2*gYB*g2p2*gBL*id3R*sqrt2ov5 + & 
&  2*AbsMBp*gYB*g2p2*gBL*id3R*sqrt2ov5 + (32*AbsM3*gYB*g3p2*gBL*id3R*sqrt2ov5)/9._dp +   & 
&  (32*AbsMBp*gYB*g3p2*gBL*id3R*sqrt2ov5)/9._dp + 2*AbsM2*g1*g2p2*gBY*id3R*sqrt2ov5 +    & 
&  (32*AbsM3*g1*g3p2*gBY*id3R*sqrt2ov5)/9._dp + (91*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5)/9._dp +& 
&  (91*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5)/3._dp + (91*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5)/9._dp +& 
&  (272*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/45._dp + (272*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/15._dp +& 
&  adjTdYd*g1*gBY*M1*sqrt2ov5 - adjTuYu*g1*gBY*M1*sqrt2ov5 + adjTdYd*g1*gBL*MBBp*sqrt2ov5 -& 
&  adjTuYu*g1*gBL*MBBp*sqrt2ov5 + adjTdYd*gYB*gBY*MBBp*sqrt2ov5 - adjTuYu*gYB*gBY*MBBp*sqrt2ov5 +& 
&  adjTdYd*gYB*gBL*MBp*sqrt2ov5 - adjTuYu*gYB*gBL*MBp*sqrt2ov5 - adjYdYd*gYB*gBL*mHd2*sqrt2ov5 -& 
&  adjYdYd*g1*gBY*mHd2*sqrt2ov5 + adjYuYu*gYB*gBL*mHu2*sqrt2ov5 + adjYuYu*g1*gBY*mHu2*sqrt2ov5 -& 
&  6*adjTdYd*TradjYdTd - 2*adjTdYd*TradjYeTe - 6*adjTuYu*TradjYuTu - 2*adjTuYu*TradjYvTv  
betamq22 =  betamq22- 6*adjYdYd*TrCTdTpTd - 6*adjYdTd*TrCTdTpYd - 2*adjYdYd*TrCTeTpTe - 2*adjYdTd*TrCTeTpYe -& 
&  6*adjYuYu*TrCTuTpTu - 6*adjYuTu*TrCTuTpYu - 2*adjYuYu*TrCTvTpTv - 2*adjYuTu*TrCTvTpYv -& 
&  6*adjYdYd*Trmd2YdadjYd - 2*adjYdYd*Trme2YeadjYe - 2*adjYdYd*Trml2adjYeYe -            & 
&  2*adjYuYu*Trml2adjYvYv - 6*adjYdYd*Trmq2adjYdYd - 6*adjYuYu*Trmq2adjYuYu -            & 
&  6*adjYuYu*Trmu2YuadjYu - 2*adjYuYu*Trmv2YvadjYv - 6*adjTdTd*TrYdadjYd -               & 
&  6*adjYdmd2Yd*TrYdadjYd - 3*adjYdYdmq2*TrYdadjYd - 12*adjYdYd*mHd2*TrYdadjYd -         & 
&  3*mq2adjYdYd*TrYdadjYd - 2*adjTdTd*TrYeadjYe - 2*adjYdmd2Yd*TrYeadjYe -               & 
&  adjYdYdmq2*TrYeadjYe - 4*adjYdYd*mHd2*TrYeadjYe - mq2adjYdYd*TrYeadjYe -              & 
&  6*adjTuTu*TrYuadjYu - 6*adjYumu2Yu*TrYuadjYu - 3*adjYuYumq2*TrYuadjYu -               & 
&  12*adjYuYu*mHu2*TrYuadjYu - 3*mq2adjYuYu*TrYuadjYu - 2*adjTuTu*TrYvadjYv -            & 
&  2*adjYumu2Yu*TrYvadjYv - adjYuYumq2*TrYvadjYv - 4*adjYuYu*mHu2*TrYvadjYv -            & 
&  mq2adjYuYu*TrYvadjYv + ((id3R*(2388*g1p4*M1 + 16*g1p3*(199*gYB*MBBp + 204*gBY*M1*sqrt10 +& 
&  68*gBL*MBBp*sqrt10) + 2*g1p2*(398*gYBp2*(2._dp*(M1) + MBp) + 5*(146*gBLp2*M1 +        & 
&  1800*gBYp2*M1 + 1200*gBL*gBY*MBBp + 73*gBLp2*MBp + 32*g3p2*(2._dp*(M1) +              & 
&  M3) + 18*g2p2*(2._dp*(M1) + M2)) + 272*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) +            & 
&  MBp))*sqrt10) + gBY*(10*gYBp2*(600*gBL*MBBp + 73*gBY*(2._dp*(M1) + MBp)) +            & 
&  25*(109*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +       & 
&  MBp)) + 32*g3p2*(2*gBL*MBBp + gBY*(2._dp*(M1) + M3)) + 18*g2p2*(2*gBL*MBBp +          & 
&  gBY*(2._dp*(M1) + M2))) + 544*gYBp3*MBBp*sqrt10 + 10*gYB*(273*gBLp2*MBBp +            & 
&  2*(9._dp*(g2p2) + 16._dp*(g3p2) + 91._dp*(gBYp2))*MBBp + 91*gBL*gBY*(2._dp*(M1) +     & 
&  MBp))*sqrt10) + 2*g1*(796*gYBp3*MBBp + 10*gYB*(300*gBLp2*MBBp + 2*(9._dp*(g2p2) +     & 
&  16._dp*(g3p2) + 300._dp*(gBYp2))*MBBp + 227*gBL*gBY*(2._dp*(M1) + MBp)) +             & 
&  272*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 5*(91*(6*gBYp3*M1 +          & 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(gBL*MBBp +   & 
&  gBY*(2._dp*(M1) + M3)) + 18*g2p2*(gBL*MBBp + gBY*(2._dp*(M1) + M2)))*sqrt10)) +       & 
&  180*(-8*adjYuTu*g1p2 + 16*adjYuYu*g1p2*M1 + 16*adjYuYu*g1*gYB*MBBp - adjYuTu*g1*gBY*sqrt10 +& 
&  2*adjYuYu*g1*gBY*M1*sqrt10 + adjYuYu*g1*gBL*MBBp*sqrt10 + adjYuYu*gYB*gBY*MBBp*sqrt10 +& 
&  adjYdTd*g1*(-4._dp*(g1) + gBY*sqrt10) + adjYdYd*(8*g1p2*M1 - gYB*gBY*MBBp*sqrt10 -    & 
&  g1*(-8*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))))*Conjg(M1))/900._dp  
betamq22 =  betamq22+ ((id3R*(796*g1p4*MBBp + 796*gYBp4*MBBp + 10*gYBp2*(600*gBLp2*MBBp + (18._dp*(g2p2) +  & 
&  32._dp*(g3p2) + 373._dp*(gBYp2))*MBBp + 300*gBL*gBY*(M1 + 2._dp*(MBp))) +             & 
&  25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +       & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp + M3)) + 18*g2p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +           & 
&  MBp + M2))) + 272*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 5*gYB*(91*(4*gBLp3*MBBp +& 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) +       & 
&  32*g3p2*(2*gBL*MBBp + gBY*(M1 + MBp + M3)) + 18*g2p2*(2*gBL*MBBp + gBY*(M1 +          & 
&  MBp + M2)))*sqrt10 + 4*g1p3*(199*gYB*(2._dp*(M1) + MBp) + 68*(4*gBY*MBBp +            & 
&  gBL*(2._dp*(M1) + MBp))*sqrt10) + 2*g1p2*(1592*gYBp2*MBBp + 5*(373*gBLp2*MBBp +       & 
&  2*(9._dp*(g2p2) + 16._dp*(g3p2) + 300._dp*(gBYp2))*MBBp + 300*gBL*gBY*(2._dp*(M1) +   & 
&  MBp)) + 136*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(796*gYBp3*(M1 + & 
&  2._dp*(MBp)) + 20*gYB*(150*gBLp2*M1 + 300*gBYp2*M1 + 827*gBL*gBY*MBBp +               & 
&  300*gBLp2*MBp + 150*gBYp2*MBp + 16*g3p2*(M1 + MBp + M3) + 9*g2p2*(M1 + MBp +          & 
&  M2)) + 272*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 + 5*(91*(8*gBY*gBLp2*MBBp +& 
&  4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  32*g3p2*(2*gBY*MBBp + gBL*(M1 + MBp + M3)) + 18*g2p2*(2*gBY*MBBp + gBL*(M1 +          & 
&  MBp + M2)))*sqrt10)) + 90*(-16*adjYuTu*g1*gYB + 16*adjYuYu*g1*gYB*M1 + 16*adjYuYu*g1p2*MBBp +& 
&  16*adjYuYu*gYBp2*MBBp + 16*adjYuYu*g1*gYB*MBp - adjYuTu*g1*gBL*sqrt10 -               & 
&  adjYuTu*gYB*gBY*sqrt10 + adjYuYu*g1*gBL*M1*sqrt10 + adjYuYu*gYB*gBY*M1*sqrt10 +       & 
&  2*adjYuYu*gYB*gBL*MBBp*sqrt10 + 2*adjYuYu*g1*gBY*MBBp*sqrt10 + adjYuYu*g1*gBL*MBp*sqrt10 +& 
&  adjYuYu*gYB*gBY*MBp*sqrt10 + adjYdTd*(-8*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10) +   & 
&  adjYdYd*(8*g1p2*MBBp + gYB*(8*gYB*MBBp - 2*gBL*MBBp*sqrt10 - gBY*(M1 + MBp)*sqrt10) + & 
&  g1*(8*gYB*(M1 + MBp) - (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))))*Conjg(MBBp))/450._dp  
betamq22 =  betamq22- (4*adjYdTd*gYBp2*Conjg(MBp))/5._dp - (8*adjYuTu*gYBp2*Conjg(MBp))/5._dp +             & 
&  (227*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/45._dp + (73*g1p2*gBLp2*id3R*M1*Conjg(MBp))/90._dp +& 
&  (109*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/36._dp + (199*g1p2*gYBp2*id3R*M1*Conjg(MBp))/225._dp +& 
&  (73*gBYp2*gYBp2*id3R*M1*Conjg(MBp))/90._dp + (8*adjYdYd*g1*gYB*MBBp*Conjg(MBp))/5._dp +& 
&  (16*adjYuYu*g1*gYB*MBBp*Conjg(MBp))/5._dp + (398*gYB*g1p3*id3R*MBBp*Conjg(MBp))/225._dp +& 
&  (2*g1*gYB*g2p2*id3R*MBBp*Conjg(MBp))/5._dp + (32*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp))/45._dp +& 
&  (20*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/3._dp + g2p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +    & 
&  (16*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/9._dp + (40*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (109*gBY*gBLp3*id3R*MBBp*Conjg(MBp))/9._dp + (20*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (109*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/18._dp + (40*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/3._dp +& 
&  (796*g1*gYBp3*id3R*MBBp*Conjg(MBp))/225._dp + (8*g3p2*gBLp2*id3R*M3*Conjg(MBp))/9._dp +& 
&  (16*g3p2*gYBp2*id3R*M3*Conjg(MBp))/45._dp + (g2p2*gBLp2*id3R*M2*Conjg(MBp))/2._dp +   & 
&  (g2p2*gYBp2*id3R*M2*Conjg(MBp))/5._dp + (91*g1*gBY*gBLp2*id3R*M1*ooSqrt10*Conjg(MBp))/9._dp +& 
&  (91*gYB*gBL*gBYp2*id3R*M1*ooSqrt10*Conjg(MBp))/9._dp + (91*g1*gBL*gBYp2*id3R*MBBp*ooSqrt10*Conjg(MBp))/3._dp +& 
&  (91*gYB*gBYp3*id3R*MBBp*ooSqrt10*Conjg(MBp))/9._dp + adjYdTd*gYB*gBL*sqrt2ov5*Conjg(MBp) -& 
&  adjYuTu*gYB*gBL*sqrt2ov5*Conjg(MBp) + (136*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/45._dp +& 
&  (136*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/45._dp - adjYdYd*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  adjYuYu*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) - adjYdYd*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) +  & 
&  adjYuYu*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) + (136*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/45._dp +& 
&  g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) + (16*g1*g3p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp +& 
&  (136*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/15._dp + gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp)  
betamq22 =  betamq22+ (16*gYB*g3p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp + (91*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/3._dp +& 
&  (91*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/9._dp + (272*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/15._dp +& 
&  (272*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/45._dp + (16*gYB*g3p2*gBL*id3R*M3*sqrt2ov5*Conjg(MBp))/9._dp +& 
&  gYB*g2p2*gBL*id3R*M2*sqrt2ov5*Conjg(MBp) + (16*g1p2*g3p2*id3R*M1*Conjg(M3))/45._dp +  & 
&  (8*g3p2*gBYp2*id3R*M1*Conjg(M3))/9._dp + (32*g1*gYB*g3p2*id3R*MBBp*Conjg(M3))/45._dp +& 
&  (16*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3))/9._dp + (8*g3p2*gBLp2*id3R*MBp*Conjg(M3))/9._dp +& 
&  (16*g3p2*gYBp2*id3R*MBp*Conjg(M3))/45._dp + 16*g2p2*g3p2*id3R*M2*Conjg(M3) +          & 
&  (16*g1*g3p2*gBY*id3R*M1*sqrt2ov5*Conjg(M3))/9._dp + (16*g1*g3p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M3))/9._dp +& 
&  (16*gYB*g3p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M3))/9._dp + (16*gYB*g3p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M3))/9._dp +& 
&  (g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + (g2p2*gBYp2*id3R*M1*Conjg(M2))/2._dp +          & 
&  (2*g1*gYB*g2p2*id3R*MBBp*Conjg(M2))/5._dp + g2p2*gBL*gBY*id3R*MBBp*Conjg(M2) +        & 
&  (g2p2*gBLp2*id3R*MBp*Conjg(M2))/2._dp + (g2p2*gYBp2*id3R*MBp*Conjg(M2))/5._dp +       & 
&  16*g2p2*g3p2*id3R*M3*Conjg(M2) + g1*g2p2*gBY*id3R*M1*sqrt2ov5*Conjg(M2) +             & 
&  g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M2) + gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M2) +& 
&  gYB*g2p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M2) + 6*g2p4*id3R*Tr2(2) + (32*g3p4*id3R*Tr2(3))/3._dp +& 
&  (2*g1p2*id3R*Tr2U1(1,1))/15._dp + (gBYp2*id3R*Tr2U1(1,1))/3._dp + (2*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,& 
& 1))/3._dp + (2*g1*gYB*id3R*Tr2U1(1,4))/15._dp + (gBL*gBY*id3R*Tr2U1(1,4))/3._dp +      & 
&  (g1*gBL*id3R*sqrt2ov5*Tr2U1(1,4))/3._dp + (gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,             & 
& 4))/3._dp + (2*g1*gYB*id3R*Tr2U1(4,1))/15._dp + (gBL*gBY*id3R*Tr2U1(4,1))/3._dp +      & 
&  (g1*gBL*id3R*sqrt2ov5*Tr2U1(4,1))/3._dp + (gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,             & 
& 1))/3._dp + (gBLp2*id3R*Tr2U1(4,4))/3._dp + (2*gYBp2*id3R*Tr2U1(4,4))/15._dp  
betamq22 =  betamq22+ (2*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,4))/3._dp + 4*g1*id3R*ooSqrt15*Tr3(1) +              & 
&  2*gBY*id3R*sqrt2ov3*Tr3(1) + 4*gYB*id3R*ooSqrt15*Tr3(4) + 2*gBL*id3R*sqrt2ov3*Tr3(4)

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjTvTv) + 2._dp*(adjYeme2Ye) + adjYeYeml2 +     & 
&  2._dp*(adjYvmv2Yv) + adjYvYvml2 - 6*AbsM2*g2p2*id3R - 3*AbsMBp*gBLp2*id3R -           & 
&  (6*AbsMBp*gYBp2*id3R)/5._dp + 2*adjYeYe*mHd2 + 2*adjYvYv*mHu2 + ml2adjYeYe +          & 
&  ml2adjYvYv - 6*AbsMBp*gYB*gBL*id3R*sqrt2ov5 - (3*id3R*(2*g1p2*M1 + gBY*(5*gBY*M1 +    & 
&  5*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(2*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))  & 
& *Conjg(M1))/5._dp - (3*id3R*(2*g1p2*MBBp + 2*gYBp2*MBBp + 5*(gBLp2*MBBp +              & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +         & 
&  g1*(2*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp))            & 
& /5._dp - (6*g1*gYB*id3R*MBBp*Conjg(MBp))/5._dp - 3*gBL*gBY*id3R*MBBp*Conjg(MBp)        & 
&  - 3*g1*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) - 3*gYB*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp)    & 
&  - gBY*id3R*sqrt3ov2*Tr1(1) - g1*id3R*sqrt3ov5*Tr1(1) - gBL*id3R*sqrt3ov2*Tr1(4)       & 
&  - gYB*id3R*sqrt3ov5*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betaml22 = -4._dp*(adjTeTeadjYeYe) - 4._dp*(adjTeYeadjYeTe) - 4._dp*(adjTvTvadjYvYv) -           & 
&  8._dp*(adjTvTxCYxYv) - 4._dp*(adjTvYvadjYvTv) - 8._dp*(adjTvYxCYxTv) - 4._dp*(adjYeme2YeadjYeYe) -& 
&  4._dp*(adjYeTeadjTeYe) - 4._dp*(adjYeYeadjTeTe) - 4._dp*(adjYeYeadjYeme2Ye) -         & 
&  2._dp*(adjYeYeadjYeYeml2) - 4._dp*(adjYeYeml2adjYeYe) - 4._dp*(adjYvmv2YvadjYvYv) -   & 
&  8._dp*(adjYvmv2YxCYxYv) - 4._dp*(adjYvTvadjTvYv) - 8._dp*(adjYvTxCTxYv) -             & 
&  4._dp*(adjYvYvadjTvTv) - 4._dp*(adjYvYvadjYvmv2Yv) - 2._dp*(adjYvYvadjYvYvml2) -      & 
&  4._dp*(adjYvYvml2adjYvYv) - 8._dp*(adjYvYxCmv2CYxYv) - 8._dp*(adjYvYxCTxTv) -         & 
&  8._dp*(adjYvYxCYxmv2Yv) - 4._dp*(adjYvYxCYxYvml2) + (12*adjTeTe*g1p2)/5._dp +         & 
&  (12*adjYeme2Ye*g1p2)/5._dp + (6*adjYeYeml2*g1p2)/5._dp + (12*adjTeTe*gYBp2)/5._dp +   & 
&  (12*adjYeme2Ye*gYBp2)/5._dp + (24*AbsMBp*adjYeYe*gYBp2)/5._dp + (6*adjYeYeml2*gYBp2)/5._dp +& 
&  (18*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + (486*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp +& 
&  (81*AbsMBp*g1p2*gBLp2*id3R)/5._dp + 9*AbsM2*g2p2*gBLp2*id3R + 9*AbsMBp*g2p2*gBLp2*id3R +& 
&  (351*AbsMBp*gBLp4*id3R)/4._dp + 9*AbsM2*g2p2*gBYp2*id3R + (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp +& 
&  (414*AbsMBp*g1p2*gYBp2*id3R)/25._dp + (18*AbsM2*g2p2*gYBp2*id3R)/5._dp +              & 
&  (18*AbsMBp*g2p2*gYBp2*id3R)/5._dp + (972*AbsMBp*gBLp2*gYBp2*id3R)/5._dp +             & 
&  (81*AbsMBp*gBYp2*gYBp2*id3R)/5._dp + (621*AbsMBp*gYBp4*id3R)/25._dp - (12*adjTeYe*g1p2*M1)/5._dp -& 
&  (24*adjTeYe*g1*gYB*MBBp)/5._dp - (12*adjTeYe*gYBp2*MBp)/5._dp - 8*adjYvYxCYxYv*mC12 - & 
&  8*adjYeYeadjYeYe*mHd2 + (12*adjYeYe*g1p2*mHd2)/5._dp + (12*adjYeYe*gYBp2*mHd2)/5._dp -& 
&  8*adjYvYvadjYvYv*mHu2 - 8*adjYvYxCYxYv*mHu2 + (6*g1p2*ml2adjYeYe)/5._dp +             & 
&  (6*gYBp2*ml2adjYeYe)/5._dp - 2._dp*(ml2adjYeYeadjYeYe) - 2._dp*(ml2adjYvYvadjYvYv) -  & 
&  4._dp*(ml2adjYvYxCYxYv) + 3*adjYeYeml2*gYB*gBL*ooSqrt10 - 3*adjYvYvml2*gYB*gBL*ooSqrt10  
betaml22 =  betaml22+ 3*adjYeYeml2*g1*gBY*ooSqrt10 - 3*adjYvYvml2*g1*gBY*ooSqrt10 + 3*gYB*gBL*ml2adjYeYe*ooSqrt10 +& 
&  3*g1*gBY*ml2adjYeYe*ooSqrt10 - 3*gYB*gBL*ml2adjYvYv*ooSqrt10 - 3*g1*gBY*ml2adjYvYv*ooSqrt10 +& 
&  3*adjTeTe*gYB*gBL*sqrt2ov5 - 3*adjTvTv*gYB*gBL*sqrt2ov5 + 3*adjYeme2Ye*gYB*gBL*sqrt2ov5 +& 
&  6*AbsMBp*adjYeYe*gYB*gBL*sqrt2ov5 - 3*adjYvmv2Yv*gYB*gBL*sqrt2ov5 - 6*AbsMBp*adjYvYv*gYB*gBL*sqrt2ov5 +& 
&  3*adjTeTe*g1*gBY*sqrt2ov5 - 3*adjTvTv*g1*gBY*sqrt2ov5 + 3*adjYeme2Ye*g1*gBY*sqrt2ov5 -& 
&  3*adjYvmv2Yv*g1*gBY*sqrt2ov5 + (288*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/5._dp +        & 
&  18*AbsM2*gYB*g2p2*gBL*id3R*sqrt2ov5 + 18*AbsMBp*gYB*g2p2*gBL*id3R*sqrt2ov5 +          & 
&  18*AbsM2*g1*g2p2*gBY*id3R*sqrt2ov5 + 99*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 +           & 
&  297*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 + 99*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 +          & 
&  (288*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/5._dp + (864*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/5._dp -& 
&  3*adjTeYe*g1*gBY*M1*sqrt2ov5 + 3*adjTvYv*g1*gBY*M1*sqrt2ov5 - 3*adjTeYe*g1*gBL*MBBp*sqrt2ov5 +& 
&  3*adjTvYv*g1*gBL*MBBp*sqrt2ov5 - 3*adjTeYe*gYB*gBY*MBBp*sqrt2ov5 + 3*adjTvYv*gYB*gBY*MBBp*sqrt2ov5 -& 
&  3*adjTeYe*gYB*gBL*MBp*sqrt2ov5 + 3*adjTvYv*gYB*gBL*MBp*sqrt2ov5 + 3*adjYeYe*gYB*gBL*mHd2*sqrt2ov5 +& 
&  3*adjYeYe*g1*gBY*mHd2*sqrt2ov5 - 3*adjYvYv*gYB*gBL*mHu2*sqrt2ov5 - 3*adjYvYv*g1*gBY*mHu2*sqrt2ov5 -& 
&  6*adjTeYe*TradjYdTd - 2*adjTeYe*TradjYeTe - 6*adjTvYv*TradjYuTu - 2*adjTvYv*TradjYvTv -& 
&  6*adjYeYe*TrCTdTpTd - 6*adjYeTe*TrCTdTpYd - 2*adjYeYe*TrCTeTpTe - 2*adjYeTe*TrCTeTpYe -& 
&  6*adjYvYv*TrCTuTpTu - 6*adjYvTv*TrCTuTpYu - 2*adjYvYv*TrCTvTpTv - 2*adjYvTv*TrCTvTpYv -& 
&  6*adjYeYe*Trmd2YdadjYd - 2*adjYeYe*Trme2YeadjYe - 2*adjYeYe*Trml2adjYeYe -            & 
&  2*adjYvYv*Trml2adjYvYv - 6*adjYeYe*Trmq2adjYdYd - 6*adjYvYv*Trmq2adjYuYu -            & 
&  6*adjYvYv*Trmu2YuadjYu - 2*adjYvYv*Trmv2YvadjYv - 6*adjTeTe*TrYdadjYd -               & 
&  6*adjYeme2Ye*TrYdadjYd - 3*adjYeYeml2*TrYdadjYd - 12*adjYeYe*mHd2*TrYdadjYd  
betaml22 =  betaml22- 3*ml2adjYeYe*TrYdadjYd - 2*adjTeTe*TrYeadjYe - 2*adjYeme2Ye*TrYeadjYe -               & 
&  adjYeYeml2*TrYeadjYe - 4*adjYeYe*mHd2*TrYeadjYe - ml2adjYeYe*TrYeadjYe -              & 
&  6*adjTvTv*TrYuadjYu - 6*adjYvmv2Yv*TrYuadjYu - 3*adjYvYvml2*TrYuadjYu -               & 
&  12*adjYvYv*mHu2*TrYuadjYu - 3*ml2adjYvYv*TrYuadjYu - 2*adjTvTv*TrYvadjYv -            & 
&  2*adjYvmv2Yv*TrYvadjYv - adjYvYvml2*TrYvadjYv - 4*adjYvYv*mHu2*TrYvadjYv -            & 
&  ml2adjYvYv*TrYvadjYv + (3*(3*id3R*(276*g1p4*M1 + 16*g1p3*(23*gYB*MBBp +               & 
&  24*gBY*M1*sqrt10 + 8*gBL*MBBp*sqrt10) + 2*g1p2*(46*gYBp2*(2._dp*(M1) + MBp) +         & 
&  5*(9*(24*gBYp2*M1 + 16*gBL*gBY*MBBp + gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(2._dp*(M1) +& 
&  M2)) + 32*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) + gBY*(90*gYBp2*(8*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + MBp)) + 25*(13*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp +      & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(2*gBL*MBBp + gBY*(2._dp*(M1) + M2))) +        & 
&  64*gYBp3*MBBp*sqrt10 + 10*gYB*(33*gBLp2*MBBp + 2*(g2p2 + 11._dp*(gBYp2))*MBBp +       & 
&  11*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(92*gYBp3*MBBp + 10*gYB*(36*gBLp2*MBBp +& 
&  2*(g2p2 + 36._dp*(gBYp2))*MBBp + 27*gBL*gBY*(2._dp*(M1) + MBp)) + 32*gYBp2*(3*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + MBp))*sqrt10 + 5*(11*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp +  & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*g2p2*(gBL*MBBp + gBY*(2._dp*(M1) + M2)))*sqrt10)) + & 
&  20*((adjYvTv*g1*gBY - adjYvYv*(2*g1*gBY*M1 + g1*gBL*MBBp + gYB*gBY*MBBp))*sqrt10 -    & 
&  adjYeTe*g1*(4._dp*(g1) + gBY*sqrt10) + adjYeYe*(8*g1p2*M1 + gYB*gBY*MBBp*sqrt10 +     & 
&  g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))))*Conjg(M1))/100._dp +           & 
&  (3*(3*id3R*(92*g1p4*MBBp + 92*gYBp4*MBBp + 10*gYBp2*(72*gBLp2*MBBp + (2._dp*(g2p2) +  & 
&  45._dp*(gBYp2))*MBBp + 36*gBL*gBY*(M1 + 2._dp*(MBp))) + 25*(13*(gBLp4*MBBp +          & 
&  4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 +      & 
&  2._dp*(MBp))) + 2*g2p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp + M2))) +         & 
&  32*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 5*gYB*(11*(4*gBLp3*MBBp +     & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) +       & 
&  2*g2p2*(2*gBL*MBBp + gBY*(M1 + MBp + M2)))*sqrt10 + 4*g1p3*(23*gYB*(2._dp*(M1) +      & 
&  MBp) + 8*(2*gBL*M1 + 4*gBY*MBBp + gBL*MBp)*sqrt10) + 2*g1p2*(184*gYBp2*MBBp +         & 
&  5*(45*gBLp2*MBBp + 2*(g2p2 + 36._dp*(gBYp2))*MBBp + 36*gBL*gBY*(2._dp*(M1) +          & 
&  MBp)) + 16*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(92*gYBp3*(M1 +   & 
&  2._dp*(MBp)) + 20*gYB*(9*(11*gBL*gBY*MBBp + 2*gBYp2*(2._dp*(M1) + MBp) +              & 
&  2*gBLp2*(M1 + 2._dp*(MBp))) + g2p2*(M1 + MBp + M2)) + 32*gYBp2*(8*gBY*MBBp +          & 
&  3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 + 5*(11*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp +           & 
&  3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp))) + 2*g2p2*(2*gBY*MBBp +     & 
&  gBL*(M1 + MBp + M2)))*sqrt10)) + 10*((adjYvTv*(g1*gBL + gYB*gBY) - adjYvYv*(g1*(2*gBY*MBBp +& 
&  gBL*(M1 + MBp)) + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))))*sqrt10 - adjYeTe*(8*g1*gYB +    & 
&  g1*gBL*sqrt10 + gYB*gBY*sqrt10) + adjYeYe*(8*g1p2*MBBp + g1*(8*gYB*(M1 +              & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 + MBp)*sqrt10 +           & 
&  2*MBBp*(4._dp*(gYB) + gBL*sqrt10)))))*Conjg(MBBp))/50._dp - (12*adjYeTe*gYBp2*Conjg(MBp))/5._dp  
betaml22 =  betaml22+ (243*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp + (81*g1p2*gBLp2*id3R*M1*Conjg(MBp))/10._dp +& 
&  (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (207*g1p2*gYBp2*id3R*M1*Conjg(MBp))/25._dp +& 
&  (81*gBYp2*gYBp2*id3R*M1*Conjg(MBp))/10._dp + (24*adjYeYe*g1*gYB*MBBp*Conjg(MBp))/5._dp +& 
&  (414*gYB*g1p3*id3R*MBBp*Conjg(MBp))/25._dp + (18*g1*gYB*g2p2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (324*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp + 9*g2p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + & 
&  (648*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp + 117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) +  & 
&  (324*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp + (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp +& 
&  (648*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp + (828*g1*gYBp3*id3R*MBBp*Conjg(MBp))/25._dp +& 
&  (9*g2p2*gBLp2*id3R*M2*Conjg(MBp))/2._dp + (9*g2p2*gYBp2*id3R*M2*Conjg(MBp))/5._dp +   & 
&  99*g1*gBY*gBLp2*id3R*M1*ooSqrt10*Conjg(MBp) + 99*gYB*gBL*gBYp2*id3R*M1*ooSqrt10*Conjg(MBp) +& 
&  297*g1*gBL*gBYp2*id3R*MBBp*ooSqrt10*Conjg(MBp) + 99*gYB*gBYp3*id3R*MBBp*ooSqrt10*Conjg(MBp) -& 
&  3*adjYeTe*gYB*gBL*sqrt2ov5*Conjg(MBp) + 3*adjYvTv*gYB*gBL*sqrt2ov5*Conjg(MBp) +       & 
&  (144*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp + (144*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  3*adjYeYe*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) - 3*adjYvYv*g1*gBL*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  3*adjYeYe*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) - 3*adjYvYv*gYB*gBY*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (144*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 9*g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (432*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 9*gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  297*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 99*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  (864*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + (288*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  9*gYB*g2p2*gBL*id3R*M2*sqrt2ov5*Conjg(MBp) + (9*g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp +  & 
&  (9*g2p2*gBYp2*id3R*M1*Conjg(M2))/2._dp + (18*g1*gYB*g2p2*id3R*MBBp*Conjg(M2))/5._dp  
betaml22 =  betaml22+ 9*g2p2*gBL*gBY*id3R*MBBp*Conjg(M2) + (9*g2p2*gBLp2*id3R*MBp*Conjg(M2))/2._dp +        & 
&  (9*g2p2*gYBp2*id3R*MBp*Conjg(M2))/5._dp + 9*g1*g2p2*gBY*id3R*M1*sqrt2ov5*Conjg(M2) +  & 
&  9*g1*g2p2*gBL*id3R*MBBp*sqrt2ov5*Conjg(M2) + 9*gYB*g2p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(M2) +& 
&  9*gYB*g2p2*gBL*id3R*MBp*sqrt2ov5*Conjg(M2) + 6*g2p4*id3R*Tr2(2) + (6*g1p2*id3R*Tr2U1(1,& 
& 1))/5._dp + 3*gBYp2*id3R*Tr2U1(1,1) + 6*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,1) +              & 
&  (6*g1*gYB*id3R*Tr2U1(1,4))/5._dp + 3*gBL*gBY*id3R*Tr2U1(1,4) + 3*g1*gBL*id3R*sqrt2ov5*Tr2U1(1,& 
& 4) + 3*gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,4) + (6*g1*gYB*id3R*Tr2U1(4,1))/5._dp +           & 
&  3*gBL*gBY*id3R*Tr2U1(4,1) + 3*g1*gBL*id3R*sqrt2ov5*Tr2U1(4,1) + 3*gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,& 
& 1) + 3*gBLp2*id3R*Tr2U1(4,4) + (6*gYBp2*id3R*Tr2U1(4,4))/5._dp + 6*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,& 
& 4) - 4*g1*id3R*sqrt3ov5*Tr3(1) - 2*gBY*id3R*sqrt6*Tr3(1) - 4*gYB*id3R*sqrt3ov5*Tr3(4) -& 
&  2*gBL*id3R*sqrt6*Tr3(4)

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = (-30*AbsM2*g2p2 - 6*AbsMBp*gYBp2 + 30._dp*(TrCTdTpTd) + 10._dp*(TrCTeTpTe)& 
&  + 30._dp*(Trmd2YdadjYd) + 10._dp*(Trme2YeadjYe) + 10._dp*(Trml2adjYeYe)               & 
&  + 30._dp*(Trmq2adjYdYd) + 30*mHd2*TrYdadjYd + 10*mHd2*TrYeadjYe - 6*g1*(g1*M1 +       & 
&  gYB*MBBp)*Conjg(M1) - 6*(g1p2*MBBp + gYBp2*MBBp + g1*gYB*(M1 + MBp))*Conjg(MBBp)      & 
&  - 6*g1*gYB*MBBp*Conjg(MBp) - g1*sqrt15*Tr1(1) - gYB*sqrt15*Tr1(4))/5._dp

 
 
If (TwoLoopRGE) Then 
betamHd22 = (90*AbsM2*g1p2*g2p2 + 825*AbsM2*g2p4 + 540*AbsMBp*g1*gYB*gBL*gBY + 414*AbsMBp*g1p2*gYBp2 +& 
&  90*AbsM2*g2p2*gYBp2 + 90*AbsMBp*g2p2*gYBp2 + 810*AbsMBp*gBLp2*gYBp2 + 621*AbsMBp*gYBp4 +& 
&  72*AbsMBp*gYB*g1p2*gBL*sqrt10 + 72*AbsMBp*g1*gBY*gYBp2*sqrt10 + 216*AbsMBp*gBL*gYBp3*sqrt10 -& 
&  20*g1p2*TrCTdTpTd + 800*g3p2*TrCTdTpTd + 25*gBLp2*TrCTdTpTd + 25*gBYp2*TrCTdTpTd -    & 
&  20*gYBp2*TrCTdTpTd - 5*gYB*gBL*sqrt10*TrCTdTpTd - 5*g1*gBY*sqrt10*TrCTdTpTd +         & 
&  20*g1p2*M1*TrCTdTpYd - 25*gBYp2*M1*TrCTdTpYd + 40*g1*gYB*MBBp*TrCTdTpYd -             & 
&  50*gBL*gBY*MBBp*TrCTdTpYd - 25*gBLp2*MBp*TrCTdTpYd + 20*gYBp2*MBp*TrCTdTpYd -         & 
&  800*g3p2*M3*TrCTdTpYd + 5*g1*gBY*M1*sqrt10*TrCTdTpYd + 5*g1*gBL*MBBp*sqrt10*TrCTdTpYd +& 
&  5*gYB*gBY*MBBp*sqrt10*TrCTdTpYd + 5*gYB*gBL*MBp*sqrt10*TrCTdTpYd + 60*g1p2*TrCTeTpTe +& 
&  75*gBLp2*TrCTeTpTe + 75*gBYp2*TrCTeTpTe + 60*gYBp2*TrCTeTpTe + 45*gYB*gBL*sqrt10*TrCTeTpTe +& 
&  45*g1*gBY*sqrt10*TrCTeTpTe - 60*g1p2*M1*TrCTeTpYe - 75*gBYp2*M1*TrCTeTpYe -           & 
&  120*g1*gYB*MBBp*TrCTeTpYe - 150*gBL*gBY*MBBp*TrCTeTpYe - 75*gBLp2*MBp*TrCTeTpYe -     & 
&  60*gYBp2*MBp*TrCTeTpYe - 45*g1*gBY*M1*sqrt10*TrCTeTpYe - 45*g1*gBL*MBBp*sqrt10*TrCTeTpYe -& 
&  45*gYB*gBY*MBBp*sqrt10*TrCTeTpYe - 45*gYB*gBL*MBp*sqrt10*TrCTeTpYe - 20*g1p2*Trmd2YdadjYd +& 
&  800*g3p2*Trmd2YdadjYd + 25*gBLp2*Trmd2YdadjYd + 25*gBYp2*Trmd2YdadjYd -               & 
&  20*gYBp2*Trmd2YdadjYd - 5*gYB*gBL*sqrt10*Trmd2YdadjYd - 5*g1*gBY*sqrt10*Trmd2YdadjYd -& 
&  900._dp*(Trmd2YdadjYdYdadjYd) - 150._dp*(Trmd2YdadjYuYuadjYd) + 60*g1p2*Trme2YeadjYe +& 
&  75*gBLp2*Trme2YeadjYe + 75*gBYp2*Trme2YeadjYe + 60*gYBp2*Trme2YeadjYe +               & 
&  45*gYB*gBL*sqrt10*Trme2YeadjYe + 45*g1*gBY*sqrt10*Trme2YeadjYe - 300._dp*(Trme2YeadjYeYeadjYe) -& 
&  50._dp*(Trme2YeadjYvYvadjYe) + 60*g1p2*Trml2adjYeYe + 75*gBLp2*Trml2adjYeYe +         & 
&  75*gBYp2*Trml2adjYeYe + 60*gYBp2*Trml2adjYeYe + 45*gYB*gBL*sqrt10*Trml2adjYeYe +      & 
&  45*g1*gBY*sqrt10*Trml2adjYeYe - 300._dp*(Trml2adjYeYeadjYeYe) - 50._dp*(Trml2adjYeYeadjYvYv) -& 
&  50._dp*(Trml2adjYvYvadjYeYe) - 20*g1p2*Trmq2adjYdYd + 800*g3p2*Trmq2adjYdYd +         & 
&  25*gBLp2*Trmq2adjYdYd + 25*gBYp2*Trmq2adjYdYd - 20*gYBp2*Trmq2adjYdYd -               & 
&  5*gYB*gBL*sqrt10*Trmq2adjYdYd - 5*g1*gBY*sqrt10*Trmq2adjYdYd - 900._dp*(Trmq2adjYdYdadjYdYd) -& 
&  150._dp*(Trmq2adjYdYdadjYuYu) - 150._dp*(Trmq2adjYuYuadjYdYd) - 150._dp*(Trmu2YuadjYdYdadjYu) -& 
&  50._dp*(Trmv2YvadjYeYeadjYv) - 900._dp*(TrYdadjTdTdadjYd) - 150._dp*(TrYdadjTuTuadjYd) +& 
&  1600*AbsM3*g3p2*TrYdadjYd + 50*AbsMBp*gBLp2*TrYdadjYd - 40*AbsMBp*gYBp2*TrYdadjYd -   & 
&  20*g1p2*mHd2*TrYdadjYd + 800*g3p2*mHd2*TrYdadjYd + 25*gBLp2*mHd2*TrYdadjYd +          & 
&  25*gBYp2*mHd2*TrYdadjYd - 20*gYBp2*mHd2*TrYdadjYd - 10*AbsMBp*gYB*gBL*sqrt10*TrYdadjYd -& 
&  5*gYB*gBL*mHd2*sqrt10*TrYdadjYd - 5*g1*gBY*mHd2*sqrt10*TrYdadjYd - 900._dp*(TrYdadjYdTdadjTd) -& 
&  900*mHd2*TrYdadjYdYdadjYd - 150._dp*(TrYdadjYuTuadjTd) - 150*mHd2*TrYdadjYuYuadjYd -  & 
&  150*mHu2*TrYdadjYuYuadjYd - 300._dp*(TrYeadjTeTeadjYe) - 50._dp*(TrYeadjTvTvadjYe) +  & 
&  150*AbsMBp*gBLp2*TrYeadjYe + 120*AbsMBp*gYBp2*TrYeadjYe + 60*g1p2*mHd2*TrYeadjYe +    & 
&  75*gBLp2*mHd2*TrYeadjYe + 75*gBYp2*mHd2*TrYeadjYe + 60*gYBp2*mHd2*TrYeadjYe +         & 
&  90*AbsMBp*gYB*gBL*sqrt10*TrYeadjYe + 45*gYB*gBL*mHd2*sqrt10*TrYeadjYe +               & 
&  45*g1*gBY*mHd2*sqrt10*TrYeadjYe - 300._dp*(TrYeadjYeTeadjTe) - 300*mHd2*TrYeadjYeYeadjYe -& 
&  50._dp*(TrYeadjYvTvadjTe) - 50*mHd2*TrYeadjYvYvadjYe - 50*mHu2*TrYeadjYvYvadjYe -     & 
&  150._dp*(TrYuadjTdTdadjYu) - 150._dp*(TrYuadjYdTdadjTu) - 50._dp*(TrYvadjTeTeadjYv) - & 
&  50._dp*(TrYvadjYeTeadjTv) + (621*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 +  & 
&  810*g1p2*gBYp2*M1 + 414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 90*g1*gYB*g2p2*MBBp +     & 
&  540*g1p2*gBL*gBY*MBBp + 270*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp +               & 
&  270*gBL*gBY*gYBp2*MBBp + 414*g1*gYBp3*MBBp + 270*g1*gYB*gBL*gBY*MBp + 207*g1p2*gYBp2*MBp +& 
&  45*g1p2*g2p2*M2 + 72*gYB*g1p2*gBL*M1*sqrt10 + 216*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +& 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 108*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  36*gBY*gYBp3*MBBp*sqrt10 + 36*gYB*g1p2*gBL*MBp*sqrt10 + 36*g1*gBY*gYBp2*MBp*sqrt10 +  & 
&  20*g1p2*TradjYdTd - 25*gBYp2*TradjYdTd + 5*g1*gBY*sqrt10*TradjYdTd - 60*g1p2*TradjYeTe -& 
&  75*gBYp2*TradjYeTe - 45*g1*gBY*sqrt10*TradjYeTe - 5*(8*g1p2*M1 + gBY*(-               & 
& 10*gBY*M1 - 10*gBL*MBBp + gYB*MBBp*sqrt10) + g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 +        & 
&  gBL*MBBp*sqrt10))*TrYdadjYd + 15*(8*g1p2*M1 + gBY*(10*gBY*M1 + 10*gBL*MBBp +          & 
&  3*gYB*MBBp*sqrt10) + g1*(8*gYB*MBBp + 6*gBY*M1*sqrt10 + 3*gBL*MBBp*sqrt10))*TrYeadjYe)*Conjg(M1) +& 
&  (828*gYB*g1p3*M1 + 90*g1*gYB*g2p2*M1 + 540*g1p2*gBL*gBY*M1 + 270*g1*gYB*gBLp2*M1 +    & 
&  540*g1*gYB*gBYp2*M1 + 270*gBL*gBY*gYBp2*M1 + 414*g1*gYBp3*M1 + 414*g1p4*MBBp +        & 
&  90*g1p2*g2p2*MBBp + 1620*g1*gYB*gBL*gBY*MBBp + 270*g1p2*gBLp2*MBBp + 540*g1p2*gBYp2*MBBp +& 
&  1656*g1p2*gYBp2*MBBp + 90*g2p2*gYBp2*MBBp + 540*gBLp2*gYBp2*MBBp + 270*gBYp2*gYBp2*MBBp +& 
&  414*gYBp4*MBBp + 414*gYB*g1p3*MBp + 90*g1*gYB*g2p2*MBp + 270*g1p2*gBL*gBY*MBp +       & 
&  540*g1*gYB*gBLp2*MBp + 270*g1*gYB*gBYp2*MBp + 540*gBL*gBY*gYBp2*MBp + 828*g1*gYBp3*MBp +& 
&  90*g1*gYB*g2p2*M2 + 72*g1p3*gBL*M1*sqrt10 + 216*gYB*g1p2*gBY*M1*sqrt10 +              & 
&  108*g1*gBL*gYBp2*M1*sqrt10 + 36*gBY*gYBp3*M1*sqrt10 + 288*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  144*g1p3*gBY*MBBp*sqrt10 + 288*g1*gBY*gYBp2*MBBp*sqrt10 + 144*gBL*gYBp3*MBBp*sqrt10 + & 
&  36*g1p3*gBL*MBp*sqrt10 + 108*gYB*g1p2*gBY*MBp*sqrt10 + 216*g1*gBL*gYBp2*MBp*sqrt10 +  & 
&  72*gBY*gYBp3*MBp*sqrt10 + 40*g1*gYB*TradjYdTd - 50*gBL*gBY*TradjYdTd + 5*g1*gBL*sqrt10*TradjYdTd +& 
&  5*gYB*gBY*sqrt10*TradjYdTd - 120*g1*gYB*TradjYeTe - 150*gBL*gBY*TradjYeTe -           & 
&  45*g1*gBL*sqrt10*TradjYeTe - 45*gYB*gBY*sqrt10*TradjYeTe - 5*(8*g1p2*MBBp +           & 
&  8*gYBp2*MBBp - 10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + gYB*(2*gBL*MBBp +  & 
&  gBY*(M1 + MBp))*sqrt10 + g1*(8*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 +               & 
&  MBp))*sqrt10))*TrYdadjYd + 15*(8*g1p2*MBBp + 8*gYBp2*MBBp + 10*(gBLp2*MBBp +          & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 3*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(8*gYB*(M1 + MBp) + 3*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYeadjYe)*Conjg(MBBp) +& 
&  270*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 207*g1p2*gYBp2*M1*Conjg(MBp) + 414*gYB*g1p3*MBBp*Conjg(MBp) +& 
&  90*g1*gYB*g2p2*MBBp*Conjg(MBp) + 270*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 540*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  270*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 540*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 828*g1*gYBp3*MBBp*Conjg(MBp) +& 
&  45*g2p2*gYBp2*M2*Conjg(MBp) + 36*gYB*g1p2*gBL*M1*sqrt10*Conjg(MBp) + 36*g1*gBY*gYBp2*M1*sqrt10*Conjg(MBp) +& 
&  36*g1p3*gBL*MBBp*sqrt10*Conjg(MBp) + 108*gYB*g1p2*gBY*MBBp*sqrt10*Conjg(MBp) +        & 
&  216*g1*gBL*gYBp2*MBBp*sqrt10*Conjg(MBp) + 72*gBY*gYBp3*MBBp*sqrt10*Conjg(MBp) -       & 
&  25*gBLp2*TradjYdTd*Conjg(MBp) + 20*gYBp2*TradjYdTd*Conjg(MBp) + 5*gYB*gBL*sqrt10*TradjYdTd*Conjg(MBp) -& 
&  75*gBLp2*TradjYeTe*Conjg(MBp) - 60*gYBp2*TradjYeTe*Conjg(MBp) - 45*gYB*gBL*sqrt10*TradjYeTe*Conjg(MBp) -& 
&  40*g1*gYB*MBBp*TrYdadjYd*Conjg(MBp) + 50*gBL*gBY*MBBp*TrYdadjYd*Conjg(MBp) -          & 
&  5*g1*gBL*MBBp*sqrt10*TrYdadjYd*Conjg(MBp) - 5*gYB*gBY*MBBp*sqrt10*TrYdadjYd*Conjg(MBp) +& 
&  120*g1*gYB*MBBp*TrYeadjYe*Conjg(MBp) + 150*gBL*gBY*MBBp*TrYeadjYe*Conjg(MBp) +        & 
&  45*g1*gBL*MBBp*sqrt10*TrYeadjYe*Conjg(MBp) + 45*gYB*gBY*MBBp*sqrt10*TrYeadjYe*Conjg(MBp) -& 
&  800*g3p2*TradjYdTd*Conjg(M3) + 45*g1p2*g2p2*M1*Conjg(M2) + 90*g1*gYB*g2p2*MBBp*Conjg(M2) +& 
&  45*g2p2*gYBp2*MBp*Conjg(M2) + 150*g2p4*Tr2(2) + 30*g1p2*Tr2U1(1,1) + 30*g1*gYB*Tr2U1(1,& 
& 4) + 30*g1*gYB*Tr2U1(4,1) + 30*gYBp2*Tr2U1(4,4) - 20*g1*sqrt15*Tr3(1) - 20*gYB*sqrt15*Tr3(4))/25._dp

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = (-30*AbsM2*g2p2 - 6*AbsMBp*gYBp2 + 30._dp*(TrCTuTpTu) + 10._dp*(TrCTvTpTv)& 
&  + 10._dp*(Trml2adjYvYv) + 30._dp*(Trmq2adjYuYu) + 30._dp*(Trmu2YuadjYu)               & 
&  + 10._dp*(Trmv2YvadjYv) + 30*mHu2*TrYuadjYu + 10*mHu2*TrYvadjYv - 6*g1*(g1*M1 +       & 
&  gYB*MBBp)*Conjg(M1) - 6*(g1p2*MBBp + gYBp2*MBBp + g1*gYB*(M1 + MBp))*Conjg(MBBp)      & 
&  - 6*g1*gYB*MBBp*Conjg(MBp) + g1*sqrt15*Tr1(1) + gYB*sqrt15*Tr1(4))/5._dp

 
 
If (TwoLoopRGE) Then 
betamHu22 = (90*AbsM2*g1p2*g2p2 + 825*AbsM2*g2p4 + 540*AbsMBp*g1*gYB*gBL*gBY + 414*AbsMBp*g1p2*gYBp2 +& 
&  90*AbsM2*g2p2*gYBp2 + 90*AbsMBp*g2p2*gYBp2 + 810*AbsMBp*gBLp2*gYBp2 + 621*AbsMBp*gYBp4 +& 
&  72*AbsMBp*gYB*g1p2*gBL*sqrt10 + 72*AbsMBp*g1*gBY*gYBp2*sqrt10 + 216*AbsMBp*gBL*gYBp3*sqrt10 +& 
&  40*g1p2*TrCTuTpTu + 800*g3p2*TrCTuTpTu + 25*gBLp2*TrCTuTpTu + 25*gBYp2*TrCTuTpTu +    & 
&  40*gYBp2*TrCTuTpTu + 25*gYB*gBL*sqrt10*TrCTuTpTu + 25*g1*gBY*sqrt10*TrCTuTpTu -       & 
&  40*g1p2*M1*TrCTuTpYu - 25*gBYp2*M1*TrCTuTpYu - 80*g1*gYB*MBBp*TrCTuTpYu -             & 
&  50*gBL*gBY*MBBp*TrCTuTpYu - 25*gBLp2*MBp*TrCTuTpYu - 40*gYBp2*MBp*TrCTuTpYu -         & 
&  800*g3p2*M3*TrCTuTpYu - 25*g1*gBY*M1*sqrt10*TrCTuTpYu - 25*g1*gBL*MBBp*sqrt10*TrCTuTpYu -& 
&  25*gYB*gBY*MBBp*sqrt10*TrCTuTpYu - 25*gYB*gBL*MBp*sqrt10*TrCTuTpYu + 75*gBLp2*TrCTvTpTv +& 
&  75*gBYp2*TrCTvTpTv + 15*gYB*gBL*sqrt10*TrCTvTpTv + 15*g1*gBY*sqrt10*TrCTvTpTv -       & 
&  75*gBYp2*M1*TrCTvTpYv - 150*gBL*gBY*MBBp*TrCTvTpYv - 75*gBLp2*MBp*TrCTvTpYv -         & 
&  15*g1*gBY*M1*sqrt10*TrCTvTpYv - 15*g1*gBL*MBBp*sqrt10*TrCTvTpYv - 15*gYB*gBY*MBBp*sqrt10*TrCTvTpYv -& 
&  15*gYB*gBL*MBp*sqrt10*TrCTvTpYv - 200._dp*(TrCYxTxCTvTpYv) - 150._dp*(Trmd2YdadjYuYuadjYd) -& 
&  50._dp*(Trme2YeadjYvYvadjYe) - 50._dp*(Trml2adjYeYeadjYvYv) + 75*gBLp2*Trml2adjYvYv + & 
&  75*gBYp2*Trml2adjYvYv + 15*gYB*gBL*sqrt10*Trml2adjYvYv + 15*g1*gBY*sqrt10*Trml2adjYvYv -& 
&  50._dp*(Trml2adjYvYvadjYeYe) - 300._dp*(Trml2adjYvYvadjYvYv) - 200._dp*(Trml2adjYvYxCYxYv) -& 
&  150._dp*(Trmq2adjYdYdadjYuYu) + 40*g1p2*Trmq2adjYuYu + 800*g3p2*Trmq2adjYuYu +        & 
&  25*gBLp2*Trmq2adjYuYu + 25*gBYp2*Trmq2adjYuYu + 40*gYBp2*Trmq2adjYuYu +               & 
&  25*gYB*gBL*sqrt10*Trmq2adjYuYu + 25*g1*gBY*sqrt10*Trmq2adjYuYu - 150._dp*(Trmq2adjYuYuadjYdYd) -& 
&  900._dp*(Trmq2adjYuYuadjYuYu) - 150._dp*(Trmu2YuadjYdYdadjYu) + 40*g1p2*Trmu2YuadjYu +& 
&  800*g3p2*Trmu2YuadjYu + 25*gBLp2*Trmu2YuadjYu + 25*gBYp2*Trmu2YuadjYu +               & 
&  40*gYBp2*Trmu2YuadjYu + 25*gYB*gBL*sqrt10*Trmu2YuadjYu + 25*g1*gBY*sqrt10*Trmu2YuadjYu -& 
&  900._dp*(Trmu2YuadjYuYuadjYu) - 50._dp*(Trmv2YvadjYeYeadjYv) + 75*gBLp2*Trmv2YvadjYv +& 
&  75*gBYp2*Trmv2YvadjYv + 15*gYB*gBL*sqrt10*Trmv2YvadjYv + 15*g1*gBY*sqrt10*Trmv2YvadjYv -& 
&  300._dp*(Trmv2YvadjYvYvadjYv) - 200._dp*(Trmv2YvadjYvYxCYx) - 200._dp*(Trmv2YxCYxYvadjYv) -& 
&  150._dp*(TrYdadjTuTuadjYd) - 150._dp*(TrYdadjYuTuadjTd) - 150*mHd2*TrYdadjYuYuadjYd - & 
&  150*mHu2*TrYdadjYuYuadjYd - 50._dp*(TrYeadjTvTvadjYe) - 50._dp*(TrYeadjYvTvadjTe) -   & 
&  50*mHd2*TrYeadjYvYvadjYe - 50*mHu2*TrYeadjYvYvadjYe - 150._dp*(TrYuadjTdTdadjYu) -    & 
&  900._dp*(TrYuadjTuTuadjYu) - 150._dp*(TrYuadjYdTdadjTu) + 1600*AbsM3*g3p2*TrYuadjYu + & 
&  50*AbsMBp*gBLp2*TrYuadjYu + 80*AbsMBp*gYBp2*TrYuadjYu + 40*g1p2*mHu2*TrYuadjYu +      & 
&  800*g3p2*mHu2*TrYuadjYu + 25*gBLp2*mHu2*TrYuadjYu + 25*gBYp2*mHu2*TrYuadjYu +         & 
&  40*gYBp2*mHu2*TrYuadjYu + 50*AbsMBp*gYB*gBL*sqrt10*TrYuadjYu + 25*gYB*gBL*mHu2*sqrt10*TrYuadjYu +& 
&  25*g1*gBY*mHu2*sqrt10*TrYuadjYu - 900._dp*(TrYuadjYuTuadjTu) - 900*mHu2*TrYuadjYuYuadjYu -& 
&  50._dp*(TrYvadjTeTeadjYv) - 300._dp*(TrYvadjTvTvadjYv) - 50._dp*(TrYvadjYeTeadjTv) +  & 
&  150*AbsMBp*gBLp2*TrYvadjYv + 75*gBLp2*mHu2*TrYvadjYv + 75*gBYp2*mHu2*TrYvadjYv +      & 
&  30*AbsMBp*gYB*gBL*sqrt10*TrYvadjYv + 15*gYB*gBL*mHu2*sqrt10*TrYvadjYv +               & 
&  15*g1*gBY*mHu2*sqrt10*TrYvadjYv - 300._dp*(TrYvadjYvTvadjTv) - 200._dp*(TrYvadjYvTxCTx) -& 
&  300*mHu2*TrYvadjYvYvadjYv - 200._dp*(TrYxCmv2CYxYvadjYv) - 200._dp*(TrYxCTxTvadjYv) - & 
&  200._dp*(TrYxCYxTvadjTv) - 200*mC12*TrYxCYxYvadjYv - 200*mHu2*TrYxCYxYvadjYv +        & 
&  (621*g1p4*M1 + 90*g1p2*g2p2*M1 + 540*g1*gYB*gBL*gBY*M1 + 810*g1p2*gBYp2*M1 +          & 
&  414*g1p2*gYBp2*M1 + 828*gYB*g1p3*MBBp + 90*g1*gYB*g2p2*MBBp + 540*g1p2*gBL*gBY*MBBp + & 
&  270*g1*gYB*gBLp2*MBBp + 540*g1*gYB*gBYp2*MBBp + 270*gBL*gBY*gYBp2*MBBp +              & 
&  414*g1*gYBp3*MBBp + 270*g1*gYB*gBL*gBY*MBp + 207*g1p2*gYBp2*MBp + 45*g1p2*g2p2*M2 +   & 
&  72*gYB*g1p2*gBL*M1*sqrt10 + 216*g1p3*gBY*M1*sqrt10 + 72*g1*gBY*gYBp2*M1*sqrt10 +      & 
&  72*g1p3*gBL*MBBp*sqrt10 + 216*gYB*g1p2*gBY*MBBp*sqrt10 + 108*g1*gBL*gYBp2*MBBp*sqrt10 +& 
&  36*gBY*gYBp3*MBBp*sqrt10 + 36*gYB*g1p2*gBL*MBp*sqrt10 + 36*g1*gBY*gYBp2*MBp*sqrt10 -  & 
&  40*g1p2*TradjYuTu - 25*gBYp2*TradjYuTu - 25*g1*gBY*sqrt10*TradjYuTu - 75*gBYp2*TradjYvTv -& 
&  15*g1*gBY*sqrt10*TradjYvTv + 5*(16*g1p2*M1 + 5*gBY*(2*gBY*M1 + 2*gBL*MBBp +           & 
&  gYB*MBBp*sqrt10) + g1*(16*gYB*MBBp + 10*gBY*M1*sqrt10 + 5*gBL*MBBp*sqrt10))*TrYuadjYu +& 
&  15*(g1*(2*gBY*M1 + gBL*MBBp)*sqrt10 + gBY*(10*gBY*M1 + 10*gBL*MBBp + gYB*MBBp*sqrt10))*TrYvadjYv)*Conjg(M1) +& 
&  (828*gYB*g1p3*M1 + 90*g1*gYB*g2p2*M1 + 540*g1p2*gBL*gBY*M1 + 270*g1*gYB*gBLp2*M1 +    & 
&  540*g1*gYB*gBYp2*M1 + 270*gBL*gBY*gYBp2*M1 + 414*g1*gYBp3*M1 + 414*g1p4*MBBp +        & 
&  90*g1p2*g2p2*MBBp + 1620*g1*gYB*gBL*gBY*MBBp + 270*g1p2*gBLp2*MBBp + 540*g1p2*gBYp2*MBBp +& 
&  1656*g1p2*gYBp2*MBBp + 90*g2p2*gYBp2*MBBp + 540*gBLp2*gYBp2*MBBp + 270*gBYp2*gYBp2*MBBp +& 
&  414*gYBp4*MBBp + 414*gYB*g1p3*MBp + 90*g1*gYB*g2p2*MBp + 270*g1p2*gBL*gBY*MBp +       & 
&  540*g1*gYB*gBLp2*MBp + 270*g1*gYB*gBYp2*MBp + 540*gBL*gBY*gYBp2*MBp + 828*g1*gYBp3*MBp +& 
&  90*g1*gYB*g2p2*M2 + 72*g1p3*gBL*M1*sqrt10 + 216*gYB*g1p2*gBY*M1*sqrt10 +              & 
&  108*g1*gBL*gYBp2*M1*sqrt10 + 36*gBY*gYBp3*M1*sqrt10 + 288*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  144*g1p3*gBY*MBBp*sqrt10 + 288*g1*gBY*gYBp2*MBBp*sqrt10 + 144*gBL*gYBp3*MBBp*sqrt10 + & 
&  36*g1p3*gBL*MBp*sqrt10 + 108*gYB*g1p2*gBY*MBp*sqrt10 + 216*g1*gBL*gYBp2*MBp*sqrt10 +  & 
&  72*gBY*gYBp3*MBp*sqrt10 - 80*g1*gYB*TradjYuTu - 50*gBL*gBY*TradjYuTu - 25*g1*gBL*sqrt10*TradjYuTu -& 
&  25*gYB*gBY*sqrt10*TradjYuTu - 150*gBL*gBY*TradjYvTv - 15*g1*gBL*sqrt10*TradjYvTv -    & 
&  15*gYB*gBY*sqrt10*TradjYvTv + 5*(16*g1p2*MBBp + 16*gYBp2*MBBp + 10*(gBLp2*MBBp +      & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 5*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(16*gYB*(M1 + MBp) + 5*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYuadjYu +          & 
&  15*(10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + g1*(2*gBY*MBBp +              & 
&  gBL*(M1 + MBp))*sqrt10 + gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10)*TrYvadjYv)*Conjg(MBBp) +& 
&  270*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 207*g1p2*gYBp2*M1*Conjg(MBp) + 414*gYB*g1p3*MBBp*Conjg(MBp) +& 
&  90*g1*gYB*g2p2*MBBp*Conjg(MBp) + 270*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 540*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  270*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 540*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 828*g1*gYBp3*MBBp*Conjg(MBp) +& 
&  45*g2p2*gYBp2*M2*Conjg(MBp) + 36*gYB*g1p2*gBL*M1*sqrt10*Conjg(MBp) + 36*g1*gBY*gYBp2*M1*sqrt10*Conjg(MBp) +& 
&  36*g1p3*gBL*MBBp*sqrt10*Conjg(MBp) + 108*gYB*g1p2*gBY*MBBp*sqrt10*Conjg(MBp) +        & 
&  216*g1*gBL*gYBp2*MBBp*sqrt10*Conjg(MBp) + 72*gBY*gYBp3*MBBp*sqrt10*Conjg(MBp) -       & 
&  25*gBLp2*TradjYuTu*Conjg(MBp) - 40*gYBp2*TradjYuTu*Conjg(MBp) - 25*gYB*gBL*sqrt10*TradjYuTu*Conjg(MBp) -& 
&  75*gBLp2*TradjYvTv*Conjg(MBp) - 15*gYB*gBL*sqrt10*TradjYvTv*Conjg(MBp) +              & 
&  80*g1*gYB*MBBp*TrYuadjYu*Conjg(MBp) + 50*gBL*gBY*MBBp*TrYuadjYu*Conjg(MBp) +          & 
&  25*g1*gBL*MBBp*sqrt10*TrYuadjYu*Conjg(MBp) + 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu*Conjg(MBp) +& 
&  150*gBL*gBY*MBBp*TrYvadjYv*Conjg(MBp) + 15*g1*gBL*MBBp*sqrt10*TrYvadjYv*Conjg(MBp) +  & 
&  15*gYB*gBY*MBBp*sqrt10*TrYvadjYv*Conjg(MBp) - 800*g3p2*TradjYuTu*Conjg(M3) +          & 
&  45*g1p2*g2p2*M1*Conjg(M2) + 90*g1*gYB*g2p2*MBBp*Conjg(M2) + 45*g2p2*gYBp2*MBp*Conjg(M2) +& 
&  150*g2p4*Tr2(2) + 30*g1p2*Tr2U1(1,1) + 30*g1*gYB*Tr2U1(1,4) + 30*g1*gYB*Tr2U1(4,      & 
& 1) + 30*gYBp2*Tr2U1(4,4) + 20*g1*sqrt15*Tr3(1) + 20*gYB*sqrt15*Tr3(4))/25._dp

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 16*AbsMBp*gYBp2*id3R +     & 
&  60._dp*(md2YdadjYd) + 8*AbsMBp*gYB*gBL*id3R*sqrt10 + 120._dp*(TdadjTd) +              & 
&  120*mHd2*YdadjYd + 60._dp*(YdadjYdmd2) + 120._dp*(Ydmq2adjYd) - 2*id3R*(8*g1p2*M1 +   & 
&  gBY*(5*gBY*M1 + 5*gBL*MBBp - 2*gYB*MBBp*sqrt10) - 2*g1*(-4*gYB*MBBp + 2*gBY*M1*sqrt10 +& 
&  gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(8*g1p2*MBBp + 8*gYBp2*MBBp + 5*(gBLp2*MBBp +    & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) - 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  g1*(8*gYB*(M1 + MBp) - 2*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp)           & 
&  - 16*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp) + 4*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)& 
&  + 4*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 4*g1*id3R*sqrt15*Tr1(1) - 5*gBY*id3R*sqrt6*Tr1(1)& 
&  + 4*gYB*id3R*sqrt15*Tr1(4) - 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamd22 = (2560*AbsM3*g1p2*g3p2*id3R - 38400._dp*AbsM3*g3p4*id3R + 7160*AbsMBp*g1*gYB*gBL*gBY*id3R -& 
&  2800*AbsMBp*g1p2*gBLp2*id3R + 1600*AbsM3*g3p2*gBLp2*id3R + 1600*AbsMBp*g3p2*gBLp2*id3R +& 
&  8175*AbsMBp*gBLp4*id3R + 1600*AbsM3*g3p2*gBYp2*id3R + 5450*AbsMBp*gBLp2*gBYp2*id3R +  & 
&  6464*AbsMBp*g1p2*gYBp2*id3R + 2560*AbsM3*g3p2*gYBp2*id3R + 2560*AbsMBp*g3p2*gYBp2*id3R +& 
&  2340*AbsMBp*gBLp2*gYBp2*id3R - 2800*AbsMBp*gBYp2*gYBp2*id3R + 9696*AbsMBp*gYBp4*id3R +& 
&  360*g1p2*md2YdadjYd + 5400*g2p2*md2YdadjYd + 360*gYBp2*md2YdadjYd - 1800._dp*(md2YdadjYdYdadjYd) -& 
&  1800._dp*(md2YdadjYuYuadjYd) - 496*AbsMBp*gYB*g1p2*gBL*id3R*sqrt10 - 1280*AbsM3*gYB*g3p2*gBL*id3R*sqrt10 -& 
&  1280*AbsMBp*gYB*g3p2*gBL*id3R*sqrt10 - 1280*AbsM3*g1*g3p2*gBY*id3R*sqrt10 -           & 
&  1480*AbsMBp*g1*gBY*gBLp2*id3R*sqrt10 - 4440*AbsMBp*gYB*gBLp3*id3R*sqrt10 -            & 
&  1480*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt10 - 496*AbsMBp*g1*gBY*gYBp2*id3R*sqrt10 -         & 
&  1488*AbsMBp*gBL*gYBp3*id3R*sqrt10 + 180*gYB*gBL*md2YdadjYd*sqrt10 + 180*g1*gBY*md2YdadjYd*sqrt10 +& 
&  720*g1p2*TdadjTd + 10800._dp*g2p2*TdadjTd + 720*gYBp2*TdadjTd + 360*gYB*gBL*sqrt10*TdadjTd +& 
&  360*g1*gBY*sqrt10*TdadjTd - 3600._dp*(TdadjTdYdadjYd) - 3600._dp*(TdadjTuYuadjYd) -   & 
&  3600._dp*(TdadjYdYdadjTd) - 3600._dp*(TdadjYuYuadjTd) - 10800._dp*TdadjYd*TrCTdTpYd - & 
&  3600*TdadjYd*TrCTeTpYe - 5400*md2YdadjYd*TrYdadjYd - 10800._dp*TdadjTd*TrYdadjYd -    & 
&  1800*md2YdadjYd*TrYeadjYe - 3600*TdadjTd*TrYeadjYe - 720*g1p2*M1*YdadjTd -            & 
&  1440*g1*gYB*MBBp*YdadjTd - 720*gYBp2*MBp*YdadjTd - 10800._dp*g2p2*M2*YdadjTd -        & 
&  360*g1*gBY*M1*sqrt10*YdadjTd - 360*g1*gBL*MBBp*sqrt10*YdadjTd - 360*gYB*gBY*MBBp*sqrt10*YdadjTd -& 
&  360*gYB*gBL*MBp*sqrt10*YdadjTd - 10800._dp*TradjYdTd*YdadjTd - 3600*TradjYeTe*YdadjTd -& 
&  3600._dp*(YdadjTdTdadjYd) - 3600._dp*(YdadjTuTuadjYd) + 21600._dp*AbsM2*g2p2*YdadjYd +& 
&  1440*AbsMBp*gYBp2*YdadjYd + 720*g1p2*mHd2*YdadjYd + 10800._dp*g2p2*mHd2*YdadjYd +     & 
&  720*gYBp2*mHd2*YdadjYd + 720*AbsMBp*gYB*gBL*sqrt10*YdadjYd + 360*gYB*gBL*mHd2*sqrt10*YdadjYd +& 
&  360*g1*gBY*mHd2*sqrt10*YdadjYd - 10800._dp*TrCTdTpTd*YdadjYd - 3600*TrCTeTpTe*YdadjYd -& 
&  10800._dp*Trmd2YdadjYd*YdadjYd - 3600*Trme2YeadjYe*YdadjYd - 3600*Trml2adjYeYe*YdadjYd -& 
&  10800._dp*Trmq2adjYdYd*YdadjYd - 21600._dp*mHd2*TrYdadjYd*YdadjYd - 7200*mHd2*TrYeadjYe*YdadjYd +& 
&  360*g1p2*YdadjYdmd2 + 5400*g2p2*YdadjYdmd2 + 360*gYBp2*YdadjYdmd2 + 180*gYB*gBL*sqrt10*YdadjYdmd2 +& 
&  180*g1*gBY*sqrt10*YdadjYdmd2 - 5400*TrYdadjYd*YdadjYdmd2 - 1800*TrYeadjYe*YdadjYdmd2 -& 
&  3600._dp*(YdadjYdmd2YdadjYd) - 3600._dp*(YdadjYdTdadjTd) - 7200*mHd2*YdadjYdYdadjYd - & 
&  1800._dp*(YdadjYdYdadjYdmd2) - 3600._dp*(YdadjYdYdmq2adjYd) - 3600._dp*(YdadjYumu2YuadjYd) -& 
&  3600._dp*(YdadjYuTuadjTd) - 3600*mHd2*YdadjYuYuadjYd - 3600*mHu2*YdadjYuYuadjYd -     & 
&  1800._dp*(YdadjYuYuadjYdmd2) - 3600._dp*(YdadjYuYumq2adjYd) + 720*g1p2*Ydmq2adjYd +   & 
&  10800._dp*g2p2*Ydmq2adjYd + 720*gYBp2*Ydmq2adjYd + 360*gYB*gBL*sqrt10*Ydmq2adjYd +    & 
&  360*g1*gBY*sqrt10*Ydmq2adjYd - 10800._dp*TrYdadjYd*Ydmq2adjYd - 3600*TrYeadjYe*Ydmq2adjYd -& 
&  3600._dp*(Ydmq2adjYdYdadjYd) - 3600._dp*(Ydmq2adjYuYuadjYd) + (id3R*(9696*g1p4*M1 -   & 
&  16*g1p3*(-808*gYB*MBBp + 93*gBY*M1*sqrt10 + 31*gBL*MBBp*sqrt10) + 4*g1p2*(808*gYBp2*(2._dp*(M1) +& 
&  MBp) + 5*(117*gBYp2*M1 + 78*gBL*gBY*MBBp - 70*gBLp2*(2._dp*(M1) + MBp) +              & 
&  64*g3p2*(2._dp*(M1) + M3)) - 62*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) +   & 
&  gBY*(-20*gYBp2*(-39*gBL*MBBp + 70*gBY*(2._dp*(M1) + MBp)) + 25*(109*(3*gBYp3*M1 +     & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(2*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + M3))) - 248*gYBp3*MBBp*sqrt10 - 20*gYB*(32*g3p2*MBBp +              & 
&  111*gBLp2*MBBp + 74*gBYp2*MBBp + 37*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) -             & 
&  4*g1*(-1616*gYBp3*MBBp - 5*gYB*(39*gBLp2*MBBp + 2*(64._dp*(g3p2) + 39._dp*(gBYp2))*MBBp +& 
&  179*gBL*gBY*(2._dp*(M1) + MBp)) + 62*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) +            & 
&  MBp))*sqrt10 + 5*(37*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +& 
&  MBp)) + 32*g3p2*(gBL*MBBp + gBY*(2._dp*(M1) + M3)))*sqrt10)) + 360*(-(g1*(2._dp*(g1) +& 
&  gBY*sqrt10)*TdadjYd) + (4*g1p2*M1 + gYB*gBY*MBBp*sqrt10 + g1*(4*gYB*MBBp +            & 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*YdadjYd))*Conjg(M1) + 2*(id3R*(3232*g1p4*MBBp +   & 
&  3232*gYBp4*MBBp + 10*gYBp2*(78*gBLp2*MBBp + (128._dp*(g3p2) - 101._dp*(gBYp2))*MBBp + & 
&  39*gBL*gBY*(M1 + 2._dp*(MBp))) + 25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp +           & 
&  gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  32*g3p2*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp + M3))) - 124*gYBp3*(4*gBL*MBBp +& 
&  gBY*(M1 + 2._dp*(MBp)))*sqrt10 - 10*gYB*(37*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp +        & 
&  gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp))) + 32*g3p2*(2*gBL*MBBp +    & 
&  gBY*(M1 + MBp + M3)))*sqrt10 + 4*g1p3*(808*gYB*(2._dp*(M1) + MBp) - 31*(4*gBY*MBBp +  & 
&  gBL*(2._dp*(M1) + MBp))*sqrt10) - 2*g1p2*(-6464*gYBp2*MBBp - 5*(-101*gBLp2*MBBp +     & 
&  2*(64._dp*(g3p2) + 39._dp*(gBYp2))*MBBp + 39*gBL*gBY*(2._dp*(M1) + MBp)) +            & 
&  62*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(1616*gYBp3*(M1 +       & 
&  2._dp*(MBp)) + 5*gYB*(514*gBL*gBY*MBBp + 39*gBYp2*(2._dp*(M1) + MBp) + 39*gBLp2*(M1 + & 
&  2._dp*(MBp)) + 128*g3p2*(M1 + MBp + M3)) - 62*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 +         & 
&  2._dp*(MBp)))*sqrt10 - 5*(37*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) +& 
&  MBp) + gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(2*gBY*MBBp + gBL*(M1 + MBp +              & 
&  M3)))*sqrt10)) + 180*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TdadjYd) +        & 
&  (4*g1p2*MBBp + g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) +         & 
&  gYB*(gBY*(M1 + MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YdadjYd))*Conjg(MBBp) +& 
&  3580*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp) - 1400*g1p2*gBLp2*id3R*M1*Conjg(MBp) +         & 
&  2725*gBLp2*gBYp2*id3R*M1*Conjg(MBp) + 3232*g1p2*gYBp2*id3R*M1*Conjg(MBp) -            & 
&  1400*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + 6464*gYB*g1p3*id3R*MBBp*Conjg(MBp) +            & 
&  2560*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp) + 780*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +       & 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + 1560*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp) +     & 
&  10900._dp*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + 780*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp) +    & 
&  5450*gBL*gBYp3*id3R*MBBp*Conjg(MBp) + 1560*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp) +       & 
&  12928._dp*g1*gYBp3*id3R*MBBp*Conjg(MBp) + 800*g3p2*gBLp2*id3R*M3*Conjg(MBp) +         & 
&  1280*g3p2*gYBp2*id3R*M3*Conjg(MBp) - 248*gYB*g1p2*gBL*id3R*M1*sqrt10*Conjg(MBp) -     & 
&  740*g1*gBY*gBLp2*id3R*M1*sqrt10*Conjg(MBp) - 740*gYB*gBL*gBYp2*id3R*M1*sqrt10*Conjg(MBp) -& 
&  248*g1*gBY*gYBp2*id3R*M1*sqrt10*Conjg(MBp) - 248*g1p3*gBL*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  640*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(MBp) - 744*gYB*g1p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  640*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) - 4440*gYB*gBY*gBLp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  1480*g1*gBLp3*id3R*MBBp*sqrt10*Conjg(MBp) - 2220*g1*gBL*gBYp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  740*gYB*gBYp3*id3R*MBBp*sqrt10*Conjg(MBp) - 1488*g1*gBL*gYBp2*id3R*MBBp*sqrt10*Conjg(MBp) -& 
&  496*gBY*gYBp3*id3R*MBBp*sqrt10*Conjg(MBp) - 640*gYB*g3p2*gBL*id3R*M3*sqrt10*Conjg(MBp) -& 
&  720*gYBp2*TdadjYd*Conjg(MBp) - 360*gYB*gBL*sqrt10*TdadjYd*Conjg(MBp) + 1440*g1*gYB*MBBp*YdadjYd*Conjg(MBp) +& 
&  360*g1*gBL*MBBp*sqrt10*YdadjYd*Conjg(MBp) + 360*gYB*gBY*MBBp*sqrt10*YdadjYd*Conjg(MBp) +& 
&  1280*g1p2*g3p2*id3R*M1*Conjg(M3) + 800*g3p2*gBYp2*id3R*M1*Conjg(M3) + 2560*g1*gYB*g3p2*id3R*MBBp*Conjg(M3) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3) + 800*g3p2*gBLp2*id3R*MBp*Conjg(M3) +           & 
&  1280*g3p2*gYBp2*id3R*MBp*Conjg(M3) - 640*g1*g3p2*gBY*id3R*M1*sqrt10*Conjg(M3) -       & 
&  640*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(M3) - 640*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(M3) -& 
&  640*gYB*g3p2*gBL*id3R*MBp*sqrt10*Conjg(M3) - 10800._dp*g2p2*TdadjYd*Conjg(M2) +       & 
&  9600*g3p4*id3R*Tr2(3) + 480*g1p2*id3R*Tr2U1(1,1) + 300*gBYp2*id3R*Tr2U1(1,            & 
& 1) - 240*g1*gBY*id3R*sqrt10*Tr2U1(1,1) + 480*g1*gYB*id3R*Tr2U1(1,4) + 300*gBL*gBY*id3R*Tr2U1(1,& 
& 4) - 120*g1*gBL*id3R*sqrt10*Tr2U1(1,4) - 120*gYB*gBY*id3R*sqrt10*Tr2U1(1,              & 
& 4) + 480*g1*gYB*id3R*Tr2U1(4,1) + 300*gBL*gBY*id3R*Tr2U1(4,1) - 120*g1*gBL*id3R*sqrt10*Tr2U1(4,& 
& 1) - 120*gYB*gBY*id3R*sqrt10*Tr2U1(4,1) + 300*gBLp2*id3R*Tr2U1(4,4) + 480*gYBp2*id3R*Tr2U1(4,& 
& 4) - 240*gYB*gBL*id3R*sqrt10*Tr2U1(4,4) + 480*g1*id3R*sqrt15*Tr3(1) - 600*gBY*id3R*sqrt6*Tr3(1) +& 
&  480*gYB*id3R*sqrt15*Tr3(4) - 600*gBL*id3R*sqrt6*Tr3(4))/900._dp

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-320*AbsM3*g3p2*id3R - 10*AbsMBp*gBLp2*id3R - 64*AbsMBp*gYBp2*id3R +     & 
&  60._dp*(mu2YuadjYu) - 16*AbsMBp*gYB*gBL*id3R*sqrt10 + 120._dp*(TuadjTu)               & 
&  + 120*mHu2*YuadjYu + 60._dp*(YuadjYumu2) + 120._dp*(Yumq2adjYu) - 2*id3R*(32*g1p2*M1 +& 
&  gBY*(5*gBY*M1 + 5*gBL*MBBp + 4*gYB*MBBp*sqrt10) + 4*g1*(8*gYB*MBBp + 2*gBY*M1*sqrt10 +& 
&  gBL*MBBp*sqrt10))*Conjg(M1) - 2*id3R*(32*g1p2*MBBp + 32*gYBp2*MBBp + 5*(gBLp2*MBBp +  & 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp)) + 4*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 +       & 
&  4*g1*(8*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp)           & 
&  - 64*g1*gYB*id3R*MBBp*Conjg(MBp) - 10*gBL*gBY*id3R*MBBp*Conjg(MBp) - 8*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)& 
&  - 8*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) - 8*g1*id3R*sqrt15*Tr1(1) - 5*gBY*id3R*sqrt6*Tr1(1)& 
&  - 8*gYB*id3R*sqrt15*Tr1(4) - 5*gBL*id3R*sqrt6*Tr1(4))/30._dp

 
 
If (TwoLoopRGE) Then 
betamu22 = (10240._dp*AbsM3*g1p2*g3p2*id3R - 38400._dp*AbsM3*g3p4*id3R + 51320._dp*AbsMBp*g1*gYB*gBL*gBY*id3R +& 
&  6080*AbsMBp*g1p2*gBLp2*id3R + 1600*AbsM3*g3p2*gBLp2*id3R + 1600*AbsMBp*g3p2*gBLp2*id3R +& 
&  8175*AbsMBp*gBLp4*id3R + 1600*AbsM3*g3p2*gBYp2*id3R + 5450*AbsMBp*gBLp2*gBYp2*id3R +  & 
&  27392._dp*AbsMBp*g1p2*gYBp2*id3R + 10240._dp*AbsM3*g3p2*gYBp2*id3R + 10240._dp*AbsMBp*g3p2*gYBp2*id3R +& 
&  95220._dp*AbsMBp*gBLp2*gYBp2*id3R + 6080*AbsMBp*gBYp2*gYBp2*id3R + 41088._dp*AbsMBp*gYBp4*id3R -& 
&  1800._dp*(mu2YuadjYdYdadjYu) - 360*g1p2*mu2YuadjYu + 5400*g2p2*mu2YuadjYu -           & 
&  360*gYBp2*mu2YuadjYu - 1800._dp*(mu2YuadjYuYuadjYu) + 8288*AbsMBp*gYB*g1p2*gBL*id3R*sqrt10 +& 
&  2560*AbsM3*gYB*g3p2*gBL*id3R*sqrt10 + 2560*AbsMBp*gYB*g3p2*gBL*id3R*sqrt10 +          & 
&  2560*AbsM3*g1*g3p2*gBY*id3R*sqrt10 + 5120*AbsMBp*g1*gBY*gBLp2*id3R*sqrt10 +           & 
&  15360._dp*AbsMBp*gYB*gBLp3*id3R*sqrt10 + 5120*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt10 +      & 
&  8288*AbsMBp*g1*gBY*gYBp2*id3R*sqrt10 + 24864._dp*AbsMBp*gBL*gYBp3*id3R*sqrt10 -       & 
&  180*gYB*gBL*mu2YuadjYu*sqrt10 - 180*g1*gBY*mu2YuadjYu*sqrt10 - 5400*mu2YuadjYu*TrYuadjYu -& 
&  1800*mu2YuadjYu*TrYvadjYv - 3600._dp*(TuadjTdYdadjYu) - 720*g1p2*TuadjTu +            & 
&  10800._dp*g2p2*TuadjTu - 720*gYBp2*TuadjTu - 360*gYB*gBL*sqrt10*TuadjTu -             & 
&  360*g1*gBY*sqrt10*TuadjTu - 10800._dp*TrYuadjYu*TuadjTu - 3600*TrYvadjYv*TuadjTu -    & 
&  3600._dp*(TuadjTuYuadjYu) - 3600._dp*(TuadjYdYdadjTu) - 10800._dp*TrCTuTpYu*TuadjYu - & 
&  3600*TrCTvTpYv*TuadjYu - 3600._dp*(TuadjYuYuadjTu) - 3600._dp*(YuadjTdTdadjYu) +      & 
&  720*g1p2*M1*YuadjTu + 1440*g1*gYB*MBBp*YuadjTu + 720*gYBp2*MBp*YuadjTu -              & 
&  10800._dp*g2p2*M2*YuadjTu + 360*g1*gBY*M1*sqrt10*YuadjTu + 360*g1*gBL*MBBp*sqrt10*YuadjTu +& 
&  360*gYB*gBY*MBBp*sqrt10*YuadjTu + 360*gYB*gBL*MBp*sqrt10*YuadjTu - 10800._dp*TradjYuTu*YuadjTu -& 
&  3600*TradjYvTv*YuadjTu - 3600._dp*(YuadjTuTuadjYu) - 3600._dp*(YuadjYdmd2YdadjYu) -   & 
&  3600._dp*(YuadjYdTdadjTu) - 3600*mHd2*YuadjYdYdadjYu - 3600*mHu2*YuadjYdYdadjYu -     & 
&  1800._dp*(YuadjYdYdadjYumu2) - 3600._dp*(YuadjYdYdmq2adjYu) + 21600._dp*AbsM2*g2p2*YuadjYu -& 
&  1440*AbsMBp*gYBp2*YuadjYu - 720*g1p2*mHu2*YuadjYu + 10800._dp*g2p2*mHu2*YuadjYu -     & 
&  720*gYBp2*mHu2*YuadjYu - 720*AbsMBp*gYB*gBL*sqrt10*YuadjYu - 360*gYB*gBL*mHu2*sqrt10*YuadjYu -& 
&  360*g1*gBY*mHu2*sqrt10*YuadjYu - 10800._dp*TrCTuTpTu*YuadjYu - 3600*TrCTvTpTv*YuadjYu -& 
&  3600*Trml2adjYvYv*YuadjYu - 10800._dp*Trmq2adjYuYu*YuadjYu - 10800._dp*Trmu2YuadjYu*YuadjYu -& 
&  3600*Trmv2YvadjYv*YuadjYu - 21600._dp*mHu2*TrYuadjYu*YuadjYu - 7200*mHu2*TrYvadjYv*YuadjYu -& 
&  360*g1p2*YuadjYumu2 + 5400*g2p2*YuadjYumu2 - 360*gYBp2*YuadjYumu2 - 180*gYB*gBL*sqrt10*YuadjYumu2 -& 
&  180*g1*gBY*sqrt10*YuadjYumu2 - 5400*TrYuadjYu*YuadjYumu2 - 1800*TrYvadjYv*YuadjYumu2 -& 
&  3600._dp*(YuadjYumu2YuadjYu) - 3600._dp*(YuadjYuTuadjTu) - 7200*mHu2*YuadjYuYuadjYu - & 
&  1800._dp*(YuadjYuYuadjYumu2) - 3600._dp*(YuadjYuYumq2adjYu) - 3600._dp*(Yumq2adjYdYdadjYu) -& 
&  720*g1p2*Yumq2adjYu + 10800._dp*g2p2*Yumq2adjYu - 720*gYBp2*Yumq2adjYu -              & 
&  360*gYB*gBL*sqrt10*Yumq2adjYu - 360*g1*gBY*sqrt10*Yumq2adjYu - 10800._dp*TrYuadjYu*Yumq2adjYu -& 
&  3600*TrYvadjYv*Yumq2adjYu - 3600._dp*(Yumq2adjYuYuadjYu) + (id3R*(41088._dp*g1p4*M1 + & 
&  32*g1p3*(1712*gYB*MBBp + 777*gBY*M1*sqrt10 + 259*gBL*MBBp*sqrt10) + 4*g1p2*(3424*gYBp2*(2._dp*(M1) +& 
&  MBp) + 5*(4761*gBYp2*M1 + 3174*gBL*gBY*MBBp + 152*gBLp2*(2._dp*(M1) + MBp) +          & 
&  256*g3p2*(2._dp*(M1) + M3)) + 1036*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) +& 
&  gBY*(20*gYBp2*(1587*gBL*MBBp + 152*gBY*(2._dp*(M1) + MBp)) + 25*(109*(3*gBYp3*M1 +    & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 32*g3p2*(2*gBL*MBBp +& 
&  gBY*(2._dp*(M1) + M3))) + 4144*gYBp3*MBBp*sqrt10 + 1280*gYB*(6*gBLp2*MBBp +           & 
&  (g3p2 + 4._dp*(gBYp2))*MBBp + 2*gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + 4*g1*(6848*gYBp3*MBBp +& 
&  5*gYB*(512*g3p2*MBBp + 1587*gBLp2*MBBp + 3174*gBYp2*MBBp + 1283*gBL*gBY*(2._dp*(M1) + & 
&  MBp)) + 1036*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 320*(2*(6*gBYp3*M1 +& 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + g3p2*(gBL*MBBp +      & 
&  gBY*(2._dp*(M1) + M3)))*sqrt10)) - 360*(-(g1*(2._dp*(g1) + gBY*sqrt10)*TuadjYu) +     & 
&  (4*g1p2*M1 + gYB*gBY*MBBp*sqrt10 + g1*(4*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*YuadjYu))*Conjg(M1) +& 
&  2*(id3R*(13696._dp*g1p4*MBBp + 13696._dp*gYBp4*MBBp + 10*gYBp2*(3174*gBLp2*MBBp +     & 
&  (512._dp*(g3p2) + 1891._dp*(gBYp2))*MBBp + 1587*gBL*gBY*(M1 + 2._dp*(MBp))) +         & 
&  25*(109*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +       & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 32*g3p2*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp + M3))) + 2072*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + & 
&  640*gYB*(2*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) +              & 
&  3*gBY*gBLp2*(M1 + 2._dp*(MBp))) + g3p2*(2*gBL*MBBp + gBY*(M1 + MBp + M3)))*sqrt10 +   & 
&  8*g1p3*(1712*gYB*(2._dp*(M1) + MBp) + 259*(4*gBY*MBBp + gBL*(2._dp*(M1) +             & 
&  MBp))*sqrt10) + 2*g1p2*(27392._dp*gYBp2*MBBp + 5*(512*g3p2*MBBp + 1891*gBLp2*MBBp +   & 
&  3174*gBYp2*MBBp + 1587*gBL*gBY*(2._dp*(M1) + MBp)) + 1036*gYB*(8*gBL*MBBp +           & 
&  3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(6848*gYBp3*(M1 + 2._dp*(MBp)) +             & 
&  5*gYB*(8914*gBL*gBY*MBBp + 1587*gBYp2*(2._dp*(M1) + MBp) + 1587*gBLp2*(M1 +           & 
&  2._dp*(MBp)) + 512*g3p2*(M1 + MBp + M3)) + 1036*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 +       & 
&  2._dp*(MBp)))*sqrt10 + 320*(2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) +& 
&  MBp) + gBLp3*(M1 + 2._dp*(MBp))) + g3p2*(2*gBY*MBBp + gBL*(M1 + MBp + M3)))*sqrt10)) -& 
&  180*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TuadjYu) + (4*g1p2*MBBp +          & 
&  g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 +         & 
&  MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YuadjYu))*Conjg(MBBp) +             & 
&  25660._dp*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp) + 3040*g1p2*gBLp2*id3R*M1*Conjg(MBp) +    & 
&  2725*gBLp2*gBYp2*id3R*M1*Conjg(MBp) + 13696._dp*g1p2*gYBp2*id3R*M1*Conjg(MBp) +       & 
&  3040*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + 27392._dp*gYB*g1p3*id3R*MBBp*Conjg(MBp) +       & 
&  10240._dp*g1*gYB*g3p2*id3R*MBBp*Conjg(MBp) + 31740._dp*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(MBp) + 63480._dp*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp) +& 
&  10900._dp*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + 31740._dp*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp) +& 
&  5450*gBL*gBYp3*id3R*MBBp*Conjg(MBp) + 63480._dp*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp) +  & 
&  54784._dp*g1*gYBp3*id3R*MBBp*Conjg(MBp) + 800*g3p2*gBLp2*id3R*M3*Conjg(MBp) +         & 
&  5120*g3p2*gYBp2*id3R*M3*Conjg(MBp) + 4144*gYB*g1p2*gBL*id3R*M1*sqrt10*Conjg(MBp) +    & 
&  2560*g1*gBY*gBLp2*id3R*M1*sqrt10*Conjg(MBp) + 2560*gYB*gBL*gBYp2*id3R*M1*sqrt10*Conjg(MBp) +& 
&  4144*g1*gBY*gYBp2*id3R*M1*sqrt10*Conjg(MBp) + 4144*g1p3*gBL*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  1280*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(MBp) + 12432._dp*gYB*g1p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  1280*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 15360._dp*gYB*gBY*gBLp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  5120*g1*gBLp3*id3R*MBBp*sqrt10*Conjg(MBp) + 7680*g1*gBL*gBYp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  2560*gYB*gBYp3*id3R*MBBp*sqrt10*Conjg(MBp) + 24864._dp*g1*gBL*gYBp2*id3R*MBBp*sqrt10*Conjg(MBp) +& 
&  8288*gBY*gYBp3*id3R*MBBp*sqrt10*Conjg(MBp) + 1280*gYB*g3p2*gBL*id3R*M3*sqrt10*Conjg(MBp) +& 
&  720*gYBp2*TuadjYu*Conjg(MBp) + 360*gYB*gBL*sqrt10*TuadjYu*Conjg(MBp) - 1440*g1*gYB*MBBp*YuadjYu*Conjg(MBp) -& 
&  360*g1*gBL*MBBp*sqrt10*YuadjYu*Conjg(MBp) - 360*gYB*gBY*MBBp*sqrt10*YuadjYu*Conjg(MBp) +& 
&  5120*g1p2*g3p2*id3R*M1*Conjg(M3) + 800*g3p2*gBYp2*id3R*M1*Conjg(M3) + 10240._dp*g1*gYB*g3p2*id3R*MBBp*Conjg(M3) +& 
&  1600*g3p2*gBL*gBY*id3R*MBBp*Conjg(M3) + 800*g3p2*gBLp2*id3R*MBp*Conjg(M3) +           & 
&  5120*g3p2*gYBp2*id3R*MBp*Conjg(M3) + 1280*g1*g3p2*gBY*id3R*M1*sqrt10*Conjg(M3) +      & 
&  1280*g1*g3p2*gBL*id3R*MBBp*sqrt10*Conjg(M3) + 1280*gYB*g3p2*gBY*id3R*MBBp*sqrt10*Conjg(M3) +& 
&  1280*gYB*g3p2*gBL*id3R*MBp*sqrt10*Conjg(M3) - 10800._dp*g2p2*TuadjYu*Conjg(M2) +      & 
&  9600*g3p4*id3R*Tr2(3) + 1920*g1p2*id3R*Tr2U1(1,1) + 300*gBYp2*id3R*Tr2U1(1,           & 
& 1) + 480*g1*gBY*id3R*sqrt10*Tr2U1(1,1) + 1920*g1*gYB*id3R*Tr2U1(1,4) + 300*gBL*gBY*id3R*Tr2U1(1,& 
& 4) + 240*g1*gBL*id3R*sqrt10*Tr2U1(1,4) + 240*gYB*gBY*id3R*sqrt10*Tr2U1(1,              & 
& 4) + 1920*g1*gYB*id3R*Tr2U1(4,1) + 300*gBL*gBY*id3R*Tr2U1(4,1) + 240*g1*gBL*id3R*sqrt10*Tr2U1(4,& 
& 1) + 240*gYB*gBY*id3R*sqrt10*Tr2U1(4,1) + 300*gBLp2*id3R*Tr2U1(4,4) + 1920*gYBp2*id3R*Tr2U1(4,& 
& 4) + 480*gYB*gBL*id3R*sqrt10*Tr2U1(4,4) - 960*g1*id3R*sqrt15*Tr3(1) - 600*gBY*id3R*sqrt6*Tr3(1) -& 
&  960*gYB*id3R*sqrt15*Tr3(4) - 600*gBL*id3R*sqrt6*Tr3(4))/900._dp

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-30*AbsMBp*gBLp2*id3R - 48*AbsMBp*gYBp2*id3R + 20._dp*(me2YeadjYe)       & 
&  - 24*AbsMBp*gYB*gBL*id3R*sqrt10 + 40._dp*(TeadjTe) + 40*mHd2*YeadjYe + 20._dp*(YeadjYeme2)& 
&  + 40._dp*(Yeml2adjYe) - 6*id3R*(8*g1p2*M1 + gBY*(5*gBY*M1 + 5*gBL*MBBp +              & 
&  2*gYB*MBBp*sqrt10) + 2*g1*(4*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))           & 
& *Conjg(M1) - 6*id3R*(8*g1p2*MBBp + 8*gYBp2*MBBp + 5*(gBLp2*MBBp + gBYp2*MBBp +         & 
&  gBL*gBY*(M1 + MBp)) + 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + 2*g1*(4*gYB*(M1 +  & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*Conjg(MBBp) - 48*g1*gYB*id3R*MBBp*Conjg(MBp)& 
&  - 30*gBL*gBY*id3R*MBBp*Conjg(MBp) - 12*g1*gBL*id3R*MBBp*sqrt10*Conjg(MBp)             & 
&  - 12*gYB*gBY*id3R*MBBp*sqrt10*Conjg(MBp) + 4*g1*id3R*sqrt15*Tr1(1) + 5*gBY*id3R*sqrt6*Tr1(1)& 
&  + 4*gYB*id3R*sqrt15*Tr1(4) + 5*gBL*id3R*sqrt6*Tr1(4))/10._dp

 
 
If (TwoLoopRGE) Then 
betame22 = (1062*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp + 36*AbsMBp*g1p2*gBLp2*id3R + (351*AbsMBp*gBLp4*id3R)/4._dp +& 
&  (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp + (1872*AbsMBp*g1p2*gYBp2*id3R)/25._dp +          & 
&  (2133*AbsMBp*gBLp2*gYBp2*id3R)/5._dp + 36*AbsMBp*gBYp2*gYBp2*id3R + (2808*AbsMBp*gYBp4*id3R)/25._dp -& 
&  (6*g1p2*me2YeadjYe)/5._dp + 6*g2p2*me2YeadjYe - (6*gYBp2*me2YeadjYe)/5._dp -          & 
&  2._dp*(me2YeadjYeYeadjYe) - 2._dp*(me2YeadjYvYvadjYe) + (828*AbsMBp*gYB*g1p2*gBL*id3R*sqrt2ov5)/5._dp +& 
&  162*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 + 486*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 +          & 
&  162*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 + (828*AbsMBp*g1*gBY*gYBp2*id3R*sqrt2ov5)/5._dp +& 
&  (2484*AbsMBp*gBL*gYBp3*id3R*sqrt2ov5)/5._dp - 3*gYB*gBL*me2YeadjYe*sqrt2ov5 -         & 
&  3*g1*gBY*me2YeadjYe*sqrt2ov5 - (12*g1p2*TeadjTe)/5._dp + 12*g2p2*TeadjTe -            & 
&  (12*gYBp2*TeadjTe)/5._dp - 6*gYB*gBL*sqrt2ov5*TeadjTe - 6*g1*gBY*sqrt2ov5*TeadjTe -   & 
&  4._dp*(TeadjTeYeadjYe) - 4._dp*(TeadjTvYvadjYe) - 4._dp*(TeadjYeYeadjTe) -            & 
&  4._dp*(TeadjYvYvadjTe) - 12*TeadjYe*TrCTdTpYd - 4*TeadjYe*TrCTeTpYe - 6*me2YeadjYe*TrYdadjYd -& 
&  12*TeadjTe*TrYdadjYd - 2*me2YeadjYe*TrYeadjYe - 4*TeadjTe*TrYeadjYe + (12*g1p2*M1*YeadjTe)/5._dp +& 
&  (24*g1*gYB*MBBp*YeadjTe)/5._dp + (12*gYBp2*MBp*YeadjTe)/5._dp - 12*g2p2*M2*YeadjTe +  & 
&  6*g1*gBY*M1*sqrt2ov5*YeadjTe + 6*g1*gBL*MBBp*sqrt2ov5*YeadjTe + 6*gYB*gBY*MBBp*sqrt2ov5*YeadjTe +& 
&  6*gYB*gBL*MBp*sqrt2ov5*YeadjTe - 12*TradjYdTd*YeadjTe - 4*TradjYeTe*YeadjTe -         & 
&  4._dp*(YeadjTeTeadjYe) - 4._dp*(YeadjTvTvadjYe) + 24*AbsM2*g2p2*YeadjYe -             & 
&  (24*AbsMBp*gYBp2*YeadjYe)/5._dp - (12*g1p2*mHd2*YeadjYe)/5._dp + 12*g2p2*mHd2*YeadjYe -& 
&  (12*gYBp2*mHd2*YeadjYe)/5._dp - 12*AbsMBp*gYB*gBL*sqrt2ov5*YeadjYe - 6*gYB*gBL*mHd2*sqrt2ov5*YeadjYe -& 
&  6*g1*gBY*mHd2*sqrt2ov5*YeadjYe - 12*TrCTdTpTd*YeadjYe - 4*TrCTeTpTe*YeadjYe -         & 
&  12*Trmd2YdadjYd*YeadjYe - 4*Trme2YeadjYe*YeadjYe - 4*Trml2adjYeYe*YeadjYe  
betame22 =  betame22- 12*Trmq2adjYdYd*YeadjYe - 24*mHd2*TrYdadjYd*YeadjYe - 8*mHd2*TrYeadjYe*YeadjYe -      & 
&  (6*g1p2*YeadjYeme2)/5._dp + 6*g2p2*YeadjYeme2 - (6*gYBp2*YeadjYeme2)/5._dp -          & 
&  3*gYB*gBL*sqrt2ov5*YeadjYeme2 - 3*g1*gBY*sqrt2ov5*YeadjYeme2 - 6*TrYdadjYd*YeadjYeme2 -& 
&  2*TrYeadjYe*YeadjYeme2 - 4._dp*(YeadjYeme2YeadjYe) - 4._dp*(YeadjYeTeadjTe) -         & 
&  8*mHd2*YeadjYeYeadjYe - 2._dp*(YeadjYeYeadjYeme2) - 4._dp*(YeadjYeYeml2adjYe) -       & 
&  4._dp*(YeadjYvmv2YvadjYe) - 4._dp*(YeadjYvTvadjTe) - 4*mHd2*YeadjYvYvadjYe -          & 
&  4*mHu2*YeadjYvYvadjYe - 2._dp*(YeadjYvYvadjYeme2) - 4._dp*(YeadjYvYvml2adjYe) -       & 
&  (12*g1p2*Yeml2adjYe)/5._dp + 12*g2p2*Yeml2adjYe - (12*gYBp2*Yeml2adjYe)/5._dp -       & 
&  6*gYB*gBL*sqrt2ov5*Yeml2adjYe - 6*g1*gBY*sqrt2ov5*Yeml2adjYe - 12*TrYdadjYd*Yeml2adjYe -& 
&  4*TrYeadjYe*Yeml2adjYe - 4._dp*(Yeml2adjYeYeadjYe) - 4._dp*(Yeml2adjYvYvadjYe) +      & 
&  (3*(3*id3R*(1248*g1p4*M1 + 16*g1p3*(104*gYB*MBBp + 69*gBY*M1*sqrt10 + 23*gBL*MBBp*sqrt10) +& 
&  4*g1p2*(104*gYBp2*(2._dp*(M1) + MBp) + 5*(237*gBYp2*M1 + 158*gBL*gBY*MBBp +           & 
&  10*gBLp2*(2._dp*(M1) + MBp)) + 46*gYB*(6*gBY*MBBp + gBL*(2._dp*(M1) + MBp))*sqrt10) + & 
&  gBY*(20*gYBp2*(79*gBL*MBBp + 10*gBY*(2._dp*(M1) + MBp)) + 325*(3*gBYp3*M1 +           & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 184*gYBp3*MBBp*sqrt10 +& 
&  180*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) +          & 
&  4*g1*(208*gYBp3*MBBp + 5*gYB*(79*gBLp2*MBBp + 158*gBYp2*MBBp + 59*gBL*gBY*(2._dp*(M1) +& 
&  MBp)) + 46*gYBp2*(3*gBL*MBBp + gBY*(2._dp*(M1) + MBp))*sqrt10 + 45*(6*gBYp3*M1 +      & 
&  gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp))*sqrt10)) -              & 
&  40*(-(g1*(2._dp*(g1) + gBY*sqrt10)*TeadjYe) + (4*g1p2*M1 + 4*g1*gYB*MBBp +            & 
&  2*g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10)*YeadjYe))*Conjg(M1))/100._dp  
betame22 =  betame22+ (3*(3*id3R*(416*g1p4*MBBp + 416*gYBp4*MBBp + 10*gYBp2*(158*gBLp2*MBBp +               & 
&  99*gBYp2*MBBp + 79*gBL*gBY*(M1 + 2._dp*(MBp))) + 325*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp +& 
&  gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) +           & 
&  92*gYBp3*(4*gBL*MBBp + gBY*(M1 + 2._dp*(MBp)))*sqrt10 + 90*gYB*(4*gBLp3*MBBp +        & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  4*g1p3*(104*gYB*(2._dp*(M1) + MBp) + 23*(2*gBL*M1 + 4*gBY*MBBp + gBL*MBp)*sqrt10) +   & 
&  2*g1p2*(832*gYBp2*MBBp + 5*(99*gBLp2*MBBp + 158*gBYp2*MBBp + 79*gBL*gBY*(2._dp*(M1) + & 
&  MBp)) + 46*gYB*(8*gBL*MBBp + 3*gBY*(2._dp*(M1) + MBp))*sqrt10) + 2*g1*(208*gYBp3*(M1 +& 
&  2._dp*(MBp)) + 5*gYB*(434*gBL*gBY*MBBp + 79*gBYp2*(2._dp*(M1) + MBp) + 79*gBLp2*(M1 + & 
&  2._dp*(MBp))) + 46*gYBp2*(8*gBY*MBBp + 3*gBL*(M1 + 2._dp*(MBp)))*sqrt10 +             & 
&  45*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +    & 
&  2._dp*(MBp)))*sqrt10)) - 20*(-((4*g1*gYB + g1*gBL*sqrt10 + gYB*gBY*sqrt10)*TeadjYe) + & 
&  (4*g1p2*MBBp + g1*(4*gYB*(M1 + MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) +         & 
&  gYB*(gBY*(M1 + MBp)*sqrt10 + 2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YeadjYe))*Conjg(MBBp))/50._dp +& 
&  (531*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp + 18*g1p2*gBLp2*id3R*M1*Conjg(MBp) +    & 
&  (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (936*g1p2*gYBp2*id3R*M1*Conjg(MBp))/25._dp +& 
&  18*gBYp2*gYBp2*id3R*M1*Conjg(MBp) + (1872*gYB*g1p3*id3R*MBBp*Conjg(MBp))/25._dp +     & 
&  (711*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp + (1422*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) + (711*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp +  & 
&  (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp + (1422*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (3744*g1*gYBp3*id3R*MBBp*Conjg(MBp))/25._dp + (414*gYB*g1p2*gBL*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp  
betame22 =  betame22+ 81*g1*gBY*gBLp2*id3R*M1*sqrt2ov5*Conjg(MBp) + 81*gYB*gBL*gBYp2*id3R*M1*sqrt2ov5*Conjg(MBp) +& 
&  (414*g1*gBY*gYBp2*id3R*M1*sqrt2ov5*Conjg(MBp))/5._dp + (414*g1p3*gBL*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  (1242*gYB*g1p2*gBY*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + 486*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  162*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 243*g1*gBL*gBYp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  81*gYB*gBYp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + (2484*g1*gBL*gYBp2*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp +& 
&  (828*gBY*gYBp3*id3R*MBBp*sqrt2ov5*Conjg(MBp))/5._dp + (12*gYBp2*TeadjYe*Conjg(MBp))/5._dp +& 
&  6*gYB*gBL*sqrt2ov5*TeadjYe*Conjg(MBp) - (24*g1*gYB*MBBp*YeadjYe*Conjg(MBp))/5._dp -   & 
&  6*g1*gBL*MBBp*sqrt2ov5*YeadjYe*Conjg(MBp) - 6*gYB*gBY*MBBp*sqrt2ov5*YeadjYe*Conjg(MBp) -& 
&  12*g2p2*TeadjYe*Conjg(M2) + (24*g1p2*id3R*Tr2U1(1,1))/5._dp + 3*gBYp2*id3R*Tr2U1(1,   & 
& 1) + 12*g1*gBY*id3R*sqrt2ov5*Tr2U1(1,1) + (24*g1*gYB*id3R*Tr2U1(1,4))/5._dp +          & 
&  3*gBL*gBY*id3R*Tr2U1(1,4) + 6*g1*gBL*id3R*sqrt2ov5*Tr2U1(1,4) + 6*gYB*gBY*id3R*sqrt2ov5*Tr2U1(1,& 
& 4) + (24*g1*gYB*id3R*Tr2U1(4,1))/5._dp + 3*gBL*gBY*id3R*Tr2U1(4,1) + 6*g1*gBL*id3R*sqrt2ov5*Tr2U1(4,& 
& 1) + 6*gYB*gBY*id3R*sqrt2ov5*Tr2U1(4,1) + 3*gBLp2*id3R*Tr2U1(4,4) + (24*gYBp2*id3R*Tr2U1(4,& 
& 4))/5._dp + 12*gYB*gBL*id3R*sqrt2ov5*Tr2U1(4,4) + 8*g1*id3R*sqrt3ov5*Tr3(1) +          & 
&  2*gBY*id3R*sqrt6*Tr3(1) + 8*gYB*id3R*sqrt3ov5*Tr3(4) + 2*gBL*id3R*sqrt6*Tr3(4)

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = -3*AbsMBp*gBLp2*id3R + 2._dp*(mv2YvadjYv) + 4._dp*(mv2YxCYx)              & 
&  + 4._dp*(TvadjTv) + 8._dp*(TxCTx) + 4*mHu2*YvadjYv + 2._dp*(YvadjYvmv2)               & 
&  + 4._dp*(Yvml2adjYv) + 8._dp*(YxCmv2CYx) + 8*mC12*YxCYx + 4._dp*(YxCYxmv2)            & 
&  - 3*gBY*id3R*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 3*id3R*(gBLp2*MBBp + gBYp2*MBBp +        & 
&  gBL*gBY*(M1 + MBp))*Conjg(MBBp) - 3*gBL*gBY*id3R*MBBp*Conjg(MBp) + gBY*id3R*sqrt3ov2*Tr1(1)& 
&  + gBL*id3R*sqrt3ov2*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamv22 = (198*AbsMBp*g1*gYB*gBL*gBY*id3R)/5._dp + (351*AbsMBp*gBLp4*id3R)/4._dp +              & 
&  (117*AbsMBp*gBLp2*gBYp2*id3R)/2._dp + (297*AbsMBp*gBLp2*gYBp2*id3R)/5._dp -           & 
&  2._dp*(mv2YvadjYeYeadjYv) + (6*g1p2*mv2YvadjYv)/5._dp + 6*g2p2*mv2YvadjYv +           & 
&  (6*gYBp2*mv2YvadjYv)/5._dp - 2._dp*(mv2YvadjYvYvadjYv) - 8._dp*(mv2YxCYvTpYvCYx) +    & 
&  12*gBLp2*mv2YxCYx + 12*gBYp2*mv2YxCYx - 16._dp*(mv2YxCYxYxCYx) + 36*AbsMBp*g1*gBY*gBLp2*id3R*sqrt2ov5 +& 
&  108*AbsMBp*gYB*gBLp3*id3R*sqrt2ov5 + 36*AbsMBp*gYB*gBL*gBYp2*id3R*sqrt2ov5 +          & 
&  3*gYB*gBL*mv2YvadjYv*sqrt2ov5 + 3*g1*gBY*mv2YvadjYv*sqrt2ov5 - 6*mv2YvadjYv*TrYuadjYu -& 
&  2*mv2YvadjYv*TrYvadjYv - 8*mv2YxCYx*TrYxCYx - 4._dp*(TvadjTeYeadjYv) + (12*g1p2*TvadjTv)/5._dp +& 
&  12*g2p2*TvadjTv + (12*gYBp2*TvadjTv)/5._dp + 6*gYB*gBL*sqrt2ov5*TvadjTv +             & 
&  6*g1*gBY*sqrt2ov5*TvadjTv - 12*TrYuadjYu*TvadjTv - 4*TrYvadjYv*TvadjTv -              & 
&  4._dp*(TvadjTvYvadjYv) - 4._dp*(TvadjYeYeadjTv) - 12*TrCTuTpYu*TvadjYv -              & 
&  4*TrCTvTpYv*TvadjYv - 4._dp*(TvadjYvYvadjTv) - 16._dp*(TxCTvTpYvCYx) + 24*gBLp2*TxCTx +& 
&  24*gBYp2*TxCTx - 16*TrYxCYx*TxCTx - 32._dp*(TxCTxYxCYx) - 16._dp*(TxCYvTpYvCTx) -     & 
&  16*TrYxCTx*TxCYx - 32._dp*(TxCYxYxCTx) - 4._dp*(YvadjTeTeadjYv) - (12*g1p2*M1*YvadjTv)/5._dp -& 
&  (24*g1*gYB*MBBp*YvadjTv)/5._dp - (12*gYBp2*MBp*YvadjTv)/5._dp - 12*g2p2*M2*YvadjTv -  & 
&  6*g1*gBY*M1*sqrt2ov5*YvadjTv - 6*g1*gBL*MBBp*sqrt2ov5*YvadjTv - 6*gYB*gBY*MBBp*sqrt2ov5*YvadjTv -& 
&  6*gYB*gBL*MBp*sqrt2ov5*YvadjTv - 12*TradjYuTu*YvadjTv - 4*TradjYvTv*YvadjTv -         & 
&  4._dp*(YvadjTvTvadjYv) - 4._dp*(YvadjYeme2YeadjYv) - 4._dp*(YvadjYeTeadjTv) -         & 
&  4*mHd2*YvadjYeYeadjYv - 4*mHu2*YvadjYeYeadjYv - 2._dp*(YvadjYeYeadjYvmv2) -           & 
&  4._dp*(YvadjYeYeml2adjYv) + 24*AbsM2*g2p2*YvadjYv + (24*AbsMBp*gYBp2*YvadjYv)/5._dp + & 
&  (12*g1p2*mHu2*YvadjYv)/5._dp + 12*g2p2*mHu2*YvadjYv + (12*gYBp2*mHu2*YvadjYv)/5._dp  
betamv22 =  betamv22+ 12*AbsMBp*gYB*gBL*sqrt2ov5*YvadjYv + 6*gYB*gBL*mHu2*sqrt2ov5*YvadjYv + 6*g1*gBY*mHu2*sqrt2ov5*YvadjYv -& 
&  12*TrCTuTpTu*YvadjYv - 4*TrCTvTpTv*YvadjYv - 4*Trml2adjYvYv*YvadjYv - 12*Trmq2adjYuYu*YvadjYv -& 
&  12*Trmu2YuadjYu*YvadjYv - 4*Trmv2YvadjYv*YvadjYv - 24*mHu2*TrYuadjYu*YvadjYv -        & 
&  8*mHu2*TrYvadjYv*YvadjYv + (6*g1p2*YvadjYvmv2)/5._dp + 6*g2p2*YvadjYvmv2 +            & 
&  (6*gYBp2*YvadjYvmv2)/5._dp + 3*gYB*gBL*sqrt2ov5*YvadjYvmv2 + 3*g1*gBY*sqrt2ov5*YvadjYvmv2 -& 
&  6*TrYuadjYu*YvadjYvmv2 - 2*TrYvadjYv*YvadjYvmv2 - 4._dp*(YvadjYvmv2YvadjYv) -         & 
&  4._dp*(YvadjYvTvadjTv) - 8*mHu2*YvadjYvYvadjYv - 2._dp*(YvadjYvYvadjYvmv2) -          & 
&  4._dp*(YvadjYvYvml2adjYv) - 4._dp*(Yvml2adjYeYeadjYv) + (12*g1p2*Yvml2adjYv)/5._dp +  & 
&  12*g2p2*Yvml2adjYv + (12*gYBp2*Yvml2adjYv)/5._dp + 6*gYB*gBL*sqrt2ov5*Yvml2adjYv +    & 
&  6*g1*gBY*sqrt2ov5*Yvml2adjYv - 12*TrYuadjYu*Yvml2adjYv - 4*TrYvadjYv*Yvml2adjYv -     & 
&  4._dp*(Yvml2adjYvYvadjYv) - 16._dp*(YxCmv2CYvTpYvCYx) + 24*gBLp2*YxCmv2CYx +          & 
&  24*gBYp2*YxCmv2CYx - 16*TrYxCYx*YxCmv2CYx - 32._dp*(YxCmv2CYxYxCYx) - 16._dp*(YxCTvTpTvCYx) -& 
&  24*gBYp2*M1*YxCTx - 48*gBL*gBY*MBBp*YxCTx - 24*gBLp2*MBp*YxCTx - 16*TrCYxTx*YxCTx -   & 
&  32._dp*(YxCTxTxCYx) - 16._dp*(YxCYvCml2TpYvCYx) - 16._dp*(YxCYvTpTvCTx) -             & 
&  16._dp*(YxCYvTpYvCmv2CYx) - 16*mC12*YxCYvTpYvCYx - 16*mHu2*YxCYvTpYvCYx -             & 
&  8._dp*(YxCYvTpYvCYxmv2) + 48*AbsMBp*gBLp2*YxCYx + 24*gBLp2*mC12*YxCYx +               & 
&  24*gBYp2*mC12*YxCYx - 16*TrCTxTx*YxCYx - 32*Trmv2YxCYx*YxCYx - 32*mC12*TrYxCYx*YxCYx +& 
&  12*gBLp2*YxCYxmv2 + 12*gBYp2*YxCYxmv2 - 8*TrYxCYx*YxCYxmv2 - 32._dp*(YxCYxmv2YxCYx) - & 
&  32._dp*(YxCYxTxCTx) - 32._dp*(YxCYxYxCmv2CYx) - 64*mC12*YxCYxYxCYx - 16._dp*(YxCYxYxCYxmv2) +& 
&  (3*(3*id3R*(44*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) + gBY*(44*gBL*gYBp2*MBBp +            & 
&  65*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +            & 
&  MBp)) + 8*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) +    & 
&  4*g1*(11*gYB*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) +               & 
&  2*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +               & 
&  MBp))*sqrt10)) + 8*(-2*g1p2*TvadjYv - g1*gBY*sqrt10*TvadjYv - 20*gBYp2*TxCYx +        & 
&  (4*g1p2*M1 + 4*g1*gYB*MBBp + 2*g1*gBY*M1*sqrt10 + g1*gBL*MBBp*sqrt10 + gYB*gBY*MBBp*sqrt10)*YvadjYv +& 
&  40*gBY*(gBY*M1 + gBL*MBBp)*YxCYx))*Conjg(M1))/20._dp + (3*(3*id3R*(22*g1p2*(gBLp2*MBBp +& 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 22*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp +    & 
&  gBL*gBY*(M1 + 2._dp*(MBp))) + 65*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp +      & 
&  gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 4*gYB*(4*gBLp3*MBBp +  & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  2*g1*(11*gYB*(6*gBL*gBY*MBBp + gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) + & 
&  2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +     & 
&  2._dp*(MBp)))*sqrt10)) + 4*(-4*g1*gYB*TvadjYv - g1*gBL*sqrt10*TvadjYv -               & 
&  gYB*gBY*sqrt10*TvadjYv - 40*gBL*gBY*TxCYx + (4*g1p2*MBBp + g1*(4*gYB*(M1 +            & 
&  MBp) + (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10) + gYB*(gBY*(M1 + MBp)*sqrt10 +           & 
&  2*MBBp*(2._dp*(gYB) + gBL*sqrt10)))*YvadjYv + 40*(gBLp2*MBBp + gBYp2*MBBp +           & 
&  gBL*gBY*(M1 + MBp))*YxCYx))*Conjg(MBBp))/10._dp + (99*g1*gYB*gBL*gBY*id3R*M1*Conjg(MBp))/5._dp  
betamv22 =  betamv22+ (117*gBLp2*gBYp2*id3R*M1*Conjg(MBp))/4._dp + (99*g1p2*gBL*gBY*id3R*MBBp*Conjg(MBp))/5._dp +& 
&  (198*g1*gYB*gBLp2*id3R*MBBp*Conjg(MBp))/5._dp + 117*gBY*gBLp3*id3R*MBBp*Conjg(MBp) +  & 
&  (99*g1*gYB*gBYp2*id3R*MBBp*Conjg(MBp))/5._dp + (117*gBL*gBYp3*id3R*MBBp*Conjg(MBp))/2._dp +& 
&  (198*gBL*gBY*gYBp2*id3R*MBBp*Conjg(MBp))/5._dp + 18*g1*gBY*gBLp2*id3R*M1*sqrt2ov5*Conjg(MBp) +& 
&  18*gYB*gBL*gBYp2*id3R*M1*sqrt2ov5*Conjg(MBp) + 108*gYB*gBY*gBLp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  36*g1*gBLp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) + 54*g1*gBL*gBYp2*id3R*MBBp*sqrt2ov5*Conjg(MBp) +& 
&  18*gYB*gBYp3*id3R*MBBp*sqrt2ov5*Conjg(MBp) - (12*gYBp2*TvadjYv*Conjg(MBp))/5._dp -    & 
&  6*gYB*gBL*sqrt2ov5*TvadjYv*Conjg(MBp) - 24*gBLp2*TxCYx*Conjg(MBp) + (24*g1*gYB*MBBp*YvadjYv*Conjg(MBp))/5._dp +& 
&  6*g1*gBL*MBBp*sqrt2ov5*YvadjYv*Conjg(MBp) + 6*gYB*gBY*MBBp*sqrt2ov5*YvadjYv*Conjg(MBp) +& 
&  48*gBL*gBY*MBBp*YxCYx*Conjg(MBp) - 12*g2p2*TvadjYv*Conjg(M2) + 3*gBYp2*id3R*Tr2U1(1,  & 
& 1) + 3*gBL*gBY*id3R*Tr2U1(1,4) + 3*gBL*gBY*id3R*Tr2U1(4,1) + 3*gBLp2*id3R*Tr2U1(4,     & 
& 4) + 2*gBY*id3R*sqrt6*Tr3(1) + 2*gBL*id3R*sqrt6*Tr3(4)

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! mC12 
!-------------------- 
 
betamC121  = -12*AbsMBp*gBLp2 + 4._dp*(TrCTxTx) + 8._dp*(Trmv2YxCYx) + 4*mC12*TrYxCYx -& 
&  12*gBY*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 12*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +    & 
&  MBp))*Conjg(MBBp) - 12*gBL*gBY*MBBp*Conjg(MBp) - gBY*sqrt6*Tr1(1) - gBL*sqrt6*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamC122 = (2*(396*AbsMBp*g1*gYB*gBL*gBY + 1080*AbsMBp*gBLp4 + 720*AbsMBp*gBLp2*gBYp2 +          & 
&  594*AbsMBp*gBLp2*gYBp2 + 72*AbsMBp*g1*gBY*gBLp2*sqrt10 + 216*AbsMBp*gYB*gBLp3*sqrt10 +& 
&  72*AbsMBp*gYB*gBL*gBYp2*sqrt10 - 15*gBLp2*TrCTxTx - 15*gBYp2*TrCTxTx - 40._dp*(TrCYxTxCTvTpYv) -& 
&  40._dp*(Trml2adjYvYxCYxYv) - 40._dp*(Trmv2YvadjYvYxCYx) - 30*gBLp2*Trmv2YxCYx -       & 
&  30*gBYp2*Trmv2YxCYx - 40._dp*(Trmv2YxCYxYvadjYv) - 320._dp*(Trmv2YxCYxYxCYx) -        & 
&  40._dp*(TrYvadjYvTxCTx) - 40._dp*(TrYxCmv2CYxYvadjYv) + 15*gBYp2*M1*TrYxCTx +         & 
&  30*gBL*gBY*MBBp*TrYxCTx + 15*gBLp2*MBp*TrYxCTx - 40._dp*(TrYxCTxTvadjYv) -            & 
&  160._dp*(TrYxCTxTxCYx) - 30*AbsMBp*gBLp2*TrYxCYx - 15*gBLp2*mC12*TrYxCYx -            & 
&  15*gBYp2*mC12*TrYxCYx - 40._dp*(TrYxCYxTvadjTv) - 160._dp*(TrYxCYxTxCTx) -            & 
&  40*mC12*TrYxCYxYvadjYv - 40*mHu2*TrYxCYxYvadjYv - 160*mC12*TrYxCYxYxCYx +             & 
&  3*(6*(11*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) + gBY*(11*gBL*gYBp2*MBBp + 20*(3*gBYp3*M1 + & 
&  2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*gYB*(3*gBLp2*MBBp +& 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp))*sqrt10) + g1*(11*gYB*(gBLp2*MBBp +         & 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 2*(6*gBYp3*M1 + gBLp3*MBBp +             & 
&  6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) + MBp))*sqrt10)) + 5*gBYp2*TrCYxTx -         & 
&  10*gBY*(gBY*M1 + gBL*MBBp)*TrYxCYx)*Conjg(M1) + 6*(3*(11*g1p2*(gBLp2*MBBp +           & 
&  2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) + MBp)) + 11*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp +    & 
&  gBL*gBY*(M1 + 2._dp*(MBp))) + 40*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp +      & 
&  gBL*gBYp3*(2._dp*(M1) + MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 2*gYB*(4*gBLp3*MBBp +  & 
&  8*gBL*gBYp2*MBBp + gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 +& 
&  g1*(11*gYB*(6*gBL*gBY*MBBp + gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) +   & 
&  2*(8*gBY*gBLp2*MBBp + 4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 +     & 
&  2._dp*(MBp)))*sqrt10)) + 5*gBL*gBY*TrCYxTx - 5*(gBLp2*MBBp + gBYp2*MBBp +             & 
&  gBL*gBY*(M1 + MBp))*TrYxCYx)*Conjg(MBBp) + 198*g1*gYB*gBL*gBY*M1*Conjg(MBp) +         & 
&  360*gBLp2*gBYp2*M1*Conjg(MBp) + 198*g1p2*gBL*gBY*MBBp*Conjg(MBp) + 396*g1*gYB*gBLp2*MBBp*Conjg(MBp) +& 
&  1440*gBY*gBLp3*MBBp*Conjg(MBp) + 198*g1*gYB*gBYp2*MBBp*Conjg(MBp) + 720*gBL*gBYp3*MBBp*Conjg(MBp) +& 
&  396*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 36*g1*gBY*gBLp2*M1*sqrt10*Conjg(MBp) +            & 
&  36*gYB*gBL*gBYp2*M1*sqrt10*Conjg(MBp) + 216*gYB*gBY*gBLp2*MBBp*sqrt10*Conjg(MBp) +    & 
&  72*g1*gBLp3*MBBp*sqrt10*Conjg(MBp) + 108*g1*gBL*gBYp2*MBBp*sqrt10*Conjg(MBp) +        & 
&  36*gYB*gBYp3*MBBp*sqrt10*Conjg(MBp) + 15*gBLp2*TrCYxTx*Conjg(MBp) - 30*gBL*gBY*MBBp*TrYxCYx*Conjg(MBp) +& 
&  30*gBYp2*Tr2U1(1,1) + 30*gBL*gBY*Tr2U1(1,4) + 30*gBL*gBY*Tr2U1(4,1) + 30*gBLp2*Tr2U1(4,& 
& 4) - 10*gBY*sqrt6*Tr3(1) - 10*gBL*sqrt6*Tr3(4)))/5._dp

 
DmC12 = oo16pi2*( betamC121 + oo16pi2 * betamC122 ) 

 
Else 
DmC12 = oo16pi2* betamC121 
End If 
 
 
!-------------------- 
! mC22 
!-------------------- 
 
betamC221  = -12*AbsMBp*gBLp2 - 12*gBY*(gBY*M1 + gBL*MBBp)*Conjg(M1) - 12*(gBLp2*MBBp +& 
&  gBYp2*MBBp + gBL*gBY*(M1 + MBp))*Conjg(MBBp) - 12*gBL*gBY*MBBp*Conjg(MBp)             & 
&  + gBY*sqrt6*Tr1(1) + gBL*sqrt6*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamC222 = (4*(198*AbsMBp*g1*gYB*gBL*gBY + 540*AbsMBp*gBLp4 + 360*AbsMBp*gBLp2*gBYp2 +           & 
&  297*AbsMBp*gBLp2*gYBp2 + 36*AbsMBp*g1*gBY*gBLp2*sqrt10 + 108*AbsMBp*gYB*gBLp3*sqrt10 +& 
&  36*AbsMBp*gYB*gBL*gBYp2*sqrt10 + 9*(11*g1p2*gBY*(3*gBY*M1 + 2*gBL*MBBp) +             & 
&  gBY*(11*gBL*gYBp2*MBBp + 20*(3*gBYp3*M1 + 2*gBLp3*MBBp + 4*gBL*gBYp2*MBBp +           & 
&  gBY*gBLp2*(2._dp*(M1) + MBp)) + 2*gYB*(3*gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +& 
&  MBp))*sqrt10) + g1*(11*gYB*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +         & 
&  MBp)) + 2*(6*gBYp3*M1 + gBLp3*MBBp + 6*gBL*gBYp2*MBBp + gBY*gBLp2*(2._dp*(M1) +       & 
&  MBp))*sqrt10))*Conjg(M1) + 9*(11*g1p2*(gBLp2*MBBp + 2*gBYp2*MBBp + gBL*gBY*(2._dp*(M1) +& 
&  MBp)) + 11*gYBp2*(2*gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + 2._dp*(MBp))) +           & 
&  40*(gBLp4*MBBp + 4*gBLp2*gBYp2*MBBp + gBYp4*MBBp + gBL*gBYp3*(2._dp*(M1) +            & 
&  MBp) + gBY*gBLp3*(M1 + 2._dp*(MBp))) + 2*gYB*(4*gBLp3*MBBp + 8*gBL*gBYp2*MBBp +       & 
&  gBYp3*(2._dp*(M1) + MBp) + 3*gBY*gBLp2*(M1 + 2._dp*(MBp)))*sqrt10 + g1*(11*gYB*(6*gBL*gBY*MBBp +& 
&  gBYp2*(2._dp*(M1) + MBp) + gBLp2*(M1 + 2._dp*(MBp))) + 2*(8*gBY*gBLp2*MBBp +          & 
&  4*gBYp3*MBBp + 3*gBL*gBYp2*(2._dp*(M1) + MBp) + gBLp3*(M1 + 2._dp*(MBp)))*sqrt10))*Conjg(MBBp) +& 
&  99*g1*gYB*gBL*gBY*M1*Conjg(MBp) + 180*gBLp2*gBYp2*M1*Conjg(MBp) + 99*g1p2*gBL*gBY*MBBp*Conjg(MBp) +& 
&  198*g1*gYB*gBLp2*MBBp*Conjg(MBp) + 720*gBY*gBLp3*MBBp*Conjg(MBp) + 99*g1*gYB*gBYp2*MBBp*Conjg(MBp) +& 
&  360*gBL*gBYp3*MBBp*Conjg(MBp) + 198*gBL*gBY*gYBp2*MBBp*Conjg(MBp) + 18*g1*gBY*gBLp2*M1*sqrt10*Conjg(MBp) +& 
&  18*gYB*gBL*gBYp2*M1*sqrt10*Conjg(MBp) + 108*gYB*gBY*gBLp2*MBBp*sqrt10*Conjg(MBp) +    & 
&  36*g1*gBLp3*MBBp*sqrt10*Conjg(MBp) + 54*g1*gBL*gBYp2*MBBp*sqrt10*Conjg(MBp) +         & 
&  18*gYB*gBYp3*MBBp*sqrt10*Conjg(MBp) + 15*gBYp2*Tr2U1(1,1) + 15*gBL*gBY*Tr2U1(1,       & 
& 4) + 15*gBL*gBY*Tr2U1(4,1) + 15*gBLp2*Tr2U1(4,4) + 5*gBY*sqrt6*Tr3(1) + 5*gBL*sqrt6*Tr3(4)))/5._dp

 
DmC22 = oo16pi2*( betamC221 + oo16pi2 * betamC222 ) 

 
Else 
DmC22 = oo16pi2* betamC221 
End If 
 
 
!-------------------- 
! MBBp 
!-------------------- 
 
betaMBBp1  = (3*(11*g1p2*MBBp + 11*gYBp2*MBBp + 15*(gBLp2*MBBp + gBYp2*MBBp +         & 
&  gBL*gBY*(M1 + MBp)) + 2*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + g1*(11*gYB*(M1 +   & 
&  MBp) + 2*(2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaMBBp2 = (1194*gYB*g1p3*M1 + 270*g1*gYB*g2p2*M1 + 880*g1*gYB*g3p2*M1 + 2070*g1p2*gBL*gBY*M1 +  & 
&  450*g2p2*gBL*gBY*M1 + 400*g3p2*gBL*gBY*M1 + 690*g1*gYB*gBLp2*M1 + 1250*gBY*gBLp3*M1 + & 
&  2070*g1*gYB*gBYp2*M1 + 3750*gBL*gBYp3*M1 + 690*gBL*gBY*gYBp2*M1 + 398*g1*gYBp3*M1 +   & 
&  398*g1p4*MBBp + 270*g1p2*g2p2*MBBp + 880*g1p2*g3p2*MBBp + 5520*g1*gYB*gBL*gBY*MBBp +  & 
&  1380*g1p2*gBLp2*MBBp + 450*g2p2*gBLp2*MBBp + 400*g3p2*gBLp2*MBBp + 1250*gBLp4*MBBp +  & 
&  1380*g1p2*gBYp2*MBBp + 450*g2p2*gBYp2*MBBp + 400*g3p2*gBYp2*MBBp + 7500*gBLp2*gBYp2*MBBp +& 
&  1250*gBYp4*MBBp + 2388*g1p2*gYBp2*MBBp + 270*g2p2*gYBp2*MBBp + 880*g3p2*gYBp2*MBBp +  & 
&  1380*gBLp2*gYBp2*MBBp + 1380*gBYp2*gYBp2*MBBp + 398*gYBp4*MBBp + 398*gYB*g1p3*MBp +   & 
&  270*g1*gYB*g2p2*MBp + 880*g1*gYB*g3p2*MBp + 690*g1p2*gBL*gBY*MBp + 450*g2p2*gBL*gBY*MBp +& 
&  400*g3p2*gBL*gBY*MBp + 2070*g1*gYB*gBLp2*MBp + 3750*gBY*gBLp3*MBp + 690*g1*gYB*gBYp2*MBp +& 
&  1250*gBL*gBYp3*MBp + 2070*gBL*gBY*gYBp2*MBp + 1194*g1*gYBp3*MBp + 1760*g1*gYB*g3p2*M3 +& 
&  800*g3p2*gBL*gBY*M3 + 540*g1*gYB*g2p2*M2 + 900*g2p2*gBL*gBY*M2 + 246*g1p3*gBL*M1*sqrt10 +& 
&  90*g1*g2p2*gBL*M1*sqrt10 + 80*g1*g3p2*gBL*M1*sqrt10 + 738*gYB*g1p2*gBY*M1*sqrt10 +    & 
&  90*gYB*g2p2*gBY*M1*sqrt10 + 80*gYB*g3p2*gBY*M1*sqrt10 + 210*gYB*gBY*gBLp2*M1*sqrt10 + & 
&  70*g1*gBLp3*M1*sqrt10 + 630*g1*gBL*gBYp2*M1*sqrt10 + 210*gYB*gBYp3*M1*sqrt10 +        & 
&  246*g1*gBL*gYBp2*M1*sqrt10 + 82*gBY*gYBp3*M1*sqrt10 + 984*gYB*g1p2*gBL*MBBp*sqrt10 +  & 
&  180*gYB*g2p2*gBL*MBBp*sqrt10 + 160*gYB*g3p2*gBL*MBBp*sqrt10 + 328*g1p3*gBY*MBBp*sqrt10 +& 
&  180*g1*g2p2*gBY*MBBp*sqrt10 + 160*g1*g3p2*gBY*MBBp*sqrt10 + 840*g1*gBY*gBLp2*MBBp*sqrt10 +& 
&  280*gYB*gBLp3*MBBp*sqrt10 + 840*gYB*gBL*gBYp2*MBBp*sqrt10 + 280*g1*gBYp3*MBBp*sqrt10 +& 
&  984*g1*gBY*gYBp2*MBBp*sqrt10 + 328*gBL*gYBp3*MBBp*sqrt10 + 82*g1p3*gBL*MBp*sqrt10 +   & 
&  90*g1*g2p2*gBL*MBp*sqrt10 + 80*g1*g3p2*gBL*MBp*sqrt10 + 246*gYB*g1p2*gBY*MBp*sqrt10 + & 
&  90*gYB*g2p2*gBY*MBp*sqrt10 + 80*gYB*g3p2*gBY*MBp*sqrt10 + 630*gYB*gBY*gBLp2*MBp*sqrt10 +& 
&  210*g1*gBLp3*MBp*sqrt10 + 210*g1*gBL*gBYp2*MBp*sqrt10 + 70*gYB*gBYp3*MBp*sqrt10 +     & 
&  738*g1*gBL*gYBp2*MBp*sqrt10 + 246*gBY*gYBp3*MBp*sqrt10 + 160*g1*g3p2*gBL*M3*sqrt10 +  & 
&  160*gYB*g3p2*gBY*M3*sqrt10 + 180*g1*g2p2*gBL*M2*sqrt10 + 180*gYB*g2p2*gBY*M2*sqrt10 + & 
&  280*g1*gYB*TradjYdTd + 100*gBL*gBY*TradjYdTd - 10*g1*gBL*sqrt10*TradjYdTd -           & 
&  10*gYB*gBY*sqrt10*TradjYdTd + 360*g1*gYB*TradjYeTe + 300*gBL*gBY*TradjYeTe +          & 
&  90*g1*gBL*sqrt10*TradjYeTe + 90*gYB*gBY*sqrt10*TradjYeTe + 520*g1*gYB*TradjYuTu +     & 
&  100*gBL*gBY*TradjYuTu + 50*g1*gBL*sqrt10*TradjYuTu + 50*gYB*gBY*sqrt10*TradjYuTu +    & 
&  120*g1*gYB*TradjYvTv + 300*gBL*gBY*TradjYvTv + 30*g1*gBL*sqrt10*TradjYvTv +           & 
&  30*gYB*gBY*sqrt10*TradjYvTv + 900*gBL*gBY*TrCYxTx - 5*(28*g1p2*MBBp + 28*gYBp2*MBBp + & 
&  10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 + MBp)) - gYB*(2*gBL*MBBp + gBY*(M1 +       & 
&  MBp))*sqrt10 + g1*(28*gYB*(M1 + MBp) - (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*MBBp + 12*gYBp2*MBBp + 10*(gBLp2*MBBp + gBYp2*MBBp + gBL*gBY*(M1 +        & 
&  MBp)) + 3*gYB*(2*gBL*MBBp + gBY*(M1 + MBp))*sqrt10 + 3*g1*(4*gYB*(M1 + MBp) +         & 
&  (2*gBY*MBBp + gBL*(M1 + MBp))*sqrt10))*TrYeadjYe - 260*g1*gYB*M1*TrYuadjYu -          & 
&  50*gBL*gBY*M1*TrYuadjYu - 260*g1p2*MBBp*TrYuadjYu - 50*gBLp2*MBBp*TrYuadjYu -         & 
&  50*gBYp2*MBBp*TrYuadjYu - 260*gYBp2*MBBp*TrYuadjYu - 260*g1*gYB*MBp*TrYuadjYu -       & 
&  50*gBL*gBY*MBp*TrYuadjYu - 25*g1*gBL*M1*sqrt10*TrYuadjYu - 25*gYB*gBY*M1*sqrt10*TrYuadjYu -& 
&  50*gYB*gBL*MBBp*sqrt10*TrYuadjYu - 50*g1*gBY*MBBp*sqrt10*TrYuadjYu - 25*g1*gBL*MBp*sqrt10*TrYuadjYu -& 
&  25*gYB*gBY*MBp*sqrt10*TrYuadjYu - 60*g1*gYB*M1*TrYvadjYv - 150*gBL*gBY*M1*TrYvadjYv - & 
&  60*g1p2*MBBp*TrYvadjYv - 150*gBLp2*MBBp*TrYvadjYv - 150*gBYp2*MBBp*TrYvadjYv -        & 
&  60*gYBp2*MBBp*TrYvadjYv - 60*g1*gYB*MBp*TrYvadjYv - 150*gBL*gBY*MBp*TrYvadjYv -       & 
&  15*g1*gBL*M1*sqrt10*TrYvadjYv - 15*gYB*gBY*M1*sqrt10*TrYvadjYv - 30*gYB*gBL*MBBp*sqrt10*TrYvadjYv -& 
&  30*g1*gBY*MBBp*sqrt10*TrYvadjYv - 15*g1*gBL*MBp*sqrt10*TrYvadjYv - 15*gYB*gBY*MBp*sqrt10*TrYvadjYv -& 
&  450*gBL*gBY*M1*TrYxCYx - 450*gBLp2*MBBp*TrYxCYx - 450*gBYp2*MBBp*TrYxCYx -            & 
&  450*gBL*gBY*MBp*TrYxCYx)/50._dp

 
DMBBp = oo16pi2*( betaMBBp1 + oo16pi2 * betaMBBp2 ) 

 
Else 
DMBBp = oo16pi2* betaMBBp1 
End If 
 
 
Call Chop(DMBBp) 

If (.not.KineticMixing) DMBBp  = 0._dp 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (6*(11*g1p2*M1 + gBY*(15*gBY*M1 + 15*gBL*MBBp + 2*gYB*MBBp*sqrt10)         & 
&  + g1*(11*gYB*MBBp + 4*gBY*M1*sqrt10 + 2*gBL*MBBp*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = (796*g1p4*M1 + 270*g1p2*g2p2*M1 + 880*g1p2*g3p2*M1 + 920*g1*gYB*gBL*gBY*M1 +          & 
&  230*g1p2*gBLp2*M1 + 2760*g1p2*gBYp2*M1 + 450*g2p2*gBYp2*M1 + 400*g3p2*gBYp2*M1 +      & 
&  1250*gBLp2*gBYp2*M1 + 2500*gBYp4*M1 + 398*g1p2*gYBp2*M1 + 230*gBYp2*gYBp2*M1 +        & 
&  1194*gYB*g1p3*MBBp + 270*g1*gYB*g2p2*MBBp + 880*g1*gYB*g3p2*MBBp + 2070*g1p2*gBL*gBY*MBBp +& 
&  450*g2p2*gBL*gBY*MBBp + 400*g3p2*gBL*gBY*MBBp + 690*g1*gYB*gBLp2*MBBp +               & 
&  1250*gBY*gBLp3*MBBp + 2070*g1*gYB*gBYp2*MBBp + 3750*gBL*gBYp3*MBBp + 690*gBL*gBY*gYBp2*MBBp +& 
&  398*g1*gYBp3*MBBp + 920*g1*gYB*gBL*gBY*MBp + 230*g1p2*gBLp2*MBp + 1250*gBLp2*gBYp2*MBp +& 
&  398*g1p2*gYBp2*MBp + 230*gBYp2*gYBp2*MBp + 880*g1p2*g3p2*M3 + 400*g3p2*gBYp2*M3 +     & 
&  270*g1p2*g2p2*M2 + 450*g2p2*gBYp2*M2 + 164*gYB*g1p2*gBL*M1*sqrt10 + 656*g1p3*gBY*M1*sqrt10 +& 
&  180*g1*g2p2*gBY*M1*sqrt10 + 160*g1*g3p2*gBY*M1*sqrt10 + 140*g1*gBY*gBLp2*M1*sqrt10 +  & 
&  140*gYB*gBL*gBYp2*M1*sqrt10 + 560*g1*gBYp3*M1*sqrt10 + 164*g1*gBY*gYBp2*M1*sqrt10 +   & 
&  246*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 + 80*g1*g3p2*gBL*MBBp*sqrt10 +  & 
&  738*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 80*gYB*g3p2*gBY*MBBp*sqrt10 +& 
&  210*gYB*gBY*gBLp2*MBBp*sqrt10 + 70*g1*gBLp3*MBBp*sqrt10 + 630*g1*gBL*gBYp2*MBBp*sqrt10 +& 
&  210*gYB*gBYp3*MBBp*sqrt10 + 246*g1*gBL*gYBp2*MBBp*sqrt10 + 82*gBY*gYBp3*MBBp*sqrt10 + & 
&  164*gYB*g1p2*gBL*MBp*sqrt10 + 140*g1*gBY*gBLp2*MBp*sqrt10 + 140*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  164*g1*gBY*gYBp2*MBp*sqrt10 + 160*g1*g3p2*gBY*M3*sqrt10 + 180*g1*g2p2*gBY*M2*sqrt10 + & 
&  140*g1p2*TradjYdTd + 50*gBYp2*TradjYdTd - 10*g1*gBY*sqrt10*TradjYdTd + 180*g1p2*TradjYeTe +& 
&  150*gBYp2*TradjYeTe + 90*g1*gBY*sqrt10*TradjYeTe + 260*g1p2*TradjYuTu +               & 
&  50*gBYp2*TradjYuTu + 50*g1*gBY*sqrt10*TradjYuTu + 60*g1p2*TradjYvTv + 150*gBYp2*TradjYvTv +& 
&  30*g1*gBY*sqrt10*TradjYvTv + 450*gBYp2*TrCYxTx - 5*(28*g1p2*M1 + gBY*(10*gBY*M1 +     & 
&  10*gBL*MBBp - gYB*MBBp*sqrt10) - g1*(-28*gYB*MBBp + 2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYdadjYd -& 
&  15*(12*g1p2*M1 + gBY*(10*gBY*M1 + 10*gBL*MBBp + 3*gYB*MBBp*sqrt10) + 3*g1*(4*gYB*MBBp +& 
&  2*gBY*M1*sqrt10 + gBL*MBBp*sqrt10))*TrYeadjYe - 260*g1p2*M1*TrYuadjYu -               & 
&  50*gBYp2*M1*TrYuadjYu - 260*g1*gYB*MBBp*TrYuadjYu - 50*gBL*gBY*MBBp*TrYuadjYu -       & 
&  50*g1*gBY*M1*sqrt10*TrYuadjYu - 25*g1*gBL*MBBp*sqrt10*TrYuadjYu - 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu -& 
&  60*g1p2*M1*TrYvadjYv - 150*gBYp2*M1*TrYvadjYv - 60*g1*gYB*MBBp*TrYvadjYv -            & 
&  150*gBL*gBY*MBBp*TrYvadjYv - 30*g1*gBY*M1*sqrt10*TrYvadjYv - 15*g1*gBL*MBBp*sqrt10*TrYvadjYv -& 
&  15*gYB*gBY*MBBp*sqrt10*TrYvadjYv - 450*gBYp2*M1*TrYxCYx - 450*gBL*gBY*MBBp*TrYxCYx)/25._dp

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = (2*g2p2*(9*g1p2*M1 + 15*gBLp2*MBp + 120*g3p2*M3 + 9*g1p2*M2 + 250*g2p2*M2 +           & 
&  120*g3p2*M2 + 15*gBLp2*M2 + 30._dp*(TradjYdTd) + 10._dp*(TradjYeTe) + 30._dp*(TradjYuTu) +& 
&  10._dp*(TradjYvTv) - 30*M2*TrYdadjYd - 10*M2*TrYeadjYe - 30*M2*TrYuadjYu -            & 
&  10*M2*TrYvadjYv))/5._dp

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = (2*g3p2*(11*g1p2*M1 + 5*gBLp2*MBp + 11*g1p2*M3 + 45*g2p2*M3 + 140*g3p2*M3 +           & 
&  5*gBLp2*M3 + 45*g2p2*M2 + 20._dp*(TradjYdTd) + 20._dp*(TradjYuTu) - 20*M3*TrYdadjYd - & 
&  20*M3*TrYuadjYu))/5._dp

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! MBp 
!-------------------- 
 
betaMBp1  = (6*(11*gYBp2*MBp + 15*gBL*(gBY*MBBp + gBL*MBp) + 2*gYB*(gBY*MBBp +        & 
&  2*gBL*MBp)*sqrt10 + g1*MBBp*(11._dp*(gYB) + 2*gBL*sqrt10)))/5._dp

 
 
If (TwoLoopRGE) Then 
betaMBp2 = (920*g1*gYB*gBL*gBY*M1 + 230*g1p2*gBLp2*M1 + 1250*gBLp2*gBYp2*M1 + 398*g1p2*gYBp2*M1 +& 
&  230*gBYp2*gYBp2*M1 + 398*gYB*g1p3*MBBp + 270*g1*gYB*g2p2*MBBp + 880*g1*gYB*g3p2*MBBp +& 
&  690*g1p2*gBL*gBY*MBBp + 450*g2p2*gBL*gBY*MBBp + 400*g3p2*gBL*gBY*MBBp +               & 
&  2070*g1*gYB*gBLp2*MBBp + 3750*gBY*gBLp3*MBBp + 690*g1*gYB*gBYp2*MBBp + 1250*gBL*gBYp3*MBBp +& 
&  2070*gBL*gBY*gYBp2*MBBp + 1194*g1*gYBp3*MBBp + 920*g1*gYB*gBL*gBY*MBp +               & 
&  230*g1p2*gBLp2*MBp + 450*g2p2*gBLp2*MBp + 400*g3p2*gBLp2*MBp + 2500*gBLp4*MBp +       & 
&  1250*gBLp2*gBYp2*MBp + 398*g1p2*gYBp2*MBp + 270*g2p2*gYBp2*MBp + 880*g3p2*gYBp2*MBp + & 
&  2760*gBLp2*gYBp2*MBp + 230*gBYp2*gYBp2*MBp + 796*gYBp4*MBp + 400*g3p2*gBLp2*M3 +      & 
&  880*g3p2*gYBp2*M3 + 450*g2p2*gBLp2*M2 + 270*g2p2*gYBp2*M2 + 164*gYB*g1p2*gBL*M1*sqrt10 +& 
&  140*g1*gBY*gBLp2*M1*sqrt10 + 140*gYB*gBL*gBYp2*M1*sqrt10 + 164*g1*gBY*gYBp2*M1*sqrt10 +& 
&  82*g1p3*gBL*MBBp*sqrt10 + 90*g1*g2p2*gBL*MBBp*sqrt10 + 80*g1*g3p2*gBL*MBBp*sqrt10 +   & 
&  246*gYB*g1p2*gBY*MBBp*sqrt10 + 90*gYB*g2p2*gBY*MBBp*sqrt10 + 80*gYB*g3p2*gBY*MBBp*sqrt10 +& 
&  630*gYB*gBY*gBLp2*MBBp*sqrt10 + 210*g1*gBLp3*MBBp*sqrt10 + 210*g1*gBL*gBYp2*MBBp*sqrt10 +& 
&  70*gYB*gBYp3*MBBp*sqrt10 + 738*g1*gBL*gYBp2*MBBp*sqrt10 + 246*gBY*gYBp3*MBBp*sqrt10 + & 
&  164*gYB*g1p2*gBL*MBp*sqrt10 + 180*gYB*g2p2*gBL*MBp*sqrt10 + 160*gYB*g3p2*gBL*MBp*sqrt10 +& 
&  140*g1*gBY*gBLp2*MBp*sqrt10 + 560*gYB*gBLp3*MBp*sqrt10 + 140*gYB*gBL*gBYp2*MBp*sqrt10 +& 
&  164*g1*gBY*gYBp2*MBp*sqrt10 + 656*gBL*gYBp3*MBp*sqrt10 + 160*gYB*g3p2*gBL*M3*sqrt10 + & 
&  180*gYB*g2p2*gBL*M2*sqrt10 + 50*gBLp2*TradjYdTd + 140*gYBp2*TradjYdTd -               & 
&  10*gYB*gBL*sqrt10*TradjYdTd + 150*gBLp2*TradjYeTe + 180*gYBp2*TradjYeTe +             & 
&  90*gYB*gBL*sqrt10*TradjYeTe + 50*gBLp2*TradjYuTu + 260*gYBp2*TradjYuTu +              & 
&  50*gYB*gBL*sqrt10*TradjYuTu + 150*gBLp2*TradjYvTv + 60*gYBp2*TradjYvTv +              & 
&  30*gYB*gBL*sqrt10*TradjYvTv + 450*gBLp2*TrCYxTx - 5*(28*gYBp2*MBp + 10*gBL*(gBY*MBBp +& 
&  gBL*MBp) - gYB*(gBY*MBBp + 2*gBL*MBp)*sqrt10 + g1*MBBp*(28._dp*(gYB) - gBL*sqrt10))*TrYdadjYd -& 
&  15*(12*gYBp2*MBp + 10*gBL*(gBY*MBBp + gBL*MBp) + 3*gYB*(gBY*MBBp + 2*gBL*MBp)*sqrt10 +& 
&  3*g1*MBBp*(4._dp*(gYB) + gBL*sqrt10))*TrYeadjYe - 260*g1*gYB*MBBp*TrYuadjYu -         & 
&  50*gBL*gBY*MBBp*TrYuadjYu - 50*gBLp2*MBp*TrYuadjYu - 260*gYBp2*MBp*TrYuadjYu -        & 
&  25*g1*gBL*MBBp*sqrt10*TrYuadjYu - 25*gYB*gBY*MBBp*sqrt10*TrYuadjYu - 50*gYB*gBL*MBp*sqrt10*TrYuadjYu -& 
&  60*g1*gYB*MBBp*TrYvadjYv - 150*gBL*gBY*MBBp*TrYvadjYv - 150*gBLp2*MBp*TrYvadjYv -     & 
&  60*gYBp2*MBp*TrYvadjYv - 15*g1*gBL*MBBp*sqrt10*TrYvadjYv - 15*gYB*gBY*MBBp*sqrt10*TrYvadjYv -& 
&  30*gYB*gBL*MBp*sqrt10*TrYvadjYv - 450*gBL*gBY*MBBp*TrYxCYx - 450*gBLp2*MBp*TrYxCYx)/25._dp

 
DMBp = oo16pi2*( betaMBp1 + oo16pi2 * betaMBp2 ) 

 
Else 
DMBp = oo16pi2* betaMBp1 
End If 
 
 
Call Chop(DMBp) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = (vd*(-60._dp*(TrYdadjYd) - 20._dp*(TrYeadjYe) + 3*(g1p2 + 5._dp*(g2p2)     & 
&  + gYBp2)*(1 + Xi)))/20._dp

 
 
If (TwoLoopRGE) Then 
betavd2 = (vd*(-207._dp*(g1p4) - 90*g1p2*g2p2 - 600._dp*(g2p4) - 540*g1*gYB*gBL*gBY -           & 
&  270*g1p2*gBYp2 - 414*g1p2*gYBp2 - 90*g2p2*gYBp2 - 270*gBLp2*gYBp2 - 207._dp*(gYBp4) - & 
&  72*gYB*g1p2*gBL*sqrt10 - 72*g1p3*gBY*sqrt10 - 72*g1*gBY*gYBp2*sqrt10 - 72*gBL*gYBp3*sqrt10 +& 
&  1800._dp*(TrYdadjYdYdadjYd) + 600._dp*(TrYdadjYuYuadjYd) + 600._dp*(TrYeadjYeYeadjYe) +& 
&  200._dp*(TrYeadjYvYvadjYe) - 9*g1p4*Xi - 90*g1p2*g2p2*Xi + 325*g2p4*Xi -              & 
&  18*g1p2*gYBp2*Xi - 90*g2p2*gYBp2*Xi - 9*gYBp4*Xi - 60*TrYeadjYe*(3*gYB*gBL*sqrt10 +   & 
&  3*g1*gBY*sqrt10 + g1p2*(4 + Xi) + gYBp2*(4 + Xi) + 5*(gBLp2 + gBYp2 + g2p2*Xi)) -     & 
&  20*TrYdadjYd*(-(gYB*gBL*sqrt10) - g1*gBY*sqrt10 + g1p2*(-4 + 9._dp*(Xi)) +            & 
&  gYBp2*(-4 + 9._dp*(Xi)) + 5*(32._dp*(g3p2) + gBLp2 + gBYp2 + 9*g2p2*Xi)) +            & 
&  9*g1p4*Xip2 + 90*g1p2*g2p2*Xip2 + 18*g1p2*gYBp2*Xip2 + 90*g2p2*gYBp2*Xip2 +           & 
&  9*gYBp4*Xip2))/200._dp

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = (vu*(-60._dp*(TrYuadjYu) - 20._dp*(TrYvadjYv) + 3*(g1p2 + 5._dp*(g2p2)     & 
&  + gYBp2)*(1 + Xi)))/20._dp

 
 
If (TwoLoopRGE) Then 
betavu2 = (vu*(-207._dp*(g1p4) - 90*g1p2*g2p2 - 600._dp*(g2p4) - 540*g1*gYB*gBL*gBY -           & 
&  270*g1p2*gBYp2 - 414*g1p2*gYBp2 - 90*g2p2*gYBp2 - 270*gBLp2*gYBp2 - 207._dp*(gYBp4) - & 
&  72*gYB*g1p2*gBL*sqrt10 - 72*g1p3*gBY*sqrt10 - 72*g1*gBY*gYBp2*sqrt10 - 72*gBL*gYBp3*sqrt10 +& 
&  600._dp*(TrYdadjYuYuadjYd) + 200._dp*(TrYeadjYvYvadjYe) + 1800._dp*(TrYuadjYuYuadjYu) +& 
&  600._dp*(TrYvadjYvYvadjYv) + 800._dp*(TrYxCYxYvadjYv) - 9*g1p4*Xi - 90*g1p2*g2p2*Xi + & 
&  325*g2p4*Xi - 18*g1p2*gYBp2*Xi - 90*g2p2*gYBp2*Xi - 9*gYBp4*Xi - 60*TrYvadjYv*(5._dp*(gBLp2) +& 
&  5._dp*(gBYp2) + gYB*gBL*sqrt10 + g1*gBY*sqrt10 + g1p2*Xi + 5*g2p2*Xi + gYBp2*Xi) -    & 
&  20*TrYuadjYu*(5*gYB*gBL*sqrt10 + 5*g1*gBY*sqrt10 + g1p2*(8 + 9._dp*(Xi)) +            & 
&  gYBp2*(8 + 9._dp*(Xi)) + 5*(32._dp*(g3p2) + gBLp2 + gBYp2 + 9*g2p2*Xi)) +             & 
&  9*g1p4*Xip2 + 90*g1p2*g2p2*Xip2 + 18*g1p2*gYBp2*Xip2 + 90*g2p2*gYBp2*Xip2 +           & 
&  9*gYBp4*Xip2))/200._dp

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
!-------------------- 
! x1 
!-------------------- 
 
betax11  = (x1*(-4._dp*(TrYxCYx) + 3*(gBLp2 + gBYp2)*(1 + Xi)))/2._dp

 
 
If (TwoLoopRGE) Then 
betax12 = -(x1*(198*g1*gYB*gBL*gBY + 180._dp*(gBLp4) + 99*g1p2*gBYp2 + 360*gBLp2*gBYp2 +        & 
&  180._dp*(gBYp4) + 99*gBLp2*gYBp2 + 36*g1*gBY*gBLp2*sqrt10 + 36*gYB*gBLp3*sqrt10 +     & 
&  36*gYB*gBL*gBYp2*sqrt10 + 36*g1*gBYp3*sqrt10 - 80._dp*(TrYxCYxYvadjYv) -              & 
&  160._dp*(TrYxCYxYxCYx) + 45*gBLp4*Xi + 90*gBLp2*gBYp2*Xi + 45*gBYp4*Xi +              & 
&  30*(gBLp2 + gBYp2)*TrYxCYx*(-1 + 2._dp*(Xi)) - 45*gBLp4*Xip2 - 90*gBLp2*gBYp2*Xip2 -  & 
&  45*gBYp4*Xip2))/10._dp

 
Dx1 = oo16pi2*( betax11 + oo16pi2 * betax12 ) 

 
Else 
Dx1 = oo16pi2* betax11 
End If 
 
 
!-------------------- 
! x2 
!-------------------- 
 
betax21  = (3*(gBLp2 + gBYp2)*x2*(1 + Xi))/2._dp

 
 
If (TwoLoopRGE) Then 
betax22 = (-9*x2*(11*gBLp2*gYBp2 + gYB*(4*gBLp3*sqrt10 + 2*gBL*gBY*(11._dp*(g1) +               & 
&  2*gBY*sqrt10)) + 2*gBY*gBLp2*(2*g1*sqrt10 + 5*gBY*(4 + Xi - Xip2)) + gBYp2*(11._dp*(g1p2) +& 
&  4*g1*gBY*sqrt10 + 5*gBYp2*(4 + Xi - Xip2)) - 5*gBLp4*(-4 - Xi + Xip2)))/10._dp

 
Dx2 = oo16pi2*( betax21 + oo16pi2 * betax22 ) 

 
Else 
Dx2 = oo16pi2* betax21 
End If 
 
 
Call ParametersToG320(Dg1,Dg2,Dg3,DgBL,DgYB,DgBY,DYd,DYe,DYu,DYx,DYv,DMuP,            & 
& DMu,DTd,DTe,DTu,DTx,DTv,DBMuP,DBmu,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,               & 
& Dmv2,DmC12,DmC22,DMBBp,DM1,DM2,DM3,DMBp,Dvd,Dvu,Dx1,Dx2,f)

Iname = Iname - 1 
 
End Subroutine rge320  

End Module RGEs_BLSSM 
 
