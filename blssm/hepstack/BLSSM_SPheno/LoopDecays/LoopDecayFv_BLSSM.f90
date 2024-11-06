! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:11 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fv_BLSSM
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

Subroutine Amplitude_Tree_BLSSM_FvToFvAh(cplFvFvAhL,cplFvFvAhR,MAh,MFv,               & 
& MAh2,MFv2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MFv(6),MAh2(4),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4)

Complex(dp) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvAhL(gt1,gt2,gt3)
coupT1R = cplFvFvAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFvAh


Subroutine Gamma_Real_BLSSM_FvToFvAh(MLambda,em,gs,cplFvFvAhL,cplFvFvAhR,             & 
& MAh,MFv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4)

Real(dp), Intent(in) :: MAh(4),MFv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,4
CoupL = cplFvFvAhL(i1,i2,i3)
CoupR = cplFvFvAhR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFvAh


Subroutine Amplitude_WAVE_BLSSM_FvToFvAh(cplFvFvAhL,cplFvFvAhR,ctcplFvFvAhL,          & 
& ctcplFvFvAhR,MAh,MAh2,MFv,MFv2,ZfAh,ZfFvm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MAh2(4),MFv(6),MFv2(6)

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4)

Complex(dp), Intent(in) :: ctcplFvFvAhL(6,6,4),ctcplFvFvAhR(6,6,4)

Complex(dp), Intent(in) :: ZfAh(4,4),ZfFvm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFvAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplFvFvAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFvAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplFvFvAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplFvFvAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplFvFvAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplFvFvAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFvAh


Subroutine Amplitude_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),           & 
& cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),   & 
& cplAhHpmcVWm(4,2),cplAhSecSe(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),         & 
& cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),        & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i2,i3)
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


! {Chi, SvIm, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvRe, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvIm, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, SvRe, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Hpm, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
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


! {Fe, VWm, Hpm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Hpm, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
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


! {Fv, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {Fv, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
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


! {hh, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
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


! {Se, Cha, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
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


! {SvIm, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFeAhL(i3,i2,gt3)
coup3R = cplcFeFeAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Hpm]}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
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


! {conj[Hpm], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToFvAh


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvAh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,cplFvFvAhR,               & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvImSvIm,     & 
& cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplFvChacSeL,cplFvChacSeR,cplChiFvSvImL,      & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),       & 
& cplChiChiAhR(7,7,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),           & 
& cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplAhHpmcHpm(4,2,2),   & 
& cplAhHpmcVWm(4,2),cplAhSecSe(4,6,6),cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),         & 
& cplAhSvReSvRe(4,6,6),cplAhcHpmVWm(4,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),        & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh(gt3) 


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = -cplAhhhVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = -cplAhhhVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvAhL(i3,i2,gt3)
coup3R = cplFvFvAhR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvAh


Subroutine Amplitude_Tree_BLSSM_FvToChacSe(cplFvChacSeL,cplFvChacSeR,MCha,            & 
& MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6),MCha2(2),MFv2(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvChacSeL(gt1,gt2,gt3)
coupT1R = cplFvChacSeR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToChacSe


Subroutine Gamma_Real_BLSSM_FvToChacSe(MLambda,em,gs,cplFvChacSeL,cplFvChacSeR,       & 
& MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Real(dp), Intent(in) :: MCha(2),MFv(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,6), GammarealGluon(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
CoupL = cplFvChacSeL(i1,i2,i3)
CoupR = cplFvChacSeR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MCha(i2)
Mex3 = MSe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToChacSe


Subroutine Amplitude_WAVE_BLSSM_FvToChacSe(cplFvChacSeL,cplFvChacSeR,ctcplFvChacSeL,  & 
& ctcplFvChacSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFvm,ZfLm,ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(6),MFv2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ctcplFvChacSeL(6,2,6),ctcplFvChacSeR(6,2,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvChacSeL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvChacSeR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplFvChacSeL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvChacSeR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplFvChacSeL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplFvChacSeR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplFvChacSeL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplFvChacSeR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToChacSe


Subroutine Amplitude_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),        & 
& cplAhSecSe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),& 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2), & 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSecSe(4,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),         & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 


! {Ah, Fv, bar[Cha]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
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


! {Cha, Se, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhSecSe(i3,i2,gt3)
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


! {Cha, Se, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhSecSe(i3,i2,gt3)
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


! {Cha, Se, VP}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplSecSeVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, Se, VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplSecSeVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, Se, VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplSecSeVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, SvIm, conj[Hpm]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i3,i2,gt3)
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


! {Chi, SvRe, conj[Hpm]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i3,i2,gt3)
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


! {Chi, SvIm, conj[VWm]}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplSvImcSeVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, SvRe, conj[VWm]}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplSvRecSeVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, Hpm, SvIm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i2,i3,gt3)
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


! {Fe, VWm, SvIm}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
coup3 = cplSvImcSeVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Hpm, SvRe}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i2,i3,gt3)
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


! {Fe, VWm, SvRe}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
coup3 = cplSvRecSeVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, Ah, conj[Se]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplAhSecSe(i2,i3,gt3)
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


! {Fv, hh, conj[Se]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplhhSecSe(i2,i3,gt3)
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


! {Fv, VP, conj[Se]}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VZ, conj[Se]}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VZp, conj[Se]}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MSe(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Fv, bar[Cha]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
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


! {Hpm, Fe, Chi}
Do i1=1,2
  Do i2=1,3
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiFecSeL(i3,i2,gt3)
coup3R = cplChiFecSeR(i3,i2,gt3)
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


! {Se, Cha, Fv}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
coup3L = cplFvChacSeL(i3,i2,gt3)
coup3R = cplFvChacSeR(i3,i2,gt3)
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


! {SvIm, Chi, bar[Fe]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
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


! {SvRe, Chi, bar[Fe]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
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


! {VP, Fv, bar[Cha]}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Chi}
  Do i2=1,3
    Do i3=1,7
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiFecSeL(i3,i2,gt3)
coup3R = cplChiFecSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, bar[Cha]}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, bar[Cha]}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToChacSe


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChacSe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplFvFvAhL,       & 
& cplFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,     & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvImL,cplcFeChaSvImR,   & 
& cplcFeChaSvReL,cplcFeChaSvReR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,   & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,      & 
& cplFvFecVWmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),        & 
& cplAhSecSe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),      & 
& cplcChaChahhR(2,2,4),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),& 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6), & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2), & 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhSecSe(4,6,6),cplHpmSvImcSe(2,6,6),cplHpmSvRecSe(2,6,6),         & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvImcSeVWm(6,6),cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MSe(gt3) 


! {Cha, Se, VP}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplSecSeVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, VP, conj[Se]}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
coup3 = cplSecSeVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, Fv, bar[Cha]}
  Do i2=1,6
    Do i3=1,2
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplFvChacSeL(i2,i3,gt3)
coup3R = cplFvChacSeR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChacSe


Subroutine Amplitude_Tree_BLSSM_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,              & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvIm(6),MChi2(7),MFv2(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Complex(dp) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvImL(gt2,gt1,gt3)
coupT1R = cplChiFvSvImR(gt2,gt1,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToChiSvIm


Subroutine Gamma_Real_BLSSM_FvToChiSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,    & 
& MChi,MFv,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,7,6), GammarealGluon(6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
CoupL = cplChiFvSvImL(i2,i1,i3)
CoupR = cplChiFvSvImR(i2,i1,i3)
Mex1 = MFv(i1)
Mex2 = MChi(i2)
Mex3 = MSvIm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToChiSvIm


Subroutine Amplitude_WAVE_BLSSM_FvToChiSvIm(cplChiFvSvImL,cplChiFvSvImR,              & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFvm,ZfL0,           & 
& ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFv(6),MFv2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfL0(7,7),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvImL(gt2,gt1,gt3) 
ZcoupT1R = ctcplChiFvSvImR(gt2,gt1,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplChiFvSvImL(gt2,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplChiFvSvImR(gt2,i1,gt3)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiFvSvImL(i1,gt1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiFvSvImR(i1,gt1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImL(gt2,gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImR(gt2,gt1,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToChiSvIm


Subroutine Amplitude_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvImL,     & 
& cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,cplHpmSvImcSe,cplSeSvImcHpm,     & 
& cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),          & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2), & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),   & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),         & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),       & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),   & 
& cplSeSvImcVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),          & 
& cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, Fv, Chi}
Do i1=1,4
  Do i2=1,6
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Se, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i2,gt3,i3)
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


! {Cha, Se, VWm}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplSeSvImcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, SvIm, Ah}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, SvRe, Ah}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, SvIm, hh}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, SvRe, hh}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, SvRe, VP}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
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


! {Chi, SvRe, VZ}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
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


! {Chi, SvRe, VZp}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZp 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
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


! {Fe, Hpm, Se}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvImcSe(i2,gt3,i3)
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


! {Fe, VWm, Se}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvImcSeVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, Ah, SvIm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, hh, SvIm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, Ah, SvRe}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, hh, SvRe}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, VP, SvRe}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, VZ, SvRe}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, VZp, SvRe}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MSvRe(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Fv, Chi}
Do i1=1,4
  Do i2=1,6
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Fe, Cha}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
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


! {Se, Cha, Fe}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeChaSvImL(i3,i2,gt3)
coup3R = cplcFeChaSvImR(i3,i2,gt3)
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


! {SvIm, Chi, Fv}
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Chi, Fv}
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Cha}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaFeSvImL(i3,i2,gt3)
coup3R = cplcChaFeSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Hpm]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Se], conj[VWm]}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
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


! {bar[Fe], conj[Hpm], conj[Se]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Se]}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {conj[Hpm], bar[Fe], bar[Cha]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Fe]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Cha]}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = cplcFeChaSvImL(i2,i3,gt3)
coup3R = cplcFeChaSvImR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToChiSvIm


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,              & 
& cplFvFvAhL,cplFvFvAhR,cplAhSvImSvIm,cplAhSvImSvRe,cplChiChacHpmL,cplChiChacHpmR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvImL,cplcFeChaSvImR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,             & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvIm,cplhhSvImSvRe,       & 
& cplHpmSvImcSe,cplSeSvImcHpm,cplSeSvImcVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvImcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),          & 
& cplAhSvImSvIm(4,6,6),cplAhSvImSvRe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2), & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),   & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),         & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),       & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplHpmSvImcSe(2,6,6),cplSeSvImcHpm(6,6,2),   & 
& cplSeSvImcVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),          & 
& cplSvImcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvIm(gt3) 


! {Chi, SvRe, VP}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = -cplSvImSvReVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, VP, SvRe}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
coup3 = -cplSvImSvReVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiFvSvImL(i3,i2,gt3)
coup3R = cplChiFvSvImR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChiSvIm


Subroutine Amplitude_Tree_BLSSM_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,              & 
& MChi,MFv,MSvRe,MChi2,MFv2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvRe(6),MChi2(7),MFv2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Complex(dp) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvReL(gt2,gt1,gt3)
coupT1R = cplChiFvSvReR(gt2,gt1,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToChiSvRe


Subroutine Gamma_Real_BLSSM_FvToChiSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,    & 
& MChi,MFv,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,7,6), GammarealGluon(6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
CoupL = cplChiFvSvReL(i2,i1,i3)
CoupR = cplChiFvSvReR(i2,i1,i3)
Mex1 = MFv(i1)
Mex2 = MChi(i2)
Mex3 = MSvRe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToChiSvRe


Subroutine Amplitude_WAVE_BLSSM_FvToChiSvRe(cplChiFvSvReL,cplChiFvSvReR,              & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFvm,ZfL0,           & 
& ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvReL(7,6,6),ctcplChiFvSvReR(7,6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfL0(7,7),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvReL(gt2,gt1,gt3) 
ZcoupT1R = ctcplChiFvSvReR(gt2,gt1,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplChiFvSvReL(gt2,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplChiFvSvReR(gt2,i1,gt3)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiFvSvReL(i1,gt1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiFvSvReR(i1,gt1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReL(gt2,gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReR(gt2,gt1,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToChiSvRe


Subroutine Amplitude_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplFvFvAhL,         & 
& cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,     & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,  & 
& cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcChaFeSvReL,     & 
& cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,      & 
& cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,cplHpmSvRecSe,cplSeSvRecHpm,     & 
& cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),          & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2), & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),   & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),         & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),       & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),   & 
& cplSeSvRecVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),          & 
& cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 


! {Ah, Fv, Chi}
Do i1=1,4
  Do i2=1,6
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Se, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i2,gt3,i3)
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


! {Cha, Se, VWm}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplSeSvRecVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, SvIm, Ah}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, SvRe, Ah}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, SvIm, hh}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, SvRe, hh}
Do i1=1,7
  Do i2=1,6
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, SvIm, VP}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
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


! {Chi, SvIm, VZ}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
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


! {Chi, SvIm, VZp}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZp 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
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


! {Fe, Hpm, Se}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvRecSe(i2,gt3,i3)
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


! {Fe, VWm, Se}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvRecSeVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, Ah, SvIm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, hh, SvIm}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, VP, SvIm}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, VZ, SvIm}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, VZp, SvIm}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MSvIm(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, Ah, SvRe}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, hh, SvRe}
Do i1=1,6
  Do i2=1,4
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Fv, Chi}
Do i1=1,4
  Do i2=1,6
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Fe, Cha}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaFeSvReL(i3,i2,gt3)
coup3R = cplcChaFeSvReR(i3,i2,gt3)
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


! {Se, Cha, Fe}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeChaSvReL(i3,i2,gt3)
coup3R = cplcFeChaSvReR(i3,i2,gt3)
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


! {SvIm, Chi, Fv}
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Chi, Fv}
Do i1=1,6
  Do i2=1,7
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Cha}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaFeSvReL(i3,i2,gt3)
coup3R = cplcChaFeSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Hpm]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Se], conj[VWm]}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
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


! {bar[Fe], conj[Hpm], conj[Se]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Se]}
Do i1=1,3
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {conj[Hpm], bar[Fe], bar[Cha]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Fe]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Cha]}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
coup3L = cplcFeChaSvReL(i2,i3,gt3)
coup3R = cplcFeChaSvReR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToChiSvRe


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,              & 
& cplFvFvAhL,cplFvFvAhR,cplAhSvImSvRe,cplAhSvReSvRe,cplChiChacHpmL,cplChiChacHpmR,       & 
& cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,     & 
& cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,     & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,             & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,               & 
& cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSvImSvRe,cplhhSvReSvRe,       & 
& cplHpmSvRecSe,cplSeSvRecHpm,cplSeSvRecVWm,cplSvImSvReVP,cplSvImSvReVZ,cplSvImSvReVZp,  & 
& cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),          & 
& cplAhSvImSvRe(4,6,6),cplAhSvReSvRe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2), & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),   & 
& cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),               & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),         & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),       & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),       & 
& cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),cplHpmSvRecSe(2,6,6),cplSeSvRecHpm(6,6,2),   & 
& cplSeSvRecVWm(6,6),cplSvImSvReVP(6,6),cplSvImSvReVZ(6,6),cplSvImSvReVZp(6,6),          & 
& cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,7,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MSvRe(gt3) 


! {Chi, SvIm, VP}
Do i1=1,7
  Do i2=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplSvImSvReVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, VP, SvIm}
Do i1=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
coup3 = cplSvImSvReVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, Fv, Chi}
  Do i2=1,6
    Do i3=1,7
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiFvSvReL(i3,i2,gt3)
coup3R = cplChiFvSvReR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToChiSvRe


Subroutine Amplitude_Tree_BLSSM_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,MFe,             & 
& MFv,MHpm,MFe2,MFv2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(6),MHpm(2),MFe2(3),MFv2(6),MHpm2(2)

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Complex(dp) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFecHpmL(gt1,gt2,gt3)
coupT1R = cplFvFecHpmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFecHpm


Subroutine Gamma_Real_BLSSM_FvToFecHpm(MLambda,em,gs,cplFvFecHpmL,cplFvFecHpmR,       & 
& MFe,MFv,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Real(dp), Intent(in) :: MFe(3),MFv(6),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,2), GammarealGluon(6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=2,2
CoupL = cplFvFecHpmL(i1,i2,i3)
CoupR = cplFvFecHpmR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MHpm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFecHpm


Subroutine Amplitude_WAVE_BLSSM_FvToFecHpm(cplFvFecHpmL,cplFvFecHpmR,ctcplFvFecHpmL,  & 
& ctcplFvFecHpmR,MFe,MFe2,MFv,MFv2,MHpm,MHpm2,ZfFEL,ZfFER,ZfFvm,ZfHpm,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(6),MFv2(6),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2)

Complex(dp), Intent(in) :: ctcplFvFecHpmL(6,3,2),ctcplFvFecHpmR(6,3,2)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfFvm(6,6),ZfHpm(2,2)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFecHpmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFecHpmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplFvFecHpmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFecHpmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplFvFecHpmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplFvFecHpmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplFvFecHpmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplFvFecHpmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFecHpm


Subroutine Amplitude_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),            & 
& cplAhHpmcHpm(4,2,2),cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),& 
& cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),     & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhHpmcHpm(4,2,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),             & 
& cplHpmcHpmVZp(2,2),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),          & 
& cplcHpmVWmVZ(2),cplcHpmVWmVZp(2)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, Fv, bar[Fe]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
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


! {Cha, Se, SvIm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i2,i3,gt3)
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


! {Cha, Se, SvRe}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i2,i3,gt3)
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


! {Chi, SvIm, conj[Se]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcHpm(i3,i2,gt3)
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


! {Chi, SvRe, conj[Se]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecHpm(i3,i2,gt3)
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


! {Fe, Hpm, Ah}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i3,i2,gt3)
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


! {Fe, VWm, Ah}
Do i1=1,3
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhcHpmVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Hpm, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i3,i2,gt3)
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


! {Fe, VWm, hh}
Do i1=1,3
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhcHpmVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Hpm, VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHpmcHpmVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Hpm, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplHpmcHpmVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Hpm, VZp}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplHpmcHpmVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VZp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplcHpmVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Ah, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i2,i3,gt3)
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


! {Fv, hh, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i2,i3,gt3)
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


! {Fv, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VZ, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VZp, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, Ah, conj[VWm]}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplAhcHpmVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, hh, conj[VWm]}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplhhcHpmVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, VP, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZ, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplcHpmVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Fv, bar[Fe]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
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


! {Hpm, Fe, Fv}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = cplFvFecHpmL(i3,i2,gt3)
coup3R = cplFvFecHpmR(i3,i2,gt3)
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


! {Se, Cha, Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,7
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i3,i2,gt3)
coup3R = cplChiChacHpmR(i3,i2,gt3)
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


! {SvIm, Chi, bar[Cha]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
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


! {SvRe, Chi, bar[Cha]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
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


! {VP, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fv}
  Do i2=1,3
    Do i3=1,6
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplFvFecHpmL(i3,i2,gt3)
coup3R = cplFvFecHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToFecHpm


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFecHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplFvChacSeL,       & 
& cplFvChacSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,        & 
& cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),            & 
& cplAhHpmcHpm(4,2,2),cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),     & 
& cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),         & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),& 
& cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),     & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhHpmcHpm(4,2,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),             & 
& cplHpmcHpmVZp(2,2),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),cplcHpmVPVWm(2),          & 
& cplcHpmVWmVZ(2),cplcHpmVWmVZp(2)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHpm(gt3) 


! {Fe, Hpm, VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHpmcHpmVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VP, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplFvFecHpmL(i2,i3,gt3)
coup3R = cplFvFecHpmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFecHpm


Subroutine Amplitude_Tree_BLSSM_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,MFe,             & 
& MFv,MVWm,MFe2,MFv2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(6),MVWm,MFe2(3),MFv2(6),MVWm2

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Complex(dp) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplFvFecVWmL(gt1,gt2)
coupT1R = cplFvFecVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFecVWm


Subroutine Gamma_Real_BLSSM_FvToFecVWm(MLambda,em,gs,cplFvFecVWmL,cplFvFecVWmR,       & 
& MFe,MFv,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Real(dp), Intent(in) :: MFe(3),MFv(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3), GammarealGluon(6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
CoupL = cplFvFecVWmL(i1,i2)
CoupR = cplFvFecVWmR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,0._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFecVWm


Subroutine Amplitude_WAVE_BLSSM_FvToFecVWm(cplFvFecVWmL,cplFvFecVWmR,ctcplFvFecVWmL,  & 
& ctcplFvFecVWmR,MFe,MFe2,MFv,MFv2,MVWm,MVWm2,ZfFEL,ZfFER,ZfFvm,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(6),MFv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Complex(dp), Intent(in) :: ctcplFvFecVWmL(6,3),ctcplFvFecVWmR(6,3)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfFvm(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFecVWmL(gt1,gt2) 
ZcoupT1R = ctcplFvFecVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFecVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFvm(i1,gt1)*cplFvFecVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplFvFecVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplFvFecVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplFvFecVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplFvFecVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFecVWm


Subroutine Amplitude_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),            & 
& cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),         & 
& cplFvChacSeR(6,2,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcVWm(4,2),             & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSeSvImcVWm(6,6),   & 
& cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 


! {Ah, Fv, bar[Fe]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
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


! {Cha, Se, SvIm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
coup3 = -cplSeSvImcVWm(i2,i3)
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


! {Cha, Se, SvRe}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
coup3 = -cplSeSvRecVWm(i2,i3)
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


! {Chi, SvIm, conj[Se]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvImcVWm(i3,i2)
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


! {Chi, SvRe, conj[Se]}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSeSvRecVWm(i3,i2)
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


! {Fe, Hpm, Ah}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhHpmcVWm(i3,i2)
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


! {Fe, Hpm, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhHpmcVWm(i3,i2)
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


! {Fe, VWm, hh}
Do i1=1,3
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, Hpm, VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Hpm, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Hpm, VZp}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVZpL(i1,gt2)
coup2R = cplcFeFeVZpR(i1,gt2)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VZp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVZpL(i1,gt2)
coup2R = cplcFeFeVZpR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Ah, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(i2,i3)
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


! {Fv, hh, conj[Hpm]}
Do i1=1,6
  Do i2=1,4
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(i2,i3)
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


! {Fv, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, VZ, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, VZp, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, hh, conj[VWm]}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
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


! {Fv, VP, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZ, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, Fv, bar[Fe]}
Do i1=1,4
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
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


! {Hpm, Fe, Fv}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
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


! {Se, Cha, Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,7
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
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


! {SvIm, Chi, bar[Cha]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
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


! {SvRe, Chi, bar[Cha]}
Do i1=1,6
  Do i2=1,7
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
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


! {VP, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fv}
  Do i2=1,3
    Do i3=1,6
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = cplFvFecVWmL(i3,gt2)
coup2R = cplFvFecVWmR(i3,gt2)
coup3L = -cplFvFecVWmR(i3,i2)
coup3R = -cplFvFecVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVZpL(gt1,i2)
coup1R = cplFvFvVZpR(gt1,i2)
coup2L = cplcFeFeVZpL(i3,gt2)
coup2R = cplcFeFeVZpR(i3,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_FvToFecVWm


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplcFeFeAhL,cplcFeFeAhR,cplFvFvAhL,           & 
& cplFvFvAhR,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplFvChacSeL,cplFvChacSeR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,              & 
& cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSeSvImcVWm,       & 
& cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),            & 
& cplAhHpmcVWm(4,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),         & 
& cplFvChacSeR(6,2,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhHpmcVWm(4,2),             & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSeSvImcVWm(6,6),   & 
& cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,6,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWm 


! {Fe, Hpm, VP}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VP, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVP(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, VP, conj[VWm]}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFecVWmL(i1,gt2)
coup2R = cplFvFecVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, Fv, bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplFvFecVWmL(i2,i3)
coup3R = cplFvFecVWmR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFecVWm


Subroutine Amplitude_Tree_BLSSM_FvToFvhh(cplFvFvhhL,cplFvFvhhR,MFv,Mhh,               & 
& MFv2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),Mhh(4),MFv2(6),Mhh2(4)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4)

Complex(dp) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFvhhL(gt1,gt2,gt3)
coupT1R = cplFvFvhhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFvhh


Subroutine Gamma_Real_BLSSM_FvToFvhh(MLambda,em,gs,cplFvFvhhL,cplFvFvhhR,             & 
& MFv,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4)

Real(dp), Intent(in) :: MFv(6),Mhh(4)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,4), GammarealGluon(6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
CoupL = cplFvFvhhL(i1,i2,i3)
CoupR = cplFvFvhhR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFvhh


Subroutine Amplitude_WAVE_BLSSM_FvToFvhh(cplFvFvhhL,cplFvFvhhR,ctcplFvFvhhL,          & 
& ctcplFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFvm,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),Mhh(4),Mhh2(4)

Complex(dp), Intent(in) :: cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4)

Complex(dp), Intent(in) :: ctcplFvFvhhL(6,6,4),ctcplFvFvhhR(6,6,4)

Complex(dp), Intent(in) :: ZfFvm(6,6),Zfhh(4,4)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvhhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFvhhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt1)*cplFvFvhhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFvhhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplFvFvhhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplFvFvhhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplFvFvhhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplFvFvhhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFvhh


Subroutine Amplitude_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),   & 
& cplAhhhVZp(4,4),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),          & 
& cplcChaChahhR(2,2,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFvSvImL(7,6,6),     & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),& 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2), & 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),              & 
& cplhhSecSe(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhVZVZ(4),             & 
& cplhhVZVZp(4),cplhhVZpVZp(4)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i2,i3)
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


! {Chi, SvIm, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvRe, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvIm, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, SvRe, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Hpm, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
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


! {Fe, VWm, Hpm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Hpm, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = -cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplFvFecVWmR(gt1,i1)
coup1R = -cplFvFecVWmL(gt1,i1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Ah, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, VZ, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, VZp, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, hh, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
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


! {Fv, VZ, VP}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, VP}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Ah, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {Fv, VP, VZ}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZ, VZ}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, VZ}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Ah, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
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


! {Fv, VP, VZp}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZ, VZp}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, VZp}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
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


! {Se, Cha, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
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


! {SvIm, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWmL(i2,gt1)
coup1R = cplcFeFvVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVZpR(gt1,i2)
coup1R = -cplFvFvVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Hpm]}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
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


! {bar[Fe], conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcFeFvVWmL(i1,gt1)
coup1R = cplcFeFvVWmR(i1,gt1)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hpm], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWmR(gt1,i2)
coup1R = -cplFvFecVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_FvToFvhh


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvhh(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplFvFvAhL,cplFvFvAhR,              & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvImSvIm,             & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),   & 
& cplAhhhVZp(4,4),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),          & 
& cplcChaChahhR(2,2,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiFvSvImL(7,6,6),     & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),& 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2), & 
& cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),         & 
& cplcFeFvVWmR(3,6),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),              & 
& cplhhSecSe(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),cplhhSvReSvRe(4,6,6),      & 
& cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),cplhhVZVZ(4),             & 
& cplhhVZVZp(4),cplhhVZpVZp(4)

Complex(dp), Intent(out) :: Amp(2,6,6,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 


! {Fv, VP, Ah}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
coup3 = cplAhhhVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, Ah, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplAhhhVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, VZ, VP}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VZp, VP}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplFvFvVZpR(gt1,i1)
coup1R = -cplFvFvVZpL(gt1,i1)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VP, VZ}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, VP, VZp}
Do i1=1,6
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplFvFvVPR(gt1,i1)
coup1R = -cplFvFvVPL(gt1,i1)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = -cplFvFvVPR(gt1,i2)
coup1R = -cplFvFvVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplFvFvhhL(i3,i2,gt3)
coup3R = cplFvFvhhR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvhh


Subroutine Amplitude_Tree_BLSSM_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,MFv,MVZ,               & 
& MFv2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MVZ,MFv2(6),MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplFvFvVZL(gt1,gt2)
coupT1R = cplFvFvVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFvVZ


Subroutine Gamma_Real_BLSSM_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,             & 
& MFv,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvVZL(6,6),cplFvFvVZR(6,6)

Real(dp), Intent(in) :: MFv(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplFvFvVZL(i1,i2)
CoupR = cplFvFvVZR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealPhoton(i1,i2) = 0._dp 

  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFvVZ


Subroutine Amplitude_WAVE_BLSSM_FvToFvVZ(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,            & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,             & 
& ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,MVZ,MVZ2,ZfFvm,             & 
& ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),     & 
& cplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ctcplFvFvVPL(6,6),ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6),              & 
& ctcplFvFvVZpL(6,6),ctcplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvVZL(gt1,gt2) 
ZcoupT1R = ctcplFvFvVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFvVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFvm(i1,gt1)*cplFvFvVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplFvFvVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplFvFvVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplFvFvVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplFvFvVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplFvFvVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplFvFvVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplFvFvVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFvVZ


Subroutine Amplitude_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVZ(4,4),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),           & 
& cplChiChiVZR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),      & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhVPVZ(4),cplhhVZVZ(4),     & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 


! {Ah, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZ(i2,i3)
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


! {Chi, SvRe, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvIm, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Hpm, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZ(i2,i3)
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


! {Fe, VWm, Hpm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Hpm, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
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


! {Fv, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
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


! {Fv, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZpR(gt2,i1)
coup2R = -cplFvFvVZpL(gt2,i1)
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


! {hh, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
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


! {Se, Cha, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
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


! {SvIm, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = -cplFvFecVWmR(gt2,i3)
coup2R = -cplFvFecVWmL(gt2,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZpL(gt1,i2)
coup1R = cplFvFvVZpR(gt1,i2)
coup2L = -cplFvFvVZpR(gt2,i3)
coup2R = -cplFvFvVZpL(gt2,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Hpm]}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
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


! {bar[Fe], conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hpm], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(i3,gt2)
coup2R = cplcFeFvVWmR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_FvToFvVZ


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSvImSvReVZ,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVZ(4,4),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(7,7),           & 
& cplChiChiVZR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),      & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhVPVZ(4),cplhhVZVZ(4),     & 
& cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSvImSvReVZ(6,6),    & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVZ


Subroutine Amplitude_Tree_BLSSM_FvToFvVZp(cplFvFvVZpL,cplFvFvVZpR,MFv,MVZp,           & 
& MFv2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MVZp,MFv2(6),MVZp2

Complex(dp), Intent(in) :: cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Complex(dp) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplFvFvVZpL(gt1,gt2)
coupT1R = cplFvFvVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_FvToFvVZp


Subroutine Gamma_Real_BLSSM_FvToFvVZp(MLambda,em,gs,cplFvFvVZpL,cplFvFvVZpR,          & 
& MFv,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp), Intent(in) :: MFv(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,6
CoupL = cplFvFvVZpL(i1,i2)
CoupR = cplFvFvVZpR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  GammarealPhoton(i1,i2) = 0._dp 

  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_FvToFvVZp


Subroutine Amplitude_WAVE_BLSSM_FvToFvVZp(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,           & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,             & 
& ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,MVZp,MVZp2,ZfFvm,           & 
& ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),     & 
& cplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ctcplFvFvVPL(6,6),ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6),              & 
& ctcplFvFvVZpL(6,6),ctcplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvVZpL(gt1,gt2) 
ZcoupT1R = ctcplFvFvVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFvVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFvm(i1,gt1)*cplFvFvVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplFvFvVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplFvFvVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplFvFvVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplFvFvVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplFvFvVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplFvFvVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplFvFvVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFvVZp


Subroutine Amplitude_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVZp(4,4),cplFvChacSeL(6,2,6),              & 
& cplFvChacSeR(6,2,6),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),        & 
& cplChiChiVZpR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),     & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),               & 
& cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),     & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),        & 
& cplSecSeVZp(6,6),cplSvImSvReVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZp 


! {Ah, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZp(i2,i3)
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


! {Chi, SvRe, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvIm, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Hpm, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZp(i2,i3)
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


! {Fe, VWm, Hpm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Hpm, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
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


! {Fv, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
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


! {Fv, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZpR(gt2,i1)
coup2R = -cplFvFvVZpL(gt2,i1)
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


! {hh, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
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


! {Se, Cha, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = -cplcChaChaVZpR(i3,i2)
coup3R = -cplcChaChaVZpL(i3,i2)
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


! {SvIm, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = -cplFvFecVWmR(gt2,i3)
coup2R = -cplFvFecVWmL(gt2,i3)
coup3L = -cplcFeFeVZpR(i3,i2)
coup3R = -cplcFeFeVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZpL(gt1,i2)
coup1R = cplFvFvVZpR(gt1,i2)
coup2L = -cplFvFvVZpR(gt2,i3)
coup2R = -cplFvFvVZpL(gt2,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Hpm]}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
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


! {bar[Fe], conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hpm], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(i3,gt2)
coup2R = cplcFeFvVWmR(i3,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_FvToFvVZp


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVZp,             & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVZpL,cplcFeFeVZpR,cplFvFvhhL,cplFvFvhhR,             & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZp,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,cplSvImSvReVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVZp(4,4),cplFvChacSeL(6,2,6),              & 
& cplFvChacSeR(6,2,6),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(7,7),        & 
& cplChiChiVZpR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),     & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplFvFvhhL(6,6,4),               & 
& cplFvFvhhR(6,6,4),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),     & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),             & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),           & 
& cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),        & 
& cplSecSeVZp(6,6),cplSvImSvReVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZp 


! {Fv, VP, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplFvFvVPL(gt1,i1)
coup1R = cplFvFvVPR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, hh, VP}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVPR(gt2,i1)
coup2R = -cplFvFvVPL(gt2,i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVZpR(i3,i2)
coup3R = -cplFvFvVZpL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVZp


Subroutine Amplitude_WAVE_BLSSM_FvToFvVP(cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,            & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,ctcplFvFvVPL,ctcplFvFvVPR,ctcplFvFvVZL,             & 
& ctcplFvFvVZR,ctcplFvFvVZpL,ctcplFvFvVZpR,MFv,MFv2,MVP,MVP2,ZfFvm,ZfVP,ZfVZpVP,         & 
& ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(6),MFv2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),     & 
& cplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ctcplFvFvVPL(6,6),ctcplFvFvVPR(6,6),ctcplFvFvVZL(6,6),ctcplFvFvVZR(6,6),              & 
& ctcplFvFvVZpL(6,6),ctcplFvFvVZpR(6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfFvm(i1,gt1))*cplFvFvVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfFvm(i1,gt1)*cplFvFvVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplFvFvVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplFvFvVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplFvFvVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplFvFvVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplFvFvVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_FvToFvVP


Subroutine Amplitude_VERTEX_BLSSM_FvToFvVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSvImSvReVP,cplcHpmVPVWm,            & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),           & 
& cplChiChiVPR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),      & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhVPVZ(4),cplhhVPVZp(4),    & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),  & 
& cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 


! {Ah, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Se, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplFvChacSeL(gt1,i1,i2)
coup1R = cplFvChacSeR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(i2,i3)
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


! {Chi, SvRe, SvIm}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(i1,gt1,i2)
coup1R = cplChiFvSvReR(i1,gt1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, SvIm, SvRe}
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(i1,gt1,i2)
coup1R = cplChiFvSvImR(i1,gt1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Hpm, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(i2,i3)
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


! {Fe, VWm, Hpm}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Hpm, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, VWm, VWm}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplFvFecVWmL(gt1,i1)
coup1R = cplFvFecVWmR(gt1,i1)
coup2L = cplcFeFvVWmL(i1,gt2)
coup2R = cplcFeFvVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fv, hh, Ah}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, Ah, hh}
Do i1=1,6
  Do i2=1,4
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZ, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, VZp, hh}
Do i1=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplFvFvVZpL(gt1,i1)
coup1R = cplFvFvVZpR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, hh, VZ}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
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


! {Fv, hh, VZp}
Do i1=1,6
  Do i2=1,4
ML1 = MFv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = -cplFvFvVZpR(gt2,i1)
coup2R = -cplFvFvVZpL(gt2,i1)
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


! {hh, Fv, Fv}
Do i1=1,4
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Fe, Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
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


! {Se, Cha, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFvSeL(i2,gt1,i1)
coup1R = cplcChaFvSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
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


! {SvIm, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(i2,gt1,i1)
coup1R = cplChiFvSvImR(i2,gt1,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Chi, Chi}
Do i1=1,6
  Do i2=1,7
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(i2,gt1,i1)
coup1R = cplChiFvSvReR(i2,gt1,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWmR(i2,gt1)
coup1R = -cplcFeFvVWmL(i2,gt1)
coup2L = -cplFvFecVWmR(gt2,i3)
coup2R = -cplFvFecVWmL(gt2,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZpL(gt1,i2)
coup1R = cplFvFvVZpR(gt1,i2)
coup2L = -cplFvFvVZpR(gt2,i3)
coup2R = -cplFvFvVZpL(gt2,i3)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFvSeL(i1,gt1,i2)
coup1R = cplcChaFvSeR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWm], conj[Hpm]}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Hpm], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
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


! {bar[Fe], conj[VWm], conj[VWm]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcFeFvVWmR(i1,gt1)
coup1R = -cplcFeFvVWmL(i1,gt1)
coup2L = -cplFvFecVWmR(gt2,i1)
coup2R = -cplFvFecVWmL(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hpm], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplFvChacSeL(gt1,i2,i1)
coup1R = cplFvChacSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWm 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWmL(gt1,i2)
coup1R = cplFvFecVWmR(gt1,i2)
coup2L = cplcFeFvVWmL(i3,gt2)
coup2R = cplcFeFvVWmR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_FvToFvVP


Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVP(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplFvFvAhL,cplFvFvAhR,cplAhhhVP,              & 
& cplFvChacSeL,cplFvChacSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiChiVPL,cplChiChiVPR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFeVPL,cplcFeFeVPR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,cplcFeFvHpmL,      & 
& cplcFeFvHpmR,cplcChaFvSeL,cplcChaFvSeR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhVPVZ,            & 
& cplhhVPVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSvImSvReVP,cplcHpmVPVWm,            & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplAhhhVP(4,4),cplFvChacSeL(6,2,6),               & 
& cplFvChacSeR(6,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplChiChiVPL(7,7),           & 
& cplChiChiVPR(7,7),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),      & 
& cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),        & 
& cplFvFecVWmR(6,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),& 
& cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),      & 
& cplFvFvVZpR(6,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),cplcChaFvSeL(2,6,6),          & 
& cplcChaFvSeR(2,6,6),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplhhVPVZ(4),cplhhVPVZp(4),    & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),  & 
& cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 


! {VP, Fv, Fv}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVPL(gt1,i2)
coup1R = cplFvFvVPR(gt1,i2)
coup2L = -cplFvFvVPR(gt2,i3)
coup2R = -cplFvFvVPL(gt2,i3)
coup3L = -cplFvFvVPR(i3,i2)
coup3R = -cplFvFvVPL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_FvToFvVP



End Module OneLoopDecay_Fv_BLSSM
