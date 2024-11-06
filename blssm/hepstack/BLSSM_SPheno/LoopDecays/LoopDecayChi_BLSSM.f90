! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:10 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Chi_BLSSM
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

Subroutine Amplitude_Tree_BLSSM_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,MAh,             & 
& MChi,MAh2,MChi2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MChi(7),MAh2(4),MChi2(7)

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4)

Complex(dp) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiChiAhL(gt1,gt2,gt3)
coupT1R = cplChiChiAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChiAh


Subroutine Gamma_Real_BLSSM_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,       & 
& MAh,MChi,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4)

Real(dp), Intent(in) :: MAh(4),MChi(7)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,7,4), GammarealGluon(7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,7
    Do i3=3,4
CoupL = cplChiChiAhL(i1,i2,i3)
CoupR = cplChiChiAhR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChiAh


Subroutine Amplitude_WAVE_BLSSM_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,  & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MAh2(4),MChi(7),MChi2(7)

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4)

Complex(dp), Intent(in) :: ctcplChiChiAhL(7,7,4),ctcplChiChiAhR(7,7,4)

Complex(dp), Intent(in) :: ZfAh(4,4),ZfL0(7,7)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChiAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiChiAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiChiAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChiAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChiAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChiAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplChiChiAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplChiChiAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChiAh


Subroutine Amplitude_VERTEX_BLSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,Amp)

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
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MAh(gt3) 


! {Ah, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, VWm, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, Hpm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
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


! {Chi, hh, Ah}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, Ah, hh}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZ, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZp, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
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


! {Chi, hh, VZ}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
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


! {Chi, hh, VZp}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
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


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = cplAhSdcSd(gt3,i2,i3)
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


! {Fe, Se, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
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


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
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


! {Fv, SvIm, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvRe, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Cha, Cha}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
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


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,i2,gt3)
coup3R = cplcFdFdAhR(i3,i2,gt3)
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


! {Se, Fe, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
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


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
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


! {SvIm, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
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


! {VWm, Cha, Cha}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
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


! {VZp, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Hpm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Hpm]}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Hpm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
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


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplAhSucSu(gt3,i3,i2)
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


! {conj[Hpm], bar[Cha], bar[Cha]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFuFuAhL(i2,i3,gt3)
coup3R = cplcFuFuAhR(i2,i3,gt3)
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


! {conj[VWm], bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChacVWmR(gt1,i2)
coup1R = -cplChiChacVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChiAh


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,     & 
& cplAhhhVP,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvImSvIm,cplAhSvImSvRe,cplAhSvReSvRe,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,   & 
& cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,        & 
& cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,               & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,Amp)

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
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MAh(gt3) 


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = -cplAhhhVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = -cplAhhhVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiAh


Subroutine Amplitude_Tree_BLSSM_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,           & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(7),MHpm(2),MCha2(2),MChi2(7),MHpm2(2)

Complex(dp), Intent(in) :: cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2)

Complex(dp) :: Amp(2,7,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiChacHpmL(gt1,gt2,gt3)
coupT1R = cplChiChacHpmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChacHpm


Subroutine Gamma_Real_BLSSM_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR, & 
& MCha,MChi,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2)

Real(dp), Intent(in) :: MCha(2),MChi(7),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,2,2), GammarealGluon(7,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,2
    Do i3=2,2
CoupL = cplChiChacHpmL(i1,i2,i3)
CoupR = cplChiChacHpmR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MCha(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChacHpm


Subroutine Amplitude_WAVE_BLSSM_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,           & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2)

Complex(dp), Intent(in) :: ctcplChiChacHpmL(7,2,2),ctcplChiChacHpmR(7,2,2)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfL0(7,7),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,7,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChacHpmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiChacHpmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiChacHpmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChacHpmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplChiChacHpmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplChiChacHpmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplChiChacHpmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHpm(i1,gt3))*cplChiChacHpmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChacHpm


Subroutine Amplitude_VERTEX_BLSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,              & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplFvFecHpmL,cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,         & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,      & 
& cplcHpmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcHpm(4,2,2),cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),       & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplhhHpmcHpm(4,2,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),             & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),      & 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2)

Complex(dp), Intent(out) :: Amp(2,7,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,2
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, Chi, bar[Cha]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
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


! {Cha, Hpm, Ah}
Do i1=1,2
  Do i2=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
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


! {Cha, VWm, Ah}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
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


! {Cha, Hpm, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
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


! {Cha, VWm, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
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


! {Cha, Hpm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
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


! {Cha, VWm, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Hpm, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
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


! {Cha, VWm, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Hpm, VZp}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
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


! {Cha, VWm, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplcHpmVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, Ah, conj[Hpm]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, hh, conj[Hpm]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, VP, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, VZ, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, VZp, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, Ah, conj[VWm]}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
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


! {Chi, hh, conj[VWm]}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
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


! {Chi, VP, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZ, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplcHpmVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplcHpmVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Sd, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = cplSdcHpmcSu(i2,gt3,i3)
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


! {Fe, Se, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
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


! {Fe, Se, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
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


! {Fv, SvIm, conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
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


! {Fv, SvRe, conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
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


! {hh, Chi, bar[Cha]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
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


! {Hpm, Cha, Chi}
Do i1=1,2
  Do i2=1,2
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
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


! {Sd, Fd, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = cplcFuFdcHpmL(i3,i2,gt3)
coup3R = cplcFuFdcHpmR(i3,i2,gt3)
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


! {Se, Fe, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
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


! {SvIm, Fv, bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
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


! {SvRe, Fv, bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
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


! {VP, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Cha, Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiChacHpmL(i3,i2,gt3)
coup3R = cplChiChacHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Su], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcHpmcSu(i3,gt3,i2)
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


! {conj[Su], bar[Fu], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFuFdcHpmL(i2,i3,gt3)
coup3R = cplcFuFdcHpmR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChacHpm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,              & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChaFucSdL,cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR, & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplFvFecHpmL,cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,         & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSeSvImcHpm,cplSeSvRecHpm,cplcHpmVPVWm,cplcHpmVWmVZ,      & 
& cplcHpmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcHpm(4,2,2),cplAhcHpmVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),     & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),   & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),     & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),       & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),     & 
& cplhhHpmcHpm(4,2,2),cplhhcHpmVWm(4,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),             & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSeSvImcHpm(6,6,2),cplSeSvRecHpm(6,6,2),      & 
& cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2)

Complex(dp), Intent(out) :: Amp(2,7,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,2
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MHpm(gt3) 


! {Cha, Hpm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplHpmcHpmVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VWm, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = -cplcChaChaVPR(i1,gt2)
coup2R = -cplcChaChaVPL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VP, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, VP, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplcHpmVPVWm(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplChiChacHpmL(i2,i3,gt3)
coup3R = cplChiChacHpmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChacHpm


Subroutine Amplitude_Tree_BLSSM_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,           & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(7),MVWm,MCha2(2),MChi2(7),MVWm2

Complex(dp), Intent(in) :: cplChiChacVWmL(7,2),cplChiChacVWmR(7,2)

Complex(dp) :: Amp(4,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,2
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplChiChacVWmL(gt1,gt2)
coupT1R = cplChiChacVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChacVWm


Subroutine Gamma_Real_BLSSM_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,cplChiChacVWmR, & 
& MCha,MChi,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChacVWmL(7,2),cplChiChacVWmR(7,2)

Real(dp), Intent(in) :: MCha(2),MChi(7),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,2), GammarealGluon(7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,2
CoupL = cplChiChacVWmL(i1,i2)
CoupR = cplChiChacVWmR(i1,i2)
Mex1 = MChi(i1)
Mex2 = MCha(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChacVWm


Subroutine Amplitude_WAVE_BLSSM_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,           & 
& ctcplChiChacVWmL,ctcplChiChacVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(7),MChi2(7),MVWm,MVWm2

Complex(dp), Intent(in) :: cplChiChacVWmL(7,2),cplChiChacVWmR(7,2)

Complex(dp), Intent(in) :: ctcplChiChacVWmL(7,2),ctcplChiChacVWmR(7,2)

Complex(dp), Intent(in) :: ZfL0(7,7),ZfLm(2,2),ZfLp(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(4,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,2
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChacVWmL(gt1,gt2) 
ZcoupT1R = ctcplChiChacVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChacVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfL0(i1,gt1)*cplChiChacVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplChiChacVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplChiChacVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplChiChacVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplChiChacVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChacVWm


Subroutine Amplitude_VERTEX_BLSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplFvFecVWmL,cplFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,         & 
& cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,      & 
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),       & 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),        & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),  & 
& cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),       & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFuFdcVWmL(3,3),        & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplhhHpmcVWm(4,2),              & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSucVWm(6,6),    & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVWm 


! {Ah, Chi, bar[Cha]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
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


! {Cha, Hpm, Ah}
Do i1=1,2
  Do i2=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
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


! {Cha, Hpm, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
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


! {Cha, VWm, hh}
Do i1=1,2
    Do i3=1,4
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
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


! {Cha, Hpm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
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


! {Cha, VWm, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Hpm, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
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


! {Cha, VWm, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Hpm, VZp}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
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


! {Cha, VWm, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, Ah, conj[Hpm]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, hh, conj[Hpm]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
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


! {Chi, VP, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
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


! {Chi, VZ, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = cplChiChiVZL(gt1,i1)
coup1R = cplChiChiVZR(gt1,i1)
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


! {Chi, VZp, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = cplChiChiVZpL(gt1,i1)
coup1R = cplChiChiVZpR(gt1,i1)
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


! {Chi, hh, conj[VWm]}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
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


! {Chi, VP, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZ, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplChiChiVZL(gt1,i1)
coup1R = cplChiChiVZR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = cplChiChiVZpL(gt1,i1)
coup1R = cplChiChiVZpR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Sd, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSdcSucVWm(i2,i3)
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


! {Fe, Se, SvIm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChaSvImL(i1,gt2,i3)
coup2R = cplcFeChaSvImR(i1,gt2,i3)
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


! {Fe, Se, SvRe}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChaSvReL(i1,gt2,i3)
coup2R = cplcFeChaSvReR(i1,gt2,i3)
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


! {Fv, SvIm, conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
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


! {Fv, SvRe, conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvChacSeL(i1,gt2,i3)
coup2R = cplFvChacSeR(i1,gt2,i3)
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


! {hh, Chi, bar[Cha]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
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


! {Hpm, Cha, Chi}
Do i1=1,2
  Do i2=1,2
    Do i3=1,7
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
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


! {Sd, Fd, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFdcVWmR(i3,i2)
coup3R = -cplcFuFdcVWmL(i3,i2)
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


! {Se, Fe, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(i3,gt2,i1)
coup2R = cplFvChacSeR(i3,gt2,i1)
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


! {SvIm, Fv, bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplcFeChaSvImL(i3,gt2,i1)
coup2R = cplcFeChaSvImR(i3,gt2,i1)
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


! {SvRe, Fv, bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplcFeChaSvReL(i3,gt2,i1)
coup2R = cplcFeChaSvReR(i3,gt2,i1)
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


! {VP, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Cha, Chi}
  Do i2=1,2
    Do i3=1,7
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChiVWmR(i2,gt1)
coup1R = -cplcChaChiVWmL(i2,gt1)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiVZL(gt1,i2)
coup1R = cplChiChiVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiVZpL(gt1,i2)
coup1R = cplChiChiVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Su], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSucVWm(i3,i2)
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


! {conj[Su], bar[Fu], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFuFdcVWmL(i2,i3)
coup3R = cplcFuFdcVWmR(i2,i3)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChacVWm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplFvChacSeL,cplFvChacSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,     & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplFvFecVWmL,cplFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,         & 
& cplHpmcVWmVZp,cplSdcSucVWm,cplSeSvImcVWm,cplSeSvRecVWm,cplcVWmVPVWm,cplcVWmVWmVZ,      & 
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),    & 
& cplAhHpmcVWm(4,2),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplFvChacSeL(6,2,6),       & 
& cplFvChacSeR(6,2,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFdChaSuL(3,2,6),     & 
& cplcFdChaSuR(3,2,6),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6), & 
& cplcFeChaSvReR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),        & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),        & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),           & 
& cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),       & 
& cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),  & 
& cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),       & 
& cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcFuFdcVWmL(3,3),        & 
& cplcFuFdcVWmR(3,3),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplhhHpmcVWm(4,2),              & 
& cplhhcVWmVWm(4),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSdcSucVWm(6,6),    & 
& cplSeSvImcVWm(6,6),cplSeSvRecVWm(6,6),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,7,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVWm 


! {Cha, Hpm, VP}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VWm, VP}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChaVPL(i1,gt2)
coup2R = cplcChaChaVPR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VP, conj[Hpm]}
Do i1=1,7
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVP(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, VP, conj[VWm]}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, Chi, bar[Cha]}
  Do i2=1,7
    Do i3=1,2
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChacVWm


Subroutine Amplitude_Tree_BLSSM_ChiToChihh(cplChiChihhL,cplChiChihhR,MChi,            & 
& Mhh,MChi2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),Mhh(4),MChi2(7),Mhh2(4)

Complex(dp), Intent(in) :: cplChiChihhL(7,7,4),cplChiChihhR(7,7,4)

Complex(dp) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiChihhL(gt1,gt2,gt3)
coupT1R = cplChiChihhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChihh


Subroutine Gamma_Real_BLSSM_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,       & 
& MChi,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChihhL(7,7,4),cplChiChihhR(7,7,4)

Real(dp), Intent(in) :: MChi(7),Mhh(4)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,7,4), GammarealGluon(7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,7
    Do i3=1,4
CoupL = cplChiChihhL(i1,i2,i3)
CoupR = cplChiChihhR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChihh


Subroutine Amplitude_WAVE_BLSSM_ChiToChihh(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,  & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),Mhh(4),Mhh2(4)

Complex(dp), Intent(in) :: cplChiChihhL(7,7,4),cplChiChihhR(7,7,4)

Complex(dp), Intent(in) :: ctcplChiChihhL(7,7,4),ctcplChiChihhR(7,7,4)

Complex(dp), Intent(in) :: Zfhh(4,4),ZfL0(7,7)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChihhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiChihhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiChihhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChihhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChihhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChihhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,4
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplChiChihhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplChiChihhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChihh


Subroutine Amplitude_VERTEX_BLSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,        & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVP(4,4),              & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),            & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),       & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),           & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),             & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),              & 
& cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),         & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),     & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, VWm, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, Hpm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
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


! {Cha, VWm, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, Ah, Ah}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, VP, Ah}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, VZ, Ah}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, VZp, Ah}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, hh, hh}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, Ah, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
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


! {Chi, VZ, VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, Ah, VZ}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
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


! {Chi, VP, VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZ, VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, Ah, VZp}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
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


! {Chi, VP, VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZ, VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = cplhhSdcSd(gt3,i2,i3)
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


! {Fe, Se, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
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


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
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


! {Fv, SvIm, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvRe, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {Fv, SvRe, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Cha, Cha}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
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


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
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


! {Se, Fe, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
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


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
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


! {SvIm, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
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


! {VWm, Cha, Cha}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
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


! {VZp, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Hpm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Hpm]}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Hpm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
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


! {bar[Cha], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplChiChacVWmL(gt2,i1)
coup2R = cplChiChacVWmR(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplhhSucSu(gt3,i3,i2)
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


! {conj[Hpm], bar[Cha], bar[Cha]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
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


! {conj[VWm], bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplChiChacVWmR(gt1,i2)
coup1R = -cplChiChacVWmL(gt1,i2)
coup2L = -cplcChaChiVWmR(i3,gt2)
coup2R = -cplcChaChiVWmL(i3,gt2)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChihh


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplAhhhVZ,cplAhhhVZp,              & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,        & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,    & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplFvFvhhL,cplFvFvhhR,     & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvImSvIm,    & 
& cplhhSvImSvRe,cplhhSvReSvRe,cplhhVPVZ,cplhhVPVZp,cplhhcHpmVWm,cplhhcVWmVWm,            & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVP(4,4),              & 
& cplAhhhVZ(4,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),            & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),     & 
& cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),           & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2), & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),       & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),       & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),           & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),             & 
& cplhhhhhh(4,4,4),cplhhHpmcHpm(4,2,2),cplhhHpmcVWm(4,2),cplhhSdcSd(4,6,6),              & 
& cplhhSecSe(4,6,6),cplhhSucSu(4,6,6),cplhhSvImSvIm(4,6,6),cplhhSvImSvRe(4,6,6),         & 
& cplhhSvReSvRe(4,6,6),cplhhVPVZ(4),cplhhVPVZp(4),cplhhcHpmVWm(4,2),cplhhcVWmVWm(4),     & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplhhVZpVZp(4)

Complex(dp), Intent(out) :: Amp(2,7,7,4) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
    Do gt3=1,4
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = Mhh(gt3) 


! {Chi, VP, Ah}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MAh(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhhhVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, Ah, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MVP 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplAhhhVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, VZ, VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MVP 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VZp, VP}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MVP 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiChiVPL(gt2,i1)
coup2R = cplChiChiVPR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VP, VZ}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVZ 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplhhVPVZ(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, VP, VZp}
Do i1=1,7
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MVZp 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplhhVPVZp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplChiChiVPL(gt2,i3)
coup2R = cplChiChiVPR(gt2,i3)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChihh


Subroutine Amplitude_Tree_BLSSM_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,MChi,            & 
& MVZ,MChi2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MVZ,MChi2(7),MVZ2

Complex(dp), Intent(in) :: cplChiChiVZL(7,7),cplChiChiVZR(7,7)

Complex(dp) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplChiChiVZL(gt1,gt2)
coupT1R = cplChiChiVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChiVZ


Subroutine Gamma_Real_BLSSM_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,       & 
& MChi,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChiVZL(7,7),cplChiChiVZR(7,7)

Real(dp), Intent(in) :: MChi(7),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,7), GammarealGluon(7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,7
CoupL = cplChiChiVZL(i1,i2)
CoupR = cplChiChiVZR(i1,i2)
Mex1 = MChi(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChiVZ


Subroutine Amplitude_WAVE_BLSSM_ChiToChiVZ(cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,MChi,MChi2,MVP,MVP2,MVZ,MVZ2,           & 
& ZfL0,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),              & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ctcplChiChiVPL(7,7),ctcplChiChiVPR(7,7),ctcplChiChiVZL(7,7),ctcplChiChiVZR(7,7),      & 
& ctcplChiChiVZpL(7,7),ctcplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ZfL0(7,7),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChiVZL(gt1,gt2) 
ZcoupT1R = ctcplChiChiVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChiVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfL0(i1,gt1)*cplChiChiVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChiVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChiVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplChiChiVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplChiChiVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplChiChiVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplChiChiVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplChiChiVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplChiChiVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChiVZ


Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,              & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVZ(4,4),cplChiChacHpmL(7,2,2),         & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVZL(2,2),      & 
& cplcChaChaVZR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),          & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVPVZ(4),        & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),          & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZ 


! {Ah, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, VWm, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
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


! {Cha, Hpm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
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


! {Cha, VWm, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, hh, Ah}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, Ah, hh}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZ, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZL(gt1,i1)
coup1R = cplChiChiVZR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZp, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZpL(gt1,i1)
coup1R = cplChiChiVZpR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
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


! {Chi, hh, VZ}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
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


! {Chi, hh, VZp}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
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


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZ(i2,i3)
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


! {Fe, Se, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
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


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
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


! {Fv, SvRe, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Cha, Cha}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
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


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
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


! {Se, Fe, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
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


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
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


! {SvIm, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
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


! {VWm, Cha, Cha}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChiVWmR(i2,gt1)
coup1R = -cplcChaChiVWmL(i2,gt1)
coup2L = -cplChiChacVWmR(gt2,i3)
coup2R = -cplChiChacVWmL(gt2,i3)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZL(gt1,i2)
coup1R = cplChiChiVZR(gt1,i2)
coup2L = -cplChiChiVZR(gt2,i3)
coup2R = -cplChiChiVZL(gt2,i3)
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


! {VZp, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZpL(gt1,i2)
coup1R = cplChiChiVZpR(gt1,i2)
coup2L = -cplChiChiVZpR(gt2,i3)
coup2R = -cplChiChiVZpL(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Hpm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Hpm]}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Hpm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
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


! {bar[Cha], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplSucSuVZ(i3,i2)
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


! {conj[Hpm], bar[Cha], bar[Cha]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
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


! {conj[VWm], bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacVWmL(gt1,i2)
coup1R = cplChiChacVWmR(gt1,i2)
coup2L = cplcChaChiVWmL(i3,gt2)
coup2R = cplcChaChiVWmR(i3,gt2)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVZ


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZp,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvImSvReVZ,              & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVZ(4,4),cplChiChacHpmL(7,2,2),         & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVZL(2,2),      & 
& cplcChaChaVZR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),          & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplhhVPVZ(4),        & 
& cplhhVZVZ(4),cplhhVZVZp(4),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),          & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvImSvReVZ(6,6),cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZ 


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhVPVZ(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplhhVPVZ(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVZ


Subroutine Amplitude_Tree_BLSSM_ChiToChiVZp(cplChiChiVZpL,cplChiChiVZpR,              & 
& MChi,MVZp,MChi2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MVZp,MChi2(7),MVZp2

Complex(dp), Intent(in) :: cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Complex(dp) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplChiChiVZpL(gt1,gt2)
coupT1R = cplChiChiVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToChiVZp


Subroutine Gamma_Real_BLSSM_ChiToChiVZp(MLambda,em,gs,cplChiChiVZpL,cplChiChiVZpR,    & 
& MChi,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Real(dp), Intent(in) :: MChi(7),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,7), GammarealGluon(7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,7
CoupL = cplChiChiVZpL(i1,i2)
CoupR = cplChiChiVZpR(i1,i2)
Mex1 = MChi(i1)
Mex2 = MChi(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToChiVZp


Subroutine Amplitude_WAVE_BLSSM_ChiToChiVZp(cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,MChi,MChi2,MVP,MVP2,MVZp,               & 
& MVZp2,ZfL0,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),              & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ctcplChiChiVPL(7,7),ctcplChiChiVPR(7,7),ctcplChiChiVZL(7,7),ctcplChiChiVZR(7,7),      & 
& ctcplChiChiVZpL(7,7),ctcplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ZfL0(7,7),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiChiVZpL(gt1,gt2) 
ZcoupT1R = ctcplChiChiVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChiVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfL0(i1,gt1)*cplChiChiVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChiVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChiVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplChiChiVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplChiChiVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplChiChiVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplChiChiVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplChiChiVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplChiChiVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChiVZp


Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,              & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,             & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),        & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVZpL(2,2),     & 
& cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),         & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),             & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),        & 
& cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),cplSvImSvReVZp(6,6),cplcHpmVWmVZp(2),& 
& cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZp 


! {Ah, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, VWm, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
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


! {Cha, Hpm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
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


! {Cha, VWm, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, hh, Ah}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, Ah, hh}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZ, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZL(gt1,i1)
coup1R = cplChiChiVZR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZp, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZpL(gt1,i1)
coup1R = cplChiChiVZpR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
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


! {Chi, hh, VZ}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
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


! {Chi, hh, VZp}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
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


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZp(i2,i3)
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


! {Fe, Se, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
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


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
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


! {Fv, SvRe, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Cha, Cha}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
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


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = -cplcFdFdVZpR(i3,i2)
coup3R = -cplcFdFdVZpL(i3,i2)
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


! {Se, Fe, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
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


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
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


! {SvIm, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
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


! {VWm, Cha, Cha}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChiVWmR(i2,gt1)
coup1R = -cplcChaChiVWmL(i2,gt1)
coup2L = -cplChiChacVWmR(gt2,i3)
coup2R = -cplChiChacVWmL(gt2,i3)
coup3L = -cplcChaChaVZpR(i3,i2)
coup3R = -cplcChaChaVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZL(gt1,i2)
coup1R = cplChiChiVZR(gt1,i2)
coup2L = -cplChiChiVZR(gt2,i3)
coup2R = -cplChiChiVZL(gt2,i3)
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


! {VZp, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZpL(gt1,i2)
coup1R = cplChiChiVZpR(gt1,i2)
coup2L = -cplChiChiVZpR(gt2,i3)
coup2R = -cplChiChiVZpL(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Hpm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Hpm]}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Hpm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
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


! {bar[Cha], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplSucSuVZp(i3,i2)
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


! {conj[Hpm], bar[Cha], bar[Cha]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFuFuVZpL(i2,i3)
coup3R = cplcFuFuVZpR(i2,i3)
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


! {conj[VWm], bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacVWmL(gt1,i2)
coup1R = cplChiChacVWmR(gt1,i2)
coup2L = cplcChaChiVWmL(i3,gt2)
coup2R = cplcChaChiVWmR(i3,gt2)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVZp


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,           & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,              & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,              & 
& cplChiChihhR,cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplFvFvVZpL,cplFvFvVZpR,cplhhVPVZp,             & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvImSvReVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVZp(4,4),cplChiChacHpmL(7,2,2),        & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVZpL(2,2),     & 
& cplcChaChaVZpR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),         & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),             & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),& 
& cplhhVPVZp(4),cplhhVZVZp(4),cplhhVZpVZp(4),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),        & 
& cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),cplSvImSvReVZp(6,6),cplcHpmVWmVZp(2),& 
& cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVZp 


! {Chi, VP, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = Mhh(i3) 
coup1L = cplChiChiVPL(gt1,i1)
coup1R = cplChiChiVPR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhVPVZp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, hh, VP}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVP 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVPR(gt2,i1)
coup2R = -cplChiChiVPL(gt2,i1)
coup3 = cplhhVPVZp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVZp


Subroutine Amplitude_Tree_BLSSM_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,MChi,            & 
& MFd,MSd,MChi2,MFd2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFd(3),MSd(6),MChi2(7),MFd2(3),MSd2(6)

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Complex(dp) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFdcSdL(gt1,gt2,gt3)
coupT1R = cplChiFdcSdR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToFdcSd


Subroutine Gamma_Real_BLSSM_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,       & 
& MChi,MFd,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp), Intent(in) :: MChi(7),MFd(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,3,6), GammarealGluon(7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
CoupL = cplChiFdcSdL(i1,i2,i3)
CoupR = cplChiFdcSdR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MFd(i2)
Mex3 = MSd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChiToFdcSd


Subroutine Amplitude_WAVE_BLSSM_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL,  & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFd(3),MFd2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Complex(dp), Intent(in) :: ctcplChiFdcSdL(7,3,6),ctcplChiFdcSdR(7,3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZfL0(7,7),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFdcSdL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiFdcSdR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiFdcSdL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiFdcSdR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt2)*cplChiFdcSdL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt2))*cplChiFdcSdR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSd(i1,gt3))*cplChiFdcSdL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSd(i1,gt3))*cplChiFdcSdR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToFdcSd


Subroutine Amplitude_VERTEX_BLSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
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

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSd(gt3) 


! {Ah, Chi, bar[Fd]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
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


! {Cha, Hpm, conj[Su]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSu(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplHpmSucSd(i2,i3,gt3)
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


! {Cha, VWm, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSu(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSdVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, Ah, conj[Sd]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplAhSdcSd(i2,i3,gt3)
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


! {Chi, hh, conj[Sd]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplhhSdcSd(i2,i3,gt3)
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


! {Chi, VP, conj[Sd]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSdVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, VZ, conj[Sd]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSdVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, VZp, conj[Sd]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MSd(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSdVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Sd, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
coup3 = cplAhSdcSd(i3,i2,gt3)
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


! {Fd, Sd, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhSdcSd(i3,i2,gt3)
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


! {Fd, Sd, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSdcSdVG(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Sd, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSdcSdVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Sd, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplSdcSdVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Sd, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVZp 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
coup3 = cplSdcSdVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Su, conj[Hpm]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuFdcHpmL(i1,gt2,i3)
coup2R = cplcFuFdcHpmR(i1,gt2,i3)
coup3 = cplHpmSucSd(i3,i2,gt3)
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


! {Fu, Su, conj[VWm]}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVWm 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFdcVWmR(i1,gt2)
coup2R = -cplcFuFdcVWmL(i1,gt2)
coup3 = cplSucSdVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Chi, bar[Fd]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
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


! {Hpm, Cha, bar[Fu]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplcFuFdcHpmL(i3,gt2,i1)
coup2R = cplcFuFdcHpmR(i3,gt2,i1)
coup3L = cplChaFucSdL(i2,i3,gt3)
coup3R = cplChaFucSdR(i2,i3,gt3)
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


! {Sd, Fd, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MChi(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = cplChiFdcSdL(i3,i2,gt3)
coup3R = cplChiFdcSdR(i3,i2,gt3)
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


! {Sd, Fd, Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MGlu 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplGluFdcSdL(gt2,i1)
coup2R = cplGluFdcSdR(gt2,i1)
coup3L = cplGluFdcSdL(i2,gt3)
coup3R = cplGluFdcSdR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Su, Fu, bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MCha(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplcChaFdcSuL(i3,gt2,i1)
coup2R = cplcChaFdcSuR(i3,gt2,i1)
coup3L = cplChaFucSdL(i3,i2,gt3)
coup3R = cplChaFucSdR(i3,i2,gt3)
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


! {VP, Chi, bar[Fd]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Cha, bar[Fu]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = -cplcFuFdcVWmR(i3,gt2)
coup2R = -cplcFuFdcVWmL(i3,gt2)
coup3L = cplChaFucSdL(i2,i3,gt3)
coup3R = cplChaFucSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, bar[Fd]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Chi, bar[Fd]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToFdcSd


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
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

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSd(gt3) 


! {Chi, VP, conj[Sd]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSdVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Sd, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSdcSdVG(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Sd, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSdcSdVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, bar[Fd]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplChiFdcSdL(i2,i3,gt3)
coup3R = cplChiFdcSdR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFdcSd


Subroutine Amplitude_Tree_BLSSM_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,MChi,            & 
& MFe,MSe,MChi2,MFe2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFe(3),MSe(6),MChi2(7),MFe2(3),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6)

Complex(dp) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFecSeL(gt1,gt2,gt3)
coupT1R = cplChiFecSeR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToFecSe


Subroutine Gamma_Real_BLSSM_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,       & 
& MChi,MFe,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6)

Real(dp), Intent(in) :: MChi(7),MFe(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,3,6), GammarealGluon(7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
CoupL = cplChiFecSeL(i1,i2,i3)
CoupR = cplChiFecSeR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MFe(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToFecSe


Subroutine Amplitude_WAVE_BLSSM_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,  & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFe(3),MFe2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6)

Complex(dp), Intent(in) :: ctcplChiFecSeL(7,3,6),ctcplChiFecSeR(7,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfL0(7,7),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFecSeL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiFecSeR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiFecSeL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiFecSeR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplChiFecSeL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplChiFecSeR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplChiFecSeL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt3))*cplChiFecSeR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToFecSe


Subroutine Amplitude_VERTEX_BLSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),        & 
& cplAhSecSe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),           & 
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),  & 
& cplcFeChiSeR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),       & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplhhSecSe(4,6,6),cplHpmSvImcSe(2,6,6),& 
& cplHpmSvRecSe(2,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvImcSeVWm(6,6),& 
& cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSe(gt3) 


! {Ah, Chi, bar[Fe]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
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


! {Cha, Hpm, SvIm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
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


! {Cha, VWm, SvIm}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSvIm(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaFeSvImL(i1,gt2,i3)
coup2R = cplcChaFeSvImR(i1,gt2,i3)
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


! {Cha, Hpm, SvRe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
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


! {Cha, VWm, SvRe}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSvRe(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaFeSvReL(i1,gt2,i3)
coup2R = cplcChaFeSvReR(i1,gt2,i3)
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


! {Chi, Ah, conj[Se]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Chi, hh, conj[Se]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Chi, VP, conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Chi, VZ, conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Chi, VZp, conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MSe(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Fe, Se, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
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


! {Fe, Se, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, Se, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
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


! {Fe, Se, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fe, Se, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
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


! {Fv, SvIm, conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, SvRe, conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFecHpmL(i1,gt2,i3)
coup2R = cplFvFecHpmR(i1,gt2,i3)
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


! {Fv, SvIm, conj[VWm]}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
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


! {Fv, SvRe, conj[VWm]}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MVWm 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = -cplFvFecVWmR(i1,gt2)
coup2R = -cplFvFecVWmL(i1,gt2)
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


! {hh, Chi, bar[Fe]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
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


! {Hpm, Cha, Fv}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(i3,gt2,i1)
coup2R = cplFvFecHpmR(i3,gt2,i1)
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


! {Se, Fe, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {SvIm, Fv, bar[Cha]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplcChaFeSvImL(i3,gt2,i1)
coup2R = cplcChaFeSvImR(i3,gt2,i1)
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


! {SvRe, Fv, bar[Cha]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplcChaFeSvReL(i3,gt2,i1)
coup2R = cplcChaFeSvReR(i3,gt2,i1)
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


! {VP, Chi, bar[Fe]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Cha, Fv}
  Do i2=1,2
    Do i3=1,6
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = -cplFvFecVWmR(i3,gt2)
coup2R = -cplFvFecVWmL(i3,gt2)
coup3L = cplFvChacSeL(i3,i2,gt3)
coup3R = cplFvChacSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, bar[Fe]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, Chi, bar[Fe]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToFecSe


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSe2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,        & 
& cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplFvChacSeL,cplFvChacSeR,cplChiChihhL,cplChiChihhR,cplChiChiVPL,cplChiChiVPR,         & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaChiVWmL,cplcChaChiVWmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,cplcFeFehhL,cplcFeFehhR,cplcChaFeSvImL,cplcChaFeSvImR,       & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplhhSecSe,cplHpmSvImcSe,cplHpmSvRecSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvImcSeVWm,cplSvRecSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFe(3),MFv(6),Mhh(4),MHpm(2),MSe(6),MSvIm(6),MSvRe(6),         & 
& MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),MFe2(3),MFv2(6),Mhh2(4),MHpm2(2),          & 
& MSe2(6),MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),        & 
& cplAhSecSe(4,6,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),     & 
& cplChiChacVWmR(7,2),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),             & 
& cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiFecSeL(7,3,6),           & 
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFeChiSeL(3,7,6),  & 
& cplcFeChiSeR(3,7,6),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplFvFecHpmL(6,3,2),       & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplcFeFehhL(3,3,4),            & 
& cplcFeFehhR(3,3,4),cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),  & 
& cplcChaFeSvReR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),              & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplhhSecSe(4,6,6),cplHpmSvImcSe(2,6,6),& 
& cplHpmSvRecSe(2,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvImcSeVWm(6,6),& 
& cplSvRecSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSe(gt3) 


! {Chi, VP, conj[Se]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSecSeVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Se, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplSecSeVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, bar[Fe]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplChiFecSeL(i2,i3,gt3)
coup3R = cplChiFecSeR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFecSe


Subroutine Amplitude_Tree_BLSSM_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,MChi,            & 
& MFu,MSu,MChi2,MFu2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFu(3),MSu(6),MChi2(7),MFu2(3),MSu2(6)

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Complex(dp) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSu(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFucSuL(gt1,gt2,gt3)
coupT1R = cplChiFucSuR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToFucSu


Subroutine Gamma_Real_BLSSM_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,       & 
& MChi,MFu,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Real(dp), Intent(in) :: MChi(7),MFu(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,3,6), GammarealGluon(7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,3
    Do i3=1,6
CoupL = cplChiFucSuL(i1,i2,i3)
CoupR = cplChiFucSuR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MFu(i2)
Mex3 = MSu(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_BLSSM_ChiToFucSu


Subroutine Amplitude_WAVE_BLSSM_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,ctcplChiFucSuL,  & 
& ctcplChiFucSuR,MChi,MChi2,MFu,MFu2,MSu,MSu2,ZfFUL,ZfFUR,ZfL0,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFu(3),MFu2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Complex(dp), Intent(in) :: ctcplChiFucSuL(7,3,6),ctcplChiFucSuR(7,3,6)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),ZfL0(7,7),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFucSuL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiFucSuR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiFucSuL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiFucSuR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUL(i1,gt2)*cplChiFucSuL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUR(i1,gt2))*cplChiFucSuR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplChiFucSuL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplChiFucSuR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToFucSu


Subroutine Amplitude_VERTEX_BLSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
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

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSu(gt3) 


! {Ah, Chi, bar[Fu]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplcFuFuAhL(i3,gt2,i1)
coup2R = cplcFuFuAhR(i3,gt2,i1)
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


! {Chi, Ah, conj[Su]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Chi, hh, conj[Su]}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Chi, VP, conj[Su]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Chi, VZ, conj[Su]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Chi, VZp, conj[Su]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MSu(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
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


! {Fd, Sd, Hpm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdFuHpmL(i1,gt2,i3)
coup2R = cplcFdFuHpmR(i1,gt2,i3)
coup3 = cplSdcHpmcSu(i2,i3,gt3)
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


! {Fd, Sd, VWm}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MVWm 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = -cplcFdFuVWmR(i1,gt2)
coup2R = -cplcFdFuVWmL(i1,gt2)
coup3 = cplSdcSucVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Su, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2,i3)
coup2R = cplcFuFuAhR(i1,gt2,i3)
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


! {Fu, Su, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,4
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVGR(i1,gt2)
coup2R = -cplcFuFuVGL(i1,gt2)
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


! {Fu, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
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


! {Fu, Su, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVZ 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
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


! {Fu, Su, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVZp 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVZpR(i1,gt2)
coup2R = -cplcFuFuVZpL(i1,gt2)
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


! {hh, Chi, bar[Fu]}
Do i1=1,4
  Do i2=1,7
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
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


! {Sd, Fd, Cha}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MCha(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChaFucSdL(i3,gt2,i1)
coup2R = cplChaFucSdR(i3,gt2,i1)
coup3L = cplcChaFdcSuL(i3,i2,gt3)
coup3R = cplcChaFdcSuR(i3,i2,gt3)
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


! {Su, Fu, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,7
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MChi(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(i3,gt2,i1)
coup2R = cplChiFucSuR(i3,gt2,i1)
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


! {Su, Fu, Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MGlu 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplGluFucSuL(gt2,i1)
coup2R = cplGluFucSuR(gt2,i1)
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


! {VP, Chi, bar[Fu]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
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


! {VZ, Chi, bar[Fu]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
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


! {VZp, Chi, bar[Fu]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = -cplcFuFuVZpR(i3,gt2)
coup2R = -cplcFuFuVZpL(i3,gt2)
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


! {bar[Cha], conj[Hpm], conj[Sd]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChaFucSdL(i1,gt2,i3)
coup2R = cplChaFucSdR(i1,gt2,i3)
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


! {bar[Cha], conj[VWm], conj[Sd]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSd(i3) 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplChaFucSdL(i1,gt2,i3)
coup2R = cplChaFucSdR(i1,gt2,i3)
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


! {conj[Hpm], bar[Cha], bar[Fd]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcFdFuHpmL(i3,gt2,i1)
coup2R = cplcFdFuHpmR(i3,gt2,i1)
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


! {conj[VWm], bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplChiChacVWmR(gt1,i2)
coup1R = -cplChiChacVWmL(gt1,i2)
coup2L = -cplcFdFuVWmR(i3,gt2)
coup2R = -cplcFdFuVWmL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToFucSu


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,           & 
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

Complex(dp), Intent(out) :: Amp(2,7,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSu(gt3) 


! {Chi, VP, conj[Su]}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFucSuL(i1,gt2,i3)
coup2R = cplChiFucSuR(i1,gt2,i3)
coup3 = cplSucSuVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVGR(i1,gt2)
coup2R = -cplcFuFuVGL(i1,gt2)
coup3 = cplSucSuVG(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fu, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplSucSuVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, bar[Fu]}
  Do i2=1,7
    Do i3=1,3
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplChiFucSuL(i2,i3,gt3)
coup3R = cplChiFucSuR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFucSu


Subroutine Amplitude_Tree_BLSSM_ChiToFvSvIm(cplChiFvSvImL,cplChiFvSvImR,              & 
& MChi,MFv,MSvIm,MChi2,MFv2,MSvIm2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvIm(6),MChi2(7),MFv2(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Complex(dp) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvIm(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvImL(gt1,gt2,gt3)
coupT1R = cplChiFvSvImR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToFvSvIm


Subroutine Gamma_Real_BLSSM_ChiToFvSvIm(MLambda,em,gs,cplChiFvSvImL,cplChiFvSvImR,    & 
& MChi,MFv,MSvIm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvIm(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,6,6), GammarealGluon(7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
CoupL = cplChiFvSvImL(i1,i2,i3)
CoupR = cplChiFvSvImR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MFv(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToFvSvIm


Subroutine Amplitude_WAVE_BLSSM_ChiToFvSvIm(cplChiFvSvImL,cplChiFvSvImR,              & 
& ctcplChiFvSvImL,ctcplChiFvSvImR,MChi,MChi2,MFv,MFv2,MSvIm,MSvIm2,ZfFvm,ZfL0,           & 
& ZfSvIm,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFv(6),MFv2(6),MSvIm(6),MSvIm2(6)

Complex(dp), Intent(in) :: cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvImL(7,6,6),ctcplChiFvSvImR(7,6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfL0(7,7),ZfSvIm(6,6)

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvIm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvImL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiFvSvImR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiFvSvImL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiFvSvImR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplChiFvSvImL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplChiFvSvImR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvIm(i1,gt3)*cplChiFvSvImR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToFvSvIm


Subroutine Amplitude_VERTEX_BLSSM_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
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

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvIm(gt3) 


! {Ah, Chi, Fv}
Do i1=1,4
  Do i2=1,7
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Hpm, Se}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Cha, VWm, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Chi, Ah, SvIm}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, hh, SvIm}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, Ah, SvRe}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, hh, SvRe}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, VP, SvRe}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, VZ, SvRe}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MSvRe(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, VZp, SvRe}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MSvRe(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Se, Hpm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Se, VWm}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
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


! {Fv, SvIm, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, SvRe, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, SvIm, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, SvRe, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, SvRe, VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
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


! {Fv, SvRe, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {Fv, SvRe, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MVZp 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
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


! {hh, Chi, Fv}
Do i1=1,4
  Do i2=1,7
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Cha, Fe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
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


! {Se, Fe, Cha}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {SvIm, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
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


! {VWm, Cha, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeChaSvImL(i3,i2,gt3)
coup3R = cplcFeChaSvImR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
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


! {VZp, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Se]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Se]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Hpm]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[VWm]}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
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


! {conj[Hpm], bar[Cha], bar[Fe]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChacVWmR(gt1,i2)
coup1R = -cplChiChacVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToFvSvIm


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFvSvIm(MAh,MCha,MChi,MFe,MFv,               & 
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

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvIm(gt3) 


! {Chi, VP, SvRe}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSvRe(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
coup3 = -cplSvImSvReVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, SvRe, VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MVP 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = -cplSvImSvReVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplChiFvSvImL(i2,i3,gt3)
coup3R = cplChiFvSvImR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFvSvIm


Subroutine Amplitude_Tree_BLSSM_ChiToFvSvRe(cplChiFvSvReL,cplChiFvSvReR,              & 
& MChi,MFv,MSvRe,MChi2,MFv2,MSvRe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvRe(6),MChi2(7),MFv2(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Complex(dp) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvRe(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvSvReL(gt1,gt2,gt3)
coupT1R = cplChiFvSvReR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_BLSSM_ChiToFvSvRe


Subroutine Gamma_Real_BLSSM_ChiToFvSvRe(MLambda,em,gs,cplChiFvSvReL,cplChiFvSvReR,    & 
& MChi,MFv,MSvRe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Real(dp), Intent(in) :: MChi(7),MFv(6),MSvRe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(7,6,6), GammarealGluon(7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,7
  Do i2=1,6
    Do i3=1,6
CoupL = cplChiFvSvReL(i1,i2,i3)
CoupR = cplChiFvSvReR(i1,i2,i3)
Mex1 = MChi(i1)
Mex2 = MFv(i2)
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
End Subroutine Gamma_Real_BLSSM_ChiToFvSvRe


Subroutine Amplitude_WAVE_BLSSM_ChiToFvSvRe(cplChiFvSvReL,cplChiFvSvReR,              & 
& ctcplChiFvSvReL,ctcplChiFvSvReR,MChi,MChi2,MFv,MFv2,MSvRe,MSvRe2,ZfFvm,ZfL0,           & 
& ZfSvRe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MFv(6),MFv2(6),MSvRe(6),MSvRe2(6)

Complex(dp), Intent(in) :: cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Complex(dp), Intent(in) :: ctcplChiFvSvReL(7,6,6),ctcplChiFvSvReR(7,6,6)

Complex(dp), Intent(in) :: ZfFvm(6,6),ZfL0(7,7),ZfSvRe(6,6)

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvRe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvSvReL(gt1,gt2,gt3) 
ZcoupT1R = ctcplChiFvSvReR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt1)*cplChiFvSvReL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiFvSvReR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFvm(i1,gt2)*cplChiFvSvReL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFvm(i1,gt2))*cplChiFvSvReR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSvRe(i1,gt3)*cplChiFvSvReR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToFvSvRe


Subroutine Amplitude_VERTEX_BLSSM_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
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

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvRe(gt3) 


! {Ah, Chi, Fv}
Do i1=1,4
  Do i2=1,7
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplFvFvAhL(gt2,i3,i1)
coup2R = cplFvFvAhR(gt2,i3,i1)
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


! {Cha, Hpm, Se}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Cha, VWm, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplChiChacVWmR(gt1,i1)
coup1R = -cplChiChacVWmL(gt1,i1)
coup2L = cplcChaFvSeL(i1,gt2,i3)
coup2R = cplcChaFvSeR(i1,gt2,i3)
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


! {Chi, Ah, SvIm}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, hh, SvIm}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, VP, SvIm}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, VZ, SvIm}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = MSvIm(i3) 
coup1L = -cplChiChiVZR(gt1,i1)
coup1R = -cplChiChiVZL(gt1,i1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, VZp, SvIm}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = MSvIm(i3) 
coup1L = -cplChiChiVZpR(gt1,i1)
coup1R = -cplChiChiVZpL(gt1,i1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
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


! {Chi, Ah, SvRe}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Chi, hh, SvRe}
Do i1=1,7
  Do i2=1,4
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiFvSvReL(i1,gt2,i3)
coup2R = cplChiFvSvReR(i1,gt2,i3)
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


! {Fe, Se, Hpm}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
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


! {Fe, Se, VWm}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
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


! {Fv, SvIm, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, SvRe, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvAhL(gt2,i1,i3)
coup2R = cplFvFvAhR(gt2,i1,i3)
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


! {Fv, SvIm, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, SvRe, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,4
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplFvFvhhL(gt2,i1,i3)
coup2R = cplFvFvhhR(gt2,i1,i3)
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


! {Fv, SvIm, VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
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


! {Fv, SvIm, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZ 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {Fv, SvIm, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MVZp 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvVZpL(gt2,i1)
coup2R = cplFvFvVZpR(gt2,i1)
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


! {hh, Chi, Fv}
Do i1=1,4
  Do i2=1,7
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplFvFvhhL(gt2,i3,i1)
coup2R = cplFvFvhhR(gt2,i3,i1)
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


! {Hpm, Cha, Fe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplFvFecHpmL(gt2,i3,i1)
coup2R = cplFvFecHpmR(gt2,i3,i1)
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


! {Se, Fe, Cha}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplFvChacSeL(gt2,i3,i1)
coup2R = cplFvChacSeR(gt2,i3,i1)
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


! {SvIm, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(i3,gt2,i1)
coup2R = cplChiFvSvImR(i3,gt2,i1)
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


! {SvRe, Fv, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,7
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(i3,gt2,i1)
coup2R = cplChiFvSvReR(i3,gt2,i1)
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


! {VP, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
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


! {VWm, Cha, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiVWmL(i2,gt1)
coup1R = cplcChaChiVWmR(i2,gt1)
coup2L = cplFvFecVWmL(gt2,i3)
coup2R = cplFvFecVWmR(gt2,i3)
coup3L = cplcFeChaSvReL(i3,i2,gt3)
coup3R = cplcFeChaSvReR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVZR(gt1,i2)
coup1R = -cplChiChiVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
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


! {VZp, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVZpR(gt1,i2)
coup1R = -cplChiChiVZpL(gt1,i2)
coup2L = cplFvFvVZpL(gt2,i3)
coup2R = cplFvFvVZpR(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Se]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Se]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = cplcChaChiVWmL(i1,gt1)
coup1R = cplcChaChiVWmR(i1,gt1)
coup2L = cplFvChacSeL(gt2,i1,i3)
coup2R = cplFvChacSeR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Hpm]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MHpm(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplFvFecHpmL(gt2,i1,i3)
coup2R = cplFvFecHpmR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[VWm]}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MVWm 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplFvFecVWmL(gt2,i1)
coup2R = cplFvFecVWmR(gt2,i1)
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


! {conj[Hpm], bar[Cha], bar[Fe]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Cha]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcChaFvSeL(i3,gt2,i1)
coup2R = cplcChaFvSeR(i3,gt2,i1)
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


! {conj[VWm], bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplChiChacVWmR(gt1,i2)
coup1R = -cplChiChacVWmL(gt1,i2)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_BLSSM_ChiToFvSvRe


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFvSvRe(MAh,MCha,MChi,MFe,MFv,               & 
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

Complex(dp), Intent(out) :: Amp(2,7,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSvRe(gt3) 


! {Chi, VP, SvIm}
Do i1=1,7
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVP 
ML3 = MSvIm(i3) 
coup1L = -cplChiChiVPR(gt1,i1)
coup1R = -cplChiChiVPL(gt1,i1)
coup2L = cplChiFvSvImL(i1,gt2,i3)
coup2R = cplChiFvSvImR(i1,gt2,i3)
coup3 = cplSvImSvReVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fv, SvIm, VP}
Do i1=1,6
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MVP 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplFvFvVPL(gt2,i1)
coup2R = cplFvFvVPR(gt2,i1)
coup3 = cplSvImSvReVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Chi, Fv}
  Do i2=1,7
    Do i3=1,6
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplChiChiVPR(gt1,i2)
coup1R = -cplChiChiVPL(gt1,i2)
coup2L = cplFvFvVPL(gt2,i3)
coup2R = cplFvFvVPR(gt2,i3)
coup3L = cplChiFvSvReL(i2,i3,gt3)
coup3R = cplChiFvSvReR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToFvSvRe


Subroutine Amplitude_WAVE_BLSSM_ChiToChiVP(cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ctcplChiChiVPL,ctcplChiChiVPR,ctcplChiChiVZL, & 
& ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,MChi,MChi2,MVP,MVP2,ZfL0,               & 
& ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MVP,MVP2

Complex(dp), Intent(in) :: cplChiChiVPL(7,7),cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),              & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ctcplChiChiVPL(7,7),ctcplChiChiVPR(7,7),ctcplChiChiVZL(7,7),ctcplChiChiVZR(7,7),      & 
& ctcplChiChiVZpL(7,7),ctcplChiChiVZpR(7,7)

Complex(dp), Intent(in) :: ZfL0(7,7),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
  Do gt2=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfL0(i1,gt1))*cplChiChiVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfL0(i1,gt1)*cplChiChiVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,7
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplChiChiVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplChiChiVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplChiChiVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplChiChiVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplChiChiVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplChiChiVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToChiVP


Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVP(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,       & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,              & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVP(4,4),cplChiChacHpmL(7,2,2),         & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),          & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplhhVPVZ(4),        & 
& cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),       & 
& cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVP 


! {Ah, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = MAh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiAhL(gt1,i2,i1)
coup1R = cplChiChiAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
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


! {Cha, Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
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


! {Cha, VWm, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
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


! {Cha, Hpm, VWm}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplChiChacHpmL(gt1,i1,i2)
coup1R = cplChiChacHpmR(gt1,i1,i2)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
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


! {Cha, VWm, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplChiChacVWmL(gt1,i1)
coup1R = cplChiChacVWmR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, hh, Ah}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
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


! {Chi, Ah, hh}
Do i1=1,7
  Do i2=1,4
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiChiAhL(gt1,i1,i2)
coup1R = cplChiChiAhR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZ, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZL(gt1,i1)
coup1R = cplChiChiVZR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, VZp, hh}
Do i1=1,7
    Do i3=1,4
ML1 = MChi(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplChiChiVZpL(gt1,i1)
coup1R = cplChiChiVZpR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
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


! {Chi, hh, VZ}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
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


! {Chi, hh, VZp}
Do i1=1,7
  Do i2=1,4
ML1 = MChi(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplChiChihhL(gt1,i1,i2)
coup1R = cplChiChihhR(gt1,i1,i2)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
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


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = -cplSdcSdVP(i2,i3)
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


! {Fe, Se, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(gt1,i1,i2)
coup1R = cplChiFecSeR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
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


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuChiSuL(i1,gt2,i3)
coup2R = cplcFuChiSuR(i1,gt2,i3)
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


! {Fv, SvRe, SvIm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvRe(i2) 
ML3 = MSvIm(i3) 
coup1L = cplChiFvSvReL(gt1,i1,i2)
coup1R = cplChiFvSvReR(gt1,i1,i2)
coup2L = cplChiFvSvImL(gt2,i1,i3)
coup2R = cplChiFvSvImR(gt2,i1,i3)
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


! {Fv, SvIm, SvRe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSvIm(i2) 
ML3 = MSvRe(i3) 
coup1L = cplChiFvSvImL(gt1,i1,i2)
coup1R = cplChiFvSvImR(gt1,i1,i2)
coup2L = cplChiFvSvReL(gt2,i1,i3)
coup2R = cplChiFvSvReR(gt2,i1,i3)
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


! {hh, Chi, Chi}
Do i1=1,4
  Do i2=1,7
    Do i3=1,7
ML1 = Mhh(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChihhL(gt1,i2,i1)
coup1R = cplChiChihhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
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


! {Hpm, Cha, Cha}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(i2,gt1,i1)
coup1R = cplcChaChiHpmR(i2,gt1,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
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


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
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


! {Se, Fe, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeChiSeL(i2,gt1,i1)
coup1R = cplcFeChiSeR(i2,gt1,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
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


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplChiFucSuL(gt2,i3,i1)
coup2R = cplChiFucSuR(gt2,i3,i1)
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


! {SvIm, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvIm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvImL(gt1,i2,i1)
coup1R = cplChiFvSvImR(gt1,i2,i1)
coup2L = cplChiFvSvImL(gt2,i3,i1)
coup2R = cplChiFvSvImR(gt2,i3,i1)
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


! {SvRe, Fv, Fv}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSvRe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvSvReL(gt1,i2,i1)
coup1R = cplChiFvSvReR(gt1,i2,i1)
coup2L = cplChiFvSvReL(gt2,i3,i1)
coup2R = cplChiFvSvReR(gt2,i3,i1)
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


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
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


! {VWm, Cha, Cha}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChiVWmR(i2,gt1)
coup1R = -cplcChaChiVWmL(i2,gt1)
coup2L = -cplChiChacVWmR(gt2,i3)
coup2R = -cplChiChacVWmL(gt2,i3)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZ 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZL(gt1,i2)
coup1R = cplChiChiVZR(gt1,i2)
coup2L = -cplChiChiVZR(gt2,i3)
coup2R = -cplChiChiVZL(gt2,i3)
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


! {VZp, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVZp 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVZpL(gt1,i2)
coup1R = cplChiChiVZpR(gt1,i2)
coup2L = -cplChiChiVZpR(gt2,i3)
coup2R = -cplChiChiVZpL(gt2,i3)
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


! {bar[Cha], conj[Hpm], conj[Hpm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[VWm], conj[Hpm]}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = cplChiChacHpmL(gt2,i1,i3)
coup2R = cplChiChacHpmR(gt2,i1,i3)
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


! {bar[Cha], conj[Hpm], conj[VWm]}
Do i1=1,2
  Do i2=1,2
ML1 = MCha(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(i1,gt1,i2)
coup1R = cplcChaChiHpmR(i1,gt1,i2)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
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


! {bar[Cha], conj[VWm], conj[VWm]}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcChaChiVWmR(i1,gt1)
coup1R = -cplcChaChiVWmL(i1,gt1)
coup2L = -cplChiChacVWmR(gt2,i1)
coup2R = -cplChiChacVWmL(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplChiFdcSdL(gt2,i1,i3)
coup2R = cplChiFdcSdR(gt2,i1,i3)
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


! {bar[Fe], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcFeChiSeL(i1,gt1,i2)
coup1R = cplcFeChiSeR(i1,gt1,i2)
coup2L = cplChiFecSeL(gt2,i1,i3)
coup2R = cplChiFecSeR(gt2,i1,i3)
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


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplSucSuVP(i3,i2)
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


! {conj[Hpm], bar[Cha], bar[Cha]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacHpmL(gt1,i2,i1)
coup1R = cplChiChacHpmR(gt1,i2,i1)
coup2L = cplcChaChiHpmL(i3,gt2,i1)
coup2R = cplcChaChiHpmR(i3,gt2,i1)
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


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdChiSdL(i3,gt2,i1)
coup2R = cplcFdChiSdR(i3,gt2,i1)
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


! {conj[Se], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(gt1,i2,i1)
coup1R = cplChiFecSeR(gt1,i2,i1)
coup2L = cplcFeChiSeL(i3,gt2,i1)
coup2R = cplcFeChiSeR(i3,gt2,i1)
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


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
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


! {conj[VWm], bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWm 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChiChacVWmL(gt1,i2)
coup1R = cplChiChacVWmR(gt1,i2)
coup2L = cplcChaChiVWmL(i3,gt2)
coup2R = cplcChaChiVWmR(i3,gt2)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToChiVP


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVP(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSvIm,MSvRe,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSvIm2,MSvRe2,MVP2,MVWm2,MVZ2,           & 
& MVZp2,cplChiChiAhL,cplChiChiAhR,cplAhhhVP,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVPL,cplChiChiVPR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplcChaChiHpmL,cplcChaChiHpmR, & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,cplhhVPVZ,cplhhVPVZp,cplHpmcHpmVP,       & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplSvImSvReVP,cplcHpmVPVWm,              & 
& cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(4),MCha(2),MChi(7),MFd(3),MFe(3),MFu(3),MFv(6),Mhh(4),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSvIm(6),MSvRe(6),MVP,MVWm,MVZ,MVZp,MAh2(4),MCha2(2),MChi2(7),           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(6),Mhh2(4),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),              & 
& MSvIm2(6),MSvRe2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplAhhhVP(4,4),cplChiChacHpmL(7,2,2),         & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVPL(7,7),          & 
& cplChiChiVPR(7,7),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),              & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),        & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplcChaChiHpmL(2,7,2),  & 
& cplcChaChiHpmR(2,7,2),cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFeChiSeL(3,7,6),     & 
& cplcFeChiSeR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcChaChiVWmL(2,7),       & 
& cplcChaChiVWmR(2,7),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(6,6),cplFvFvVPR(6,6),cplhhVPVZ(4),        & 
& cplhhVPVZp(4),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),       & 
& cplSucSuVP(6,6),cplSvImSvReVP(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,7,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
  Do gt2=1,7
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVP 


! {VP, Chi, Chi}
  Do i2=1,7
    Do i3=1,7
ML1 = MVP 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiChiVPL(gt1,i2)
coup1R = cplChiChiVPR(gt1,i2)
coup2L = -cplChiChiVPR(gt2,i3)
coup2R = -cplChiChiVPL(gt2,i3)
coup3L = -cplChiChiVPR(i3,i2)
coup3R = -cplChiChiVPL(i3,i2)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToChiVP


Subroutine Amplitude_WAVE_BLSSM_ChiToGluVG(MChi,MChi2,MGlu,MGlu2,MVG,MVG2,            & 
& ZffG,ZfL0,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MChi2(7),MGlu,MGlu2,MVG,MVG2

Complex(dp), Intent(in) :: ZffG,ZfL0(7,7),ZfVG

Complex(dp), Intent(out) :: Amp(4,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,7
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MGlu 
Mex3 = MVG 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_BLSSM_ChiToGluVG


Subroutine Amplitude_VERTEX_BLSSM_ChiToGluVG(MChi,MFd,MFu,MGlu,MSd,MSu,               & 
& MVG,MChi2,MFd2,MFu2,MGlu2,MSd2,MSu2,MVG2,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplSdcSdVG,            & 
& cplSucSuVG,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFd(3),MFu(3),MGlu,MSd(6),MSu(6),MVG,MChi2(7),MFd2(3),MFu2(3),MGlu2,          & 
& MSd2(6),MSu2(6),MVG2

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),      & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplGluFucSuL(3,6),& 
& cplGluFucSuR(3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),& 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplSdcSdVG(6,6),cplSucSuVG(6,6)

Complex(dp), Intent(out) :: Amp(4,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MGlu 
Mex3 = MVG 


! {Fd, Sd, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplChiFdcSdL(gt1,i1,i2)
coup1R = cplChiFdcSdR(gt1,i1,i2)
coup2L = cplcFdGluSdL(i1,i3)
coup2R = cplcFdGluSdR(i1,i3)
coup3 = -cplSdcSdVG(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {Fu, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplChiFucSuL(gt1,i1,i2)
coup1R = cplChiFucSuR(gt1,i1,i2)
coup2L = cplcFuGluSuL(i1,i3)
coup2R = cplcFuGluSuR(i1,i3)
coup3 = -cplSucSuVG(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fd, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdChiSdL(i2,gt1,i1)
coup1R = cplcFdChiSdR(i2,gt1,i1)
coup2L = cplGluFdcSdL(i3,i1)
coup2R = cplGluFdcSdR(i3,i1)
coup3L = -cplcFdFdVGR(i3,i2)
coup3R = -cplcFdFdVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {Su, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuChiSuL(i2,gt1,i1)
coup1R = cplcFuChiSuR(i2,gt1,i1)
coup2L = cplGluFucSuL(i3,i1)
coup2R = cplGluFucSuR(i3,i1)
coup3L = -cplcFuFuVGR(i3,i2)
coup3R = -cplcFuFuVGL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcFdChiSdL(i1,gt1,i2)
coup1R = cplcFdChiSdR(i1,gt1,i2)
coup2L = cplGluFdcSdL(i1,i3)
coup2R = cplGluFdcSdR(i1,i3)
coup3 = cplSdcSdVG(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], conj[Su], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcFuChiSuL(i1,gt1,i2)
coup1R = cplcFuChiSuR(i1,gt1,i2)
coup2L = cplGluFucSuL(i1,i3)
coup2R = cplGluFucSuR(i1,i3)
coup3 = cplSucSuVG(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {conj[Sd], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplChiFdcSdL(gt1,i2,i1)
coup1R = cplChiFdcSdR(gt1,i2,i1)
coup2L = cplcFdGluSdL(i3,i1)
coup2R = cplcFdGluSdR(i3,i1)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fu], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplChiFucSuL(gt1,i2,i1)
coup1R = cplChiFucSuR(gt1,i2,i1)
coup2L = cplcFuGluSuL(i3,i1)
coup2R = cplcFuGluSuR(i3,i1)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
    End Do
  End Do
End Do
End Do
End Subroutine Amplitude_VERTEX_BLSSM_ChiToGluVG


Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToGluVG(MChi,MFd,MFu,MGlu,MSd,MSu,            & 
& MVG,MChi2,MFd2,MFu2,MGlu2,MSd2,MSu2,MVG2,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplSdcSdVG,            & 
& cplSucSuVG,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(7),MFd(3),MFu(3),MGlu,MSd(6),MSu(6),MVG,MChi2(7),MFd2(3),MFu2(3),MGlu2,          & 
& MSd2(6),MSu2(6),MVG2

Complex(dp), Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),      & 
& cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplGluFucSuL(3,6),& 
& cplGluFucSuR(3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),& 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplSdcSdVG(6,6),cplSucSuVG(6,6)

Complex(dp), Intent(out) :: Amp(4,7) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,7
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MChi(gt1) 
Mex2 = MGlu 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_BLSSM_ChiToGluVG



End Module OneLoopDecay_Chi_BLSSM
