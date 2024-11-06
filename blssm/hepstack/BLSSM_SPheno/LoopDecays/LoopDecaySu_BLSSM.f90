! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:56 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Su_BLSSM
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

Subroutine Amplitude_Tree_BLSSM_SuToSuAh(cplAhSucSu,MAh,MSu,MAh2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MSu(6),MAh2(4),MSu2(6)

Complex(dp), Intent(in) :: cplAhSucSu(4,6,6)

Complex(dp) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSucSu(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToSuAh


Subroutine Gamma_Real_BLSSM_SuToSuAh(MLambda,em,gs,cplAhSucSu,MAh,MSu,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSucSu(4,6,6)

Real(dp), Intent(in) :: MAh(4),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,4
Coup = cplAhSucSu(i3,i2,i1)
Mex1 = MSu(i1)
Mex2 = MSu(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToSuAh


Subroutine Amplitude_WAVE_BLSSM_SuToSuAh(cplAhSucSu,ctcplAhSucSu,MAh,MAh2,            & 
& MSu,MSu2,ZfAh,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MAh2(4),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplAhSucSu(4,6,6)

Complex(dp), Intent(in) :: ctcplAhSucSu(4,6,6)

Complex(dp), Intent(in) :: ZfAh(4,4),ZfSu(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSucSu(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplAhSucSu(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplAhSucSu(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSucSu(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuAh


Subroutine Amplitude_VERTEX_BLSSM_SuToSuAh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,             & 
& cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,        & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,       & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFuFuAhL(3,3,4),          & 
& cplcFuFuAhR(3,3,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),  & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),      & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSucSu(4,6,6),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),            & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplAhAhSucSuaa(4,4,6,6),cplAhHpmSucSdaa(4,2,6,6),cplAhSdcHpmcSuaa(4,6,2,6),            & 
& cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),      & 
& cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),        & 
& cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MAh(gt3) 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fd, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
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


! {Fu, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3,gt3)
coup3R = cplcFuFuAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Sd, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
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


! {Sd, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
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


! {Su, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
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


! {Su, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
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


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = -cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = -cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = -cplSucSdVWm(gt2,i3)
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


! {Ah, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhAhSucSuaa(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplAhHpmSucSdaa(gt3,i2,gt2,i1)
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
coup1 = cplAhAhSucSuaa(gt3,i1,i2,gt1)
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


! {Sd, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSdcHpmcSuaa(gt3,i1,i2,gt1)
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


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSucHpmcSuaa(i1,gt2,i2,gt1)
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
coup1 = cplSdSucSdcSuabba(i1,gt2,i2,gt1)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSucSdcSuabab(i1,gt2,i2,gt1)
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
coup1 = cplSeSucSecSuaa(i1,gt2,i2,gt1)
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
coup1 = cplSuSucSucSuabba(gt2,i1,gt1,i2)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSuSucSucSuabab(gt2,i1,gt1,i2)
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
coup1 = cplSuSvImSvImcSuaa(gt2,i1,i2,gt1)
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


! {SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSuSvImSvRecSuaa(gt2,i1,i2,gt1)
coup2 = cplAhSvImSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSuSvReSvRecSuaa(gt2,i1,i2,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuAh


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuAh(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,        & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvImSvIm,              & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,       & 
& cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,  & 
& cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,cplSuSvImSvRecSuaa,& 
& cplSuSvReSvRecSuaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFuFuAhL(3,3,4),          & 
& cplcFuFuAhR(3,3,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),  & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),      & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplhhSucSu(4,6,6),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),            & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplAhAhSucSuaa(4,4,6,6),cplAhHpmSucSdaa(4,2,6,6),cplAhSdcHpmcSuaa(4,6,2,6),            & 
& cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),      & 
& cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),cplSuSucSucSuabab(6,6,6,6),        & 
& cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),cplSuSvReSvRecSuaa(6,6,6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MAh(gt3) 


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplAhhhVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplAhhhVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuAh


Subroutine Amplitude_Tree_BLSSM_SuToFuChi(cplChiFucSuL,cplChiFucSuR,MChi,             & 
& MFu,MSu,MChi2,MFu2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFu(3),MSu(6),MChi2(7),MFu2(3),MSu2(6)

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Complex(dp) :: Amp(2,6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,7
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFucSuL(gt3,gt2,gt1)
coupT1R = cplChiFucSuR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToFuChi


Subroutine Gamma_Real_BLSSM_SuToFuChi(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,        & 
& MChi,MFu,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Real(dp), Intent(in) :: MChi(7),MFu(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,7), GammarealGluon(6,3,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
CoupL = cplChiFucSuL(i3,i2,i1)
CoupR = cplChiFucSuR(i3,i2,i1)
Mex1 = MSu(i1)
Mex2 = MFu(i2)
Mex3 = MChi(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToFuChi


Subroutine Amplitude_WAVE_BLSSM_SuToFuChi(cplChiFucSuL,cplChiFucSuR,ctcplChiFucSuL,   & 
& ctcplChiFucSuR,MChi,MChi2,MFu,MFu2,MSu,MSu2,ZfFUL,ZfFUR,ZfL0,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFu(3),MFu2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Complex(dp), Intent(in) :: ctcplChiFucSuL(7,3,6),ctcplChiFucSuR(7,3,6)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),ZfL0(7,7),ZfSu(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFucSuL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFucSuR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplChiFucSuL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplChiFucSuR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt2)*cplChiFucSuL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt2))*cplChiFucSuR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFucSuL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFucSuR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToFuChi


Subroutine Amplitude_VERTEX_BLSSM_SuToFuChi(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,             & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),        & 
& cplAhSucSu(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),     & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),     & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),      & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),           & 
& cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),           & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplhhSucSu(4,6,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6), & 
& cplSucSuVZp(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MChi(gt3) 


! {Ah, conj[Su], bar[Fu]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2L = cplcFuFuAhL(i3,gt2,i1)
coup2R = cplcFuFuAhR(i3,gt2,i1)
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


! {Chi, bar[Fu], conj[Su]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Fd, Cha, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdFuHpmL(i1,gt2,i3)
coup2R = cplcFdFuHpmR(i1,gt2,i3)
coup3L = cplChiChacHpmL(gt3,i2,i3)
coup3R = cplChiChacHpmR(gt3,i2,i3)
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


! {Fd, Cha, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = -cplcFdFuVWmR(i1,gt2)
coup2R = -cplcFdFuVWmL(i1,gt2)
coup3L = -cplChiChacVWmR(gt3,i2)
coup3R = -cplChiChacVWmL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Chi, Ah}
Do i1=1,3
  Do i2=1,7
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,gt2,i3)
coup2R = cplcFuFuAhR(i1,gt2,i3)
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


! {Fu, Chi, hh}
Do i1=1,3
  Do i2=1,7
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, Chi, VP}
Do i1=1,3
  Do i2=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MVP 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
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


! {Fu, Chi, VZ}
Do i1=1,3
  Do i2=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
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


! {Fu, Chi, VZp}
Do i1=1,3
  Do i2=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MVZp 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = -cplcFuFuVZpR(i1,gt2)
coup2R = -cplcFuFuVZpL(i1,gt2)
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


! {Glu, bar[Fu], conj[Su]}
  Do i2=1,3
    Do i3=1,6
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MSu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplGluFucSuL(gt2,i3)
coup2R = cplGluFucSuR(gt2,i3)
coup3L = cplcFuChiSuL(i2,gt3,i3)
coup3R = cplcFuChiSuR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], bar[Fu]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
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


! {Sd, Hpm, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChiHpmL(i3,gt3,i2)
coup3R = cplcChaChiHpmR(i3,gt3,i2)
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


! {Sd, VWm, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaChiVWmL(i3,gt3)
coup3R = cplcChaChiVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, Ah, Chi}
Do i1=1,6
  Do i2=1,4
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {Su, hh, Chi}
Do i1=1,6
  Do i2=1,4
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {Su, VP, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MChi(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {Su, VZ, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplSucSuVZ(i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {Su, VZp, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MChi(i3) 
coup1 = -cplSucSuVZp(i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {VG, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVG(i2,gt1)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVP(i2,gt1)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
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


! {VZ, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVZ(i2,gt1)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
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


! {VZp, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVZp(i2,gt1)
coup2L = -cplcFuFuVZpR(i3,gt2)
coup2R = -cplcFuFuVZpL(i3,gt2)
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


! {bar[Cha], bar[Fd], conj[Sd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplChaFucSdL(i1,gt2,i3)
coup2R = cplChaFucSdR(i1,gt2,i3)
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


! {conj[Hpm], conj[Sd], bar[Fd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2L = cplcFdFuHpmL(i3,gt2,i1)
coup2R = cplcFdFuHpmR(i3,gt2,i1)
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


! {conj[VWm], conj[Sd], bar[Fd]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MFd(i3) 
coup1 = -cplSdcSucVWm(i2,gt1)
coup2L = -cplcFdFuVWmR(i3,gt2)
coup2R = -cplcFdFuVWmL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToFuChi


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToFuChi(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,       & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,             & 
& cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,             & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),        & 
& cplAhSucSu(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),     & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),     & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),      & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),           & 
& cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),           & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplhhSucSu(4,6,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6), & 
& cplSucSuVZp(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MChi(gt3) 


! {Fu, Chi, VP}
Do i1=1,3
  Do i2=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MVP 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3L = -cplChiChiVPR(gt3,i2)
coup3R = -cplChiChiVPL(gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, VP, Chi}
Do i1=1,6
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MChi(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
coup3L = -cplChiChiVPR(gt3,i3)
coup3R = -cplChiChiVPL(gt3,i3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVG(i2,gt1)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], bar[Fu]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MFu(i3) 
coup1 = -cplSucSuVP(i2,gt1)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplChiFucSuL(gt3,i3,i2)
coup3R = cplChiFucSuR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToFuChi


Subroutine Amplitude_Tree_BLSSM_SuTocChaFd(cplcChaFdcSuL,cplcChaFdcSuR,               & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6),MCha2(2),MFd2(3),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFdcSuL(gt2,gt3,gt1)
coupT1R = cplcChaFdcSuR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuTocChaFd


Subroutine Gamma_Real_BLSSM_SuTocChaFd(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& MCha,MFd,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,3), GammarealGluon(6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
CoupL = cplcChaFdcSuL(i2,i3,i1)
CoupR = cplcChaFdcSuR(i2,i3,i1)
Mex1 = MSu(i1)
Mex2 = MCha(i2)
Mex3 = MFd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,2._dp/3._dp,-2._dp/9._dp,1._dp,-1._dp/3._dp,1._dp/9._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,4._dp/3._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuTocChaFd


Subroutine Amplitude_WAVE_BLSSM_SuTocChaFd(cplcChaFdcSuL,cplcChaFdcSuR,               & 
& ctcplcChaFdcSuL,ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,              & 
& ZfLm,ZfLp,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFdcSuL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcChaFdcSuR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplcChaFdcSuL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplcChaFdcSuR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt2)*cplcChaFdcSuL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt2))*cplcChaFdcSuR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt3)*cplcChaFdcSuL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt3))*cplcChaFdcSuR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuTocChaFd


Subroutine Amplitude_VERTEX_BLSSM_SuTocChaFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),      & 
& cplAhSucSu(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),   & 
& cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),            & 
& cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(4,6,6),              & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFd(gt3) 


! {Ah, conj[Su], Cha}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i3,i1)
coup2R = cplcChaChaAhR(gt2,i3,i1)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
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


! {Chi, bar[Fu], Hpm}
Do i1=1,7
  Do i2=1,3
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcChaChiHpmL(gt2,i1,i3)
coup2R = cplcChaChiHpmR(gt2,i1,i3)
coup3L = cplcFuFdcHpmL(i2,gt3,i3)
coup3R = cplcFuFdcHpmR(i2,gt3,i3)
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


! {Chi, bar[Fu], VWm}
Do i1=1,7
  Do i2=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MVWm 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcChaChiVWmL(gt2,i1)
coup2R = cplcChaChiVWmR(gt2,i1)
coup3L = cplcFuFdcVWmL(i2,gt3)
coup3R = cplcFuFdcVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Chi, Sd}
Do i1=1,3
  Do i2=1,7
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcChacFuSdL(gt2,i1,i3)
coup2R = cplcChacFuSdR(gt2,i1,i3)
coup3L = cplChiFdcSdL(i2,gt3,i3)
coup3R = cplChiFdcSdR(i2,gt3,i3)
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


! {Fu, Glu, Sd}
Do i1=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MGlu 
ML3 = MSd(i3) 
coup1L = cplGluFucSuL(i1,gt1)
coup1R = cplGluFucSuR(i1,gt1)
coup2L = cplcChacFuSdL(gt2,i1,i3)
coup2R = cplcChacFuSdR(gt2,i1,i3)
coup3L = cplGluFdcSdL(gt3,i3)
coup3R = cplGluFdcSdR(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {hh, conj[Su], Cha}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2L = cplcChaChahhL(gt2,i3,i1)
coup2R = cplcChaChahhR(gt2,i3,i1)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
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


! {Su, Ah, Fd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3,i2)
coup3R = cplcFdFdAhR(i3,gt3,i2)
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


! {Su, hh, Fd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
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


! {Su, VG, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MFd(i3) 
coup1 = -cplSucSuVG(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVGL(i3,gt3)
coup3R = cplcFdFdVGR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {Su, VP, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZ, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplSucSuVZ(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZp, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MFd(i3) 
coup1 = -cplSucSuVZp(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVZpL(i3,gt3)
coup3R = cplcFdFdVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, conj[Su], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = -cplSucSuVP(i2,gt1)
coup2L = cplcChaChaVPL(gt2,i3)
coup2R = cplcChaChaVPR(gt2,i3)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Su], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = -cplSucSuVZ(i2,gt1)
coup2L = cplcChaChaVZL(gt2,i3)
coup2R = cplcChaChaVZR(gt2,i3)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Su], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = -cplSucSuVZp(i2,gt1)
coup2L = cplcChaChaVZpL(gt2,i3)
coup2R = cplcChaChaVZpR(gt2,i3)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fd], Ah}
Do i1=1,2
  Do i2=1,3
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i1,i3)
coup2R = cplcChaChaAhR(gt2,i1,i3)
coup3L = cplcFdFdAhL(i2,gt3,i3)
coup3R = cplcFdFdAhR(i2,gt3,i3)
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


! {bar[Cha], bar[Fd], hh}
Do i1=1,2
  Do i2=1,3
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChahhL(gt2,i1,i3)
coup2R = cplcChaChahhR(gt2,i1,i3)
coup3L = cplcFdFdhhL(i2,gt3,i3)
coup3R = cplcFdFdhhR(i2,gt3,i3)
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


! {bar[Cha], bar[Fd], VP}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Cha], bar[Fd], VZ}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChaVZL(gt2,i1)
coup2R = cplcChaChaVZR(gt2,i1)
coup3L = cplcFdFdVZL(i2,gt3)
coup3R = cplcFdFdVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Cha], bar[Fd], VZp}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MVZp 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChaVZpL(gt2,i1)
coup2R = cplcChaChaVZpR(gt2,i1)
coup3L = cplcFdFdVZpL(i2,gt3)
coup3R = cplcFdFdVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Sd], Chi}
Do i1=1,2
  Do i2=1,6
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MChi(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2L = cplcChaChiHpmL(gt2,i3,i1)
coup2R = cplcChaChiHpmR(gt2,i3,i1)
coup3L = cplChiFdcSdL(i3,gt3,i2)
coup3R = cplChiFdcSdR(i3,gt3,i2)
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


! {conj[VWm], conj[Sd], Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MChi(i3) 
coup1 = -cplSdcSucVWm(i2,gt1)
coup2L = cplcChaChiVWmL(gt2,i3)
coup2R = cplcChaChiVWmR(gt2,i3)
coup3L = cplChiFdcSdL(i3,gt3,i2)
coup3R = cplChiFdcSdR(i3,gt3,i2)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuTocChaFd


Subroutine Amplitude_IR_VERTEX_BLSSM_SuTocChaFd(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),      & 
& cplAhSucSu(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),   & 
& cplcChaChiVWmR(2,7),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,4),            & 
& cplcFdFdhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(4,6,6),              & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFd(gt3) 


! {Su, VG, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MFd(i3) 
coup1 = -cplSucSuVG(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVGL(i3,gt3)
coup3R = cplcFdFdVGR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {Su, VP, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MFd(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplcChaFdcSuL(gt2,i3,i1)
coup2R = cplcChaFdcSuR(gt2,i3,i1)
coup3L = cplcFdFdVPL(i3,gt3)
coup3R = cplcFdFdVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, conj[Su], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MCha(i3) 
coup1 = -cplSucSuVP(i2,gt1)
coup2L = cplcChaChaVPL(gt2,i3)
coup2R = cplcChaChaVPR(gt2,i3)
coup3L = cplcChaFdcSuL(i3,gt3,i2)
coup3R = cplcChaFdcSuR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fd], VP}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuTocChaFd


Subroutine Amplitude_Tree_BLSSM_SuToGluFu(cplGluFucSuL,cplGluFucSuR,MFu,              & 
& MGlu,MSu,MFu2,MGlu2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MGlu,MSu(6),MFu2(3),MGlu2,MSu2(6)

Complex(dp), Intent(in) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Complex(dp) :: Amp(2,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
    Do gt3=1,3
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MGlu 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplGluFucSuL(gt3,gt1)
coupT1R = cplGluFucSuR(gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToGluFu


Subroutine Gamma_Real_BLSSM_SuToGluFu(MLambda,em,gs,cplGluFucSuL,cplGluFucSuR,        & 
& MFu,MGlu,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp), Intent(in) :: MFu(3),MGlu,MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3), GammarealGluon(6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
    Do i3=1,3
CoupL = cplGluFucSuL(i3,i1)
CoupR = cplGluFucSuR(i3,i1)
Mex1 = MSu(i1)
Mex2 = MGlu
Mex3 = MFu(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,16._dp/27._dp,0._dp,16._dp/27._dp,0._dp,0._dp,16._dp/27._dp,CoupL,CoupR,Gammarealphoton(i1,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,16._dp/9._dp,2._dp,-2._dp/9._dp,4._dp,-2._dp,16._dp/9._dp,CoupL,CoupR,Gammarealgluon(i1,i3),kont)
Else 
  GammarealGluon(i1,i3) = 0._dp 
  GammarealPhoton(i1,i3) = 0._dp 

End if 
    End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToGluFu


Subroutine Amplitude_WAVE_BLSSM_SuToGluFu(cplGluFucSuL,cplGluFucSuR,ctcplGluFucSuL,   & 
& ctcplGluFucSuR,MFu,MFu2,MGlu,MGlu2,MSu,MSu2,ZffG,ZfFUL,ZfFUR,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),MGlu,MGlu2,MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Complex(dp), Intent(in) :: ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6)

Complex(dp), Intent(in) :: ZffG,ZfFUL(3,3),ZfFUR(3,3),ZfSu(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MGlu 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplGluFucSuL(gt3,gt1) 
ZcoupT1R = ctcplGluFucSuR(gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplGluFucSuL(gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplGluFucSuR(gt3,i1)
End Do


! External Field 2 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZffG*cplGluFucSuL(gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZffG)*cplGluFucSuR(gt3,gt1)


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt3)*cplGluFucSuL(i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt3))*cplGluFucSuR(i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt3) = AmpC 
    End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToGluFu


Subroutine Amplitude_VERTEX_BLSSM_SuToGluFu(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplAhSucSu,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,           & 
& cplGluFdcSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSuVZ,cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplAhSucSu(4,6,6),cplChaFucSdL(2,3,6),          & 
& cplChaFucSdR(2,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),         & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),& 
& cplcFuFuVZpR(3,3),cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),       & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplSdcHpmcSu(6,2,6),             & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MGlu 
Mex3 = MFu(gt3) 


! {Fd, Cha, Sd}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdGluSdL(i1,i3)
coup2R = cplcFdGluSdR(i1,i3)
coup3L = cplChaFucSdL(i2,gt3,i3)
coup3R = cplChaFucSdR(i2,gt3,i3)
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


! {Fu, Chi, Su}
Do i1=1,3
  Do i2=1,7
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuGluSuL(i1,i3)
coup2R = cplcFuGluSuR(i1,i3)
coup3L = cplChiFucSuL(i2,gt3,i3)
coup3R = cplChiFucSuR(i2,gt3,i3)
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


! {Fu, Glu, Su}
Do i1=1,3
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MGlu 
ML3 = MSu(i3) 
coup1L = cplGluFucSuL(i1,gt1)
coup1R = cplGluFucSuR(i1,gt1)
coup2L = cplcFuGluSuL(i1,i3)
coup2R = cplcFuGluSuR(i1,i3)
coup3L = cplGluFucSuL(gt3,i3)
coup3R = cplGluFucSuR(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Glu, bar[Fu], VG}
  Do i2=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do


! {Sd, Hpm, Fd}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MFd(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFuHpmL(i3,gt3,i2)
coup3R = cplcFdFuHpmR(i3,gt3,i2)
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


! {Sd, VWm, Fd}
Do i1=1,6
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MFd(i3) 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = cplcFdFuVWmL(i3,gt3)
coup3R = cplcFdFuVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, Ah, Fu}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuAhL(i3,gt3,i2)
coup3R = cplcFuFuAhR(i3,gt3,i2)
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


! {Su, hh, Fu}
Do i1=1,6
  Do i2=1,4
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
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


! {Su, VG, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MFu(i3) 
coup1 = -cplSucSuVG(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVGL(i3,gt3)
coup3R = cplcFuFuVGR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Su, VP, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZ, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplSucSuVZ(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZp, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MFu(i3) 
coup1 = -cplSucSuVZp(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVZpL(i3,gt3)
coup3R = cplcFuFuVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Su], Glu}
  Do i2=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MGlu 
coup1 = -cplSucSuVG(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplGluFucSuL(gt3,i2)
coup3R = cplGluFucSuR(gt3,i2)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToGluFu


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToGluFu(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplAhSucSu,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,           & 
& cplGluFdcSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSuVZ,cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplAhSucSu(4,6,6),cplChaFucSdL(2,3,6),          & 
& cplChaFucSdR(2,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),         & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),& 
& cplcFuFuVZpR(3,3),cplGluGluVGL,cplGluGluVGR,cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),       & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplSdcHpmcSu(6,2,6),             & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MGlu 
Mex3 = MFu(gt3) 


! {Glu, bar[Fu], VG}
  Do i2=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do


! {Su, VG, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MFu(i3) 
coup1 = -cplSucSuVG(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVGL(i3,gt3)
coup3R = cplcFuFuVGR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
End Do


! {Su, VP, Fu}
Do i1=1,6
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplSucSuVP(i1,gt1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VG, conj[Su], Glu}
  Do i2=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MGlu 
coup1 = -cplSucSuVG(i2,gt1)
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
coup3L = cplGluFucSuL(gt3,i2)
coup3R = cplGluFucSuR(gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt3) = Amp(:,gt1, gt3) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
  End Do
    End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToGluFu


Subroutine Amplitude_Tree_BLSSM_SuToSuhh(cplhhSucSu,Mhh,MSu,Mhh2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(4),MSu(6),Mhh2(4),MSu2(6)

Complex(dp), Intent(in) :: cplhhSucSu(4,6,6)

Complex(dp) :: Amp(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSucSu(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToSuhh


Subroutine Gamma_Real_BLSSM_SuToSuhh(MLambda,em,gs,cplhhSucSu,Mhh,MSu,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSucSu(4,6,6)

Real(dp), Intent(in) :: Mhh(4),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
Coup = cplhhSucSu(i3,i2,i1)
Mex1 = MSu(i1)
Mex2 = MSu(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToSuhh


Subroutine Amplitude_WAVE_BLSSM_SuToSuhh(cplhhSucSu,ctcplhhSucSu,Mhh,Mhh2,            & 
& MSu,MSu2,Zfhh,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplhhSucSu(4,6,6)

Complex(dp), Intent(in) :: ctcplhhSucSu(4,6,6)

Complex(dp), Intent(in) :: Zfhh(4,4),ZfSu(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSucSu(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplhhSucSu(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplhhSucSu(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSucSu(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuhh


Subroutine Amplitude_VERTEX_BLSSM_SuToSuhh(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,MVZ2,               & 
& MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,               & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,& 
& cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhSucSu(4,6,6),     & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),         & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),             & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),              & 
& cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),         & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),     & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplSucSuVZp(6,6),cplAhAhSucSuaa(4,4,6,6),cplhhhhSucSuaa(4,4,6,6),cplhhHpmSucSdaa(4,2,6,6),& 
& cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),       & 
& cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),        & 
& cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),    & 
& cplSuSvReSvRecSuaa(6,6,6,6),cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),cplSucSucVWmVWmaa(6,6),& 
& cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6),cplSucSuVZpVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fd, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
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


! {Fu, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Sd, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
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


! {Sd, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sd, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = -cplSucSdVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, Ah, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, VZ, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, VZp, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, hh, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
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


! {Su, VZ, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, Ah, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
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


! {Su, VP, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplSucSuVP(i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, Ah, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
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


! {Su, VP, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplSucSuVP(i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = -cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = -cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = -cplSucSdVWm(gt2,i3)
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


! {hh, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhhhSucSuaa(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplhhHpmSucSdaa(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhhhSucSuaa(gt3,i1,i2,gt1)
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
coup1 = cplhhSdcHpmcSuaa(gt3,i1,i2,gt1)
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


! {Ah, Ah}
Do i1=1,4
  Do i2=1,4
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSucSuaa(i1,i2,gt2,gt1)
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
coup1 = cplhhhhSucSuaa(i1,i2,gt2,gt1)
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
coup1 = cplHpmSucHpmcSuaa(i1,gt2,i2,gt1)
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
coup1 = cplSdSucSdcSuabba(i1,gt2,i2,gt1)
coup2 = cplhhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSdSucSdcSuabab(i1,gt2,i2,gt1)
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
coup1 = cplSeSucSecSuaa(i1,gt2,i2,gt1)
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
coup1 = cplSuSucSucSuabba(gt2,i1,gt1,i2)
coup2 = cplhhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

coup1 = cplSuSucSucSuabab(gt2,i1,gt1,i2)
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
coup1 = cplSuSvImSvImcSuaa(gt2,i1,i2,gt1)
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


! {SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSuSvImSvRecSuaa(gt2,i1,i2,gt1)
coup2 = cplhhSvImSvRe(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSvRe(i2) 
coup1 = cplSuSvReSvRecSuaa(gt2,i1,i2,gt1)
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
coup1 = cplSucSuVPVZaa(gt2,gt1)
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
coup1 = cplSucSuVPVZpaa(gt2,gt1)
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
coup1 = cplSucSucVWmVWmaa(gt2,gt1)
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
coup1 = cplSucSuVZVZaa(gt2,gt1)
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
coup1 = cplSucSuVZVZpaa(gt2,gt1)
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
coup1 = cplSucSuVZpVZpaa(gt2,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuhh


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuhh(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhAhhh,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,          & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvImSvIm,cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,           & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvImSvImcSuaa,& 
& cplSuSvImSvRecSuaa,cplSuSvReSvRecSuaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSucVWmVWmaa,& 
& cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhSucSu(4,6,6),     & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),         & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),             & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),              & 
& cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),         & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),     & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmSucSd(2,6,6),cplSdcHpmcSu(6,2,6),      & 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplSucSuVZp(6,6),cplAhAhSucSuaa(4,4,6,6),cplhhhhSucSuaa(4,4,6,6),cplhhHpmSucSdaa(4,2,6,6),& 
& cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),       & 
& cplSdSucSdcSuabab(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSuSucSucSuabba(6,6,6,6),        & 
& cplSuSucSucSuabab(6,6,6,6),cplSuSvImSvImcSuaa(6,6,6,6),cplSuSvImSvRecSuaa(6,6,6,6),    & 
& cplSuSvReSvRecSuaa(6,6,6,6),cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),cplSucSucVWmVWmaa(6,6),& 
& cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6),cplSucSuVZpVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = Mhh(gt3) 


! {Su, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
coup3 = -cplAhhhVP(i3,gt3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = -cplAhhhVP(i2,gt3)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, VZ, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = -cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VP, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1 = cplSucSuVP(i1,gt1)
coup2 = -cplSucSuVZ(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Su, VP, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1 = cplSucSuVP(i1,gt1)
coup2 = -cplSucSuVZp(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = -cplSucSuVG(gt2,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = -cplSucSuVP(gt2,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VZ}
ML1 = MVP 
ML2 = MVZ 
coup1 = cplSucSuVPVZaa(gt2,gt1)
coup2 = cplhhVPVZ(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, VZp}
ML1 = MVP 
ML2 = MVZp 
coup1 = cplSucSuVPVZpaa(gt2,gt1)
coup2 = cplhhVPVZp(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuhh


Subroutine Amplitude_Tree_BLSSM_SuTocHpmSd(cplSdcHpmcSu,MHpm,MSd,MSu,MHpm2,           & 
& MSd2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSd(6),MSu(6),MHpm2(2),MSd2(6),MSu2(6)

Complex(dp), Intent(in) :: cplSdcHpmcSu(6,2,6)

Complex(dp) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1 = cplSdcHpmcSu(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuTocHpmSd


Subroutine Gamma_Real_BLSSM_SuTocHpmSd(MLambda,em,gs,cplSdcHpmcSu,MHpm,               & 
& MSd,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSdcHpmcSu(6,2,6)

Real(dp), Intent(in) :: MHpm(2),MSd(6),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,6), GammarealGluon(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=2,2
    Do i3=1,6
Coup = cplSdcHpmcSu(i3,i2,i1)
Mex1 = MSu(i1)
Mex2 = MHpm(i2)
Mex3 = MSd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,2._dp/3._dp,-2._dp/9._dp,1._dp,-1._dp/3._dp,1._dp/9._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,4._dp/3._dp,Coup,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuTocHpmSd


Subroutine Amplitude_WAVE_BLSSM_SuTocHpmSd(cplSdcHpmcSu,ctcplSdcHpmcSu,               & 
& MHpm,MHpm2,MSd,MSd2,MSu,MSu2,ZfHpm,ZfSd,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSd(6),MSd2(6),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplSdcHpmcSu(6,2,6)

Complex(dp), Intent(in) :: ctcplSdcHpmcSu(6,2,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSd(6,6),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSdcHpmcSu(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSdcHpmcSu(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHpm(i1,gt2))*cplSdcHpmcSu(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt3)*cplSdcHpmcSu(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuTocHpmSd


Subroutine Amplitude_VERTEX_BLSSM_SuTocHpmSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,      & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,      & 
& cplcFdGluSdR,cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,             & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,     & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,  & 
& cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,& 
& cplSdcSucVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(4,2,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplAhcHpmVWm(4,2),            & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),   & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplGluFucSuL(3,6),cplGluFucSuR(3,6),         & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhHpmcHpm(4,2,2),cplhhSdcSd(4,6,6),             & 
& cplhhSucSu(4,6,6),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplSucSuVG(6,6),cplSucSuVP(6,6),             & 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),     & 
& cplAhSdcHpmcSuaa(4,6,2,6),cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),        & 
& cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),      & 
& cplSdSvImcSecSuaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),cplSdcSucVWmVPaa(6,6),           & 
& cplSdcSucVWmVZaa(6,6),cplSdcSucVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSd(gt3) 


! {Ah, conj[Su], Hpm}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhHpmcHpm(i1,i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
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


! {Ah, conj[Su], VWm}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhcHpmVWm(i1,gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, bar[Fu], Cha}
Do i1=1,7
  Do i2=1,3
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i1,i3,gt2)
coup2R = cplChiChacHpmR(i1,i3,gt2)
coup3L = cplcChacFuSdL(i3,i2,gt3)
coup3R = cplcChacFuSdR(i3,i2,gt3)
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


! {Fu, Chi, Fd}
Do i1=1,3
  Do i2=1,7
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuFdcHpmL(i1,i3,gt2)
coup2R = cplcFuFdcHpmR(i1,i3,gt2)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
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


! {Fu, Glu, Fd}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MGlu 
ML3 = MFd(i3) 
coup1L = cplGluFucSuL(i1,gt1)
coup1R = cplGluFucSuR(i1,gt1)
coup2L = cplcFuFdcHpmL(i1,i3,gt2)
coup2R = cplcFuFdcHpmR(i1,i3,gt2)
coup3L = cplcFdGluSdL(i3,gt3)
coup3R = cplcFdGluSdR(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {hh, conj[Su], Hpm}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhHpmcHpm(i1,i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
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


! {hh, conj[Su], VWm}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhcHpmVWm(i1,gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Su, Ah, Sd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplAhSdcSd(i2,gt3,i3)
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


! {Su, hh, Sd}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplhhSdcSd(i2,gt3,i3)
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


! {Su, VG, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MSd(i3) 
coup1 = cplSucSuVG(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVG(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {Su, VP, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZ, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VZp, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MSd(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, conj[Su], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplHpmcHpmVP(i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, conj[Su], VWm}
  Do i2=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, conj[Su], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplHpmcHpmVZ(i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Su], VWm}
  Do i2=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZp, conj[Su], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplHpmcHpmVZp(i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Su], VWm}
  Do i2=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplcHpmVWmVZp(gt2)
coup3 = cplSdcSucVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {bar[Cha], bar[Fd], Chi}
Do i1=1,2
  Do i2=1,3
    Do i3=1,7
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i3,i1,gt2)
coup2R = cplChiChacHpmR(i3,i1,gt2)
coup3L = cplcFdChiSdL(i2,i3,gt3)
coup3R = cplcFdChiSdR(i2,i3,gt3)
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


! {conj[Hpm], conj[Sd], Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplAhHpmcHpm(i3,i1,gt2)
coup3 = cplAhSdcSd(i3,gt3,i2)
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


! {conj[Hpm], conj[Sd], hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplhhHpmcHpm(i3,i1,gt2)
coup3 = cplhhSdcSd(i3,gt3,i2)
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


! {conj[Hpm], conj[Sd], VP}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplSdcSdVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Sd], VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmcHpmVZ(i1,gt2)
coup3 = cplSdcSdVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Sd], VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MVZp 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmcHpmVZp(i1,gt2)
coup3 = cplSdcSdVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Sd], Ah}
  Do i2=1,6
    Do i3=1,4
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplAhcHpmVWm(i3,gt2)
coup3 = cplAhSdcSd(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[Sd], hh}
  Do i2=1,6
    Do i3=1,4
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplhhcHpmVWm(i3,gt2)
coup3 = cplhhSdcSd(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[Sd], VP}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSdcSdVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[Sd], VZ}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplSdcSdVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[Sd], VZp}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MVZp 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplcHpmVWmVZp(gt2)
coup3 = cplSdcSdVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSdcHpmcSuaa(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Su]}
Do i1=1,4
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSdcHpmcSuaa(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSdcHpmcSdaa(i2,gt3,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Hpm}
Do i1=1,4
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSdcHpmcSuaa(i1,gt3,i2,gt1)
coup2 = cplAhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, Hpm}
Do i1=1,4
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSdcHpmcSuaa(i1,gt3,i2,gt1)
coup2 = cplhhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSucSdcSuabba(gt3,i1,i2,gt1)
coup2 = cplSdcHpmcSu(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

coup1 = cplSdSucSdcSuabab(gt3,i1,i2,gt1)
coup2 = cplSdcHpmcSu(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {SvIm, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSvIm(i1) 
ML2 = MSe(i2) 
coup1 = cplSdSvImcSecSuaa(gt3,i1,i2,gt1)
coup2 = cplSeSvImcHpm(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {SvRe, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSvRe(i1) 
ML2 = MSe(i2) 
coup1 = cplSdSvRecSecSuaa(gt3,i1,i2,gt1)
coup2 = cplSeSvRecHpm(i2,i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSdcSucVWmVPaa(gt3,gt1)
coup2 = cplcHpmVPVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWm}
ML1 = MVZ 
ML2 = MVWm 
coup1 = cplSdcSucVWmVZaa(gt3,gt1)
coup2 = cplcHpmVWmVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZp, VWm}
ML1 = MVZp 
ML2 = MVWm 
coup1 = cplSdcSucVWmVZpaa(gt3,gt1)
coup2 = cplcHpmVWmVZp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, conj[Sd]}
Do i1=1,4
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSd(i2) 
coup1 = cplAhSdcHpmcSuaa(i1,i2,gt2,gt1)
coup2 = cplAhSdcSd(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhSdcHpmcSuaa(i1,i2,gt2,gt1)
coup2 = cplhhSdcSd(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplHpmSucHpmcSuaa(i1,i2,gt2,gt1)
coup2 = cplSdcHpmcSu(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_SuTocHpmSd


Subroutine Amplitude_IR_VERTEX_BLSSM_SuTocHpmSd(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
& Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFu2,MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVG2,MVP2,MVWm2,               & 
& MVZ2,MVZp2,cplAhHpmcHpm,cplAhSdcSd,cplAhSucSu,cplAhcHpmVWm,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcChaFdcSuL,      & 
& cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,      & 
& cplcFdGluSdR,cplhhHpmcHpm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplHpmcHpmVP,             & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSeSvImcHpm,cplSeSvRecHpm,     & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,  & 
& cplAhSdcHpmcSuaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvImcSecSuaa,cplSdSvRecSecSuaa,cplSdcSucVWmVPaa,cplSdcSucVWmVZaa,& 
& cplSdcSucVWmVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSe(6),               & 
& MSu(6),MSvIm(6),MSvRe(6),MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),              & 
& MFd2(3),MFu2(3),MGlu2,Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSvIm2(6),              & 
& MSvRe2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(4,2,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplAhcHpmVWm(4,2),            & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),   & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplGluFucSuL(3,6),cplGluFucSuR(3,6),         & 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplhhHpmcHpm(4,2,2),cplhhSdcSd(4,6,6),             & 
& cplhhSucSu(4,6,6),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplSucSuVG(6,6),cplSucSuVP(6,6),             & 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),     & 
& cplAhSdcHpmcSuaa(4,6,2,6),cplhhSdcHpmcSuaa(4,6,2,6),cplHpmSdcHpmcSdaa(2,6,2,6),        & 
& cplHpmSucHpmcSuaa(2,6,2,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),      & 
& cplSdSvImcSecSuaa(6,6,6,6),cplSdSvRecSecSuaa(6,6,6,6),cplSdcSucVWmVPaa(6,6),           & 
& cplSdcSucVWmVZaa(6,6),cplSdcSucVWmVZpaa(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSd(gt3) 


! {Su, VG, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MSd(i3) 
coup1 = cplSucSuVG(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVG(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
End Do


! {Su, VP, Sd}
Do i1=1,6
    Do i3=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplSdcHpmcSu(i3,gt2,i1)
coup3 = cplSdcSdVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, conj[Su], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplHpmcHpmVP(i3,gt2)
coup3 = cplSdcHpmcSu(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, conj[Su], VWm}
  Do i2=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSdcSucVWm(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hpm], conj[Sd], VP}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplSdcSdVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Sd], VP}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MVP 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSdcSdVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSdcSucVWmVPaa(gt3,gt1)
coup2 = cplcHpmVPVWm(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuTocHpmSd


Subroutine Amplitude_Tree_BLSSM_SuToSdcVWm(cplSdcSucVWm,MSd,MSu,MVWm,MSd2,            & 
& MSu2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSu(6),MVWm,MSd2(6),MSu2(6),MVWm2

Complex(dp), Intent(in) :: cplSdcSucVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSdcSucVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToSdcVWm


Subroutine Gamma_Real_BLSSM_SuToSdcVWm(MLambda,em,gs,cplSdcSucVWm,MSd,MSu,            & 
& MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSdcSucVWm(6,6)

Real(dp), Intent(in) :: MSd(6),MSu(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSdcSucVWm(i2,i1)
Mex1 = MSu(i1)
Mex2 = MSd(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,2._dp/3._dp,-1._dp/3._dp,1._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToSdcVWm


Subroutine Amplitude_WAVE_BLSSM_SuToSdcVWm(cplSdcSucVWm,ctcplSdcSucVWm,               & 
& MSd,MSd2,MSu,MSu2,MVWm,MVWm2,ZfSd,ZfSu,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSd(6),MSd2(6),MSu(6),MSu2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSdcSucVWm(6,6)

Complex(dp), Intent(in) :: ctcplSdcSucVWm(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSdcSucVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSdcSucVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSd(i1,gt2)*cplSdcSucVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSdcSucVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSdcVWm


Subroutine Amplitude_VERTEX_BLSSM_SuToSdcVWm(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSucSu,cplChiChacVWmL,cplChiChacVWmR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,       & 
& cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,            & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,  & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSdcSucVWmVPaa,cplSdcSdcVWmVWmaa,cplSdcSucVWmVZaa,        & 
& cplSdcSucVWmVZpaa,cplSucSucVWmVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplChiChacVWmL(7,2),            & 
& cplChiChacVWmR(7,2),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFdGluSdL(3,6),              & 
& cplcFdGluSdR(3,6),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSdVG(6,6),      & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6), & 
& cplSucSuVZp(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSdcSucVWmVPaa(6,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSucVWmVZaa(6,6),cplSdcSucVWmVZpaa(6,6),& 
& cplSucSucVWmVWmaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVWm 


! {Ah, conj[Su], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSdcSd(i1,gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
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


! {Chi, bar[Fu], bar[Fd]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFdChiSdL(i3,i1,gt2)
coup2R = cplcFdChiSdR(i3,i1,gt2)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
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


! {Fd, Cha, Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,7
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChiSdL(i1,i3,gt2)
coup2R = cplcFdChiSdR(i1,i3,gt2)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
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


! {Fu, Chi, bar[Cha]}
Do i1=1,3
  Do i2=1,7
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcChacFuSdL(i3,i1,gt2)
coup2R = cplcChacFuSdR(i3,i1,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
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


! {Glu, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFdGluSdL(i3,gt2)
coup2R = cplcFdGluSdR(i3,gt2)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Sd]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSdcSd(i1,gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
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


! {Sd, Hpm, Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplAhSdcSd(i3,gt2,i1)
coup3 = cplAhHpmcVWm(i3,i2)
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


! {Sd, Hpm, hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
coup3 = cplhhHpmcVWm(i3,i2)
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


! {Sd, VWm, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplhhSdcSd(i3,gt2,i1)
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


! {Sd, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, Hpm, VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VZ}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSdcSdVZ(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, Hpm, VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VZp}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSdcSdVZp(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, Ah, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = -cplAhHpmcVWm(i2,i3)
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


! {Su, hh, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {Su, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSucSuVP(i1,gt1)
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


! {Su, VZ, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSucSuVZ(i1,gt1)
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


! {Su, VZp, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSucSuVZp(i1,gt1)
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


! {Su, hh, conj[VWm]}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
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


! {Su, VP, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplSdcSdVZ(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplSdcSdVZp(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2 = cplSdcSdcVWmVWmaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSdcSucVWmVGLamct4ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSdcSucVWmVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = -cplSucSuVZ(i1,gt1)
coup2 = cplSdcSucVWmVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = -cplSucSuVZp(i1,gt1)
coup2 = cplSdcSucVWmVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSucVWmVGLamct4ct2ct1(i1,gt1)
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
coup1 = cplSdcSucVWmVPaa(i1,gt1)
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
coup1 = cplSdcSucVWmVZaa(i1,gt1)
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
coup1 = cplSdcSucVWmVZpaa(i1,gt1)
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
coup1 = cplSucSucVWmVWmaa(i1,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSdcVWm


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSdcVWm(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSucSu,cplChiChacVWmL,cplChiChacVWmR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,       & 
& cplcFdChiSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,             & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSdVG,cplSdcSdVP,            & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,  & 
& cplSdcSucVWmVGLamct4ct2ct1,cplSdcSucVWmVPaa,cplSdcSdcVWmVWmaa,cplSdcSucVWmVZaa,        & 
& cplSdcSucVWmVZpaa,cplSucSucVWmVWmaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSucSu(4,6,6),cplChiChacVWmL(7,2),            & 
& cplChiChacVWmR(7,2),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFdGluSdL(3,6),              & 
& cplcFdGluSdR(3,6),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSdVG(6,6),      & 
& cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6), & 
& cplSucSuVZp(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSdcSucVWmVPaa(6,6),cplSdcSdcVWmVWmaa(6,6),cplSdcSucVWmVZaa(6,6),cplSdcSucVWmVZpaa(6,6),& 
& cplSucSucVWmVWmaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSd(gt2) 
Mex3 = MVWm 


! {Sd, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplSdcHpmcSu(gt2,i3,i1)
coup3 = cplHpmcVWmVP(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, VP, conj[VWm]}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplSdcSucVWm(gt2,i1)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSdcSdVG(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSdcSdVP(gt2,i3)
coup3 = cplSdcSucVWm(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSdcSucVWmVGLamct4ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSdcSucVWmVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VG}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVG 
coup1 = cplSdcSucVWmVGLamct4ct2ct1(i1,gt1)
coup2 = cplSdcSdVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Sd, VP}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVP 
coup1 = cplSdcSucVWmVPaa(i1,gt1)
coup2 = cplSdcSdVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSdcVWm


Subroutine Amplitude_Tree_BLSSM_SuToSuVZ(cplSucSuVZ,MSu,MVZ,MSu2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MVZ,MSu2(6),MVZ2

Complex(dp), Intent(in) :: cplSucSuVZ(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplSucSuVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToSuVZ


Subroutine Gamma_Real_BLSSM_SuToSuVZ(MLambda,em,gs,cplSucSuVZ,MSu,MVZ,GammarealPhoton,& 
& GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSucSuVZ(6,6)

Real(dp), Intent(in) :: MSu(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSucSuVZ(i2,i1)
Mex1 = MSu(i1)
Mex2 = MSu(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,2._dp/3._dp,2._dp/3._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToSuVZ


Subroutine Amplitude_WAVE_BLSSM_SuToSuVZ(cplSucSuVP,cplSucSuVZ,cplSucSuVZp,           & 
& ctcplSucSuVP,ctcplSucSuVZ,ctcplSucSuVZp,MSu,MSu2,MVP,MVP2,MVZ,MVZ2,ZfSu,               & 
& ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MSu2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ctcplSucSuVP(6,6),ctcplSucSuVZ(6,6),ctcplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ZfSu(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSucSuVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSucSuVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplSucSuVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplSucSuVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSucSuVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplSucSuVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuVZ


Subroutine Amplitude_VERTEX_BLSSM_SuToSuVZ(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSucSu,cplcFdChaSuL,          & 
& cplcFdChaSuR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSucVWmVZaa,         & 
& cplSucSuVGVZLamct3ct2ct1,cplSucSuVPVZaa,cplSucSdVWmVZaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),             & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),           & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),& 
& cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),           & 
& cplHpmSucSd(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSdcHpmcSu(6,2,6),& 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplSucSuVZp(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSdcSucVWmVZaa(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),& 
& cplSucSuVPVZaa(6,6),cplSucSdVWmVZaa(6,6),cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZ 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fd, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
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


! {Fu, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Sd, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
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


! {Sd, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
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


! {Sd, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
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


! {Su, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
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


! {Su, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
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


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplSucSdVWm(gt2,i3)
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


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVWmVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = -cplSucSuVZ(i1,gt1)
coup2 = cplSucSuVZVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = -cplSucSuVZp(i1,gt1)
coup2 = cplSucSuVZVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = cplSdcSucVWmVZaa(i1,gt1)
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
coup1 = cplSucSuVGVZLamct3ct2ct1(i1,gt1)
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
coup1 = cplSucSuVPVZaa(i1,gt1)
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
coup1 = cplSucSuVZVZaa(i1,gt1)
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
coup1 = cplSucSuVZVZpaa(i1,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuVZ


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVZ(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSucSu,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVZL,cplcFuFuVZR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmSucSd,cplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplSdcSdVZ,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSdcSucVWmVZaa,         & 
& cplSucSuVGVZLamct3ct2ct1,cplSucSuVPVZaa,cplSucSdVWmVZaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),             & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),           & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),& 
& cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),           & 
& cplHpmSucSd(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplSdcHpmcSu(6,2,6),& 
& cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),    & 
& cplSucSuVZp(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplSdcSucVWmVZaa(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),& 
& cplSucSuVPVZaa(6,6),cplSucSdVWmVZaa(6,6),cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZ 


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSuVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSuVGVZLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSuVPVZaa(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVZ


Subroutine Amplitude_Tree_BLSSM_SuToSuVZp(cplSucSuVZp,MSu,MVZp,MSu2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MVZp,MSu2(6),MVZp2

Complex(dp), Intent(in) :: cplSucSuVZp(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = -cplSucSuVZp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_SuToSuVZp


Subroutine Gamma_Real_BLSSM_SuToSuVZp(MLambda,em,gs,cplSucSuVZp,MSu,MVZp,             & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSucSuVZp(6,6)

Real(dp), Intent(in) :: MSu(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSucSuVZp(i2,i1)
Mex1 = MSu(i1)
Mex2 = MSu(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,2._dp/3._dp,2._dp/3._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,gs,1._dp,1._dp,0._dp,Coup,Gammarealgluon(i1,i2),kont)
 GammarealGluon(i1,i2) = GammarealGluon(i1,i2)*4._dp/3._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_SuToSuVZp


Subroutine Amplitude_WAVE_BLSSM_SuToSuVZp(cplSucSuVP,cplSucSuVZ,cplSucSuVZp,          & 
& ctcplSucSuVP,ctcplSucSuVZ,ctcplSucSuVZp,MSu,MSu2,MVP,MVP2,MVZp,MVZp2,ZfSu,             & 
& ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MSu2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ctcplSucSuVP(6,6),ctcplSucSuVZ(6,6),ctcplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ZfSu(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSucSuVZp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSucSuVZp(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplSucSuVZp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZp*cplSucSuVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplSucSuVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplSucSuVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuVZp


Subroutine Amplitude_VERTEX_BLSSM_SuToSuVZp(MAh,MCha,MChi,MFd,MFu,MGlu,               & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSucSu,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFucSuL,   & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,        & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,   & 
& cplHpmcVWmVZp,cplSdcSdVZp,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,             & 
& cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSucVWmVZpaa,      & 
& cplSucSuVGVZpLamct3ct2ct1,cplSucSuVPVZpaa,cplSucSdVWmVZpaa,cplSucSuVZVZpaa,            & 
& cplSucSuVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),         & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZp(4),cplhhVZVZp(4),     & 
& cplhhVZpVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),& 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSdcSucVWmVZpaa(6,6),& 
& cplSucSuVGVZpLamct3ct2ct1(6,6),cplSucSuVPVZpaa(6,6),cplSucSdVWmVZpaa(6,6),             & 
& cplSucSuVZVZpaa(6,6),cplSucSuVZpVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZp 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fd, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = -cplcChaChaVZpR(i3,i2)
coup3R = -cplcChaChaVZpL(i3,i2)
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


! {Fu, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuVZpL(i2,i3)
coup3R = cplcFuFuVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Sd, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = -cplHpmcHpmVZp(i2,i3)
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


! {Sd, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
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


! {Sd, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
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


! {Su, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
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


! {Su, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
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


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplSucSdVWm(gt2,i3)
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


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVWmVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = -cplSucSuVZ(i1,gt1)
coup2 = cplSucSuVZVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = -cplSucSuVZp(i1,gt1)
coup2 = cplSucSuVZpVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = cplSdcSucVWmVZpaa(i1,gt1)
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
coup1 = cplSucSuVGVZpLamct3ct2ct1(i1,gt1)
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
coup1 = cplSucSuVPVZpaa(i1,gt1)
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
coup1 = cplSucSuVZVZpaa(i1,gt1)
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
coup1 = cplSucSuVZpVZpaa(i1,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuVZp


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVZp(MAh,MCha,MChi,MFd,MFu,MGlu,            & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSucSu,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFucSuL,   & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,        & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmcHpmVZp,   & 
& cplHpmcVWmVZp,cplSdcSdVZp,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,             & 
& cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSdcSucVWmVZpaa,      & 
& cplSucSuVGVZpLamct3ct2ct1,cplSucSuVPVZpaa,cplSucSdVWmVZpaa,cplSucSuVZVZpaa,            & 
& cplSucSuVZpVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),         & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),         & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZp(4),cplhhVZVZp(4),     & 
& cplhhVZpVZp(4),cplHpmSucSd(2,6,6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),& 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),& 
& cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSdcSucVWmVZpaa(6,6),& 
& cplSucSuVGVZpLamct3ct2ct1(6,6),cplSucSuVPVZpaa(6,6),cplSucSdVWmVZpaa(6,6),             & 
& cplSucSuVZVZpaa(6,6),cplSucSuVZpVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVZp 


! {Su, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1 = cplSucSuVP(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Su, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVZp(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSuVZp(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSuVGVZpLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSuVPVZpaa(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVZp


Subroutine Amplitude_WAVE_BLSSM_SuToSuVG(cplSucSuVG,ctcplSucSuVG,MSu,MSu2,            & 
& MVG,MVG2,ZfSu,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MSu2(6),MVG,MVG2

Complex(dp), Intent(in) :: cplSucSuVG(6,6)

Complex(dp), Intent(in) :: ctcplSucSuVG(6,6)

Complex(dp), Intent(in) :: ZfSu(6,6),ZfVG

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVG 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSucSuVG(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSucSuVG(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplSucSuVG(i1,gt1)
End Do


! External Field 3 


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuVG


Subroutine Amplitude_VERTEX_BLSSM_SuToSuVG(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSucSu,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVGL,cplcFdFdVGR,           & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,cplcFuFuVGR,         & 
& cplGluGluVGL,cplGluGluVGR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcSdVG,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,     & 
& cplSucSuVZp,cplVGVGVG,cplSdcSucVWmVGLamct4ct2ct1,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSucSuVGVPLamct3ct2ct1,cplSucSdVGVWmLamct3ct2ct1,& 
& cplSucSuVGVZLamct3ct2ct1,cplSucSuVGVZpLamct3ct2ct1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(7,3,6),        & 
& cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),          & 
& cplGluFucSuR(3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR,         & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplHpmSucSd(2,6,6),              & 
& cplSdcSdVG(6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6), & 
& cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplVGVGVG,cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSucSuVGVPLamct3ct2ct1(6,6),cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),& 
& cplSucSuVGVZpLamct3ct2ct1(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVG 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fu, Glu, Glu}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MGlu 
ML3 = MGlu 
coup1L = cplGluFucSuL(i1,gt1)
coup1R = cplGluFucSuR(i1,gt1)
coup2L = cplcFuGluSuL(i1,gt2)
coup2R = cplcFuGluSuR(i1,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Su, VG, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MVG 
coup1 = cplSucSuVG(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
coup3 = cplVGVGVG
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVG(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplSucSdVWm(gt2,i3)
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


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVGVWmLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
coup2 = cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = -cplSucSuVZ(i1,gt1)
coup2 = cplSucSuVGVZLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = -cplSucSuVZp(i1,gt1)
coup2 = cplSucSuVGVZpLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = cplSdcSucVWmVGLamct4ct2ct1(i1,gt1)
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
coup1 = cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

coup1 = cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i1,gt1)
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
coup1 = cplSucSuVGVPLamct3ct2ct1(i1,gt1)
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
coup1 = cplSucSuVGVZLamct3ct2ct1(i1,gt1)
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
coup1 = cplSucSuVGVZpLamct3ct2ct1(i1,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuVG


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVG(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSucSu,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,            & 
& cplHpmSucSd,cplSdcSdVG,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,    & 
& cplSucSuVZ,cplSucSuVZp,cplVGVGVG,cplSdcSucVWmVGLamct4ct2ct1,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,cplSucSuVGVPLamct3ct2ct1,cplSucSdVGVWmLamct3ct2ct1,& 
& cplSucSuVGVZLamct3ct2ct1,cplSucSuVGVZpLamct3ct2ct1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplChiFucSuL(7,3,6),        & 
& cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),          & 
& cplGluFucSuR(3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR,         & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplHpmSucSd(2,6,6),              & 
& cplSdcSdVG(6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6), & 
& cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),cplVGVGVG,cplSdcSucVWmVGLamct4ct2ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSucSuVGVPLamct3ct2ct1(6,6),cplSucSdVGVWmLamct3ct2ct1(6,6),cplSucSuVGVZLamct3ct2ct1(6,6),& 
& cplSucSuVGVZpLamct3ct2ct1(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVG 


! {Su, VG, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
ML3 = MVG 
coup1 = cplSucSuVG(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
coup3 = cplVGVGVG
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVG(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSuVG(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
coup2 = cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

coup1 = cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSuVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVG


Subroutine Amplitude_WAVE_BLSSM_SuToSuVP(cplSucSuVP,cplSucSuVZ,cplSucSuVZp,           & 
& ctcplSucSuVP,ctcplSucSuVZ,ctcplSucSuVZp,MSu,MSu2,MVP,MVP2,ZfSu,ZfVP,ZfVZpVP,           & 
& ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSu(6),MSu2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ctcplSucSuVP(6,6),ctcplSucSuVZ(6,6),ctcplSucSuVZp(6,6)

Complex(dp), Intent(in) :: ZfSu(6,6),ZfVP,ZfVZpVP,ZfVZVP

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSu(i1,gt1))*cplSucSuVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSu(i1,gt2)*cplSucSuVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSucSuVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplSucSuVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_SuToSuVP


Subroutine Amplitude_VERTEX_BLSSM_SuToSuVP(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSucSu,cplcFdChaSuL,          & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVPL,cplcFuFuVPR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,    & 
& cplSdcSdVP,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,     & 
& cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplSdcSucVWmVPaa,cplSucSuVGVPLamct3ct2ct1,       & 
& cplSucSuVPVPaa,cplSucSdVPVWmaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),             & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),             & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),           & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuGluSuL(3,6),& 
& cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplHpmSucSd(2,6,6),     & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),& 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplSdcSucVWmVPaa(6,6),cplSucSuVGVPLamct3ct2ct1(6,6),      & 
& cplSucSuVPVPaa(6,6),cplSucSdVPVWmaa(6,6),cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVP 


! {Ah, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplAhSucSu(i1,i2,gt1)
coup2 = cplAhSucSu(i1,gt2,i3)
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


! {Chi, bar[Fu], bar[Fu]}
Do i1=1,7
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(i1,i2,gt1)
coup1R = cplChiFucSuR(i1,i2,gt1)
coup2L = cplcFuChiSuL(i3,i1,gt2)
coup2R = cplcFuChiSuR(i3,i1,gt2)
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


! {Fd, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFdcSuL(i2,i1,gt1)
coup1R = cplcChaFdcSuR(i2,i1,gt1)
coup2L = cplcFdChaSuL(i1,i3,gt2)
coup2R = cplcFdChaSuR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
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


! {Fu, Chi, Chi}
Do i1=1,3
  Do i2=1,7
    Do i3=1,7
ML1 = MFu(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFucSuL(i2,i1,gt1)
coup1R = cplChiFucSuR(i2,i1,gt1)
coup2L = cplcFuChiSuL(i1,i3,gt2)
coup2R = cplcFuChiSuR(i1,i3,gt2)
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


! {Glu, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MGlu 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplGluFucSuL(i2,gt1)
coup1R = cplGluFucSuR(i2,gt1)
coup2L = cplcFuGluSuL(i3,gt2)
coup2R = cplcFuGluSuR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {hh, conj[Su], conj[Su]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplhhSucSu(i1,i2,gt1)
coup2 = cplhhSucSu(i1,gt2,i3)
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


! {Sd, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplHpmSucSd(i3,gt2,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
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


! {Sd, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSdcSucVWm(i1,gt1)
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


! {Sd, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSd(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSdcHpmcSu(i1,i2,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sd, VWm, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplAhSucSu(i3,gt2,i1)
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


! {Su, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSucSu(i2,i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZ(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MSu(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSucSuVZp(i1,gt1)
coup2 = cplhhSucSu(i3,gt2,i1)
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


! {Su, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZ(gt2,i1)
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


! {Su, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MSu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSucSu(i2,i1,gt1)
coup2 = cplSucSuVZp(gt2,i1)
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


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
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


! {VZ, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZ(i2,gt1)
coup2 = cplSucSuVZ(gt2,i3)
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


! {VZp, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVZp(i2,gt1)
coup2 = cplSucSuVZp(gt2,i3)
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


! {bar[Cha], bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(i1,i2,gt1)
coup1R = cplcChaFdcSuR(i1,i2,gt1)
coup2L = cplcFdChaSuL(i3,i1,gt2)
coup2R = cplcFdChaSuR(i3,i1,gt2)
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


! {conj[Hpm], conj[Sd], conj[Sd]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcHpmcSu(i2,i1,gt1)
coup2 = cplHpmSucSd(i1,gt2,i3)
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


! {conj[VWm], conj[Sd], conj[Sd]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1 = cplSdcSucVWm(i2,gt1)
coup2 = cplSucSdVWm(gt2,i3)
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


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = -cplSdcSucVWm(i1,gt1)
coup2 = cplSucSdVPVWmaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZ}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZ 
coup1 = -cplSucSuVZ(i1,gt1)
coup2 = cplSucSuVPVZaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VZp}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVZp 
coup1 = -cplSucSuVZp(i1,gt1)
coup2 = cplSucSuVPVZpaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sd, VWm}
Do i1=1,6
ML1 = MSd(i1) 
ML2 = MVWm 
coup1 = cplSdcSucVWmVPaa(i1,gt1)
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
coup1 = cplSucSuVGVPLamct3ct2ct1(i1,gt1)
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
coup1 = cplSucSuVPVPaa(i1,gt1)
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
coup1 = cplSucSuVPVZaa(i1,gt1)
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
coup1 = cplSucSuVPVZpaa(i1,gt1)
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
End Subroutine Amplitude_VERTEX_BLSSM_SuToSuVP


Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVP(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVP,cplAhSucSu,cplcFdChaSuL,     & 
& cplcFdChaSuR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,          & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVPL,cplcFuFuVPR,cplcFuGluSuL,          & 
& cplcFuGluSuR,cplhhSucSu,cplhhVPVZ,cplhhVPVZp,cplHpmSucSd,cplHpmcHpmVP,cplHpmcVWmVP,    & 
& cplSdcSdVP,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,     & 
& cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplSdcSucVWmVPaa,cplSucSuVGVPLamct3ct2ct1,       & 
& cplSucSuVPVPaa,cplSucSdVPVWmaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplAhSucSu(4,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),             & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),             & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),           & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuGluSuL(3,6),& 
& cplcFuGluSuR(3,6),cplhhSucSu(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplHpmSucSd(2,6,6),     & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),& 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSdVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplSdcSucVWmVPaa(6,6),cplSucSuVGVPLamct3ct2ct1(6,6),      & 
& cplSucSuVPVPaa(6,6),cplSucSdVPVWmaa(6,6),cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6)

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
Mex1 = MSu(gt1) 
Mex2 = MSu(gt2) 
Mex3 = MVP 


! {VG, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVG 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVG(i2,gt1)
coup2 = cplSucSuVG(gt2,i3)
coup3 = cplSucSuVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, conj[Su], conj[Su]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1 = cplSucSuVP(i2,gt1)
coup2 = cplSucSuVP(gt2,i3)
coup3 = cplSucSuVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = -cplSucSuVG(i1,gt1)
coup2 = cplSucSuVGVPLamct3ct2ct1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = -cplSucSuVP(i1,gt1)
coup2 = cplSucSuVPVPaa(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Su, VG}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVG 
coup1 = cplSucSuVGVPLamct3ct2ct1(i1,gt1)
coup2 = cplSucSuVG(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 

End Do


! {Su, VP}
Do i1=1,6
ML1 = MSu(i1) 
ML2 = MVP 
coup1 = cplSucSuVPVPaa(i1,gt1)
coup2 = cplSucSuVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_SuToSuVP



End Module OneLoopDecay_Su_BLSSM
