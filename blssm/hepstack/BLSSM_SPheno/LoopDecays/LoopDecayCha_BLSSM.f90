! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:09 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Cha_BLSSM
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

Subroutine Amplitude_Tree_BLSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,               & 
& MAh,MCha,MAh2,MCha2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MAh2(4),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4)

Complex(dp) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChaAhL(gt1,gt2,gt3)
coupT1R = cplcChaChaAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChaAh


Subroutine Gamma_Real_BLSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,     & 
& MAh,MCha,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4)

Real(dp), Intent(in) :: MAh(4),MCha(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,4), GammarealGluon(2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
    Do i3=3,4
CoupL = cplcChaChaAhL(i1,i2,i3)
CoupR = cplcChaChaAhR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChaAh


Subroutine Amplitude_WAVE_BLSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,               & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4)

Complex(dp), Intent(in) :: ctcplcChaChaAhL(2,2,4),ctcplcChaChaAhR(2,2,4)

Complex(dp), Intent(in) :: ZfAh(4,4),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChaAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplcChaChaAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplcChaChaAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChaAh


Subroutine Amplitude_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFeFeAhL(3,3,4),          & 
& cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplFvFvAhL(6,6,4),            & 
& cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),   & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),      & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),   & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = -cplAhhhVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = -cplAhhhVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = -cplAhhhVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = -cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = cplAhSucSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplAhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,7
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,i2,gt3)
coup3R = cplcFuFuAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChaAh


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,   & 
& cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,     & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFeFeAhL(3,3,4),          & 
& cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplFvFvAhL(6,6,4),            & 
& cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),   & 
& cplAhHpmcVWm(4,2),cplAhSdcSd(4,6,6),cplAhSecSe(4,6,6),cplAhSucSu(4,6,6),               & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),      & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),   & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = -cplAhhhVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaAh


Subroutine Amplitude_Tree_BLSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,               & 
& MCha,Mhh,MCha2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),Mhh(4),MCha2(2),Mhh2(4)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4)

Complex(dp) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChahhL(gt1,gt2,gt3)
coupT1R = cplcChaChahhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChahh


Subroutine Gamma_Real_BLSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,     & 
& MCha,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4)

Real(dp), Intent(in) :: MCha(2),Mhh(4)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,4), GammarealGluon(2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
    Do i3=1,4
CoupL = cplcChaChahhL(i1,i2,i3)
CoupR = cplcChaChahhR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChahh


Subroutine Amplitude_WAVE_BLSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,               & 
& ctcplcChaChahhL,ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),Mhh(4),Mhh2(4)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4)

Complex(dp), Intent(in) :: ctcplcChaChahhL(2,2,4),ctcplcChaChahhR(2,2,4)

Complex(dp), Intent(in) :: Zfhh(4,4),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChahhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChahhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChahhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChahhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChahhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChahhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcChaChahhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcChaChahhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChahh


Subroutine Amplitude_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVP(4,4),            & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),            & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),       & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),          & 
& cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),           & 
& cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhVZVZ(4),cplhhVZVZp(4),            & 
& cplhhVZpVZp(4),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Ah}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Ah}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Ah}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Ah}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, hh}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplAhhhVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VZ, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Ah, VZ}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplAhhhVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Ah, VZp}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplAhhhVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = -cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = cplhhSucSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvIm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplhhSvReSvRe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,7
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChahh


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,cplcChaFvSeL,cplcChaFvSeR,cplhhhhhh,cplhhHpmcHpm,    & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,cplhhSvImSvRe,             & 
& cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVP(4,4),            & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),            & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),       & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),          & 
& cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),               & 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),           & 
& cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhVZVZ(4),cplhhVZVZp(4),            & 
& cplhhVZpVZp(4),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 


! {Cha, VP, Ah}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, Ah, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplAhhhVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VZ, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VP, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VP, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChahh


Subroutine Amplitude_Tree_BLSSM_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,               & 
& MCha,MVZ,MCha2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MVZ,MCha2(2),MVZ2

Complex(dp), Intent(in) :: cplcChaChaVZL(2,2),cplcChaChaVZR(2,2)

Complex(dp) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcChaChaVZL(gt1,gt2)
coupT1R = cplcChaChaVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChaVZ


Subroutine Gamma_Real_BLSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,     & 
& MCha,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaVZL(2,2),cplcChaChaVZR(2,2)

Real(dp), Intent(in) :: MCha(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
CoupL = cplcChaChaVZL(i1,i2)
CoupR = cplcChaChaVZR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChaVZ


Subroutine Amplitude_WAVE_BLSSM_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaVZL(gt1,gt2) 
ZcoupT1R = ctcplcChaChaVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcChaChaVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcChaChaVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChaVZ


Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,      & 
& cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVZ(4,4),cplChiChacHpmL(7,2,2),       & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcChaChiHpmL(2,7,2),         & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVZL(3,3),        & 
& cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVZL(3,3),    & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),    & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),       & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,7
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVZ


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,      & 
& cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,cplcHpmVWmVZ,          & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVZ(4,4),cplChiChacHpmL(7,2,2),       & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplcChaChiHpmL(2,7,2),         & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVZL(3,3),        & 
& cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVZL(3,3),    & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),    & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZp(4),       & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVZ


Subroutine Amplitude_Tree_BLSSM_ChaToChaVZp(cplcChaChaVZpL,cplcChaChaVZpR,            & 
& MCha,MVZp,MCha2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MVZp,MCha2(2),MVZp2

Complex(dp), Intent(in) :: cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplcChaChaVZpL(gt1,gt2)
coupT1R = cplcChaChaVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChaVZp


Subroutine Gamma_Real_BLSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,cplcChaChaVZpR,  & 
& MCha,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Real(dp), Intent(in) :: MCha(2),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
CoupL = cplcChaChaVZpL(i1,i2)
CoupR = cplcChaChaVZpR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChaVZp


Subroutine Amplitude_WAVE_BLSSM_ChaToChaVZp(cplcChaChaVPL,cplcChaChaVPR,              & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,MVZp,MVZp2,ZfLm,ZfLp,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaVZpL(gt1,gt2) 
ZcoupT1R = ctcplcChaChaVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplcChaChaVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplcChaChaVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChaVZp


Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,            & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,        & 
& cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,       & 
& cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),      & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcChaChiHpmL(2,7,2),       & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVZpL(3,3),       & 
& cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),     & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVZpL(3,3),   & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),    & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),             & 
& cplcChacFuSdR(2,3,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),cplSvImSvReVZp(6,6),            & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,7
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVZp


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,            & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL, & 
& cplcChaFeSvReR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,        & 
& cplFvFvVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhVPVZp,cplhhVZVZp,cplhhVZpVZp,               & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,       & 
& cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),      & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplcChaChiHpmL(2,7,2),       & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVZpL(3,3),       & 
& cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),     & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVZpL(3,3),   & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),    & 
& cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),             & 
& cplcChacFuSdR(2,3,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),cplSvImSvReVZp(6,6),            & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 


! {Cha, VP, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VP}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVZp


Subroutine Amplitude_Tree_BLSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,            & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(7),MHpm(2),MCha2(2),MChi2(7),MHpm2(2)

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2)

Complex(dp) :: Amp(2,2,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,7
    Do gt3=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChiHpmL(gt1,gt2,gt3)
coupT1R = cplcChaChiHpmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChiHpm


Subroutine Gamma_Real_BLSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,  & 
& MCha,MChi,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2)

Real(dp), Intent(in) :: MCha(2),MChi(7),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,7,2), GammarealGluon(2,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,7
    Do i3=2,2
CoupL = cplcChaChiHpmL(i1,i2,i3)
CoupR = cplcChaChiHpmR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MChi(i2)
Mex3 = MHpm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChiHpm


Subroutine Amplitude_WAVE_BLSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,            & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2)

Complex(dp), Intent(in) :: ctcplcChaChiHpmL(2,7,2),ctcplcChaChiHpmR(2,7,2)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfL0(7,7),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,7
    Do gt3=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChiHpmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChiHpmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChiHpmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChiHpmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplcChaChiHpmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplcChaChiHpmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfHpm(i1,gt3)*cplcChaChiHpmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfHpm(i1,gt3)*cplcChaChiHpmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChiHpm


Subroutine Amplitude_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,       & 
& cplcChaFvSeR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),       & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),       & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2), & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,7
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, bar[Cha], Chi}
Do i1=1,4
  Do i2=1,2
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Hpm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Hpm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, Ah, VWm}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VWm}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], Ah}
Do i1=1,7
  Do i2=1,2
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], Ah}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], hh}
Do i1=1,7
  Do i2=1,2
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], VP}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = -cplHpmcHpmVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZ}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = -cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZp}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = -cplHpmcHpmVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = cplHpmSucSd(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplHpmSvImcSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplHpmSvRecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], Chi}
Do i1=1,4
  Do i2=1,2
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Cha}
Do i1=1,2
  Do i2=1,7
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = cplcFdFuHpmL(i3,i2,gt3)
coup3R = cplcFdFuHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeFvHpmL(i3,i2,gt3)
coup3R = cplcFeFvHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplcFeFvHpmL(i2,i3,gt3)
coup3R = cplcFeFvHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplcFeFvHpmL(i2,i3,gt3)
coup3R = cplcFeFvHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Cha}
  Do i2=1,7
    Do i3=1,2
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFdFuHpmL(i2,i3,gt3)
coup3R = cplcFdFuHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChiHpm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,       & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,       & 
& cplcChaFvSeR,cplhhHpmcHpm,cplhhHpmcVWm,cplHpmSucSd,cplHpmSvImcSe,cplHpmSvRecSe,        & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcHpm(4,2,2),cplAhHpmcVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),       & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),   & 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),       & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),         & 
& cplHpmSucSd(2,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),cplHpmcHpmVP(2,2),        & 
& cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2), & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,7
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VP}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = -cplHpmcHpmVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChiHpm


Subroutine Amplitude_Tree_BLSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,            & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(7),MVWm,MCha2(2),MChi2(7),MVWm2

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7)

Complex(dp) :: Amp(4,2,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,7
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplcChaChiVWmL(gt1,gt2)
coupT1R = cplcChaChiVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToChiVWm


Subroutine Gamma_Real_BLSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,  & 
& MCha,MChi,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7)

Real(dp), Intent(in) :: MCha(2),MChi(7),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,7), GammarealGluon(2,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,7
CoupL = cplcChaChiVWmL(i1,i2)
CoupR = cplcChaChiVWmR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MChi(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp,0._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToChiVWm


Subroutine Amplitude_WAVE_BLSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,            & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7)

Complex(dp), Intent(in) :: ctcplcChaChiVWmL(2,7),ctcplcChaChiVWmR(2,7)

Complex(dp), Intent(in) :: ZfL0(7,7),ZfLm(2,2),ZfLp(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(4,2,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,7
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChiVWmL(gt1,gt2) 
ZcoupT1R = ctcplcChaChiVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChiVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChiVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplcChaChiVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplcChaChiVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplcChaChiVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplcChaChiVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChiVWm


Subroutine Amplitude_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,       & 
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),         & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),   & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFdFuVWmL(3,3),   & 
& cplcFdFuVWmR(3,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),           & 
& cplcFeFvVWmR(3,6),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplcChacFuSdL(2,3,6),              & 
& cplcChacFuSdR(2,3,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),           & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 


! {Ah, bar[Cha], Chi}
Do i1=1,4
  Do i2=1,2
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Hpm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Hpm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplhhcHpmVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVWmVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VWm}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], Ah}
Do i1=1,7
  Do i2=1,2
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhcHpmVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[Hpm], hh}
Do i1=1,7
  Do i2=1,2
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhcHpmVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], VP}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZ}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZp}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = -cplSucSdVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvImcSeVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvRecSeVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplSvImcSeVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = cplSvRecSeVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], Chi}
Do i1=1,4
  Do i2=1,2
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Cha}
Do i1=1,2
  Do i2=1,7
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = -cplcFdFuVWmR(i3,i2)
coup3R = -cplcFdFuVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Cha}
  Do i2=1,7
    Do i3=1,2
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = -cplChiChacVWmR(gt2,i3)
coup2R = -cplChiChacVWmL(gt2,i3)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = -cplChiChiVZR(gt2,i3)
coup2R = -cplChiChiVZL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = -cplChiChiVZpR(gt2,i3)
coup2R = -cplChiChiVZpL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChiVWm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplSucSdVWm,cplSvImcSeVWm,       & 
& cplSvRecSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,       & 
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),         & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),   & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFdFuVWmL(3,3),   & 
& cplcFdFuVWmR(3,3),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),           & 
& cplcFeFvVWmR(3,6),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplcChacFuSdL(2,3,6),              & 
& cplcChacFuSdR(2,3,6),cplSucSdVWm(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6),           & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VP}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChiVWm


Subroutine Amplitude_Tree_BLSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,               & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6),MCha2(2),MFd2(3),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFdcSuL(gt1,gt2,gt3)
coupT1R = cplcChaFdcSuR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToFdcSu


Subroutine Gamma_Real_BLSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& MCha,MFd,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChaFdcSuL(i1,i2,i3)
CoupR = cplcChaFdcSuR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFd(i2)
Mex3 = MSu(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,3._dp,1._dp,2._dp,1._dp/3._dp,2._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToFdcSu


Subroutine Amplitude_WAVE_BLSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,               & 
& ctcplcChaFdcSuL,ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,              & 
& ZfLm,ZfLp,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFdcSuL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFdcSuR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFdcSuL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFdcSuR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt2)*cplcChaFdcSuL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt2))*cplcChaFdcSuR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplcChaFdcSuL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplcChaFdcSuR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToFdcSu


Subroutine Amplitude_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
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

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 


! {Ah, bar[Cha], bar[Fd]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, conj[Su]}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplAhSucSu(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, conj[Su]}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplhhSucSu(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[Sd]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcHpmcSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Sd]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSd(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSucVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Su, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
coup3 = cplAhSucSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Su, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhSucSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSucSuVG(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSucSuVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVZ 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplSucSuVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVZp 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
coup3 = cplSucSuVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], bar[Fd]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, bar[Fu]}
Do i1=1,2
  Do i2=1,7
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFuFdcHpmL(i3,gt2,i1)
coup2R = cplcFuFdcHpmR(i3,gt2,i1)
coup3L = cplChiFucSuL(i2,i3,gt3)
coup3R = cplChiFucSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MChi(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = cplChiFucSuL(i3,i2,gt3)
coup3R = cplChiFucSuR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MGlu 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplGluFdcSdL(gt2,i1)
coup2R = cplGluFdcSdR(gt2,i1)
coup3L = cplGluFucSuL(i2,gt3)
coup3R = cplGluFucSuR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, bar[Fu]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplcFuFdcVWmR(i3,gt2)
coup2R = -cplcFuFdcVWmL(i3,gt2)
coup3L = cplChiFucSuL(i2,i3,gt3)
coup3R = cplChiFucSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_BLSSM_ChaToFdcSu


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
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

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 


! {Cha, VP, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSucSuVG(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSucSuVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFdcSu


Subroutine Amplitude_Tree_BLSSM_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,            & 
& MCha,MFe,MSvIm,MCha2,MFe2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvIm(6),MCha2(2),MFe2(3),MSvIm2(6)

Complex(dp), Intent(in) :: cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFeSvImL(gt1,gt2,gt3)
coupT1R = cplcChaFeSvImR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToFeSvIm


Subroutine Gamma_Real_BLSSM_ChaToFeSvIm(MLambda,em,gs,cplcChaFeSvImL,cplcChaFeSvImR,  & 
& MCha,MFe,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChaFeSvImL(i1,i2,i3)
CoupR = cplcChaFeSvImR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFe(i2)
Mex3 = MSvIm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToFeSvIm


Subroutine Amplitude_WAVE_BLSSM_ChaToFeSvIm(cplcChaFeSvImL,cplcChaFeSvImR,            & 
& ctcplcChaFeSvImL,ctcplcChaFeSvImR,MCha,MCha2,MFe,MFe2,MSvIm,MSvIm2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFe(3),MFe2(3),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFeSvImL(2,3,6),ctcplcChaFeSvImR(2,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfLm(2,2),ZfLp(2,2),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFeSvImL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFeSvImR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFeSvImL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFeSvImR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplcChaFeSvImL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplcChaFeSvImR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt3)*cplcChaFeSvImL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt3)*cplcChaFeSvImR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToFeSvIm


Subroutine Amplitude_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,    & 
& cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,      & 
& cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),      & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),   & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFvSeL(2,6,6),& 
& cplcChaFvSeR(2,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplHpmSvImcSe(2,6,6),    & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),         & 
& cplSvImSvReVZp(6,6),cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, bar[Cha], bar[Fe]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, SvIm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, SvIm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvIm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, SvRe}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, SvRe}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, SvRe}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, SvRe}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, SvRe}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSvRe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[Se]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, SvIm, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhSvImSvIm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = -cplSvImSvReVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, SvRe, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = -cplSvImSvReVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, SvRe, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZp 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = -cplSvImSvReVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Se], conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[VWm]}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = -cplSvImcSeVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], bar[Fe]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fv}
Do i1=1,2
  Do i2=1,7
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_BLSSM_ChaToFeSvIm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFvSeL,            & 
& cplcChaFvSeR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),      & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),   & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFvSeL(2,6,6),& 
& cplcChaFvSeR(2,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplHpmSvImcSe(2,6,6),    & 
& cplSeSvImcHpm(6,6,2),cplSeSvImcVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),         & 
& cplSvImSvReVZp(6,6),cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvIm(gt3) 


! {Cha, VP, SvRe}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, SvRe, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = -cplSvImSvReVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFeSvImL(i2,i3,gt3)
coup3R = cplcChaFeSvImR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFeSvIm


Subroutine Amplitude_Tree_BLSSM_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,            & 
& MCha,MFe,MSvRe,MCha2,MFe2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvRe(6),MCha2(2),MFe2(3),MSvRe2(6)

Complex(dp), Intent(in) :: cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFeSvReL(gt1,gt2,gt3)
coupT1R = cplcChaFeSvReR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToFeSvRe


Subroutine Gamma_Real_BLSSM_ChaToFeSvRe(MLambda,em,gs,cplcChaFeSvReL,cplcChaFeSvReR,  & 
& MCha,MFe,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFe(3),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChaFeSvReL(i1,i2,i3)
CoupR = cplcChaFeSvReR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFe(i2)
Mex3 = MSvRe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToFeSvRe


Subroutine Amplitude_WAVE_BLSSM_ChaToFeSvRe(cplcChaFeSvReL,cplcChaFeSvReR,            & 
& ctcplcChaFeSvReL,ctcplcChaFeSvReR,MCha,MCha2,MFe,MFe2,MSvRe,MSvRe2,ZfFEL,              & 
& ZfFER,ZfLm,ZfLp,ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFe(3),MFe2(3),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFeSvReL(2,3,6),ctcplcChaFeSvReR(2,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfLm(2,2),ZfLp(2,2),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFeSvReL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFeSvReR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFeSvReL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFeSvReR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplcChaFeSvReL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplcChaFeSvReR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvRe(i1,gt3)*cplcChaFeSvReL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvRe(i1,gt3)*cplcChaFeSvReR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToFeSvRe


Subroutine Amplitude_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvReL,    & 
& cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,   & 
& cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,           & 
& cplcFeFeVZpR,cplcChaFvSeL,cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,      & 
& cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),      & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),     & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFvSeL(2,6,6),& 
& cplcChaFvSeR(2,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplHpmSvRecSe(2,6,6),    & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),         & 
& cplSvImSvReVZp(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvRe(gt3) 


! {Ah, bar[Cha], bar[Fe]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, SvIm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, SvIm}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, SvIm}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, SvIm}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, SvIm}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSvIm(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, Ah, SvRe}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplAhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, SvRe}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplhhSvReSvRe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[Hpm], conj[Se]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, SvIm, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhSvImSvRe(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhSvReSvRe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplSvImSvReVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, SvIm, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZ 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplSvImSvReVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, SvIm, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZp 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplSvImSvReVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Se], conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[VWm]}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = -cplSvRecSeVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], bar[Fe]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fv}
Do i1=1,2
  Do i2=1,7
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_BLSSM_ChaToFeSvRe


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvReL,   & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFvSeL,            & 
& cplcChaFvSeR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,    & 
& cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),      & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),     & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFvSeL(2,6,6),& 
& cplcChaFvSeR(2,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplHpmSvRecSe(2,6,6),    & 
& cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),         & 
& cplSvImSvReVZp(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSvRe(gt3) 


! {Cha, VP, SvIm}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, SvIm, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplSvImSvReVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFeSvReL(i2,i3,gt3)
coup3R = cplcChaFeSvReR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFeSvRe


Subroutine Amplitude_Tree_BLSSM_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,MCha,             & 
& MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6),MCha2(2),MFv2(6),MSe2(6)

Complex(dp), Intent(in) :: cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6)

Complex(dp) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFvSeL(gt1,gt2,gt3)
coupT1R = cplcChaFvSeR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaToFvSe


Subroutine Gamma_Real_BLSSM_ChaToFvSe(MLambda,em,gs,cplcChaFvSeL,cplcChaFvSeR,        & 
& MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6)

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,6,6), GammarealGluon(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
CoupL = cplcChaFvSeL(i1,i2,i3)
CoupR = cplcChaFvSeR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFv(i2)
Mex3 = MSe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaToFvSe


Subroutine Amplitude_WAVE_BLSSM_ChaToFvSe(cplcChaFvSeL,cplcChaFvSeR,ctcplcChaFvSeL,   & 
& ctcplcChaFvSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFvm,ZfLm,ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(6),MFv2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6)

Complex(dp), Intent(in) :: ctcplcChaFvSeL(2,6,6),ctcplcChaFvSeR(2,6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFvSeL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFvSeR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFvSeL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFvSeR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplcChaFvSeL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplcChaFvSeR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSe(i1,gt3)*cplcChaFvSeL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSe(i1,gt3)*cplcChaFvSeR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToFvSe


Subroutine Amplitude_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),        & 
& cplAhSecSe(4,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),        & 
& cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),         & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiFvSvImL(7,6,6),       & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcChaChiVWmL(2,7),     & 
& cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),   & 
& cplcChaFeSvReR(2,3,6),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),             & 
& cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),     & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(4,6,6),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 


! {Ah, bar[Cha], Fv}
Do i1=1,4
  Do i2=1,2
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Se}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Se}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplhhSecSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], SvIm}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], SvIm}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = -cplSeSvImcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], SvRe}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], SvRe}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = -cplSeSvRecVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, SvIm, Hpm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, Hpm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, VWm}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplSeSvImcVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, SvRe, VWm}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplSeSvRecVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Se], Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhSecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhSecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = -cplSecSeVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Se], VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = -cplSecSeVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, conj[Se], VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = -cplSecSeVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], Fv}
Do i1=1,4
  Do i2=1,2
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fe}
Do i1=1,2
  Do i2=1,7
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Cha}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaFvSeL(i3,i2,gt3)
coup3R = cplcChaFvSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
coup3L = cplcFeChiSeL(i2,i3,gt3)
coup3R = cplcFeChiSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
coup3L = cplcFeChiSeL(i2,i3,gt3)
coup3R = cplcFeChiSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Fe}
  Do i2=1,7
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,6
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,6
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_BLSSM_ChaToFvSe


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR, & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhSecSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSeSvRecHpm,cplSeSvRecVWm,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),        & 
& cplAhSecSe(4,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),        & 
& cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),         & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiFvSvImL(7,6,6),       & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcChaChiVWmL(2,7),     & 
& cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),   & 
& cplcChaFeSvReR(2,3,6),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),             & 
& cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),     & 
& cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),       & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhSecSe(4,6,6),cplSeSvImcHpm(6,6,2),            & 
& cplSeSvImcVWm(6,6),cplSeSvRecHpm(6,6,2),cplSeSvRecVWm(6,6),cplSecSeVP(6,6),            & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 


! {Cha, VP, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, conj[Se], VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = -cplSecSeVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,6
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplcChaFvSeL(i2,i3,gt3)
coup3R = cplcChaFvSeR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToFvSe


Subroutine Amplitude_Tree_BLSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,               & 
& MCha,MFu,MSd,MCha2,MFu2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6),MCha2(2),MFu2(3),MSd2(6)

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChacFuSdL(gt1,gt2,gt3)
coupT1R = cplcChacFuSdR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChaTocFuSd


Subroutine Gamma_Real_BLSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,     & 
& MCha,MFu,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChacFuSdL(i1,i2,i3)
CoupR = cplcChacFuSdR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFu(i2)
Mex3 = MSd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,3._dp,2._dp,1._dp,4._dp/3._dp,2._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChaTocFuSd


Subroutine Amplitude_WAVE_BLSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,               & 
& ctcplcChacFuSdL,ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,              & 
& ZfLm,ZfLp,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFu(3),MFu2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChacFuSdL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChacFuSdR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChacFuSdL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChacFuSdR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUR(i1,gt2)*cplcChacFuSdL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUL(i1,gt2))*cplcChacFuSdR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSd(i1,gt3)*cplcChacFuSdL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSd(i1,gt3)*cplcChacFuSdR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaTocFuSd


Subroutine Amplitude_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),      & 
& cplAhSdcSd(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),   & 
& cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),    & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,4),         & 
& cplcFuFuhhR(3,3,4),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),& 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 


! {Ah, bar[Cha], Fu}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Sd}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = cplAhSdcSd(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Sd}
Do i1=1,2
  Do i2=1,4
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = cplhhSdcSd(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], Su}
Do i1=1,7
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplcFuChiSuL(gt2,i1,i3)
coup2R = cplcFuChiSuR(gt2,i1,i3)
coup3 = cplSdcHpmcSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], Su}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSu(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplcFuChiSuL(gt2,i1,i3)
coup2R = cplcFuChiSuR(gt2,i1,i3)
coup3 = -cplSdcSucVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, bar[Cha], Fu}
Do i1=1,4
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fd}
Do i1=1,2
  Do i2=1,7
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFuFdcHpmL(gt2,i3,i1)
coup2R = cplcFuFdcHpmR(gt2,i3,i1)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Fd}
  Do i2=1,7
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuAhL(gt2,i1,i3)
coup2R = cplcFuFuAhR(gt2,i1,i3)
coup3 = cplAhSdcSd(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], conj[Sd], hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
coup3 = cplhhSdcSd(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], conj[Sd], VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3 = -cplSdcSdVG(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3 = -cplSdcSdVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
coup3 = -cplSdcSdVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVZp 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVZpL(gt2,i1)
coup2R = cplcFuFuVZpR(gt2,i1)
coup3 = -cplSdcSdVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Su], bar[Fd], Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(gt2,i3,i1)
coup2R = cplcFuChiSuR(gt2,i3,i1)
coup3L = cplcFdChiSdL(i2,i3,gt3)
coup3R = cplcFdChiSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MGlu 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuGluSuL(gt2,i1)
coup2R = cplcFuGluSuR(gt2,i1)
coup3L = cplcFdGluSdL(i2,gt3)
coup3R = cplcFdGluSdR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaTocFuSd


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFu(3),MGlu,Mhh(4),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFd2(3),MFu2(3),MGlu2,Mhh2(4),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),      & 
& cplAhSdcSd(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),   & 
& cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),    & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,4),         & 
& cplcFuFuhhR(3,3,4),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),& 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(4,6,6),               & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 


! {Cha, VP, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3 = -cplSdcSdVG(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3 = -cplSdcSdVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaTocFuSd


Subroutine Amplitude_WAVE_BLSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,               & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChaToChaVP


Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,  & 
& cplcChacFuSdR,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVP(4,4),cplChiChacHpmL(7,2,2),       & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplcChaChiHpmL(2,7,2),         & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVPL(3,3),        & 
& cplcFdFdVPR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),    & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),    & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),  & 
& cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),             & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,4
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVPVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplhhVPVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,4
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplhhVPVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,7
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,7
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvRe, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplcChaFeSvReL(gt1,i1,i2)
coup1R = cplcChaFeSvReR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, SvIm, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplcChaFeSvImL(gt1,i1,i2)
coup1R = cplcChaFeSvImR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(gt1,i1,i2)
coup1R = cplcChaFvSeR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,4
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,7
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = -cplChiChiVPR(i3,i2)
coup3R = -cplChiChiVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(gt1,i2,i1)
coup1R = cplcChaFvSeR(gt1,i2,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvIm, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvImL(gt1,i2,i1)
coup1R = cplcChaFeSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {SvRe, bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFeSvReL(gt1,i2,i1)
coup1R = cplcChaFeSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChiVPR(i3,i2)
coup3R = -cplChiChiVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChaToChaVP


Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVPL,cplChiChiVPR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplcChaFvSeL,    & 
& cplcChaFvSeR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,  & 
& cplcChacFuSdR,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplAhhhVP(4,4),cplChiChacHpmL(7,2,2),       & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),    & 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),  & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplcChaChiHpmL(2,7,2),         & 
& cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFdFdVPL(3,3),        & 
& cplcFdFdVPR(3,3),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6),      & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),    & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),    & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplHpmcHpmVP(2,2),  & 
& cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),             & 
& cplSecSeVP(6,6),cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChaToChaVP



End Module OneLoopDecay_Cha_BLSSM
