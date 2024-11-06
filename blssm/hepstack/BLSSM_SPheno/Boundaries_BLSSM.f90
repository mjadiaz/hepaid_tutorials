! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:15 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Boundaries_BLSSM 
 
Use Control 
Use Settings 
Use LoopCouplings_BLSSM 
Use LoopMasses_BLSSM 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_BLSSM 
Use RGEs_BLSSM 
Use RunSM_BLSSM 
 
Use Tadpoles_BLSSM 
Use RGEs_SM_HC 
Use LoopMasses_SM_HC 
Use StandardModel 
 

 
Integer, save :: YukScen 
Real(dp), save :: Lambda, MlambdaS,F_GMSB 
Real(dp),save::mGUT_save,sinW2_Q_mZ&
&, mf_l_Q_SM(3),mf_d_Q_SM(3),mf_u_Q_SM(3) & 
&, mf_l_MS_SM(3),mf_d_MS_SM(3),mf_u_MS_SM(3) 
Complex(dp),save::Yl_mZ(3,3),Yu_mZ(3,3),Yd_mZ(3,3),Yl_Q(3,3),Yu_Q(3,3),Yd_Q(3,3)
Real(dp),Save::vevs_DR_save(2), vSM_save
Contains 
 
Subroutine BoundarySUSY(gA,gB) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(out)::gB(:)
Integer::i1,i2,i_count,kont
Complex(dp) :: Tad1Loop(6) 
Real(dp) :: comp(6) 
Complex(dp) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6),cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),            & 
& cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),     & 
& cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),      & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),        & 
& cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4), & 
& cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),               & 
& cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),           & 
& cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),       & 
& cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),cplUhhVZVZp(4),cplUhhVZpVZp(4),          & 
& cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,2,2),               & 
& cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),cplUhhUhhSucSu(4,4,6,6),               & 
& cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),cplUhhUhhVPVP(4,4),              & 
& cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Real(dp) :: g1,g2,g3,gBL,gYB,gBY

Complex(dp) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3)

Real(dp) :: mHd2,mHu2,mC12,mC22

Complex(dp) :: MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),            & 
& md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),MBBp,M1,M2,M3,MBp

Iname=Iname+1
NameOfUnit(Iname)='BoundarySUSY'
Call GToParameters96(gA,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
If (.Not.FirstRun) Then 
vd = vdSUSY 
vu = vuSUSY 
x1 = x1SUSY 
x2 = x2SUSY 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
End if 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gB)

Iname=Iname-1
End Subroutine BoundarySUSY 
 
Subroutine BoundaryHS(gA,gB,mGUT) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(in)::mGUT
Real(dp),Intent(out)::gB(:)
Integer::i1,i2
Real(dp) :: g1,g2,g3,gBL,gYB,gBY

Complex(dp) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3)

Real(dp) :: mHd2,mHu2,mC12,mC22

Complex(dp) :: MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),            & 
& md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),MBBp,M1,M2,M3,MBp

Iname=Iname+1
NameOfUnit(Iname)='BoundaryHS'
KineticMixing = KineticMixingSave 
Call GToParameters96(gA,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv)

If (HighScaleModel.ne."LOW") Then 
 If (InputValueforg1) Then 
g1 = g1IN 
Else 
g1 = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
End If 
If (InputValueforg1) Then 
g1 = g1IN 
Else 
g1 = Sqrt(g1**2 + g2**2)/sqrt(2._dp)
End If 
If (InputValueforg2) Then 
g2 = g2IN 
Else 
g2 = g1
End If 
If (InputValueforgBL) Then 
gBL = gBLIN 
Else 
gBL = g1
End If 
If (InputValueforgYB) Then 
gYB = gYBIN 
Else 
gYB = 0
End If 
If (InputValueforgBY) Then 
gBY = gBYIN 
Else 
gBY = 0
End If 
If (InputValueforTe) Then 
Te = TeIN 
Else 
Te = Azero*Ye
End If 
If (InputValueforTd) Then 
Td = TdIN 
Else 
Td = Azero*Yd
End If 
If (InputValueforTu) Then 
Tu = TuIN 
Else 
Tu = Azero*Yu
End If 
If (InputValueforTv) Then 
Tv = TvIN 
Else 
Tv = Azero*Yv
End If 
If (InputValueforTx) Then 
Tx = TxIN 
Else 
Tx = Azero*Yx
End If 
If (InputValueformq2) Then 
mq2 = mq2IN 
Else 
mq2 = 0._dp 
Do i1=1,3
mq2(i1,i1) = m0**2
End Do
End If 
If (InputValueforml2) Then 
ml2 = ml2IN 
Else 
ml2 = 0._dp 
Do i1=1,3
ml2(i1,i1) = m0**2
End Do
End If 
If (InputValueformd2) Then 
md2 = md2IN 
Else 
md2 = 0._dp 
Do i1=1,3
md2(i1,i1) = m0**2
End Do
End If 
If (InputValueformu2) Then 
mu2 = mu2IN 
Else 
mu2 = 0._dp 
Do i1=1,3
mu2(i1,i1) = m0**2
End Do
End If 
If (InputValueforme2) Then 
me2 = me2IN 
Else 
me2 = 0._dp 
Do i1=1,3
me2(i1,i1) = m0**2
End Do
End If 
If (InputValueformv2) Then 
mv2 = mv2IN 
Else 
mv2 = 0._dp 
Do i1=1,3
mv2(i1,i1) = m0**2
End Do
End If 
If (InputValueformHd2) Then 
mHd2 = mHd2IN 
Else 
mHd2 = m0**2
End If 
If (InputValueformHu2) Then 
mHu2 = mHu2IN 
Else 
mHu2 = m0**2
End If 
If (InputValueformC12) Then 
mC12 = mC12IN 
Else 
mC12 = m0**2
End If 
If (InputValueformC22) Then 
mC22 = mC22IN 
Else 
mC22 = m0**2
End If 
If (InputValueforM1) Then 
M1 = M1IN 
Else 
M1 = m12
End If 
If (InputValueforM2) Then 
M2 = M2IN 
Else 
M2 = m12
End If 
If (InputValueforM3) Then 
M3 = M3IN 
Else 
M3 = m12
End If 
If (InputValueforMBp) Then 
MBp = MBpIN 
Else 
MBp = m12
End If 
If (InputValueforMBBp) Then 
MBBp = MBBpIN 
Else 
MBBp = 0
End If 
If (InputValueforMuP) Then 
MuP = MuPIN 
Else 
MuP = 0
End If 
If (InputValueforMu) Then 
Mu = MuIN 
Else 
Mu = 0
End If 
If (InputValueforBMuP) Then 
BMuP = BMuPIN 
Else 
BMuP = 0
End If 
If (InputValueforBmu) Then 
Bmu = BmuIN 
Else 
Bmu = 0
End If 
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 MuPGUT =MuP
MuGUT =Mu
TdGUT =Td
TeGUT =Te
TuGUT =Tu
TxGUT =Tx
TvGUT =Tv
BMuPGUT =BMuP
BmuGUT =Bmu
mq2GUT =mq2
ml2GUT =ml2
mHd2GUT =mHd2
mHu2GUT =mHu2
md2GUT =md2
mu2GUT =mu2
me2GUT =me2
mv2GUT =mv2
mC12GUT =mC12
mC22GUT =mC22
MBBpGUT =MBBp
M1GUT =M1
M2GUT =M2
M3GUT =M3
MBpGUT =MBp
g1GUT =g1
g2GUT =g2
g3GUT =g3
gBLGUT =gBL
gYBGUT =gYB
gBYGUT =gBY
YdGUT =Yd
YeGUT =Ye
YuGUT =Yu
YxGUT =Yx
YvGUT =Yv
If (Maxval(Abs(Yd)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yd" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Ye)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Ye" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yu)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yu" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yx)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yx" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yv)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yv" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g1).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g1" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g2).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g2" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g3).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g3" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(gBL).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: gBL" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(gYB).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: gYB" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(gBY).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: gBY" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
Call ParametersToG316(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,gB)

Iname=Iname-1
End Subroutine BoundaryHS 
 
Subroutine BoundaryEW(i_run,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,              & 
& Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,             & 
& delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:)
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

Complex(dp) :: cplAhhhVP(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),               & 
& cplChiChiVPR(7,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3), & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWmgWmVP,        & 
& cplcgWpCgWpCVP,cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSdcSdVP(6,6),cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcVWmVPVWm,       & 
& cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),               & 
& cplSecSeVPVP(6,6),cplSucSuVPVP(6,6),cplSvImSvImVPVP(6,6),cplSvReSvReVPVP(6,6),         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ(4,4),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcFdFdVZL(3,3),               & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ(4),              & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),       & 
& cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcVWmVWmVZ,cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),     & 
& cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),cplSucSuVZVZ(6,6),             & 
& cplSvImSvImVZVZ(6,6),cplSvReSvReVZVZ(6,6),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,             & 
& cplcVWmVWmVZVZ3,cplHpmcVWmVZp(2),cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,    & 
& cplcVWmVWmVZpVZp3,cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),           & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),             & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,              & 
& cplcgWpCgZpcVWm,cplhhHpmcVWm(4,2),cplhhcVWmVWm(4),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),& 
& cplSeSvRecVWm(6,6),cplAhAhcVWmVWm(4,4),cplhhhhcVWmVWm(4,4),cplHpmcHpmcVWmVWm(2,2),     & 
& cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(6,6),& 
& cplSvReSvRecVWmVWm(6,6),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,      & 
& cplcHpmVWmVZ(2),cplcHpmVPVWm(2),cplAhAhVPVZ(4,4),cplhhhhVPVZ(4,4),cplHpmcHpmVPVZ(2,2), & 
& cplSdcSdVPVZ(6,6),cplSecSeVPVZ(6,6),cplSucSuVPVZ(6,6),cplSvImSvImVPVZ(6,6),            & 
& cplSvReSvReVPVZ(6,6),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp(2), & 
& cplAhAhVPVZp(4,4),cplhhhhVPVZp(4,4),cplHpmcHpmVPVZp(2,2),cplSdcSdVPVZp(6,6),           & 
& cplSecSeVPVZp(6,6),cplSucSuVPVZp(6,6),cplSvImSvImVPVZp(6,6),cplSvReSvReVPVZp(6,6),     & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplAhAhVZVZp(4,4),cplhhhhVZVZp(4,4),& 
& cplHpmcHpmVZVZp(2,2),cplSdcSdVZVZp(6,6),cplSecSeVZVZp(6,6),cplSucSuVZVZp(6,6),         & 
& cplSvImSvImVZVZp(6,6),cplSvReSvReVZVZp(6,6),cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,         & 
& cplcVWmVWmVZVZp3

Complex(dp) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6),       & 
& cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),     & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),         & 
& cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2), & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),             & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Real(dp) :: Abs2Mu,Abs2MuP

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp) :: uU_L_T(3,3),uU_R_T(3,3)&
&,uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryEW'
tanb = tanbetaMZ 
sinW2 = 1 - mW**2/mZ**2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
vSM = vSM_save 
If (i_run.Eq.1) Then
   sinW2_Q=sinW2
   sinW2_old=sinW2_Q
   Y_l=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
   End Do
   mf_l2=mf_l_mZ**2
   mf_d2=mf_d_mZ**2
   mf_u2=mf_u_mZ**2
Else
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
   mf_l2=mf_l2**2
   mf_d2=mf_d2**2
   mf_u2=mf_u2**2
End If
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaMZ = AlphaEwDR(mZ,Abs(MVWm),Abs(MSd),Abs(MSu),Abs(MSe),Abs(MHpm),Abs(MCha),Abs(MFe),Abs(MFd),Abs(MFu)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaSDR(mZ,Abs(MSd),Abs(MSu),Abs(MGlu),Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = AlphaS_MZ 
If (.not.OneLoopMatching) alphaMZ= alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*Abs(ZH(1,2))**2*rho_2(Sqrt(Mhh2(1))/mf_U(3))&
    &*((1._dp+tanb**2)/tanb**2)
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
MVZ2 = mZ2 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
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

! Top pole mass to calculate delta_rho
MFu(3)=mf_u(3)
MFu2(3)=MFu(3)**2
Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSvRe,MSvRe2,MSvIm,MSvIm2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,             & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,        & 
& cplSucSuVZ,cplSvImSvReVZ,cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,          & 
& cplSdcSdVZVZ,cplSecSeVZVZ,cplSucSuVZVZ,cplSvImSvImVZVZ,cplSvReSvReVZVZ,cplcVWmVWmVZVZ1,& 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,kont,dmZ2)

If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

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

If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

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

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,dmW2)

Call Pi1LoopVWm(0._dp,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,dmW2_0)

If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2,sinW2_Q,rho,MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,MSvIm,              & 
& MSvRe,MVWm,MVZp,g1,gYB,g2,gBL,gBY,TW,TWp,UM,UP,UV,vd,vu,Ye,Yx,Yv,ZA,ZE,ZEL,            & 
& ZER,ZH,ZN,ZP,ZVI,ZVR,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
If ((0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
delta_rw=delta_rho*(1._dp-delta_r)+delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_l_mZ*(1._dp-oo8pi2*3._dp*(g1SM**2-g2SM**2)/16._dp)
   mf_d_Q_SM=mf_d_mZ*(1._dp-alpha3/(3._dp*pi)&
           &-23._dp*alpha3**2/(72._dp*Pi2)&
           &+oo8pi2*3._dp*g2SM**2/16._dp&
           &-oo8pi2*13._dp*g1SM**2/144._dp)
   mf_u_Q_SM(1:2)=mf_u_mZ(1:2)*(1._dp-alpha3/(3._dp*pi)&
               &-23._dp*alpha3**2/(72._dp*Pi2)&
               &+oo8pi2*3._dp*g2SM**2/16._dp&
               &-oo8pi2*7._dp*g1SM**2/144._dp)
   mf_u_Q_SM(3)=mf_u(3)! QCD+QED shift will be added later
Else 
   mf_l_Q_SM=mf_l_MZ
   mf_d_Q_SM=mf_d_MZ
   mf_u_Q_SM=mf_u_MZ
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(Ye,ZA,ZEL,ZER,g2,Yv,ZVI,UM,UP,ZVR,g1,gBL,gYB,             & 
& gBY,ZE,ZN,ZH,TW,TWp,ZP,UV,Yd,ZDL,ZDR,Yu,ZU,ZD,g3,ZUL,ZUR,pG,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,     & 
& cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,     & 
& cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,       & 
& cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,       & 
& cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,   & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,               & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,  & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigR_l,sigL_l,sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,              & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/MFu(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(5._dp-rMS+3._dp*LogQ)&
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(5._dp-rMS+3._dp*LogQ)
Else 
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(5._dp-rMS+3._dp*LogQ&
&+( (as2loop + 3.5_dp*oo32pi2*rMS) + (log2loop_a - rMS*oo16pi2)*logQ + log2loop_b*logQ**2 )*gSU3**2) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(5._dp-rMS+3._dp*LogQ)
End if 
If (GuessTwoLoopMatchingBSM) Then 
   SigQCD=SigQCD-10._dp*gSU3**4*oo16pi2*(log(Q2/MGlu2))**2*MFu(3) 
End if 
SigQCD=oo16pi2*SigQCD

mf_u_Q_SM(3)=mf_u(3)+SigQCD



! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,3
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,3
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,3
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas3(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas3(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas3(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas
Call CalculateMSd(g1,g2,gBL,gYB,gBY,Mu,Yd,Td,mq2,md2,vd,vu,x1,x2,ZD,MSd,              & 
& MSd2,kont)

Call CalculateMSu(g1,g2,gBL,gYB,gBY,Mu,Yu,Tu,mq2,mu2,vd,vu,x1,x2,ZU,MSu,              & 
& MSu2,kont)

Call CalculateMSe(g1,g2,gBL,gYB,gBY,Mu,Ye,Te,ml2,me2,vd,vu,x1,x2,ZE,MSe,              & 
& MSe2,kont)



! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gMZ)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas3(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(3,3)
Complex(dp),Intent(out)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invMass2,Ytemp
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
If (ReSum) Then
kont=0
Call chop(MassMatrix)
invMass2=MassMatrix
Call gaussj(kont,invMass2,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invMass2)-Transpose(SigL)-Matmul(MassMatrix,Matmul(SigR,invMass2))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Ytemp=Matmul(invf,mass)
Else
Ytemp=mass+SigS+Matmul(Transpose(SigL),MassMatrix)+Matmul(MassMatrix,SigR)
End If
Y=sqrt2*Ytemp(1:3,1:3)/vev
Call chop(y)
End Subroutine Yukawas3

End Subroutine BoundaryEW 
 
Subroutine BoundarySM(i_run,Lambda_SM,delta0,g_SM,kont)

Implicit None 
Real(dp), Intent(out)::g_SM(62)
Real(dp) :: Abs2Mu,Abs2MuP

Integer, Intent(in) :: i_run 
Real(dp) :: mHiggs 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Complex(dp) ::uU_L_T(3,3),uU_R_T(3,3),uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), MuSM, adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp), Intent(in) :: Lambda_SM 
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp) :: Q2, logQ 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundarySM'
sinW2 = 1 - mW**2/mZ**2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
If (i_run.Eq.1) Then
   vSM = 246._dp 
   sinW2_Q=sinW2
   sinW2_old=sinW2_Q
   Y_l=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
       yl_MZ(i1,i1)=sqrt2*mf_l_mZ(i1)/vSM 
       yd_MZ(i1,i1)=sqrt2*mf_d_mZ(i1)/vSM 
       yu_MZ(i1,i1)=sqrt2*mf_u_mZ(i1)/vSM 
   End Do
   mf_l2=mf_l_mZ**2
   mf_d2=mf_d_mZ**2
   mf_u2=mf_u_mZ**2
Else
   vSM = vSM_save 
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
   mf_l2=mf_l2**2
   mf_d2=mf_d2**2
   mf_u2=mf_u2**2
End If
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
alphaMZ = AlphaEW_MS_SM(mZ,mf_d,mf_u,mf_l) 
 
alpha3 = AlphaS_MS_SM(mZ,mf_d,mf_u) 
If (.not.OneLoopMatching) alpha3= AlphaS_mZ 
If (.not.OneLoopMatching) alphaMZ = Alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*rho_2(mHiggs/mf_u(3)) 
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
TW= Asin(Sqrt(sinw2_Q)) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q)  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) 
vSM=sqrt(vev2) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
rho=1._dp/(1._dp-delta_rho)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta= 0._dp 
delta_rho0=0._dp
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
If ((0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ)  
vSM=sqrt(vev2) 


! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
  mf_l_MS_SM=mf_l_MZ
  mf_d_MS_SM=mf_d_MZ
  mf_u_MS_SM=mf_u_MZ
  mf_l_Q=mf_l_MS_SM
  mf_d_Q=mf_d_MS_SM
  mf_u_Q=mf_u_MS_SM
  YdSM=0._dp
  YuSM=0._dp
  YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_MS_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_MS_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_MS_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM


! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements


! Full one-loop corrections
Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,sigR_d,            & 
& sigL_d,sigSR_d,sigSL_d,sigR_u,sigL_u,sigSR_u,sigSL_u,sigR_l,sigL_l,sigSR_l,            & 
& sigSL_l,kont)

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/MFu(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
Else  
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
& -oo16pi2*MFu(3)*((2821._dp + 2028._dp*LogQ + 396._dp*LogQ**2 + 16._dp*Pi**2*(1._dp + 2._dp*log2) - 48._dp*Zeta3)*gSU3**4/18._dp) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
End if 
SigQCD=oo16pi2*SigQCD

mf_u_MS_SM(3)=mf_u(3)+SigQCD



! Obtain Yukawas
Call Yukawas(mf_u_MS_SM,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas(mf_d_MS_SM,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas(mf_l_MS_SM,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM= Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call FermionMass(YdSM,vSM,mf_d_Q,uD_L_T,uD_R_T,kont) 
Call FermionMass(YeSM,vSM,mf_l_Q,uL_L_T,uL_R_T,kont)
Call FermionMass(YuSM,vSM,mf_u_Q,uU_L_T,uU_R_T,kont)


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge
Call ParametersToG62_SM(g1SM,g2SM,g3SM,Lambda_SM,YuSM,YdSM,YeSM,MuSM,vSM,g_SM)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas(mf,vev,uL,uR,SigS,SigL,SigR,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invY
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
Y=Y*vev*oosqrt2
If (ReSum) Then
kont=0
Call chop(Y)
invY=Y
Call gaussj(kont,invY,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invY)-Transpose(SigL)-Matmul(Y,Matmul(SigR,invY))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Y=Matmul(invf,mass)
Else
Y=mass+SigS+Matmul(Transpose(SigL),Y)+Matmul(Y,SigR)
End If
Y=sqrt2*Y/vev
Call chop(y)
End Subroutine Yukawas

End Subroutine BoundarySM 
 
Subroutine BoundaryBSM(i_run,g_SM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,              & 
& Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,             & 
& delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:) 
Real(dp),Intent(in) :: g_SM(62) 
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

Complex(dp) :: cplAhhhVP(4,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),               & 
& cplChiChiVPR(7,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3), & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplcgWmgWmVP,        & 
& cplcgWpCgWpCVP,cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),           & 
& cplSdcSdVP(6,6),cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcVWmVPVWm,       & 
& cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),               & 
& cplSecSeVPVP(6,6),cplSucSuVPVP(6,6),cplSvImSvImVPVP(6,6),cplSvReSvReVPVP(6,6),         & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ(4,4),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcFdFdVZL(3,3),               & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ(4),              & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSecSeVZ(6,6),       & 
& cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcVWmVWmVZ,cplAhAhVZVZ(4,4),cplhhhhVZVZ(4,4),     & 
& cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),cplSucSuVZVZ(6,6),             & 
& cplSvImSvImVZVZ(6,6),cplSvReSvReVZVZ(6,6),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,             & 
& cplcVWmVWmVZVZ3,cplHpmcVWmVZp(2),cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,    & 
& cplcVWmVWmVZpVZp3,cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),           & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),             & 
& cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,              & 
& cplcgWpCgZpcVWm,cplhhHpmcVWm(4,2),cplhhcVWmVWm(4),cplSdcSucVWm(6,6),cplSeSvImcVWm(6,6),& 
& cplSeSvRecVWm(6,6),cplAhAhcVWmVWm(4,4),cplhhhhcVWmVWm(4,4),cplHpmcHpmcVWmVWm(2,2),     & 
& cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),cplSucSucVWmVWm(6,6),cplSvImSvImcVWmVWm(6,6),& 
& cplSvReSvRecVWmVWm(6,6),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,      & 
& cplcHpmVWmVZ(2),cplcHpmVPVWm(2),cplAhAhVPVZ(4,4),cplhhhhVPVZ(4,4),cplHpmcHpmVPVZ(2,2), & 
& cplSdcSdVPVZ(6,6),cplSecSeVPVZ(6,6),cplSucSuVPVZ(6,6),cplSvImSvImVPVZ(6,6),            & 
& cplSvReSvReVPVZ(6,6),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp(2), & 
& cplAhAhVPVZp(4,4),cplhhhhVPVZp(4,4),cplHpmcHpmVPVZp(2,2),cplSdcSdVPVZp(6,6),           & 
& cplSecSeVPVZp(6,6),cplSucSuVPVZp(6,6),cplSvImSvImVPVZp(6,6),cplSvReSvReVPVZp(6,6),     & 
& cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplAhAhVZVZp(4,4),cplhhhhVZVZp(4,4),& 
& cplHpmcHpmVZVZp(2,2),cplSdcSdVZVZp(6,6),cplSecSeVZVZp(6,6),cplSucSuVZVZp(6,6),         & 
& cplSvImSvImVZVZp(6,6),cplSvReSvReVZVZp(6,6),cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,         & 
& cplcVWmVWmVZVZp3

Complex(dp) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeChaSvImL(3,2,6),cplcUFeChaSvImR(3,2,6),& 
& cplcUFeChaSvReL(3,2,6),cplcUFeChaSvReR(3,2,6),cplcUFeChiSeL(3,7,6),cplcUFeChiSeR(3,7,6),& 
& cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),             & 
& cplcUFeFvHpmL(3,6,2),cplcUFeFvHpmR(3,6,2),cplcUFeFvVWmL(3,6),cplcUFeFvVWmR(3,6),       & 
& cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),     & 
& cplcUFdChiSdL(3,7,6),cplcUFdChiSdR(3,7,6),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),     & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),             & 
& cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),       & 
& cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),         & 
& cplcUFuChiSuL(3,7,6),cplcUFuChiSuR(3,7,6),cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2), & 
& cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),             & 
& cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Real(dp) :: Abs2Mu,Abs2MuP

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaQ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_Q,CosW2SinW2,gauge(3),delta,delta_SM,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dMZ2_SM, dMW2_SM, dMW2_0_SM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: SigSR_u_SM(3,3),SigSL_u_SM(3,3),sigR_u_SM(3,3),SigL_u_SM(3,3)
Complex(dp) :: SigSR_d_SM(3,3),SigSL_d_SM(3,3),SigR_d_SM(3,3),SigL_d_SM(3,3)
Complex(dp) :: SigSR_l_SM(3,3),SigSL_l_SM(3,3),sigR_l_SM(3,3),SigL_l_SM(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Real(dp) :: g1_MS, g2_MS,g3_MS,v_MS, mf_d_MS(3), mf_u_MS(3), mf_e_MS(3) 
Complex(dp) :: Yu_MS(3,3),Yd_MS(3,3),Ye_MS(3,3), Mu_MS, Lam_MS, MuSM 
Complex(dp) :: uU_L_MS(3,3),uU_R_MS(3,3)&
&,uD_L_MS(3,3),uD_R_MS(3,3),uL_L_MS(3,3),uL_R_MS(3,3), CKM_MS(3,3), delta_r_SM
Complex(dp) :: uU_L_T(3,3),uU_R_T(3,3)&
&,uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ, sinTW_MS, alphaEW_MS, alphaS_MS, mudim, mz2_MS, mw2_MS 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryBSM'
rMS_SM = rMS 
tanb = tanbetaMZ 
sinW2 = 1 - mW**2/mZ**2 
mudim = GetRenormalizationScale() 
mudim = sqrt(mudim) 
Call GToParameters62_SM(g_SM,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,Mu_MS,v_MS) 
sinTW_MS = g1_MS/sqrt(g1_MS**2+g2_MS**2) 
sinW2_Q = sinTW_MS**2 
alphaEW_MS = (sinTW_MS*g2_MS)**2/(4._dp*Pi) 
alphaS_MS = g3_MS**2/(4._dp*Pi) 
mz2_MS = (g1_MS**2+g2_MS**2)/(4._dp)*(v_MS**2) 
delta_r_SM = 1._dp - alphaEW_MS*Pi/(G_F*mz2*sqrt2*sinW2_Q*(1-sinW2_Q))
   Call FermionMass(Yd_MS,v_MS,mf_d_MS,uD_L_MS,uD_R_MS,kont)
   Call FermionMass(Ye_MS,v_MS,mf_e_MS,uL_L_MS,uL_R_MS,kont)
   Call FermionMass(Yu_MS,v_MS,mf_u_MS,uU_L_MS,uU_R_MS,kont)
   CKM_MS = MatMul(uU_R_MS,Transpose(Conjg(uD_R_MS))) 
!-----------------
!sin(theta_W)^2
!-----------------
vSM = v_MS 
   sinW2_old=sinW2_Q
   mf_l2=mf_e_MS**2
   mf_d2=mf_d_MS**2
   mf_u2=mf_u_MS**2
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaQ = AlphaEw_T(alphaEW_MS,mudim,Abs(MVWm),Abs(MSd),Abs(MSu),Abs(MSe),Abs(MHpm),Abs(MCha),Abs(MFe),Abs(MFd),Abs(MFu)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaS_T(alphaS_MS,mudim,Abs(MSd),Abs(MSu),Abs(MGlu),Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = alphaS_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
If (i_run.eq.1) Then 
 YeSM=Yl_MZ
 YdSM=Yd_MZ
 YuSM=Yu_MZ
Else 
 YeSM=Yl_Q
 YdSM=Yd_Q
 YuSM=Yu_Q
End if 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
MVZ2 = mZ2 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
If (.not.MatchZWpoleMasses) Then 
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

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=Sqrt(vev2)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

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

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q *CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

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

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,dmW2)

Call Pi1LoopVWm(0._dp,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,dmW2_0)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmW2 = dmW2 - dmW2_SM
dmW2_0 = dmW2_0 - dmW2_0_SM
If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2,sinW2_Q,rho,MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,MSvIm,              & 
& MSvRe,MVWm,MVZp,g1,gYB,g2,gBL,gBY,TW,TWp,UM,UP,UV,vd,vu,Ye,Yx,Yv,ZA,ZE,ZEL,            & 
& ZER,ZH,ZN,ZP,ZVI,ZVR,delta)

Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta_SM)

 delta=delta-delta_SM 
Else 
 delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
CosW2SinW2=pi*alphaQ/(sqrt2*mZ2*G_F*(1-delta_r_SM - delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at renormalisation scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
If ((0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
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

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSvIm,MSvIm2,MSe,MSe2,MSvRe,MSvRe2,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplFvFecVWmL,cplFvFecVWmR,cplcgWpCgAcVWm,   & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,        & 
& cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,    & 
& cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,      & 
& cplSvImSvImcVWmVWm,cplSvReSvRecVWmVWm,cplcVWmVPVPVWm3,cplcVWmVPVPVWm1,cplcVWmVPVPVWm2, & 
& cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,cplcVWmVWmVZVZ1,              & 
& cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3, & 
& kont,dmW2)

Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,kont,             & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

If (.not.OneLoopMatching) dmZ2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_0_SM = 0._dp 
mZ2_run=mZ2_MS-dmZ2+dmz2_SM
mW2_run=mw2_MS-dmW2+dmw2_SM
sinW2_Q=1._dp-mW2_run/MZ2_run
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM=sqrt(4._dp*mz2_run/(g1SM**2+g2SM**2))
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

vev2=4._dp*mz2_run/(g1SM**2+g2SM**2) -(0) 
vSM=sqrt(vev2) 
End If 
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
If (.not.MatchZWpoleMasses) Then 
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Else 
mW2=(1._dp-sinW2_Q)*MZ2 
mW=Sqrt(mW2)
End If 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM_Q = vSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM_MS,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM_MS
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_e_MS*(1._dp-alphaQ/(4._dp*Pi))
   mf_d_Q_SM=mf_d_MS*(1._dp-alpha3/(3._dp*pi)&
           &-43._dp*alpha3**2/(144._dp*Pi2) - alphaQ/(36._dp*Pi))
   mf_u_Q_SM(1:3)=mf_u_MS(1:3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
Else 
   mf_l_Q_SM=mf_e_MS
   mf_d_Q_SM=mf_d_MS
   mf_u_Q_SM=mf_u_MS
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(Ye,ZA,ZEL,ZER,g2,Yv,ZVI,UM,UP,ZVR,g1,gBL,gYB,             & 
& gBY,ZE,ZN,ZH,TW,TWp,ZP,UV,Yd,ZDL,ZDR,Yu,ZU,ZD,g3,ZUL,ZUR,pG,cplcUFeFeAhL,              & 
& cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,cplcUFeChaSvReR,          & 
& cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,       & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,     & 
& cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,     & 
& cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,       & 
& cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,       & 
& cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,   & 
& cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,cplcUFuFdcHpmR,   & 
& cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,     & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,       & 
& cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSvIm,MSvIm2,MCha,MCha2,MSvRe,               & 
& MSvRe2,MSe,MSe2,MChi,MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,           & 
& MVWm,MVWm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeChaSvImL,cplcUFeChaSvImR,cplcUFeChaSvReL,  & 
& cplcUFeChaSvReR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,    & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,cplcUFeFvHpmL,      & 
& cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigR_l,sigL_l,sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,              & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,sigR_d_SM,            & 
& sigL_d_SM,sigSR_d_SM,sigSL_d_SM,sigR_u_SM,sigL_u_SM,sigSR_u_SM,sigSL_u_SM,             & 
& sigR_l_SM,sigL_l_SM,sigSR_l_SM,sigSL_l_SM,kont)

sigR_l(1:3,1:3) = sigR_l(1:3,1:3) - sigR_l_SM
sigL_l(1:3,1:3) = sigL_l(1:3,1:3) - sigL_l_SM
sigSR_l(1:3,1:3) = sigSR_l(1:3,1:3) - sigSR_l_SM
sigSL_l(1:3,1:3) = sigSL_l(1:3,1:3) - sigSL_l_SM
sigR_d(1:3,1:3) = sigR_d(1:3,1:3) - sigR_d_SM
sigL_d(1:3,1:3) = sigL_d(1:3,1:3) - sigL_d_SM
sigSR_d(1:3,1:3) = sigSR_d(1:3,1:3) - sigSR_d_SM
sigSL_d(1:3,1:3) = sigSL_d(1:3,1:3) - sigSL_d_SM
sigR_u(1:3,1:3) = sigR_u(1:3,1:3) - sigR_u_SM
sigL_u(1:3,1:3) = sigL_u(1:3,1:3) - sigL_u_SM
sigSR_u(1:3,1:3) = sigSR_u(1:3,1:3) - sigSR_u_SM
sigSL_u(1:3,1:3) = sigSL_u(1:3,1:3) - sigSL_u_SM


If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if
If (GuessTwoLoopMatchingBSM) Then 
   Q2=GetRenormalizationScale() 
    mf_u_Q_SM(3)=mf_u_MS(3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
    SigQCD=-10._dp*gSU3**4*oo16pi2*(log(Q2/MGlu2))**2*MFu(3) 
    SigQCD=oo16pi2*SigQCD

    mf_u_Q_SM(3)=mf_u_Q_SM(3)+SigQCD

End if 


! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,3
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,3
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,3
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas3(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If
Call Yukawas3(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If 
Call Yukawas3(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas
Call CalculateMSd(g1,g2,gBL,gYB,gBY,Mu,Yd,Td,mq2,md2,vd,vu,x1,x2,ZD,MSd,              & 
& MSd2,kont)

Call CalculateMSu(g1,g2,gBL,gYB,gBY,Mu,Yu,Tu,mq2,mu2,vd,vu,x1,x2,ZU,MSu,              & 
& MSu2,kont)

Call CalculateMSe(g1,g2,gBL,gYB,gBY,Mu,Ye,Te,ml2,me2,vd,vu,x1,x2,ZE,MSe,              & 
& MSe2,kont)



! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_Q=YeSM
Yd_Q=YdSM
Yu_Q=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gMZ)

rMS_SM = 1._dp 
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas3(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(3,3)
Complex(dp),Intent(out)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invMass2,Ytemp
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
If (ReSum) Then
kont=0
Call chop(MassMatrix)
invMass2=MassMatrix
Call gaussj(kont,invMass2,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invMass2)-Transpose(SigL)-Matmul(MassMatrix,Matmul(SigR,invMass2))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Ytemp=Matmul(invf,mass)
Else
Ytemp=mass+SigS+Matmul(Transpose(SigL),MassMatrix)+Matmul(MassMatrix,SigR)
End If
Y=sqrt2*Ytemp(1:3,1:3)/vev
Call chop(y)
End Subroutine Yukawas3

End Subroutine BoundaryBSM 
 
Subroutine Sugra(delta0,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,mGut,kont,WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: delta0,deltaG0, gA(316), gB(96)
Real(dp) :: gC(320),  gD(320) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(6) 
Real(dp) :: comp(6), tanbQ, vev2 
Complex(dp) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6),cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),            & 
& cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),     & 
& cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),      & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),        & 
& cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4), & 
& cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),               & 
& cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),           & 
& cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),       & 
& cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),cplUhhVZVZp(4),cplUhhVZpVZp(4),          & 
& cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,2,2),               & 
& cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),cplUhhUhhSucSu(4,4,6,6),               & 
& cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),cplUhhUhhVPVP(4,4),              & 
& cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp) ::mass_new(50),mass_old(50),diff_m(50)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Sugra'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSvIm
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSvRe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+6) = MChi
n_tot = n_tot + 7 
mass_old(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+0) = MGlu
If (.Not.UseFixedScale) Then 
mudim=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
Call SetRGEScale(mudim) 
UseFixedScale= .False. 
End If 
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
Call BoundaryEW(j,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
Call RunRGE(kont,0.1_dp*delta0,gB,gA,mGUT)
 
Call GToParameters316(gA,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
mudim=GetRenormalizationScale() 
Q=Sqrt(mudim) 
Q2=mudim 
tz=Log(Q/mZ)
dt=-tz/50._dp
vd=1._dp
vu=tanbeta 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,gC)

Call odeint(gC,320,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge320,kont)
Call GToParameters320(gC,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 
  tanbetaMZ = vu/vd 
vd = vdMZ
vu = vuMZ

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

x1MZ = x1 
x2MZ = x2 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,gD)

tz=Log(mZ/Q)
dt=-tz/50._dp
Call odeint(gD,320,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge320,kont)
Call GToParameters320(gD,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 


  tanbQ = tanbeta 
vev2=4._dp*Real(mZ2,dp)/(g1**2+g2**2) -0._dp
vd=Sqrt(vev2/(1._dp+tanbQ**2))
vu=tanbQ*vd
vdSUSY = vd 
vuSUSY = vu 
x1SUSY = x1 
x2SUSY = x2 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSvIm
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSvRe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+6) = MChi
n_tot = n_tot + 7 
mass_new(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+0) = MGlu
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (.Not.UseFixedScale) Then 
mudimNew=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudimNew)) 
 UseFixedScale= .False. 
End If 
If (j.lt.niter) Then 
Call GToParameters320(gC,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)

vd = vdMZ 
vu = vuMZ 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
If (IgnoreNegativeMassesMZ) Then 
  SignMassChangedSave = SignOfMassChanged 
End if 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

If (IgnoreNegativeMassesMZ) Then 
  SignOfMassChanged = SignMassChangedSave  
End if 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Sugra
 
Subroutine RunRGE(kont, delta0, g1A, g1C, mGUT)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::delta0
Integer :: i1, i2, i3, i4 
Real(dp),Intent(inout)::g1A(96)
Real(dp),Intent(out)::g1C(316),mGUT
Real(dp)::tz,dt,t_out 
Real(dp)::mudim,gGUT,gA_h(96),g1b(96),m_hi,m_lo
Real(dp)::g1S(96)
Logical :: FoundUnification, unified, greater 

Iname=Iname+1
NameOfUnit(Iname)='runRGE'

If (.Not.UseFixedGUTScale) Then
m_lo=5.e12_dp
Else 
m_lo=Min(5.e12_dp,GUT_Scale)
End If 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
Call odeint(g1A,96,tz,0._dp,delta0,dt,0._dp,rge96,kont)

If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundarySUSY(g1a,g1B)

FoundUnification= .False. 
tz=Log(sqrt(mudim)/m_lo)
dt=-tz/50._dp

Call odeint(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
If (.Not.UseFixedGUTScale) Then
tz=Log(m_lo/1.e20_dp)
dt=-tz/50._dp

Call odeintB2(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,checkGUT96,t_out,kont)

If (kont.Eq.0) Then
FoundUnification= .True. 
mGUT=1.e20_dp*Exp(t_out)
gGUT=Sqrt(0.5_dp*(g1b(1)**2+g1b(2)**2))
If (StrictUnification) g1b(3)=gGUT
Else
Write(ErrCan,*) "kont",kont,delta0,tz,dt
Write (ErrCan,*) "t_out",t_out,1.e20_dp*Exp(t_out)
Write(ErrCan,*) " "
Iname=Iname-1
Return
End If
Else
  tz=Log(m_lo/GUT_scale)
  mGUT=GUT_scale
  dt=-tz/50._dp
Call odeint(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
End If

mGUT_Save=mGUT
Call BoundaryHS(g1B,g1c,mGUT)

mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mudim/mGUT_save**2)
dt=tz/100._dp
Call odeint(g1c,316,0._dp,tz,delta0,dt,0._dp,rge316,kont)
Iname=Iname-1
End Subroutine RunRGE

Subroutine Match_and_Run(delta0,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,mGut,kont,               & 
& WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: g_SM(62) 
Real(dp) :: delta0,deltaG0, gA(316), gB(96)
Real(dp) :: gC(320),  gD(320) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(6), lambda_SM, lambda_MZ 
Real(dp) :: comp(6), tanbQ, vev2 
Complex(dp) :: cplAhSvImUSvRe(4,6,6),cplAhUSvReSvRe(4,6,6),cplcFeChaUSvReL(3,2,6),cplcFeChaUSvReR(3,2,6),& 
& cplChiFvUSvReL(7,6,6),cplChiFvUSvReR(7,6,6),cplhhSvImUSvRe(4,6,6),cplhhUSvReSvRe(4,6,6),& 
& cplHpmUSvRecSe(2,6,6),cplSeUSvRecVWm(6,6),cplSvImUSvReVP(6,6),cplSvImUSvReVZ(6,6),     & 
& cplSvImUSvReVZp(6,6),cplAhAhUSvReUSvRe(4,4,6,6),cplhhhhUSvReUSvRe(4,4,6,6),            & 
& cplHpmUSvReUSvRecHpm(2,6,6,2),cplSdUSvReUSvRecSd(6,6,6,6),cplSeUSvReUSvRecSe(6,6,6,6), & 
& cplSuUSvReUSvRecSu(6,6,6,6),cplSvImSvImUSvReUSvRe(6,6,6,6),cplUSvReUSvReSvReSvRe(6,6,6,6),& 
& cplUSvReUSvReVPVP(6,6),cplUSvReUSvRecVWmVWm(6,6),cplUSvReUSvReVZVZ(6,6),               & 
& cplUSvReUSvReVZpVZp(6,6),cplAhAhUhh(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),            & 
& cplAhUhhVZp(4,4),cplcChaChaUhhL(2,2,4),cplcChaChaUhhR(2,2,4),cplChiChiUhhL(7,7,4),     & 
& cplChiChiUhhR(7,7,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),      & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(6,6,4),        & 
& cplFvFvUhhR(6,6,4),cplcgWmgWmUhh(4),cplcgWpCgWpCUhh(4),cplcgZgZUhh(4),cplcgZpgZUhh(4), & 
& cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,2,2),               & 
& cplUhhHpmcVWm(4,2),cplUhhSdcSd(4,6,6),cplUhhSecSe(4,6,6),cplUhhSucSu(4,6,6),           & 
& cplUhhSvImSvIm(4,6,6),cplUhhSvImSvRe(4,6,6),cplUhhSvReSvRe(4,6,6),cplUhhVPVZ(4),       & 
& cplUhhVPVZp(4),cplUhhcVWmVWm(4),cplUhhVZVZ(4),cplUhhVZVZp(4),cplUhhVZpVZp(4),          & 
& cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,2,2),               & 
& cplUhhUhhSdcSd(4,4,6,6),cplUhhUhhSecSe(4,4,6,6),cplUhhUhhSucSu(4,4,6,6),               & 
& cplUhhUhhSvImSvIm(4,4,6,6),cplUhhUhhSvReSvRe(4,4,6,6),cplUhhUhhVPVP(4,4),              & 
& cplUhhUhhcVWmVWm(4,4),cplUhhUhhVZVZ(4,4),cplUhhUhhVZpVZp(4,4)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp) ::mass_new(65),mass_old(65),diff_m(65)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2, mh_SM 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Match_and_Run'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSvIm
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSvRe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_old(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+6) = MChi
n_tot = n_tot + 7 
mass_old(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+0) = MGlu
If (.Not.UseFixedScale) Then 
mudim=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
Call SetRGEScale(mudim) 
UseFixedScale= .False. 
End If 
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Lambda_MZ = 0.1_dp 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
Call BoundarySM(j,Lambda_MZ,delta0,g_SM,kont)

g_SM_save = g_SM 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
g_SM(1) = Sqrt(5._dp/3._dp)*g_SM(1) 
Call odeint(g_SM,62,tz,0._dp,delta0,dt,0._dp,rge62_SM,kont)

g_SM(1) = Sqrt(3._dp/5._dp)*g_SM(1) 
If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundaryBSM(j,g_SM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
Call RunRGE_New(kont,0.1_dp*delta0,gB,gA,mGUT)
 
Call GToParameters316(gA,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
mudim=GetRenormalizationScale() 
Q=Sqrt(mudim) 
Q2=mudim 
tz=Log(Q/mZ)
dt=-tz/50._dp
vd=1._dp
vu=tanbeta 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,gC)

Call odeint(gC,320,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge320,kont)
Call GToParameters320(gC,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 
  tanbetaMZ = vu/vd 
vd = vdMZ
vu = vuMZ

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

x1MZ = x1 
x2MZ = x2 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 
Call ParametersToG320(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,               & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,gD)

tz=Log(mZ/Q)
dt=-tz/50._dp
Call odeint(gD,320,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge320,kont)
Call GToParameters320(gD,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 


  tanbQ = tanbeta 
vev2=4._dp*Real(mZ2,dp)/(g1**2+g2**2) -0._dp
vd=Sqrt(vev2/(1._dp+tanbQ**2))
vu=tanbQ*vd
vdSUSY = vd 
vuSUSY = vu 
x1SUSY = x1 
x2SUSY = x2 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSvIm
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSvRe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+3) = Mhh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+3) = MAh
n_tot = n_tot + 4 
mass_new(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+6) = MChi
n_tot = n_tot + 7 
mass_new(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+0) = MGlu
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (.Not.UseFixedScale) Then 
mudimNew=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudimNew)) 
 UseFixedScale= .False. 
End If 
If (j.lt.niter) Then 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp 
g_SM(1)=g_SM(1)*sqrt(5._dp/3._dp) 
g_SM(4)=Mhh2(1)/g_SM(62)**2 
Call odeint(g_SM,62,0._dp,tz,delta0,dt,0._dp,rge62_SM,kont) 
g_SM(1)=g_SM(1)/sqrt(5._dp/3._dp) 
Lambda_MZ=g_SM(4) 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

If (((Calculate_mh_within_SM).and.(Mhh(2).gt.300._dp)).OR.(Force_mh_within_SM))Then
Write(*,*) "Calculate Higgs mass within effective SM " 
Call Get_mh_pole_SM(g_SM,mudim,delta0,Mhh2(1),mh_SM) 
Mhh2(1) = mh_SM**2 
Mhh(1) = mh_SM 
End if
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Match_and_Run
 
Subroutine RunRGE_new(kont, delta0, g1A, g1C, mGUT)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::delta0
Integer :: i1, i2, i3, i4 
Real(dp),Intent(inout)::g1A(96)
Real(dp),Intent(out)::g1C(316),mGUT
Real(dp)::tz,dt,t_out 
Real(dp)::mudim,gGUT,gA_h(96),m_hi,m_lo
Real(dp)::g1B(96)
Real(dp)::g1S(96)
Logical :: FoundUnification, unified, greater 

Iname=Iname+1
NameOfUnit(Iname)='runRGE'

If (.Not.UseFixedGUTScale) Then
m_lo=5.e12_dp
Else 
m_lo=Min(5.e12_dp,GUT_Scale)
End If 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
FoundUnification= .False. 
tz=Log(sqrt(mudim)/m_lo)
dt=-tz/50._dp

g1B=g1A

Call odeint(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
If (.Not.UseFixedGUTScale) Then
tz=Log(m_lo/1.e20_dp)
dt=-tz/50._dp

Call odeintB2(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,checkGUT96,t_out,kont)

If (kont.Eq.0) Then
FoundUnification= .True. 
mGUT=1.e20_dp*Exp(t_out)
gGUT=Sqrt(0.5_dp*(g1b(1)**2+g1b(2)**2))
If (StrictUnification) g1b(3)=gGUT
Else
Write(ErrCan,*) "kont",kont,delta0,tz,dt
Write (ErrCan,*) "t_out",t_out,1.e20_dp*Exp(t_out)
Write(ErrCan,*) " "
Iname=Iname-1
Return
End If
Else
  tz=Log(m_lo/GUT_scale)
  mGUT=GUT_scale
  dt=-tz/50._dp
Call odeint(g1B,96,tz,0._dp,delta0,dt,0._dp,rge96,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
End If

mGUT_Save=mGUT
Call BoundaryHS(g1B,g1c,mGUT)

mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mudim/mGUT_save**2)
dt=tz/100._dp
Call odeint(g1c,316,0._dp,tz,delta0,dt,0._dp,rge316,kont)
Iname=Iname-1
End Subroutine RunRGE_new

Subroutine checkGUT96(y,eps,unified,greater)  
Implicit None 
Real(dp), Intent(in) :: y(96), eps 
Logical, Intent(out) :: unified, greater 
Real(dp) :: g1,g2,g3,gBL,gYB,gBY

Complex(dp) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3)

Call GToParameters96(y,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv)

If (((((g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2))-(g2)).Gt.0._dp).And.((((g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2))-(g2)).Lt.eps)) Then 
  unified = .True. 
Else 
   unified = .False. 
End If 
If (((g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)).Gt.(g2)) Then 
  greater = .True. 
Else 
  greater = .False. 
End If 
End Subroutine checkGUT96
 
Subroutine FirstGuess(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,              & 
& vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,               & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,kont)

Implicit None 
Real(dp),Intent(out) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(out) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(out) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Integer,Intent(inout)::kont
Integer :: i1, i2
Real(dp),Intent(inout) :: vd,vu,x1,x2

Real(dp)::vev,vevs(2),vev2,mgut,mudim,mudimNew,sigma(2),cosW,cosW2,sinW2 
Complex(dp):: YeSM(3,3), YdSM(3,3), YuSM(3,3) 
Real(dp) :: k_fac, g1SM, g2SM, g3SM, vSM 
Real(dp), Parameter :: oo2pi=1._dp/(2._dp*pi),oo6pi=oo2pi/3._dp 
Real(dp):: gA(96), gB(316), Scale_Save 
Logical::TwoLoopRGE_save, UseFixedScale_save 
Iname=Iname+1 
NameOfUnit(Iname)="FirstGuess" 
If (HighScaleModel.eq."LOW") UseFixedGUTScale = .true. 

gBL = 0.5_dp 
gYB = -0.06_dp 
gBY = -0.06_dp 
KineticMixingSave = KineticMixing 
KineticMixing = .False. 
If (.not.KineticMixing) Then 
gYB = 0._dp 
gBY = 0._dp 
MBBp = 0._dp 
End if 
If (tanbeta.gt.3._dp) Then 
 tanb = tanbeta 
 tanbetaMZ = tanbeta 
Else 
 tanb = 5._dp 
 tanbetaMZ = 5._dp 
End if 
mW2=mZ2*(0.5_dp+Sqrt(0.25_dp-Alpha_Mz*pi/(sqrt2*G_F*mZ2)))
mW=Sqrt(mW2) 
cosW2=mw2/mZ2 
sinW2=1._dp-cosW2 
cosW=Sqrt(cosW2) 
 
If (tanbeta.gt.5._dp) Then 
 k_fac=1._dp-alpha*(oo6pi & 
  &-oo2pi*(57._dp*Log(10._dp)+16._dp*Log(mf_u(3)/mZ))/9._dp) 
Else 
 k_fac=1._dp 
End if 
g1SM=Sqrt(3._dp/5._dp)*Sqrt(20._dp*pi*alpha_mZ/(k_fac*3._dp*(1._dp-sinW2))) 
g2SM=Sqrt(4._dp*pi*alpha_mZ/(k_fac*sinW2)) 
If (tanbeta.gt.5._dp) Then 
 k_fac=1-AlphaS_mZ*oo2pi*(0.5_dp-4._dp*Log(10._dp) &
  &-2._dp*Log(mf_u(3)/mZ)/3._dp) 
Else 
 k_fac=1._dp 
End if 
g3SM=Sqrt(4._dp*pi*alphas_mZ) 
g3SM=Sqrt(4._dp*pi*alphas_mZ/k_fac) 
 
vSM=2._dp*mW/g2SM 
YeSM=0._dp 
YdSM=0._dp 
YuSM=0._dp 
Do i1=1,3 
  YeSM(i1,i1)=sqrt2*mf_L_mZ(i1)/vSM 
  If (i1.Eq.3) Then! top and bottom are special: 
  ! TanBeta Aufsummierung fehlt bei Yd!! 
  YuSM(i1,i1)=sqrt2*mf_U(i1)/vSM& 
    &*(1._dp-oo3pi*alphas_mZ*(5._dp+3._dp*Log(mZ2/mf_u2(3)))) 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/(vSM * (1._dp + 0.015*tanb)) 
Else 
  YuSM(i1,i1)=sqrt2*mf_U_mZ(i1)/vSM 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/vSM 
End If  
End Do 
If (GenerationMixing) Then 
  If (YukawaScheme.Eq.1) Then 
    YuSM=Matmul(Transpose(CKM),YuSM) 
  Else 
    YdSM=Matmul(Conjg(CKM),YdSM) 
  End If 
End If 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

TwoLoopRGE_save=TwoLoopRGE 
UseFixedScale_save = UseFixedScale 
Scale_save=GetRenormalizationScale() 
UseFixedScale = .True. 
Call SetRGEScale(mZ2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

 
 ! 1. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Bmu = 0._dp 
BMuP = 0._dp 
Mu = 0._dp 
MuP = 0._dp 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 


Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters316(gB,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

 
 ! 2. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 


Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters316(gB,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,x1,x2,             & 
& g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,            & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,.False.)

 
 ! 3. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Yv = YvIN
Yx = YxIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 x1 = x1IN 
 x2 = x2IN 
 MuP = MuPIN 
 Mu = MuIN 
 Td = TdIN 
 Te = TeIN 
 Tu = TuIN 
 Tx = TxIN 
 Tv = TvIN 
 BMuP = BMuPIN 
 Bmu = BmuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 mv2 = mv2IN 
 mC12 = mC12IN 
 mC22 = mC22IN 
 MBBp = MBBpIN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 MBp = MBpIN 
 gBL = gBLIN 
 gYB = gYBIN 
 gBY = gBYIN 
 Yx = YxIN 
 Yv = YvIN 
 gBL = gBLinput
gYB = g1BLinput
gBY = 0
vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
Bmu = BMuInput
BMuP = BMuPInput
Mu = MuInput
MuP = MuPInput
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gBL = Sqrt(2._dp/3._dp)*gBL 
gYB = Sqrt(5._dp/3._dp)*gYB 
gBY = Sqrt(2._dp/3._dp)*gBY 
! ----------------------- 
 


Call ParametersToG96(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,gA)

Call SetRGEScale(Scale_save) 
UseFixedScale = UseFixedScale_save 
If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters316(gB,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,               & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gBL = Sqrt(3._dp/2._dp)*gBL 
gYB = Sqrt(3._dp/5._dp)*gYB 
gBY = Sqrt(3._dp/2._dp)*gBY 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
TwoLoopRGE = TwoLoopRGE_save 
MuPMZ = MuP 
MuMZ = Mu 
TdMZ = Td 
TeMZ = Te 
TuMZ = Tu 
TxMZ = Tx 
TvMZ = Tv 
BMuPMZ = BMuP 
BmuMZ = Bmu 
mq2MZ = mq2 
ml2MZ = ml2 
mHd2MZ = mHd2 
mHu2MZ = mHu2 
md2MZ = md2 
mu2MZ = mu2 
me2MZ = me2 
mv2MZ = mv2 
mC12MZ = mC12 
mC22MZ = mC22 
MBBpMZ = MBBp 
M1MZ = M1 
M2MZ = M2 
M3MZ = M3 
MBpMZ = MBp 
vSM_save = vSM 

 
 ! --- Boundary conditions at EW-scale --- 
g1T = (g1*gBL - gYB*gBY)/Sqrt(gBL**2 + gBY**2)
gBLT = Sqrt(gBL**2 + gBY**2)
g1BLT = (gYB*gBL + g1*gBY)/Sqrt(gBL**2 + gBY**2)
g1 = g1T
gBL = gBLT
gYB = g1BLT
gBY = 0
vevP = MZp/gBL
betaP = ATan(TBetaP)
x2 = vevP*Cos(betaP)
x1 = vevP*Sin(betaP)
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,             & 
& Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,              & 
& M2,M3,MBp,vd,vu,x1,x2,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,              & 
& MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,               & 
& ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,             & 
& x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,             & 
& ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,GenerationMixing,kont)

tanb = tanbeta 
tanbetaMZ = tanbeta 
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
Iname=Iname-1 
End subroutine FirstGuess 
End Module Boundaries_BLSSM 
