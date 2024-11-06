! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:48 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_BLSSM 
 
Use Control 
Use Settings 
Use Couplings_BLSSM 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Real(dp) Function Alpha_MSbar(Q,mW,mt) 
Implicit None 
Real(dp),Intent(in)::Q,mW 
Real(dp),Intent(in),Optional::mt 
Real(dp)::DeltaAlpha 
If (MZ_input) Then 
Alpha_MSbar=Alpha_mZ_MS 
If (Present(mt)) Then 
DeltaAlpha=-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha_MSbar/(1._dp+DeltaAlpha*alpha) 
End If 
Else 
DeltaAlpha=3.5_dp*Log(Q/mW)/Pi+0.5_dp*oo3pi 
If (Present(mt)) DeltaAlpha=DeltaAlpha-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha/(1._dp-Delta_Alpha_Lepton-Delta_Alpha_Hadron& 
&+DeltaAlpha*alpha) 
Alpha_MZ_MS=Alpha_MSbar 
End If 
End Function Alpha_MSbar
 
 
Real(dp) Function AlphaEwDR(Q,MVWm,MSd,MSu,MSe,MHpm,MCha,MFe,MFd,MFu) 
 
Real(dp),Intent(in)::Q,MVWm,MSd(6),MSu(6),MSe(6),MHpm(2),MCha(2),MFe(3),MFd(3),MFu(3)
Integer::i1 
Real(dp)::DeltaAlpha 
If (MZ_input) then 
DeltaAlpha=1._dp-Alpha/Alpha_MZ_MS! MSbar value^=mW+light fermions 
DeltaAlpha=DeltaAlpha+alpha/(6._dp*Pi)*(1._dp-rMS)! conversion to DRbar if necessary 
If (MVWm.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MVWm/ Q)*Alpha/(2._dp*pi) 
End if 
Do i1=1,6
If (MSd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/9._dp*Log(MSd(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,6
If (MSu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/9._dp*Log(MSu(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,6
If (MSe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MSe(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=2,2
If (MHpm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MHpm(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,2
If (MCha(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/3._dp*Log(MCha(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/3._dp*Log(MFe(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/9._dp*Log(MFd(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-16._dp/9._dp*Log(MFu(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Else 
DeltaAlpha=7._dp*Log(Q/mW)
If (MVWm.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWm/ Q)
End if 
Do i1=1,6
If (MSd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/9._dp*Log(MSd(i1)/ Q) 
End if 
End Do 
Do i1=1,6
If (MSu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MSu(i1)/ Q) 
End if 
End Do 
Do i1=1,6
If (MSe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MSe(i1)/ Q) 
End if 
End Do 
Do i1=2,2
If (MHpm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHpm(i1)/ Q) 
End if 
End Do 
Do i1=1,2
If (MCha(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MCha(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End if 
End Do 
DeltaAlpha=Delta_Alpha_Lepton+Delta_Alpha_Hadron& 
    &-alpha*DeltaAlpha/(2._dp*Pi) 
End If 
 
AlphaEwDR=Alpha/(1._dp-DeltaAlpha) 
 
End Function AlphaEwDR 
 
 
Real(dp) Function AlphaSDR(Q,MSd,MSu,MGlu,MFd,MFu) 
Real(dp),Intent(in)::Q,MSd(6),MSu(6),MGlu,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha = 0._dp 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha = 0.5_dp 
End if 
Do i1=1,6
 If (Abs(MSd(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-1._dp/6._dp*Log(MSd(i1)/ Q) 
 End If 
End Do 
Do i1=1,6
 If (Abs(MSu(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-1._dp/6._dp*Log(MSu(i1)/ Q) 
 End If 
End Do 
DeltaAlpha=DeltaAlpha-2*Log(MGlu/ Q) 
Do i1=1,3
 If (Abs(MFd(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
 End If 
End Do 
Do i1=1,3
 If (Abs(MFu(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
 End If 
End Do 
DeltaAlpha=AlphaS_mZ*DeltaAlpha/(2._dp*Pi) 
AlphaSDR=AlphaS_mZ/(1._dp-DeltaAlpha)
 
End Function AlphaSDR 
Real(dp) Function AlphaEW_T(AlphaEW_In, Q,MVWm,MSd,MSu,MSe,MHpm,MCha,MFe,MFd,MFu) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MVWm,MSd(6),MSu(6),MSe(6),MHpm(2),MCha(2),MFe(3),MFd(3),MFu(3)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=1._dp/(6._dp)*(1._dp-rMS)! conversion to DRbar if necessary 
Do i1=1,6
DeltaAlpha=DeltaAlpha+1._dp/9._dp*Log(MSd(i1)/ Q) 
End Do 
Do i1=1,6
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MSu(i1)/ Q) 
End Do 
Do i1=1,6
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MSe(i1)/ Q) 
End Do 
Do i1=2,2
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHpm(i1)/ Q) 
End Do 
Do i1=1,2
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MCha(i1)/ Q) 
End Do 
DeltaAlpha=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
AlphaEW_T=AlphaEW_in/(1._dp-DeltaAlpha) 
 
End Function AlphaEW_T 
 
 
Real(dp) Function AlphaS_T(AlphaS_In, Q,MSd,MSu,MGlu,MFd,MFu) 
Real(dp),Intent(in):: AlphaS_In, Q,MSd(6),MSu(6),MGlu,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp 
!Conversion to DR bar if necessary 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha=0.5_dp 
End if
Do i1=1,6
DeltaAlpha=DeltaAlpha-1._dp/6._dp*Log(MSd(i1)/ Q) 
End Do 
Do i1=1,6
DeltaAlpha=DeltaAlpha-1._dp/6._dp*Log(MSu(i1)/ Q) 
End Do 
DeltaAlpha=DeltaAlpha-2*Log(MGlu/ Q) 
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
End Do 
DeltaAlpha=AlphaS_In*DeltaAlpha/(2._dp*Pi) 
   AlphaS_T=AlphaS_In/(1._dp-DeltaAlpha)
 
End Function AlphaS_T



Subroutine DeltaVB(sinW2,sinW2_dr,rho,MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,             & 
& MSvIm,MSvRe,MVWm,MVZp,g1,gYB,g2,gBL,gBY,TW,TWp,UM,UP,UVinput,vd,vu,Ye,Yx,              & 
& Yv,ZA,ZE,ZEL,ZER,ZH,ZN,ZP,ZVI,ZVR,res)

Implicit None 
Real(dp),Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVWm,MVZp,g1,gYB,g2,gBL,gBY,TW,TWp,vd,vu,ZA(4,4),ZH(4,4),ZP(2,2)

Complex(dp),Intent(in) :: UM(2,2),UP(2,2),UVinput(6,6),Ye(3,3),Yx(3,3),Yv(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZVI(6,6),ZVR(6,6)

Real(dp) :: MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),MSe2(6),MSvIm2(6),         & 
& MSvRe2(6),MVWm2,MVZp2

Complex(dp) :: cplAhcHpmVWm(4,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFeFeAhL(3,3,4),      & 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZpL(3,3),            & 
& cplcFeFeVZpR(3,3),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),           & 
& cplcFeFvVWmR(3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),        & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcHpmVWmVZp(2),       & 
& cplcVWmVWmVZp,cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),             & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp) :: UV(6,6) 
Integer :: i1,i2,i3,i4,gt1,gt2,gt3,gt4 
Real(dp), Intent(in) :: sinW2,sinW2_Dr, rho 
Real(dp), Intent(out) :: res 
 
Complex(dp) :: sumI, coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,coup3, coup4L,coup4R, teil 
Complex(dp) :: D27m2, D0m2, vertex, phase 
Real(dp) :: cosW2, cosW2_Dr, chargefactor 
Iname = Iname+1
NameOfUnit(Iname) = "DeltaVB" 
MAh2 = MAh**2 
MCha2 = MCha**2 
MChi2 = MChi**2 
MFe2 = MFe**2 
MFv2 = MFv**2 
Mhh2 = Mhh**2 
MHpm2 = MHpm**2 
MSe2 = MSe**2 
MSvIm2 = MSvIm**2 
MSvRe2 = MSvRe**2 
MVWm2 = MVWm**2 
MVZp2 = MVZp**2 

 
 ! Fix neutrino phases 
 
Do i1=1,6
  phase=(1._dp,0._dp) 
  If (Abs(UVinput(i1,i1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,i1))/Abs(UVinput(i1,i1)) 
     Else If (Abs(UVinput(i1,1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,1))/Abs(UVinput(i1,1)) 
     Else If (Abs(UVinput(i1,2)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,2))/Abs(UVinput(i1,2)) 
     Else If (Abs(UVinput(i1,3)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,3))/Abs(UVinput(i1,3)) 
     Else If (Abs(UVinput(i1,4)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,4))/Abs(UVinput(i1,4)) 
     Else If (Abs(UVinput(i1,5)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,5))/Abs(UVinput(i1,5)) 
     Else If (Abs(UVinput(i1,6)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,6))/Abs(UVinput(i1,6)) 
  End If 
 UV(i1,:) = UVinput(i1,:)*phase 
End Do 
 
cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 4
Call CouplingFvFvAhT(gt1,gt2,gt3,Yx,Yv,ZA,UV,cplFvFvAhL(gt1,gt2,gt3),cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplFvChacSeL = 0._dp 
cplFvChacSeR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingFvChacSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,cplFvChacSeL(gt1,gt2,gt3)     & 
& ,cplFvChacSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvImL = 0._dp 
cplcFeChaSvImR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcFeChaSvImL(gt1,gt2,gt3)& 
& ,cplcFeChaSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvReL = 0._dp 
cplcFeChaSvReR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcFeChaSvReL(gt1,gt2,gt3)& 
& ,cplcFeChaSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvImL = 0._dp 
cplChiFvSvImR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvImT(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVI,ZN,UV,cplChiFvSvImL(gt1,gt2,gt3)& 
& ,cplChiFvSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvSvReL = 0._dp 
cplChiFvSvReR = 0._dp 
Do gt1 = 1, 7
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingChiFvSvReT(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Yx,Yv,ZVR,ZN,UV,cplChiFvSvReL(gt1,gt2,gt3)& 
& ,cplChiFvSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 7
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gBL,gYB,gBY,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 7
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplFvFecHpmL(gt1,gt2,gt3)      & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWmL = 0._dp 
cplFvFecVWmR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 3
Call CouplingFvFecVWmT(gt1,gt2,g2,UV,ZEL,cplFvFecVWmL(gt1,gt2),cplFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvImL = 0._dp 
cplcChaFeSvImR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvImT(gt1,gt2,gt3,g2,Ye,Yv,ZVI,UM,UP,ZEL,ZER,cplcChaFeSvImL(gt1,gt2,gt3)& 
& ,cplcChaFeSvImR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFeSvReL = 0._dp 
cplcChaFeSvReR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFeSvReT(gt1,gt2,gt3,g2,Ye,Yv,ZVR,UM,UP,ZEL,ZER,cplcChaFeSvReL(gt1,gt2,gt3)& 
& ,cplcChaFeSvReR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gBL,gYB,gBY,TW,TWp,cplcFeFeVZpL(gt1,gt2)         & 
& ,cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 4
Call CouplingFvFvhhT(gt1,gt2,gt3,Yx,Yv,ZH,UV,cplFvFvhhL(gt1,gt2,gt3),cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvVZpL = 0._dp 
cplFvFvVZpR = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingFvFvVZpT(gt1,gt2,g1,g2,gBL,gYB,gBY,UV,TW,TWp,cplFvFvVZpL(gt1,gt2)        & 
& ,cplFvFvVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,UV,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3)      & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFvSeL = 0._dp 
cplcChaFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingcChaFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,UM,UP,UV,cplcChaFvSeL(gt1,gt2,gt3)     & 
& ,cplcChaFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 6
Call CouplingcFeFvVWmT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 2
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplSvImcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvImcSeVWmT(gt1,gt2,g2,ZE,ZVI,cplSvImcSeVWm(gt1,gt2))

 End Do 
End Do 


cplSvRecSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvRecSeVWmT(gt1,gt2,g2,ZE,ZVR,cplSvRecSeVWm(gt1,gt2))

 End Do 
End Do 


cplcHpmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingcHpmVWmVZpT(gt1,g1,g2,gYB,vd,vu,ZP,TW,TWp,cplcHpmVWmVZp(gt1))

End Do 


cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



!-------------------------- 
!SM Contributions 
!-------------------------- 
cosW2 = 1._dp - sinW2 
cosW2_DR = 1._dp - sinW2_DR 
sumI = 6._dp & 
  & + Log(cosW2)*(3.5_dp - 2.5_dp *sinW2   & 
  & - sinW2_DR*(5._dp - 1.5_dp*cosW2/cosW2_DR))/sinW2   
res = sumI*g2**2*rho 
 
 
If (IncludeBSMdeltaVB) Then 
!-------------------------- 
!BSM  Contributions 
!-------------------------- 
teil = 0._dp 
 
Do gt1=1,6 
 Do gt2=1,6 
sumI = 0._dp 
 
If (mf_l2(2).gt. 0.5_dp*MFv2(gt2)) Then 
chargefactor = 1 
Do i1=1,4
  Do i2=1,6
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2R = Conjg(cplFvFvAhL(gt2,i2,i1))
coup2L = Conjg(cplFvFvAhR(gt2,i2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i2),MAh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,2
  Do i2=1,6
If ((MCha2(i1).gt.mf_l2(2)).Or.(MSe2(i2).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2R = Conjg(cplFvChacSeL(gt2,i1,i2))
coup2L = Conjg(cplFvChacSeR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MCha2(i1),MSe2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,7
  Do i2=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvIm2(i2).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2R = Conjg(cplChiFvSvImL(i1,gt2,i2))
coup2L = Conjg(cplChiFvSvImR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MChi2(i1),MSvIm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,7
  Do i2=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvRe2(i2).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2R = Conjg(cplChiFvSvReL(i1,gt2,i2))
coup2L = Conjg(cplChiFvSvReR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MChi2(i1),MSvRe2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,3
  Do i2=1,2
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2R = Conjg(cplFvFecHpmL(gt2,i1,i2))
coup2L = Conjg(cplFvFecHpmR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHpm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
  Do i2=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2R = Conjg(cplFvFvhhL(gt2,i1,i2))
coup2L = Conjg(cplFvFvhhR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),Mhh2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = Conjg(cplFvFvVZpL(gt2,i1))
coup2R = Conjg(cplFvFvVZpR(gt2,i1))
End if 
   End Do




chargefactor = 1 
Do i1=1,2
  Do i2=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2R = Conjg(cplcFeFvHpmL(i2,gt2,i1))
coup2L = Conjg(cplcFeFvHpmR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MHpm2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
  Do i2=1,2
If ((MSe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2))) Then
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2R = Conjg(cplcChaFvSeL(i2,gt2,i1))
coup2L = Conjg(cplcChaFvSeR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MCha2(i2),MSe2(i1))  
End if 
   End Do
  End Do




res = res + sumI*(UV(gt2,1)+UV(gt2,2)) 
End if 
End Do 
 
End Do 
 
Do gt1=1,2 
Do  gt2=1,3 
sumI = 0._dp 
 
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeAhL(i2,gt1,i1)
coup1R = cplcFeFeAhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFeAhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFeAhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MAh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,7
  Do i2=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSe2(i2).gt.mf_l2(2))) Then
coup1L = cplChiFecSeL(i1,gt1,i2)
coup1R = cplChiFecSeR(i1,gt1,i2)
coup2R = Conjg(cplChiFecSeL(i1,gt2,i2))
coup2L = Conjg(cplChiFecSeR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MChi2(i1),MSe2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
  Do i2=1,2
If ((MFv2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(i1,gt1,i2)
coup1R = cplFvFecHpmR(i1,gt1,i2)
coup2R = Conjg(cplFvFecHpmL(i1,gt2,i2))
coup2L = Conjg(cplFvFecHpmR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),MHpm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,4
  Do i2=1,3
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFehhL(i2,gt1,i1)
coup1R = cplcFeFehhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFehhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFehhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),Mhh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
  Do i2=1,2
If ((MSvIm2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2))) Then
coup1L = cplcChaFeSvImL(i2,gt1,i1)
coup1R = cplcChaFeSvImR(i2,gt1,i1)
coup2R = Conjg(cplcChaFeSvImL(i2,gt2,i1))
coup2L = Conjg(cplcChaFeSvImR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MCha2(i2),MSvIm2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,6
  Do i2=1,2
If ((MSvRe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2))) Then
coup1L = cplcChaFeSvReL(i2,gt1,i1)
coup1R = cplcChaFeSvReR(i2,gt1,i1)
coup2R = Conjg(cplcChaFeSvReL(i2,gt2,i1))
coup2L = Conjg(cplcChaFeSvReR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MCha2(i2),MSvRe2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
  Do i2=1,3
If ((MVZp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeVZpL(i2,gt1)
coup1R = cplcFeFeVZpR(i2,gt1)
coup2L = Conjg(cplcFeFeVZpL(i2,gt2))
coup2R = Conjg(cplcFeFeVZpR(i2,gt2))
End if 
  End Do




res = res + sumI 
End Do 
 
End Do 
 
vertex = 0._dp 
 
Do gt1=1,6 
 Do gt2=1,2 
chargefactor = 1 
Do i1= 1,4
  Do i2= 1,6
   Do i3= 1,3
  If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFv(i2)*MFe(i3)& 
& *C0_3m(MAh2(i1),MFv2(i2),MFe2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFv2(i2),MFe2(i3))-0.5_dp +MAh2(i1)*C0_3m(MAh2(i1),MFv2(i2),MFe2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,7
  Do i2= 1,6
   Do i3= 1,6
  If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvIm2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplcFeChiSeL(gt2,i1,i3)
coup2R = cplcFeChiSeR(gt2,i1,i3)
coup3 = cplSvImcSeVWm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MChi2(i1)*C0_3m(MChi2(i1),MSvIm2(i2),MSe2(i3)) + B0(0._dp,MSvIm2(i2),MSe2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,7
  Do i2= 1,6
   Do i3= 1,6
  If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvRe2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplcFeChiSeL(gt2,i1,i3)
coup2R = cplcFeChiSeR(gt2,i1,i3)
coup3 = cplSvRecSeVWm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MChi2(i1)*C0_3m(MChi2(i1),MSvRe2(i2),MSe2(i3)) + B0(0._dp,MSvRe2(i2),MSe2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,4
   Do i3= 1,2
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplAhcHpmVWm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFv2(i1)*C0_3m(MFv2(i1),MAh2(i2),MHpm2(i3)) + B0(0._dp,MAh2(i2),MHpm2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,4
   Do i3= 1,2
  If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplhhcHpmVWm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFv2(i1)*C0_3m(MFv2(i1),Mhh2(i2),MHpm2(i3)) + B0(0._dp,Mhh2(i2),MHpm2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
   Do i3= 1,2
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplcHpmVWmVZp(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MVWm2.gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(gt2,i1)
coup2R = cplcFeFvVWmR(gt2,i1)
coup3 = cplhhcVWmVWm(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,6
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MVWm2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplcFeFvVWmL(gt2,i1)
coup2R = cplcFeFvVWmR(gt2,i1)
coup3 = -cplcVWmVWmVZp
End if 
   End Do


chargefactor = 1 
Do i1= 1,4
  Do i2= 1,6
   Do i3= 1,3
  If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFv(i2)*MFe(i3)& 
& *C0_3m(Mhh2(i1),MFv2(i2),MFe2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFv2(i2),MFe2(i3))-0.5_dp +Mhh2(i1)*C0_3m(Mhh2(i1),MFv2(i2),MFe2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,7
   Do i3= 1,2
  If ((MSvIm2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcFeChaSvImL(gt2,i3,i1)
coup2R = cplcFeChaSvImR(gt2,i3,i1)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MChi(i2)*MCha(i3)& 
& *C0_3m(MSvIm2(i1),MChi2(i2),MCha2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MChi2(i2),MCha2(i3))-0.5_dp +MSvIm2(i1)*C0_3m(MSvIm2(i1),MChi2(i2),MCha2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,7
   Do i3= 1,2
  If ((MSvRe2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcFeChaSvReL(gt2,i3,i1)
coup2R = cplcFeChaSvReR(gt2,i3,i1)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MChi(i2)*MCha(i3)& 
& *C0_3m(MSvRe2(i1),MChi2(i2),MCha2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MChi2(i2),MCha2(i3))-0.5_dp +MSvRe2(i1)*C0_3m(MSvRe2(i1),MChi2(i2),MCha2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
  Do i2= 1,6
   Do i3= 1,3
  If ((MVZp2.gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i2)
coup1R = cplFvFvVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(gt2,i3)
coup2R = cplcFeFeVZpR(gt2,i3)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
End if 
  End Do
End Do


chargefactor = 1 
Do i1= 1,2
  Do i2= 1,6
   Do i3= 1,6
  If ((MCha2(i1).gt.mf_l2(2)).Or.(MSe2(i2).gt.mf_l2(2)).Or.(MSvIm2(i3).gt.mf_l2(2))) Then
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplcFeChaSvImL(gt2,i1,i3)
coup2R = cplcFeChaSvImR(gt2,i1,i3)
coup3 = -cplSvImcSeVWm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MCha2(i1)*C0_3m(MCha2(i1),MSe2(i2),MSvIm2(i3)) + B0(0._dp,MSe2(i2),MSvIm2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,2
  Do i2= 1,6
   Do i3= 1,6
  If ((MCha2(i1).gt.mf_l2(2)).Or.(MSe2(i2).gt.mf_l2(2)).Or.(MSvRe2(i3).gt.mf_l2(2))) Then
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplcFeChaSvReL(gt2,i1,i3)
coup2R = cplcFeChaSvReR(gt2,i1,i3)
coup3 = -cplSvRecSeVWm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MCha2(i1)*C0_3m(MCha2(i1),MSe2(i2),MSvRe2(i3)) + B0(0._dp,MSe2(i2),MSvRe2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,2
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
coup3 = -cplAhcHpmVWm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHpm2(i2),MAh2(i3)) + B0(0._dp,MHpm2(i2),MAh2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,2
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = -cplhhcHpmVWm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHpm2(i2),Mhh2(i3)) + B0(0._dp,MHpm2(i2),Mhh2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWm2.gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = cplhhcVWmVWm(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,2
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFeVZpL(gt2,i1)
coup2R = cplcFeFeVZpR(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWm2.gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplcFeFeVZpL(gt2,i1)
coup2R = cplcFeFeVZpR(gt2,i1)
coup3 = cplcVWmVWmVZp
End if 
   End Do


chargefactor = 1 
Do i1= 1,2
  Do i2= 1,3
   Do i3= 1,6
  If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(gt2,i3,i1)
coup2R = cplcFeFvHpmR(gt2,i3,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFe(i2)*MFv(i3)& 
& *C0_3m(MHpm2(i1),MFe2(i2),MFv2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFe2(i2),MFv2(i3))-0.5_dp +MHpm2(i1)*C0_3m(MHpm2(i1),MFe2(i2),MFv2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,6
  Do i2= 1,2
   Do i3= 1,7
  If ((MSe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2)).Or.(MChi2(i3).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(gt2,i3,i1)
coup2R = cplcFeChiSeR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MCha(i2)*MChi(i3)& 
& *C0_3m(MSe2(i1),MCha2(i2),MChi2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MCha2(i2),MChi2(i3))-0.5_dp +MSe2(i1)*C0_3m(MSe2(i1),MCha2(i2),MChi2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
  Do i2= 1,3
   Do i3= 1,6
  If ((MVWm2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(gt2,i3)
coup2R = cplcFeFvVWmR(gt2,i3)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
End if 
  End Do
End Do


 End Do 
 
End Do 
 
res = res + vertex/g2 
Do gt1=1,6 
 Do gt2=1,6 
gt3 = 2 
gt4 = 1 
! Cha,Se,Chi,Se
chargefactor = 1 
Do i1=1,2
  Do i2=1,6
    Do i3=1,7
      Do i4=1,6
If ((MCha2(i1).gt.mf_l2(2)).Or.(MSe2(i2).gt.mf_l2(2)).Or.(MChi2(i3).gt.mf_l2(2)).Or.(MSe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i1,i4)
coup1R = cplFvChacSeR(gt1,i1,i4)
coup2L = cplcChaFvSeL(i1,gt2,i2)
coup2R = cplcChaFvSeR(i1,gt2,i2)
coup3L = cplChiFecSeL(i3,gt3,i2)
coup3R = cplChiFecSeR(i3,gt3,i2)
coup4L = cplcFeChiSeL(gt4,i3,i4)
coup4R = cplcFeChiSeR(gt4,i3,i4)
D27m2 = D27_Bagger(MSe2(i2),MSe2(i4),MCha2(i1),MChi2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Chi,SvIm,bar[Cha],SvIm
chargefactor = 1 
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvIm2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2)).Or.(MSvIm2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i1,gt1,i4)
coup1R = cplChiFvSvImR(i1,gt1,i4)
coup2L = cplChiFvSvImL(i1,gt2,i2)
coup2R = cplChiFvSvImR(i1,gt2,i2)
coup3L = cplcChaFeSvImL(i3,gt3,i2)
coup3R = cplcChaFeSvImR(i3,gt3,i2)
coup4L = cplcFeChaSvImL(gt4,i3,i4)
coup4R = cplcFeChaSvImR(gt4,i3,i4)
D27m2 = D27_Bagger(MSvIm2(i2),MSvIm2(i4),MChi2(i1),MCha2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Chi,SvIm,bar[Cha],SvRe
chargefactor = 1 
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvIm2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2)).Or.(MSvRe2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i1,gt1,i4)
coup1R = cplChiFvSvReR(i1,gt1,i4)
coup2L = cplChiFvSvImL(i1,gt2,i2)
coup2R = cplChiFvSvImR(i1,gt2,i2)
coup3L = cplcChaFeSvImL(i3,gt3,i2)
coup3R = cplcChaFeSvImR(i3,gt3,i2)
coup4L = cplcFeChaSvReL(gt4,i3,i4)
coup4R = cplcFeChaSvReR(gt4,i3,i4)
D27m2 = D27_Bagger(MSvIm2(i2),MSvRe2(i4),MChi2(i1),MCha2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Chi,SvRe,bar[Cha],SvIm
chargefactor = 1 
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvRe2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2)).Or.(MSvIm2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i1,gt1,i4)
coup1R = cplChiFvSvImR(i1,gt1,i4)
coup2L = cplChiFvSvReL(i1,gt2,i2)
coup2R = cplChiFvSvReR(i1,gt2,i2)
coup3L = cplcChaFeSvReL(i3,gt3,i2)
coup3R = cplcChaFeSvReR(i3,gt3,i2)
coup4L = cplcFeChaSvImL(gt4,i3,i4)
coup4R = cplcFeChaSvImR(gt4,i3,i4)
D27m2 = D27_Bagger(MSvRe2(i2),MSvIm2(i4),MChi2(i1),MCha2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Chi,SvRe,bar[Cha],SvRe
chargefactor = 1 
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MChi2(i1).gt.mf_l2(2)).Or.(MSvRe2(i2).gt.mf_l2(2)).Or.(MCha2(i3).gt.mf_l2(2)).Or.(MSvRe2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i1,gt1,i4)
coup1R = cplChiFvSvReR(i1,gt1,i4)
coup2L = cplChiFvSvReL(i1,gt2,i2)
coup2R = cplChiFvSvReR(i1,gt2,i2)
coup3L = cplcChaFeSvReL(i3,gt3,i2)
coup3R = cplcChaFeSvReR(i3,gt3,i2)
coup4L = cplcFeChaSvReL(gt4,i3,i4)
coup4R = cplcFeChaSvReR(gt4,i3,i4)
D27m2 = D27_Bagger(MSvRe2(i2),MSvRe2(i4),MChi2(i1),MCha2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fe,Hpm,Fv,Hpm
chargefactor = 1 
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MHpm2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i1,i4)
coup1R = cplFvFecHpmR(gt1,i1,i4)
coup2L = cplcFeFvHpmL(i1,gt2,i2)
coup2R = cplcFeFvHpmR(i1,gt2,i2)
coup3L = cplFvFecHpmL(i3,gt3,i2)
coup3R = cplFvFecHpmR(i3,gt3,i2)
coup4L = cplcFeFvHpmL(gt4,i3,i4)
coup4R = cplcFeFvHpmR(gt4,i3,i4)
D27m2 = D27_Bagger(MHpm2(i2),MHpm2(i4),MFe2(i1),MFv2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,Ah,bar[Fe],Ah
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,Ah,bar[Fe],hh
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,Ah,bar[Fe],VZp
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 


 ! Fv,hh,bar[Fe],Ah
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,hh,bar[Fe],hh
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,hh,bar[Fe],VZp
chargefactor = 1 
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 


 ! Fv,VZp,bar[Fe],Ah
chargefactor = 1 
Do i1=1,6
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 


 ! Fv,VZp,bar[Fe],hh
chargefactor = 1 
Do i1=1,6
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 


 ! Fv,VZp,bar[Fe],VZp
chargefactor = 1 
Do i1=1,6
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
coup4L = cplcFeFeVZpL(gt4,i3)
coup4R = cplcFeFeVZpR(gt4,i3)
End if 
    End Do 
  End Do 


 ! Ah,Fv,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplFvFvAhL(gt2,i2,i1)
coup2R = cplFvFvAhR(gt2,i2,i1)
coup3L = cplcFeFvHpmL(gt4,i2,i3)
coup3R = cplcFeFvHpmR(gt4,i2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(MAh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(MAh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! hh,Fv,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
      Do i4=1,6
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplFvFvhhL(gt2,i2,i1)
coup2R = cplFvFvhhR(gt2,i2,i1)
coup3L = cplcFeFvHpmL(gt4,i2,i3)
coup3R = cplcFeFvHpmR(gt4,i2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(Mhh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(Mhh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! SvIm,Chi,Se,Chi
chargefactor = 1 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
      Do i4=1,7
If ((MSvIm2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2)).Or.(MChi2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i4,gt1,i1)
coup1R = cplChiFvSvImR(i4,gt1,i1)
coup2L = cplChiFvSvImL(i2,gt2,i1)
coup2R = cplChiFvSvImR(i2,gt2,i1)
coup3L = cplcFeChiSeL(gt4,i2,i3)
coup3R = cplcFeChiSeR(gt4,i2,i3)
coup4L = cplChiFecSeL(i4,gt3,i3)
coup4R = cplChiFecSeR(i4,gt3,i3)
D0m2 = D0_Bagger(MSvIm2(i1),MSe2(i3),MChi2(i2),MChi2(i4))*MChi(i2)*MChi(i4) 
D27m2 = D27_Bagger(MSvIm2(i1),MSe2(i3),MChi2(i2),MChi2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! SvRe,Chi,Se,Chi
chargefactor = 1 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
      Do i4=1,7
If ((MSvRe2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2)).Or.(MChi2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i4,gt1,i1)
coup1R = cplChiFvSvReR(i4,gt1,i1)
coup2L = cplChiFvSvReL(i2,gt2,i1)
coup2R = cplChiFvSvReR(i2,gt2,i1)
coup3L = cplcFeChiSeL(gt4,i2,i3)
coup3R = cplcFeChiSeR(gt4,i2,i3)
coup4L = cplChiFecSeL(i4,gt3,i3)
coup4R = cplChiFecSeR(i4,gt3,i3)
D0m2 = D0_Bagger(MSvRe2(i1),MSe2(i3),MChi2(i2),MChi2(i4))*MChi(i2)*MChi(i4) 
D27m2 = D27_Bagger(MSvRe2(i1),MSe2(i3),MChi2(i2),MChi2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],bar[Fe],Ah,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,3
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFeAhL(gt4,i2,i3)
coup3R = cplcFeFeAhR(gt4,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),MAh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHpm2(i1),MAh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],bar[Fe],hh,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,3
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFehhL(gt4,i2,i3)
coup3R = cplcFeFehhR(gt4,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHpm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],bar[Fe],VZp,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,3
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFeVZpL(gt4,i2)
coup3R = cplcFeFeVZpR(gt4,i2)
coup4L = cplcFeFeVZpL(i4,gt3)
coup4R = cplcFeFeVZpR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! conj[Se],bar[Cha],SvIm,bar[Cha]
chargefactor = 1 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MSe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2)).Or.(MSvIm2(i3).gt.mf_l2(2)).Or.(MCha2(i4).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i4,i1)
coup1R = cplFvChacSeR(gt1,i4,i1)
coup2L = cplcChaFvSeL(i2,gt2,i1)
coup2R = cplcChaFvSeR(i2,gt2,i1)
coup3L = cplcFeChaSvImL(gt4,i2,i3)
coup3R = cplcFeChaSvImR(gt4,i2,i3)
coup4L = cplcChaFeSvImL(i4,gt3,i3)
coup4R = cplcChaFeSvImR(i4,gt3,i3)
D0m2 = D0_Bagger(MSe2(i1),MSvIm2(i3),MCha2(i2),MCha2(i4))*MCha(i2)*MCha(i4) 
D27m2 = D27_Bagger(MSe2(i1),MSvIm2(i3),MCha2(i2),MCha2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Se],bar[Cha],SvRe,bar[Cha]
chargefactor = 1 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
      Do i4=1,2
If ((MSe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2)).Or.(MSvRe2(i3).gt.mf_l2(2)).Or.(MCha2(i4).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i4,i1)
coup1R = cplFvChacSeR(gt1,i4,i1)
coup2L = cplcChaFvSeL(i2,gt2,i1)
coup2R = cplcChaFvSeR(i2,gt2,i1)
coup3L = cplcFeChaSvReL(gt4,i2,i3)
coup3R = cplcFeChaSvReR(gt4,i2,i3)
coup4L = cplcChaFeSvReL(i4,gt3,i3)
coup4R = cplcChaFeSvReR(i4,gt3,i3)
D0m2 = D0_Bagger(MSe2(i1),MSvRe2(i3),MCha2(i2),MCha2(i4))*MCha(i2)*MCha(i4) 
D27m2 = D27_Bagger(MSe2(i1),MSvRe2(i3),MCha2(i2),MCha2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Ah,Fe,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,2
      Do i4=1,6
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplcFeFeAhL(gt4,i2,i1)
coup2R = cplcFeFeAhR(gt4,i2,i1)
coup3L = cplcFeFvHpmL(i2,gt2,i3)
coup3R = cplcFeFvHpmR(i2,gt2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(MAh2(i1),MHpm2(i3),MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! hh,Fe,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,2
      Do i4=1,6
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplcFeFehhL(gt4,i2,i1)
coup2R = cplcFeFehhR(gt4,i2,i1)
coup3L = cplcFeFvHpmL(i2,gt2,i3)
coup3R = cplcFeFvHpmR(i2,gt2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(Mhh2(i1),MHpm2(i3),MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! SvIm,Cha,Se,Chi
chargefactor = 1 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
      Do i4=1,7
If ((MSvIm2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2)).Or.(MChi2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvImL(i4,gt1,i1)
coup1R = cplChiFvSvImR(i4,gt1,i1)
coup2L = cplcFeChaSvImL(gt4,i2,i1)
coup2R = cplcFeChaSvImR(gt4,i2,i1)
coup3L = cplcChaFvSeL(i2,gt2,i3)
coup3R = cplcChaFvSeR(i2,gt2,i3)
coup4L = cplChiFecSeL(i4,gt3,i3)
coup4R = cplChiFecSeR(i4,gt3,i3)
D0m2 = D0_Bagger(MSvIm2(i1),MSe2(i3),MCha2(i2),MChi2(i4))*MCha(i2)*MChi(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! SvRe,Cha,Se,Chi
chargefactor = 1 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
      Do i4=1,7
If ((MSvRe2(i1).gt.mf_l2(2)).Or.(MCha2(i2).gt.mf_l2(2)).Or.(MSe2(i3).gt.mf_l2(2)).Or.(MChi2(i4).gt.mf_l2(2))) Then
coup1L = cplChiFvSvReL(i4,gt1,i1)
coup1R = cplChiFvSvReR(i4,gt1,i1)
coup2L = cplcFeChaSvReL(gt4,i2,i1)
coup2R = cplcFeChaSvReR(gt4,i2,i1)
coup3L = cplcChaFvSeL(i2,gt2,i3)
coup3R = cplcChaFvSeR(i2,gt2,i3)
coup4L = cplChiFecSeL(i4,gt3,i3)
coup4R = cplChiFecSeR(i4,gt3,i3)
D0m2 = D0_Bagger(MSvRe2(i1),MSe2(i3),MCha2(i2),MChi2(i4))*MCha(i2)*MChi(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],Fv,Ah,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvAhL(gt2,i2,i3)
coup3R = cplFvFvAhR(gt2,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),MAh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],Fv,hh,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvhhL(gt2,i2,i3)
coup3R = cplFvFvhhR(gt2,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),Mhh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],Fv,VZp,bar[Fe]
chargefactor = 1 
Do i1=1,2
  Do i2=1,6
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MVZp2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvVZpL(gt2,i2)
coup3R = cplFvFvVZpR(gt2,i2)
coup4L = cplcFeFeVZpL(i4,gt3)
coup4R = cplcFeFeVZpR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! conj[Se],Chi,SvIm,bar[Cha]
chargefactor = 1 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
      Do i4=1,2
If ((MSe2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MSvIm2(i3).gt.mf_l2(2)).Or.(MCha2(i4).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i4,i1)
coup1R = cplFvChacSeR(gt1,i4,i1)
coup2L = cplcFeChiSeL(gt4,i2,i1)
coup2R = cplcFeChiSeR(gt4,i2,i1)
coup3L = cplChiFvSvImL(i2,gt2,i3)
coup3R = cplChiFvSvImR(i2,gt2,i3)
coup4L = cplcChaFeSvImL(i4,gt3,i3)
coup4R = cplcChaFeSvImR(i4,gt3,i3)
D0m2 = D0_Bagger(MSe2(i1),MSvIm2(i3),MChi2(i2),MCha2(i4))*MChi(i2)*MCha(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Se],Chi,SvRe,bar[Cha]
chargefactor = 1 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
      Do i4=1,2
If ((MSe2(i1).gt.mf_l2(2)).Or.(MChi2(i2).gt.mf_l2(2)).Or.(MSvRe2(i3).gt.mf_l2(2)).Or.(MCha2(i4).gt.mf_l2(2))) Then
coup1L = cplFvChacSeL(gt1,i4,i1)
coup1R = cplFvChacSeR(gt1,i4,i1)
coup2L = cplcFeChiSeL(gt4,i2,i1)
coup2R = cplcFeChiSeR(gt4,i2,i1)
coup3L = cplChiFvSvReL(i2,gt2,i3)
coup3R = cplChiFvSvReR(i2,gt2,i3)
coup4L = cplcChaFeSvReL(i4,gt3,i3)
coup4R = cplcChaFeSvReR(i4,gt3,i3)
D0m2 = D0_Bagger(MSe2(i1),MSvRe2(i3),MChi2(i2),MCha2(i4))*MChi(i2)*MCha(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


  End Do 
 
End Do 
 

 
sumI = -2._dp*cosW2_DR*mz2*Real(teil,dp)/g2**2 
res = res + SumI 
End if ! BSM part 
res = res*oo16pi2 
Iname = Iname-1
End subroutine DeltaVB 
 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratCha,ratFd,ratFe,ratFu,ratHpm,              & 
& ratSd,ratSe,ratSu,ratVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Real(dp),Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVWm

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(-1)**2*ratVWm*A_one(mH2p/MVWm**2)
HPPloopVWm(inG) = HPPloopVWm(inG)+1*(-1)**2*ratVWm*A_one(mH2p/MVWm**2)
Do i1 = 1 , 6
coup = coup + cNLO_zero(mHiggs,MSd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratSd(i1)*A_zero(mH2p/MSd(i1)**2)
HPPloopSd(i1,inG) = HPPloopSd(i1,inG) + cNLO_zero(mHiggs,MSd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratSd(i1)*A_zero(mH2p/MSd(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + cNLO_zero(mHiggs,MSu(i1),gNLO)*3*(2._dp/3._dp)**2*ratSu(i1)*A_zero(mH2p/MSu(i1)**2)
HPPloopSu(i1,inG) = HPPloopSu(i1,inG) + cNLO_zero(mHiggs,MSu(i1),gNLO)*3*(2._dp/3._dp)**2*ratSu(i1)*A_zero(mH2p/MSu(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + 1*(-1)**2*ratSe(i1)*A_zero(mH2p/MSe(i1)**2)
HPPloopSe(i1,inG) = HPPloopSe(i1,inG)+1*(-1)**2*ratSe(i1)*A_zero(mH2p/MSe(i1)**2)
End Do 
Do i1 = 2 , 2
coup = coup + 1*(-1)**2*ratHpm(i1)*A_zero(mH2p/MHpm(i1)**2)
HPPloopHpm(i1,inG) = HPPloopHpm(i1,inG)+1*(-1)**2*ratHpm(i1)*A_zero(mH2p/MHpm(i1)**2)
End Do 
Do i1 = 1 , 2
coup = coup + 1*(-1)**2*ratCha(i1)*A_onehalf(mH2p/MCha(i1)**2)
HPPloopCha(i1,inG) = HPPloopCha(i1,inG)+1*(-1)**2*ratCha(i1)*A_onehalf(mH2p/MCha(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1,inG) = HPPloopFe(i1,inG)+1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,ratSd,ratSu,MFd,MFu,               & 
& MSd,MSu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3),ratSd(6),ratSu(6)

Real(dp),Intent(in) :: MFd(3),MFu(3),MSd(6),MSu(6)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 6
coup = coup + 1*ratSd(i1)*A_zero(mH2p/MSd(i1)**2)
End Do 
Do i1 = 1 , 6
coup = coup + 1*ratSu(i1)*A_zero(mH2p/MSu(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,              & 
& MVWm,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVWm

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(-1)**2*A_one(mH2p/MVWm**2)
Do i1 =1, 3 
coup = coup + 1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,MSd,MSu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3),MSd(6),MSu(6)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratCha,ratFd,ratFe,ratFu,               & 
& ratHpm,ratSd,ratSe,ratSu,ratVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Real(dp),Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVWm

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 2
coup = coup + cANLO_onehalf(mHiggs,MCha(i1),gNLO)*1*(-1)**2*ratCha(i1)*AP_onehalf(mH2p/MCha(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,ratSd,ratSu,MFd,             & 
& MFu,MSd,MSu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3),ratSd(6),ratSu(6)

Real(dp),Intent(in) :: MFd(3),MFu(3),MSd(6),MSu(6)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,            & 
& MSu,MVWm,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MCha(2),MFd(3),MFe(3),MFu(3),MHpm(2),MSd(6),MSe(6),MSu(6),MVWm

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,MSd,MSu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3),MSd(6),MSu(6)

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluonSM 

Complex(dp) Function cNLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cNLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_onehalf = 1._dp - oo4pi2*g**2  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cNLO_onehalf = 1._dp 
  End if 
End if 
End Function cNLO_onehalf 
 
Complex(dp) Function cANLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cANLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cANLO_onehalf = 1._dp  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cANLO_onehalf = 1._dp 
  End if 
End if 
End Function cANLO_onehalf 
 
Real(dp) Function cNLO_zero(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
If (g.lt.0._dp) Then 
   cNLO_zero= 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_zero = 1._dp + 2._dp*oo3pi2*g**2  
  Else  
    cNLO_zero = 1._dp 
  End if 
End if 
End Function cNLO_zero 
End Module LoopCouplings_BLSSM 
 
