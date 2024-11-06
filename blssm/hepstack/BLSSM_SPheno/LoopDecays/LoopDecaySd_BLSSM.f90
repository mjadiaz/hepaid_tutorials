! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:55 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Sd_BLSSM
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_BLSSM 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_BLSSM_SdToSdAh(cplAhSdcSd,MAh,MSd,MAh2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MSd(6),MAh2(4),MSd2(6)

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6)

Complex(dp) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSdcSd(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSdAh


Subroutine Gamma_Real_BLSSM_SdToSdAh(MLambda,em,gs,cplAhSdcSd,MAh,MSd,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6)

Real(dp), Intent(in) :: MAh(4),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,4
Coup = cplAhSdcSd(i3,i2,i1)
Mex1 = MSd(i1)
Mex2 = MSd(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSdAh


Subroutine Amplitude_WAVE_BLSSM_SdToSdAh(cplAhSdcSd,ctcplAhSdcSd,MAh,MAh2,            & 
& MSd,MSd2,ZfAh,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MAh2(4),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6)

Complex(dp), Intent(in) :: ctcplAhSdcSd(4,6,6)

Complex(dp), Intent(in) :: ZfAh(4,4),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSdcSd(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplAhSdcSd(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplAhSdcSd(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSdcSd(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdAh


Subroutine Amplitude_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvReSvRe,             & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFuFuAhL(3,3,4),          & 
& cplcFuFuAhR(3,3,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),  & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),cplChaFucSdL(2,3,6),       & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),            & 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(4,4,6,6),        & 
& cplAhHpmSucSdaa(4,2,6,6),cplAhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),         & 
& cplSdSdcSdcSdabba(6,6,6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),     & 
& cplSdSvReSvRecSdaa(6,6,6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MAh(gt3) 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i2,i3,gt3)
coup3R = cplcFuFuAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplAhhhVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = cplAhhhVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSdcSucVWm(gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSdcSdVG(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSdcSdVP(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = -cplSdcSucVWm(gt2,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = -cplSdcSdVZ(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = -cplSdcSdVZp(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhAhSdcSdaa(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplAhSdcHpmcSuaa(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhAhSdcSdaa(gt3,i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplAhHpmSucSdaa(gt3,i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSdcHpmcSdaa(i1,gt2,i2,gt1)
coup2 = cplAhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSdcSdcSdabba(gt2,i1,gt1,i2)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSdcSdcSdabab(gt2,i1,gt1,i2)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSdSecSdcSeaa(gt2,i1,gt1,i2)
coup2 = cplAhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSdSucSdcSuabba(gt2,i1,gt1,i2)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSucSdcSuabab(gt2,i1,gt1,i2)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {SvIm, SvIm}
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSdSvImSvImcSdaa(gt2,i1,i2,gt1)
coup2 = cplAhSvImSvIm(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSdSvReSvRecSdaa(gt2,i1,i2,gt1)
coup2 = cplAhSvReSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdAh


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdAh(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,        & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,         & 
& cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhHpmSucSdaa,    & 
& cplAhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFuFuAhL(3,3,4),          & 
& cplcFuFuAhR(3,3,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),  & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),cplChaFucSdL(2,3,6),       & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),            & 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplAhAhSdcSdaa(4,4,6,6),        & 
& cplAhHpmSucSdaa(4,2,6,6),cplAhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),         & 
& cplSdSdcSdcSdabba(6,6,6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),     & 
& cplSdSvReSvRecSdaa(6,6,6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MAh(gt3) 


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplAhhhVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSdcSdVG(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSdcSdVP(gt2,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdAh


Subroutine Amplitude_Tree_BLSSM_SdToFuCha(cplChaFucSdL,cplChaFucSdR,MCha,             & 
& MFu,MSd,MCha2,MFu2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6),MCha2(2),MFu2(3),MSd2(6)

Complex(dp), Intent(in) :: cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Complex(dp) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplChaFucSdL(gt3,gt2,gt1)
coupT1R = cplChaFucSdR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToFuCha


Subroutine Gamma_Real_BLSSM_SdToFuCha(MLambda,em,gs,cplChaFucSdL,cplChaFucSdR,        & 
& MCha,MFu,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,2), GammarealGluon(6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
CoupL = cplChaFucSdL(i3,i2,i1)
CoupR = cplChaFucSdR(i3,i2,i1)
Mex1 = MSd(i1)
Mex2 = MFu(i2)
Mex3 = MCha(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,-2._dp/9._dp,1._dp/3._dp,4._dp/9._dp,-2._dp/3._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToFuCha


Subroutine Amplitude_WAVE_BLSSM_SdToFuCha(cplChaFucSdL,cplChaFucSdR,ctcplChaFucSdL,   & 
& ctcplChaFucSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,ZfLm,ZfLp,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFu(3),MFu2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Complex(dp), Intent(in) :: ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChaFucSdL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChaFucSdR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplChaFucSdL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplChaFucSdR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt2)*cplChaFucSdL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt2))*cplChaFucSdR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplChaFucSdL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplChaFucSdR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToFuCha


Subroutine Amplitude_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,       & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,           & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,             & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),      & 
& cplAhSdcSd(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcChaChaVPL(2,2),       & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),             & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),& 
& cplcFuFuVZpR(3,3),cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MCha(gt3) 


! {Ah, conj[Sd], bar[Fu]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2L = cplcFuFuAhL(i3,gt2,i1)
coup2R = cplcFuFuAhR(i3,gt2,i1)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], conj[Su]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
coup3L = cplcFdChaSuL(i2,gt3,i3)
coup3R = cplcFdChaSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Hpm}
Do i1=1,3
  Do i2=1,7
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdFuHpmL(i1,gt2,i3)
coup2R = cplcFdFuHpmR(i1,gt2,i3)
coup3L = cplChiChacHpmL(i2,gt3,i3)
coup3R = cplChiChacHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, VWm}
Do i1=1,3
  Do i2=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MVWm 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = -cplcFdFuVWmR(i1,gt2)
coup2R = -cplcFdFuVWmL(i1,gt2)
coup3L = cplChiChacVWmL(i2,gt3)
coup3R = cplChiChacVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, bar[Cha], Ah}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,gt2,i3)
coup2R = cplcFuFuAhR(i1,gt2,i3)
coup3L = cplcChaChaAhL(i2,gt3,i3)
coup3R = cplcChaChaAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = Mhh(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3L = cplcChaChahhL(i2,gt3,i3)
coup3R = cplcChaChahhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3L = cplcChaChaVPL(i2,gt3)
coup3R = cplcChaChaVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, bar[Cha], VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MVZ 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3L = cplcChaChaVZL(i2,gt3)
coup3R = cplcChaChaVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, bar[Cha], VZp}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MVZp 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = -cplcFuFuVZpR(i1,gt2)
coup2R = -cplcFuFuVZpL(i1,gt2)
coup3L = cplcChaChaVZpL(i2,gt3)
coup3R = cplcChaChaVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Glu, bar[Fd], conj[Su]}
  Do i2=1,3
    Do i3=1,6
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MSu(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplGluFucSuL(gt2,i3)
coup2R = cplGluFucSuR(gt2,i3)
coup3L = cplcFdChaSuL(i2,gt3,i3)
coup3R = cplcFdChaSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], bar[Fu]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, Cha}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i3,gt3,i2)
coup3R = cplcChaChaAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Cha}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChahhL(i3,gt3,i2)
coup3R = cplcChaChahhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i3,gt3)
coup3R = cplcChaChaVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MCha(i3) 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i3,gt3)
coup3R = cplcChaChaVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i3,gt3,i2)
coup3R = cplChiChacHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = -cplSucSdVWm(i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i3,gt3)
coup3R = cplChiChacVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVP(i2,gt1)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVZ(i2,gt1)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVZp(i2,gt1)
coup2L = -cplcFuFuVZpR(i3,gt2)
coup2R = -cplcFuFuVZpL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToFuCha


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToFuCha(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,       & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,           & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSdcSd,             & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),      & 
& cplAhSdcSd(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcChaChaVPL(2,2),       & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),             & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),& 
& cplcFuFuVZpR(3,3),cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),& 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MCha(gt3) 


! {Fu, bar[Cha], VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MVP 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3L = cplcChaChaVPL(i2,gt3)
coup3R = cplcChaChaVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MFu(i3) 
coup1 = -cplSdcSdVP(i2,gt1)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplChaFucSdL(gt3,i3,i2)
coup3R = cplChaFucSdR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToFuCha


Subroutine Amplitude_Tree_BLSSM_SdToFdChi(cplChiFdcSdL,cplChiFdcSdR,MChi,             & 
& MFd,MSd,MChi2,MFd2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFd(3),MSd(6),MChi2(7),MFd2(3),MSd2(6)

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Complex(dp) :: Amp(2,6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,7
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFdcSdL(gt3,gt2,gt1)
coupT1R = cplChiFdcSdR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToFdChi


Subroutine Gamma_Real_BLSSM_SdToFdChi(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,        & 
& MChi,MFd,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp), Intent(in) :: MChi(7),MFd(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,7), GammarealGluon(6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
CoupL = cplChiFdcSdL(i3,i2,i1)
CoupR = cplChiFdcSdR(i3,i2,i1)
Mex1 = MSd(i1)
Mex2 = MFd(i2)
Mex3 = MChi(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToFdChi


Subroutine Amplitude_WAVE_BLSSM_SdToFdChi(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL,   & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFd(3),MFd2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Complex(dp), Intent(in) :: ctcplChiFdcSdL(7,3,6),ctcplChiFdcSdR(7,3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZfL0(7,7),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,7
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFdcSdL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFdcSdR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplChiFdcSdL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplChiFdcSdR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt2)*cplChiFdcSdL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt2))*cplChiFdcSdR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFdcSdL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFdcSdR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToFdChi


Subroutine Amplitude_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,     & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,      & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),        & 
& cplAhSdcSd(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),     & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),     & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),  & 
& cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,7
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MChi(gt3) 


! {Ah, conj[Sd], bar[Fd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], conj[Su]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3L = cplcFuChiSuL(i2,gt3,i3)
coup3R = cplcFuChiSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], conj[Sd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3L = cplcFdChiSdL(i2,gt3,i3)
coup3R = cplcFdChiSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Ah}
Do i1=1,3
  Do i2=1,7
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
coup3L = cplChiChiAhL(gt3,i2,i3)
coup3R = cplChiChiAhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, hh}
Do i1=1,3
  Do i2=1,7
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3L = cplChiChihhL(gt3,i2,i3)
coup3R = cplChiChihhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, VP}
Do i1=1,3
  Do i2=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MVP 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3L = -cplChiChiVPR(gt3,i2)
coup3R = -cplChiChiVPL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Chi, VZ}
Do i1=1,3
  Do i2=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3L = -cplChiChiVZR(gt3,i2)
coup3R = -cplChiChiVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Chi, VZp}
Do i1=1,3
  Do i2=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MVZp 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
coup3L = -cplChiChiVZpR(gt3,i2)
coup3R = -cplChiChiVZpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, bar[Cha], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuFdcHpmL(i1,gt2,i3)
coup2R = cplcFuFdcHpmR(i1,gt2,i3)
coup3L = cplcChaChiHpmL(i2,gt3,i3)
coup3R = cplcChaChiHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = -cplcFuFdcVWmR(i1,gt2)
coup2R = -cplcFuFdcVWmL(i1,gt2)
coup3L = cplcChaChiVWmL(i2,gt3)
coup3R = cplcChaChiVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Glu, bar[Fd], conj[Sd]}
  Do i2=1,3
    Do i3=1,6
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplGluFdcSdL(gt2,i3)
coup2R = cplGluFdcSdR(gt2,i3)
coup3L = cplcFdChiSdL(i2,gt3,i3)
coup3R = cplcFdChiSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], bar[Fd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], bar[Fu]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2L = cplcFuFdcHpmL(i3,gt2,i1)
coup2R = cplcFuFdcHpmR(i3,gt2,i1)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, Chi}
Do i1=1,6
  Do i2=1,4
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = cplChiChiAhL(gt3,i3,i2)
coup3R = cplChiChiAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Chi}
Do i1=1,6
  Do i2=1,4
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = cplChiChihhL(gt3,i3,i2)
coup3R = cplChiChihhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MChi(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = -cplChiChiVPR(gt3,i3)
coup3R = -cplChiChiVPL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = -cplChiChiVZR(gt3,i3)
coup3R = -cplChiChiVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MChi(i3) 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = -cplChiChiVZpR(gt3,i3)
coup3R = -cplChiChiVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2L = cplcChaFdcSuL(i3,gt2,i1)
coup2R = cplcChaFdcSuR(i3,gt2,i1)
coup3L = cplChiChacHpmL(gt3,i3,i2)
coup3R = cplChiChacHpmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], bar[Cha]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSucSdVWm(i1,gt1)
coup2L = cplcChaFdcSuL(i3,gt2,i1)
coup2R = cplcChaFdcSuR(i3,gt2,i1)
coup3L = -cplChiChacVWmR(gt3,i3)
coup3R = -cplChiChacVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVP(i2,gt1)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSdVWm(i2,gt1)
coup2L = -cplcFuFdcVWmR(i3,gt2)
coup2R = -cplcFuFdcVWmL(i3,gt2)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVZ(i2,gt1)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVZp(i2,gt1)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToFdChi


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToFdChi(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,     & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,      & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),        & 
& cplAhSdcSd(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),     & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),     & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),  & 
& cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,7
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MChi(gt3) 


! {Fd, Chi, VP}
Do i1=1,3
  Do i2=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MVP 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3L = -cplChiChiVPR(gt3,i2)
coup3R = -cplChiChiVPL(gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MChi(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = -cplChiChiVPR(gt3,i3)
coup3R = -cplChiChiVPL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVP(i2,gt1)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplChiFdcSdL(gt3,i3,i2)
coup3R = cplChiFdcSdR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToFdChi


Subroutine Amplitude_Tree_BLSSM_SdToGluFd(cplGluFdcSdL,cplGluFdcSdR,MFd,              & 
& MGlu,MSd,MFd2,MGlu2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MGlu,MSd(6),MFd2(3),MGlu2,MSd2(6)

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Complex(dp) :: Amp(2,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MGlu 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplGluFdcSdL(gt3,gt1)
coupT1R = cplGluFdcSdR(gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToGluFd


Subroutine Gamma_Real_BLSSM_SdToGluFd(MLambda,em,gs,cplGluFdcSdL,cplGluFdcSdR,        & 
& MFd,MGlu,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp), Intent(in) :: MFd(3),MGlu,MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3), GammarealGluon(6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
    Do i3=1,3
CoupL = cplGluFdcSdL(i3,i1)
CoupR = cplGluFdcSdR(i3,i1)
Mex1 = MSd(i1)
Mex2 = MGlu
Mex3 = MFd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,4._dp/27._dp,0._dp,4._dp/27._dp,0._dp,0._dp,4._dp/27._dp,CoupL,CoupR,Gammarealphoton(i1,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,16._dp/9._dp,2._dp,-2._dp/9._dp,4._dp,-2._dp,16._dp/9._dp,CoupL,CoupR,Gammarealgluon(i1,i3),kont)
Else 
  GammarealGluon(i1,i3) = 0._dp 
  GammarealPhoton(i1,i3) = 0._dp 

End if 
    End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToGluFd


Subroutine Amplitude_WAVE_BLSSM_SdToGluFd(cplGluFdcSdL,cplGluFdcSdR,ctcplGluFdcSdL,   & 
& ctcplGluFdcSdR,MFd,MFd2,MGlu,MGlu2,MSd,MSd2,ZfFDL,ZfFDR,ZffG,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MGlu,MGlu2,MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Complex(dp), Intent(in) :: ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZffG,ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MGlu 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplGluFdcSdL(gt3,gt1) 
ZcoupT1R = ctcplGluFdcSdR(gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplGluFdcSdL(gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplGluFdcSdR(gt3,i1)
End Do


! External Field 2 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZffG*cplGluFdcSdL(gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZffG)*cplGluFdcSdR(gt3,gt1)


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt3)*cplGluFdcSdL(i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt3))*cplGluFdcSdR(i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToGluFd


Subroutine Amplitude_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,           & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,    & 
& cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,      & 
& cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),          & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),       & 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
    Do gt3=1,3
Amp(:,gt1, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MGlu 
Mex3 = MFd(gt3) 


! {Fd, Chi, Sd}
Do i1=1,3
  Do i2=1,7
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdGluSdL(i1,i3)
coup2R = cplcFdGluSdR(i1,i3)
coup3L = cplChiFdcSdL(i2,gt3,i3)
coup3R = cplChiFdcSdR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Glu, Sd}
Do i1=1,3
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MGlu 
ML3 = MSd(i3) 
coup1L = cplGluFdcSdL(i1,gt1)
coup1R = cplGluFdcSdR(i1,gt1)
coup2L = cplcFdGluSdL(i1,i3)
coup2R = cplcFdGluSdR(i1,i3)
coup3L = cplGluFdcSdL(gt3,i3)
coup3R = cplGluFdcSdR(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Fu, bar[Cha], Su}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MSu(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuGluSuL(i1,i3)
coup2R = cplcFuGluSuR(i1,i3)
coup3L = cplcChaFdcSuL(i2,gt3,i3)
coup3R = cplcChaFdcSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], VG}
  Do i2=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do


! {Sd, Ah, Fd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Fd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VG, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVG 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVG(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVGL(i3,gt3)
coup3R = cplcFdFdVGR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Sd, VP, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], Fu}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MFu(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFdcHpmL(i3,gt3,i2)
coup3R = cplcFuFdcHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MFu(i3) 
coup1 = -cplSucSdVWm(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFdcVWmL(i3,gt3)
coup3R = cplcFuFdcVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], Glu}
  Do i2=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MGlu 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplGluFdcSdL(gt3,i2)
coup3R = cplGluFdcSdR(gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do
    End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToGluFd


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToGluFd(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,           & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,           & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,    & 
& cplGluFucSuR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,      & 
& cplSucSdVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),          & 
& cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),       & 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplSucSdVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
    Do gt3=1,3
Amp(:,gt1, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MGlu 
Mex3 = MFd(gt3) 


! {Glu, bar[Fd], VG}
  Do i2=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do


! {Sd, VG, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVG 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVG(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVGL(i3,gt3)
coup3R = cplcFdFdVGR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Sd, VP, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplSdcSdVP(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Sd], Glu}
  Do i2=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MGlu 
coup1 = -cplSdcSdVG(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplGluFdcSdL(gt3,i2)
coup3R = cplGluFdcSdR(gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do
    End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToGluFd


Subroutine Amplitude_Tree_BLSSM_SdToSdhh(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(4),MSd(6),Mhh2(4),MSd2(6)

Complex(dp), Intent(in) :: cplhhSdcSd(4,6,6)

Complex(dp) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSdcSd(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSdhh


Subroutine Gamma_Real_BLSSM_SdToSdhh(MLambda,em,gs,cplhhSdcSd,Mhh,MSd,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSdcSd(4,6,6)

Real(dp), Intent(in) :: Mhh(4),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
Coup = cplhhSdcSd(i3,i2,i1)
Mex1 = MSd(i1)
Mex2 = MSd(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSdhh


Subroutine Amplitude_WAVE_BLSSM_SdToSdhh(cplhhSdcSd,ctcplhhSdcSd,Mhh,Mhh2,            & 
& MSd,MSd2,Zfhh,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplhhSdcSd(4,6,6)

Complex(dp), Intent(in) :: ctcplhhSdcSd(4,6,6)

Complex(dp), Intent(in) :: Zfhh(4,4),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSdcSd(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplhhSdcSd(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplhhSdcSd(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSdcSd(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdhh


Subroutine Amplitude_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,   & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvReSvRe,             & 
& cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,       & 
& cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,  & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,   & 
& cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,& 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,             & 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhSdcSd(4,6,6),     & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),       & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),              & 
& cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhSvImSvIm(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),& 
& cplhhcVWmVWm(4),cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),          & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),           & 
& cplAhAhSdcSdaa(4,4,6,6),cplhhhhSdcSdaa(4,4,6,6),cplhhHpmSucSdaa(4,2,6,6),              & 
& cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),       & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6),   & 
& cplSdcSdVZVZpaa(6,6),cplSdcSdVZpVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVP(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = -cplAhhhVP(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VZ, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, Ah, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, Ah, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSdcSucVWm(gt2,i1)
coup3 = cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = -cplSdcSucVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSdcSdVG(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSdcSdVP(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = -cplSdcSucVWm(gt2,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = -cplSdcSdVZ(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = -cplSdcSdVZp(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {hh, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhhhSdcSdaa(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplhhSdcHpmcSuaa(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
coup1 = cplhhhhSdcSdaa(gt3,i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplhhHpmSucSdaa(gt3,i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
Do i1=1,4
  Do i2=1,4
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSdcSdaa(i1,i2,gt2,gt1)
coup2 = cplAhAhhh(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {hh, hh}
Do i1=1,4
  Do i2=1,4
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSdcSdaa(i1,i2,gt2,gt1)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSdcHpmcSdaa(i1,gt2,i2,gt1)
coup2 = cplhhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSdcSdcSdabba(gt2,i1,gt1,i2)
coup2 = cplhhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSdcSdcSdabab(gt2,i1,gt1,i2)
coup2 = cplhhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSdSecSdcSeaa(gt2,i1,gt1,i2)
coup2 = cplhhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSdSucSdcSuabba(gt2,i1,gt1,i2)
coup2 = cplhhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSucSdcSuabab(gt2,i1,gt1,i2)
coup2 = cplhhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {SvIm, SvIm}
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSdSvImSvImcSdaa(gt2,i1,i2,gt1)
coup2 = cplhhSvImSvIm(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSdSvReSvRecSdaa(gt2,i1,i2,gt1)
coup2 = cplhhSvReSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {VP, VZ}
ML1 = MVP 
ML2 = MVZ 
coup1 = cplSdcSdVPVZaa(gt2,gt1)
coup2 = cplhhVPVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, VZp}
ML1 = MVP 
ML2 = MVZp 
coup1 = cplSdcSdVPVZpaa(gt2,gt1)
coup2 = cplhhVPVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplSdcSdcVWmVWmaa(gt2,gt1)
coup2 = cplhhcVWmVWm(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplSdcSdVZVZaa(gt2,gt1)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {VZ, VZp}
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplSdcSdVZVZpaa(gt2,gt1)
coup2 = cplhhVZVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZp, VZp}
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplSdcSdVZpVZpaa(gt2,gt1)
coup2 = cplhhVZpVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdhh


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdhh(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,           & 
& cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,               & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,              & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplhhhhSdcSdaa,     & 
& cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,& 
& cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvImSvImcSdaa,cplSdSvReSvRecSdaa,& 
& cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,       & 
& cplSdcSdVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhSdcSd(4,6,6),     & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),       & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),           & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),              & 
& cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhSvImSvIm(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),& 
& cplhhcVWmVWm(4),cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),          & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),           & 
& cplAhAhSdcSdaa(4,4,6,6),cplhhhhSdcSdaa(4,4,6,6),cplhhHpmSucSdaa(4,2,6,6),              & 
& cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplSdSdcSdcSdabba(6,6,6,6),       & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSvImSvImcSdaa(6,6,6,6),cplSdSvReSvRecSdaa(6,6,6,6),    & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSdVZVZaa(6,6),   & 
& cplSdcSdVZVZpaa(6,6),cplSdcSdVZpVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = Mhh(gt3) 


! {Sd, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVP(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = -cplAhhhVP(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VZ, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = -cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VP, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSdcSdVZ(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VP, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSdcSdVZp(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSdcSdVG(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSdcSdVP(gt2,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VZ}
ML1 = MVP 
ML2 = MVZ 
coup1 = cplSdcSdVPVZaa(gt2,gt1)
coup2 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, VZp}
ML1 = MVP 
ML2 = MVZp 
coup1 = cplSdcSdVPVZpaa(gt2,gt1)
coup2 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdhh


Subroutine Amplitude_Tree_BLSSM_SdToSuHpm(cplHpmSucSd,MHpm,MSd,MSu,MHpm2,             & 
& MSd2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSd(6),MSu(6),MHpm2(2),MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplHpmSucSd(2,6,6)

Complex(dp) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplHpmSucSd(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSuHpm


Subroutine Gamma_Real_BLSSM_SdToSuHpm(MLambda,em,gs,cplHpmSucSd,MHpm,MSd,             & 
& MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHpmSucSd(2,6,6)

Real(dp), Intent(in) :: MHpm(2),MSd(6),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,2
Coup = cplHpmSucSd(i3,i2,i1)
Mex1 = MSd(i1)
Mex2 = MSu(i2)
Mex3 = MHpm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,-2._dp/9._dp,1._dp/3._dp,4._dp/9._dp,-2._dp/3._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSuHpm


Subroutine Amplitude_WAVE_BLSSM_SdToSuHpm(cplHpmSucSd,ctcplHpmSucSd,MHpm,             & 
& MHpm2,MSd,MSd2,MSu,MSu2,ZfHpm,ZfSd,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplHpmSucSd(2,6,6)

Complex(dp), Intent(in) :: ctcplHpmSucSd(2,6,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSd(6,6),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHpmSucSd(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplHpmSucSd(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplHpmSucSd(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplHpmSucSd(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSuHpm


Subroutine Amplitude_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,               & 
& cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,       & 
& cplcFdFuHpmR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,           & 
& cplhhSucSu,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,           & 
& cplSdcSdVZ,cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,       & 
& cplAhHpmSucSdaa,cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba, & 
& cplSdSucSdcSuabab,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,   & 
& cplSucSdVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),            & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),           & 
& cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSucSu(4,6,6),             & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2), & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSuVG(6,6),      & 
& cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplAhHpmSucSdaa(4,2,6,6),& 
& cplhhHpmSucSdaa(4,2,6,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSeSuSvImcSdaa(6,6,6,6),       & 
& cplSeSuSvRecSdaa(6,6,6,6),cplSucSdVPVWmaa(6,6),cplSucSdVWmVZaa(6,6),cplSucSdVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, conj[Sd], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
coup3L = cplcFdFuHpmL(i2,i3,gt3)
coup3R = cplcFdFuHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Cha}
Do i1=1,3
  Do i2=1,7
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFdFuHpmL(i2,i3,gt3)
coup3R = cplcFdFuHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, Hpm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Hpm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplHpmcHpmVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, Ah, VWm}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = -cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VWm}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = -cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
coup3 = -cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = -cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplHpmcHpmVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = -cplSucSuVZ(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = -cplSucSuVZp(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhHpmSucSdaa(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhHpmSucSdaa(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplHpmSucHpmcSuaa(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhHpmSucSdaa(i1,gt3,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhHpmSucSdaa(i1,gt3,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSdcHpmcSdaa(gt3,i1,i2,gt1)
coup2 = cplHpmSucSd(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, conj[Hpm]}
Do i1=1,4
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhHpmSucSdaa(i1,i2,gt2,gt1)
coup2 = cplAhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Hpm]}
Do i1=1,4
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmSucSdaa(i1,i2,gt2,gt1)
coup2 = cplhhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSu(i2) 
coup1 = cplSdSucSdcSuabba(i1,gt2,gt1,i2)
coup2 = cplHpmSucSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

coup1 = cplSdSucSdcSuabab(i1,gt2,gt1,i2)
coup2 = cplHpmSucSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Se, SvIm}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSvIm(i2) 
coup1 = cplSeSuSvImcSdaa(i1,gt2,i2,gt1)
coup2 = cplHpmSvImcSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Se, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSeSuSvRecSdaa(i1,gt2,i2,gt1)
coup2 = cplHpmSvRecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSucSdVPVWmaa(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZ}
ML1 = MVWm 
ML2 = MVZ 
coup1 = cplSucSdVWmVZaa(gt2,gt1)
coup2 = cplHpmcVWmVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZp}
ML1 = MVWm 
ML2 = MVZp 
coup1 = cplSucSdVWmVZpaa(gt2,gt1)
coup2 = cplHpmcVWmVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSuHpm


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSuHpm(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,cplChaFucSdL,               & 
& cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFuHpmL,       & 
& cplcFdFuHpmR,cplcFuGluSuL,cplcFuGluSuR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,           & 
& cplhhSucSu,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,cplHpmcHpmVP,cplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,           & 
& cplSdcSdVZ,cplSdcSdVZp,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,       & 
& cplAhHpmSucSdaa,cplhhHpmSucSdaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba, & 
& cplSdSucSdcSuabab,cplSeSuSvImcSdaa,cplSeSuSvRecSdaa,cplSucSdVPVWmaa,cplSucSdVWmVZaa,   & 
& cplSucSdVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),            & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),           & 
& cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSucSu(4,6,6),             & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2), & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSuVG(6,6),      & 
& cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplAhHpmSucSdaa(4,2,6,6),& 
& cplhhHpmSucSdaa(4,2,6,6),cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),        & 
& cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSeSuSvImcSdaa(6,6,6,6),       & 
& cplSeSuSvRecSdaa(6,6,6,6),cplSucSdVPVWmaa(6,6),cplSucSdVWmVZaa(6,6),cplSucSdVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MHpm(gt3) 


! {Sd, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VP, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSucSdVPVWmaa(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSuHpm


Subroutine Amplitude_Tree_BLSSM_SdToSdVZ(cplSdcSdVZ,MSd,MVZ,MSd2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MVZ,MSd2(6),MVZ2

Complex(dp), Intent(in) :: cplSdcSdVZ(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplSdcSdVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSdVZ


Subroutine Gamma_Real_BLSSM_SdToSdVZ(MLambda,em,gs,cplSdcSdVZ,MSd,MVZ,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSdcSdVZ(6,6)

Real(dp), Intent(in) :: MSd(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSdcSdVZ(i2,i1)
Mex1 = MSd(i1)
Mex2 = MSd(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp/3._dp,-1._dp/3._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSdVZ


Subroutine Amplitude_WAVE_BLSSM_SdToSdVZ(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,           & 
& ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,MVZ,MVZ2,ZfSd,               & 
& ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ZfSd(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSdcSdVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplSdcSdVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplSdcSdVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplSdcSdVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSdcSdVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplSdcSdVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdVZ


Subroutine Amplitude_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,          & 
& cplChaFucSdR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,       & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVPVZaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplhhVPVZ(4),   & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),       & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),           & 
& cplSucSuVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1(6,6),            & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVZVZaa(6,6),cplSdcSdVZVZpaa(6,6),cplSdcSucVWmVZaa(6,6),    & 
& cplSucSdVWmVZaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZ 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplSucSuVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = cplSdcSucVWm(gt2,i3)
coup3 = cplSucSuVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = cplSdcSdVZ(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = cplSdcSdVZp(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2 = cplSdcSdVZVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2 = cplSdcSdVZVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = -cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWmVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVZLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVZaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = cplSdcSdVZVZaa(i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = cplSdcSdVZVZpaa(i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = cplSucSdVWmVZaa(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdVZ


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVZ(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSdcSd,cplChaFucSdL,     & 
& cplChaFucSdR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVG,       & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplSucSuVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVPVZaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWmVZaa,cplSucSdVWmVZaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplhhVPVZ(4),   & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),       & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSdVWm(6,6),           & 
& cplSucSuVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSdcSdVGVZLamct3ct2ct1(6,6),            & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVZVZaa(6,6),cplSdcSdVZVZpaa(6,6),cplSdcSucVWmVZaa(6,6),    & 
& cplSucSdVWmVZaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZ 


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVZLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVZaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVZ


Subroutine Amplitude_Tree_BLSSM_SdToSdVZp(cplSdcSdVZp,MSd,MVZp,MSd2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MVZp,MSd2(6),MVZp2

Complex(dp), Intent(in) :: cplSdcSdVZp(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = -cplSdcSdVZp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSdVZp


Subroutine Gamma_Real_BLSSM_SdToSdVZp(MLambda,em,gs,cplSdcSdVZp,MSd,MVZp,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSdcSdVZp(6,6)

Real(dp), Intent(in) :: MSd(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSdcSdVZp(i2,i1)
Mex1 = MSd(i1)
Mex2 = MSd(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp/3._dp,-1._dp/3._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSdVZp


Subroutine Amplitude_WAVE_BLSSM_SdToSdVZp(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,          & 
& ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,MVZp,MVZp2,ZfSd,             & 
& ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ZfSd(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSdcSdVZp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplSdcSdVZp(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplSdcSdVZp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZp*cplSdcSdVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplSdcSdVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplSdcSdVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdVZp


Subroutine Amplitude_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,    & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),         & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),               & 
& cplhhSdcSd(4,6,6),cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),       & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),   & 
& cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),        & 
& cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplSucSuVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,    & 
& cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdVZVZpaa(6,6),              & 
& cplSdcSdVZpVZpaa(6,6),cplSdcSucVWmVZpaa(6,6),cplSucSdVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZp 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuVZpL(i2,i3)
coup3R = cplcFuFuVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplSucSuVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcHpmVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcVWmVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = cplSdcSucVWm(gt2,i3)
coup3 = cplSucSuVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = cplSdcSdVZ(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = cplSdcSdVZp(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2 = cplSdcSdVZVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2 = cplSdcSdVZpVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = -cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWmVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVZpLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVZpaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = cplSdcSdVZVZpaa(i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = cplSdcSdVZpVZpaa(i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = cplSucSdVWmVZpaa(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdVZp


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVZp(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,    & 
& cplChaFucSdR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,   & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,           & 
& cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,         & 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSdVPVZpaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,            & 
& cplSdcSucVWmVZpaa,cplSucSdVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),         & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),               & 
& cplhhSdcSd(4,6,6),cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),       & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),   & 
& cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),        & 
& cplSdcSucVWm(6,6),cplSucSdVWm(6,6),cplSucSuVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,    & 
& cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdVZVZpaa(6,6),              & 
& cplSdcSdVZpVZpaa(6,6),cplSdcSucVWmVZpaa(6,6),cplSucSdVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVZp 


! {Sd, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVZp(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVZpLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVZpaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVZp


Subroutine Amplitude_Tree_BLSSM_SdToSuVWm(cplSucSdVWm,MSd,MSu,MVWm,MSd2,              & 
& MSu2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSu(6),MVWm,MSd2(6),MSu2(6),MVWm2

Complex(dp), Intent(in) :: cplSucSdVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSucSdVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SdToSuVWm


Subroutine Gamma_Real_BLSSM_SdToSuVWm(MLambda,em,gs,cplSucSdVWm,MSd,MSu,              & 
& MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSucSdVWm(6,6)

Real(dp), Intent(in) :: MSd(6),MSu(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSucSdVWm(i2,i1)
Mex1 = MSd(i1)
Mex2 = MSu(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp/3._dp,2._dp/3._dp,-1._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SdToSuVWm


Subroutine Amplitude_WAVE_BLSSM_SdToSuVWm(cplSucSdVWm,ctcplSucSdVWm,MSd,              & 
& MSd2,MSu,MSu2,MVWm,MVWm2,ZfSd,ZfSu,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSucSdVWm(6,6)

Complex(dp), Intent(in) :: ctcplSucSdVWm(6,6)

Complex(dp), Intent(in) :: ZfSd(6,6),ZfSu(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSucSdVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplSucSdVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplSucSdVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSucSdVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSuVWm


Subroutine Amplitude_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplAhcHpmVWm(4,2),cplChaFucSdL(2,3,6),            & 
& cplChaFucSdR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFdcSdL(7,3,6),       & 
& cplChiFdcSdR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFuVWmL(3,3),             & 
& cplcFdFuVWmR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplhhSucSu(4,6,6),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),& 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),      & 
& cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,        & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSdcSdcVWmVWmaa(6,6),    & 
& cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSdVPVWmaa(6,6),cplSucSdVWmVZaa(6,6),              & 
& cplSucSdVWmVZpaa(6,6),cplSucSucVWmVWmaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVWm 


! {Ah, conj[Sd], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Cha}
Do i1=1,3
  Do i2=1,7
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, Hpm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Hpm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = -cplhhcHpmVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZ, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplcHpmVWmVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VWm}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VP, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
coup3 = cplAhcHpmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[Hpm], hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplhhcHpmVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = cplSucSuVZ(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = cplSucSuVZp(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSucSdVGVWmLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSucSdVPVWmaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2 = cplSucSdVWmVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2 = cplSucSdVWmVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = -cplSucSdVWm(i1,gt1)
coup2 = cplSucSucVWmVWmaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = cplSdcSdcVWmVWmaa(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSdVGVWmLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSdVPVWmaa(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = cplSucSdVWmVZaa(i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = cplSucSdVWmVZpaa(i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSuVWm


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSuVWm(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,    & 
& cplChaFucSdL,cplChaFucSdR,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,     & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,    & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,    & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSdcVWmVWmaa,               & 
& cplSucSdVGVWmLamct3ct2ct1,cplSucSdVPVWmaa,cplSucSdVWmVZaa,cplSucSdVWmVZpaa,            & 
& cplSucSucVWmVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplAhcHpmVWm(4,2),cplChaFucSdL(2,3,6),            & 
& cplChaFucSdR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFdcSdL(7,3,6),       & 
& cplChiFdcSdR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFuVWmL(3,3),             & 
& cplcFdFuVWmR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplhhSucSu(4,6,6),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),& 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),      & 
& cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,        & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSdcSdcVWmVWmaa(6,6),    & 
& cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSdVPVWmaa(6,6),cplSucSdVWmVZaa(6,6),              & 
& cplSucSdVWmVZpaa(6,6),cplSucSucVWmVWmaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVWm 


! {Sd, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VP, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSdcSdVP(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[Hpm], VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSdVWm(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSucSdVGVWmLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSucSdVPVWmaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSdVGVWmLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSdVPVWmaa(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSuVWm


Subroutine Amplitude_WAVE_BLSSM_SdToSdVG(cplSdcSdVG,ctcplSdcSdVG,MSd,MSd2,            & 
& MVG,MVG2,ZfSd,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MVG,MVG2

Complex(dp), Intent(in) :: cplSdcSdVG(6,6)

Complex(dp), Intent(in) :: ctcplSdcSdVG(6,6)

Complex(dp), Intent(in) :: ZfSd(6,6),ZfVG

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVG 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSdcSdVG(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplSdcSdVG(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplSdcSdVG(i1,gt1)
End Do


! External Field 3 


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdVG


Subroutine Amplitude_VERTEX_BLSSM_SdToSdVG(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,          & 
& cplSucSdVWm,cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,cplSdcSdVGVZpLamct3ct2ct1,           & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSucSdVGVWmLamct3ct2ct1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),        & 
& cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3), & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),       & 
& cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSdVWm(6,6),cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVGVPLamct3ct2ct1(6,6),          & 
& cplSdcSdVGVZLamct3ct2ct1(6,6),cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSucSdVGVWmLamct3ct2ct1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVG 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Glu, Glu}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MGlu 
ML3 = MGlu 
coup1L = cplGluFdcSdL(i1,gt1)
coup1R = cplGluFdcSdR(i1,gt1)
coup2L = cplcFdGluSdL(i1,gt2)
coup2R = cplcFdGluSdR(i1,gt2)
coup3L = cplGluGluVGL
coup3R = cplGluGluVGR
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplSucSuVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VG, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1 = cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
coup3 = cplVGVGVG
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = cplSdcSucVWm(gt2,i3)
coup3 = cplSucSuVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = cplSdcSdVZ(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = cplSdcSdVZp(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
coup2 = cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2 = cplSdcSdVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2 = cplSdcSdVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = -cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWmVGLamct4ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

coup1 = cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = cplSdcSdVGVZLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = cplSdcSdVGVZpLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = cplSucSdVGVWmLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdVG


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVG(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSdcSd,cplChaFucSdL,               & 
& cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,             & 
& cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSdVWm,cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSdcSdVGVPLamct3ct2ct1,cplSdcSdVGVZLamct3ct2ct1,& 
& cplSdcSdVGVZpLamct3ct2ct1,cplSdcSucVWmVGLamct4ct2ct1,cplSucSdVGVWmLamct3ct2ct1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),        & 
& cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3), & 
& cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),       & 
& cplHpmSucSd(2,6,6),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSdVWm(6,6),cplVGVGVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVGVPLamct3ct2ct1(6,6),          & 
& cplSdcSdVGVZLamct3ct2ct1(6,6),cplSdcSdVGVZpLamct3ct2ct1(6,6),cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSucSdVGVWmLamct3ct2ct1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVG 


! {Sd, VG, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1 = cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
coup3 = cplVGVGVG
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVG(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
coup2 = cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

coup1 = cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVG


Subroutine Amplitude_WAVE_BLSSM_SdToSdVP(cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,           & 
& ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,MSd,MSd2,MVP,MVP2,ZfSd,ZfVP,ZfVZpVP,           & 
& ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6)

Complex(dp), Intent(in) :: ZfSd(6,6),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSd(i1,gt1))*cplSdcSdVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplSdcSdVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSdcSdVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplSdcSdVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SdToSdVP


Subroutine Amplitude_VERTEX_BLSSM_SdToSdVP(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSdcSd,cplChaFucSdL,          & 
& cplChaFucSdR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVG,cplSdcSdVP,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVP,cplSucSdVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1,             & 
& cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSucVWmVPaa,cplSucSdVPVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),             & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFuVPL(3,3),& 
& cplcFuFuVPR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplhhVPVZ(4),   & 
& cplhhVPVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVG(6,6),    & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplcHpmVPVWm(2),& 
& cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),    & 
& cplSdcSdVPVZpaa(6,6),cplSdcSucVWmVPaa(6,6),cplSucSdVPVWmaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVP 


! {Ah, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSdcSd(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChaFucSdL(i1,i2,gt1)
coup1R = cplChaFucSdR(i1,i2,gt1)
coup2L = cplcChacFuSdL(i1,i3,gt2)
coup2R = cplcChacFuSdR(i1,i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fd], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(i1,i2,gt1)
coup1R = cplChiFdcSdR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFdcSdL(i2,i1,gt1)
coup1R = cplChiFdcSdR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = -cplChiChiVPR(i3,i2)
coup3R = -cplChiChiVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFucSdL(i2,i1,gt1)
coup1R = cplChaFucSdR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Glu, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFdcSdL(i2,gt1)
coup1R = cplGluFdcSdR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Sd], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSdcSd(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, conj[Su], conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplHpmSucSd(i1,i2,gt1)
coup2 = cplSdcHpmcSu(gt2,i1,i3)
coup3 = cplSucSuVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhhhVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSdcSd(i2,i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZ(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSdcSdVZp(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSdcSd(i2,i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Su, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSu(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSucSd(i2,i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSdVWm(i2,gt1)
coup2 = cplSdcSucVWm(gt2,i3)
coup3 = cplSucSuVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZ(i2,gt1)
coup2 = cplSdcSdVZ(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVZp(i2,gt1)
coup2 = cplSdcSdVZp(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = -cplSdcSdVZ(i1,gt1)
coup2 = cplSdcSdVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = -cplSdcSdVZp(i1,gt1)
coup2 = cplSdcSdVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = -cplSucSdVWm(i1,gt1)
coup2 = cplSdcSucVWmVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVPaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZ 
coup1 = cplSdcSdVPVZaa(i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sd, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVZp 
coup1 = cplSdcSdVPVZpaa(i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Su, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVWm 
coup1 = cplSucSdVPVWmaa(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SdToSdVP


Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVP(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSdcSd,cplChaFucSdL,     & 
& cplChaFucSdR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,              & 
& cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVG,cplSdcSdVP,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVP,cplSucSdVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1,             & 
& cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSucVWmVPaa,cplSucSdVPVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplAhSdcSd(4,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),             & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFuVPL(3,3),& 
& cplcFuFuVPR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhSdcSd(4,6,6),cplhhVPVZ(4),   & 
& cplhhVPVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVG(6,6),    & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplcHpmVPVWm(2),& 
& cplcVWmVPVWm,cplSdcSdVGVPLamct3ct2ct1(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),    & 
& cplSdcSdVPVZpaa(6,6),cplSdcSucVWmVPaa(6,6),cplSucSdVPVWmaa(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSd(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVP 


! {VG, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSdVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSdVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = -cplSdcSdVG(i1,gt1)
coup2 = cplSdcSdVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = -cplSdcSdVP(i1,gt1)
coup2 = cplSdcSdVPVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSdVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSdVPVPaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SdToSdVP



End Module OneLoopDecay_Sd_BLSSM
