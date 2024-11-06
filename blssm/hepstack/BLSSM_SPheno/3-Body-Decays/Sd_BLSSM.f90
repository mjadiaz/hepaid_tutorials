! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:53 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Sd3Decays_BLSSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_BLSSM 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine SdThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,      & 
& gSdSdChacCha,gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,     & 
& gSdFuFdcSu,gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,      & 
& gSdFuFeSvIm,gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,       & 
& gSdSdFecFe,gSdSdFvFv,gSdSuFeFv,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplAhSdcSd(4,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),     & 
& cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,7,2),      & 
& cplcChaChiHpmR(2,7,2),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFeSvImL(2,3,6), & 
& cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplcChaFvSeL(2,6,6), & 
& cplcChaFvSeR(2,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,7,6),       & 
& cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),          & 
& cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdGluSdL(3,6),            & 
& cplcFdGluSdR(3,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFeFeAhL(3,3,4),          & 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFuChiSuL(3,7,6),              & 
& cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),           & 
& cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),   & 
& cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVZL(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),           & 
& cplChiChiVZR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),         & 
& cplChiFecSeR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),cplChiFvSvImL(7,6,6),      & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvFecHpmL(6,3,2),    & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZpL(6,6),& 
& cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),& 
& cplGluFucSuR(3,6),cplhhSdcSd(4,6,6),cplHpmSucSd(2,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),& 
& cplSucSdVWm(6,6)

Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: gSdAhChaFu(6,4,2,3),gSdAhChiFd(6,4,7,3),gSdAhFdGlu(6,4,3,1),gSdSuChaChi(6,6,2,7),     & 
& gSdChaFdcHpm(6,2,3,2),gSdhhChaFu(6,4,2,3),gSdChaGluSu(6,2,1,6),gSdSdChacCha(6,6,2,2),  & 
& gSdSdChiChi(6,6,7,7),gSdhhChiFd(6,4,7,3),gSdHpmChiFu(6,2,7,3),gSdChiGluSd(6,7,1,6),    & 
& gSdFdFdcSd(6,3,3,6),gSdFdFecSe(6,3,3,6),gSdFuFdcSu(6,3,3,6),gSdFdFvSvIm(6,3,6,6),      & 
& gSdFdFvSvRe(6,3,6,6),gSdHpmFdcCha(6,2,3,2),gSdSdFdcFd(6,6,3,3),gSdFdSecFe(6,3,6,3),    & 
& gSdSuFdcFu(6,6,3,3),gSdFuFeSvIm(6,3,3,6),gSdFuFeSvRe(6,3,3,6),gSdFuFvSe(6,3,6,6),      & 
& gSdSdFucFu(6,6,3,3),gSdhhFdGlu(6,4,3,1),gSdHpmFuGlu(6,2,3,1),gSdGluGluSd(6,1,1,6),     & 
& gSdSdFecFe(6,6,3,3),gSdSdFvFv(6,6,6,6),gSdSuFeFv(6,6,3,6)

Real(dp) :: gSdAhChaFui(4,2,3),gSdAhChiFdi(4,7,3),gSdAhFdGlui(4,3,1),gSdSuChaChii(6,2,7),         & 
& gSdChaFdcHpmi(2,3,2),gSdhhChaFui(4,2,3),gSdChaGluSui(2,1,6),gSdSdChacChai(6,2,2),      & 
& gSdSdChiChii(6,7,7),gSdhhChiFdi(4,7,3),gSdHpmChiFui(2,7,3),gSdChiGluSdi(7,1,6),        & 
& gSdFdFdcSdi(3,3,6),gSdFdFecSei(3,3,6),gSdFuFdcSui(3,3,6),gSdFdFvSvImi(3,6,6),          & 
& gSdFdFvSvRei(3,6,6),gSdHpmFdcChai(2,3,2),gSdSdFdcFdi(6,3,3),gSdFdSecFei(3,6,3),        & 
& gSdSuFdcFui(6,3,3),gSdFuFeSvImi(3,3,6),gSdFuFeSvRei(3,3,6),gSdFuFvSei(3,6,6),          & 
& gSdSdFucFui(6,3,3),gSdhhFdGlui(4,3,1),gSdHpmFuGlui(2,3,1),gSdGluGluSdi(1,1,6),         & 
& gSdSdFecFei(6,3,3),gSdSdFvFvi(6,6,6),gSdSuFeFvi(6,3,6)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'SdThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 6 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 6) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,6) = ',n_in,6 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Sd_decays_3B(MSd(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,             & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,              & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,cplAhSdcSd,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFdcSuL,cplcChaFdcSuR,               & 
& cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,              & 
& cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChiSeL,          & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,      & 
& cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,          & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,        & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhSdcSd,cplHpmSucSd,            & 
& cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,deltaM)


 
gSdAhChaFui = 0._dp 
Call SdToAhChaFu(i_run,MAh,MCha,MFu,MSd,cplAhSdcSd,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplcFuFuAhL,cplcFuFuAhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdAhChaFui)

gSdAhChaFu(i_run,:,:,:) = gSdAhChaFui 
gT(i_run) = gT(i_run) + Sum(gSdAhChaFui) 
 
gSdAhChiFdi = 0._dp 
Call SdToAhChiFd(i_run,MAh,MChi,MFd,MSd,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,gSdAhChiFdi)

gSdAhChiFd(i_run,:,:,:) = gSdAhChiFdi 
gT(i_run) = gT(i_run) + Sum(gSdAhChiFdi) 
 
gSdAhFdGlui = 0._dp 
Call SdToAhFdGlu(i_run,MAh,MFd,MGlu,MSd,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,gSdAhFdGlui)

gSdAhFdGlu(i_run,:,:,:) = gSdAhFdGlui 
gT(i_run) = gT(i_run) + Sum(gSdAhFdGlui) 
 
gSdSuChaChii = 0._dp 
Call SdToSuChaChi(i_run,MSu,MCha,MChi,MVWm,MHpm,MFu,MFd,MSd,cplHpmSucSd,              & 
& cplSucSdVWm,cplcFdChaSuL,cplcFdChaSuR,cplcFuChiSuL,cplcFuChiSuR,cplChaFucSdL,          & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,gSdSuChaChii)

gSdSuChaChi(i_run,:,:,:) = gSdSuChaChii 
gT(i_run) = gT(i_run) + Sum(gSdSuChaChii) 
 
gSdChaFdcHpmi = 0._dp 
Call SdToChaFdcHpm(i_run,MCha,MFd,MHpm,MFu,MChi,MSd,cplcFuFdcHpmL,cplcFuFdcHpmR,      & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,     & 
& deltaM,epsI,check,gSdChaFdcHpmi)

gSdChaFdcHpm(i_run,:,:,:) = gSdChaFdcHpmi 
gT(i_run) = gT(i_run) + Sum(gSdChaFdcHpmi) 
 
gSdhhChaFui = 0._dp 
Call SdTohhChaFu(i_run,Mhh,MCha,MFu,MSd,cplhhSdcSd,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdhhChaFui)

gSdhhChaFu(i_run,:,:,:) = gSdhhChaFui 
gT(i_run) = gT(i_run) + Sum(gSdhhChaFui) 
 
gSdChaGluSui = 0._dp 
Call SdToChaGluSu(i_run,MCha,MGlu,MSu,MFu,MFd,MSd,cplcFdChaSuL,cplcFdChaSuR,          & 
& cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& deltaM,epsI,check,gSdChaGluSui)

gSdChaGluSu(i_run,:,:,:) = gSdChaGluSui 
gT(i_run) = gT(i_run) + Sum(gSdChaGluSui) 
 
gSdSdChacChai = 0._dp 
Call SdToSdChacCha(i_run,MSd,MCha,MVZ,MVZp,MAh,Mhh,MFu,cplAhSdcSd,cplhhSdcSd,         & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdSdChacChai)

gSdSdChacCha(i_run,:,:,:) = gSdSdChacChai 
gT(i_run) = gT(i_run) + Sum(gSdSdChacChai) 
 
gSdSdChiChii = 0._dp 
Call SdToSdChiChi(i_run,MSd,MChi,MVZ,MVZp,MAh,Mhh,MFd,cplAhSdcSd,cplhhSdcSd,          & 
& cplSdcSdVZ,cplSdcSdVZp,cplcFdChiSdL,cplcFdChiSdR,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,gSdSdChiChii)

gSdSdChiChi(i_run,:,:,:) = gSdSdChiChii 
gT(i_run) = gT(i_run) + Sum(gSdSdChiChii) 
 
gSdhhChiFdi = 0._dp 
Call SdTohhChiFd(i_run,Mhh,MChi,MFd,MSd,cplhhSdcSd,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,gSdhhChiFdi)

gSdhhChiFd(i_run,:,:,:) = gSdhhChiFdi 
gT(i_run) = gT(i_run) + Sum(gSdhhChiFdi) 
 
gSdHpmChiFui = 0._dp 
Call SdToHpmChiFu(i_run,MHpm,MChi,MFu,MSu,MFd,MCha,MSd,cplHpmSucSd,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,       & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,gSdHpmChiFui)

gSdHpmChiFu(i_run,:,:,:) = gSdHpmChiFui 
gT(i_run) = gT(i_run) + Sum(gSdHpmChiFui) 
 
gSdChiGluSdi = 0._dp 
Call SdToChiGluSd(i_run,MChi,MGlu,MSd,MFd,cplcFdChiSdL,cplcFdChiSdR,cplcFdGluSdL,     & 
& cplcFdGluSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,deltaM,               & 
& epsI,check,gSdChiGluSdi)

gSdChiGluSd(i_run,:,:,:) = gSdChiGluSdi 
gT(i_run) = gT(i_run) + Sum(gSdChiGluSdi) 
 
gSdFdFdcSdi = 0._dp 
Call SdToFdFdcSd(i_run,MFd,MSd,MChi,MGlu,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,      & 
& cplGluFdcSdR,deltaM,epsI,check,gSdFdFdcSdi)

gSdFdFdcSd(i_run,:,:,:) = gSdFdFdcSdi 
gT(i_run) = gT(i_run) + Sum(gSdFdFdcSdi) 
 
gSdFdFecSei = 0._dp 
Call SdToFdFecSe(i_run,MFd,MFe,MSe,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,   & 
& cplChiFecSeR,deltaM,epsI,check,gSdFdFecSei)

gSdFdFecSe(i_run,:,:,:) = gSdFdFecSei 
gT(i_run) = gT(i_run) + Sum(gSdFdFecSei) 
 
gSdFuFdcSui = 0._dp 
Call SdToFuFdcSu(i_run,MFu,MFd,MSu,MCha,MChi,MGlu,MSd,cplcChaFdcSuL,cplcChaFdcSuR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,epsI,check,gSdFuFdcSui)

gSdFuFdcSu(i_run,:,:,:) = gSdFuFdcSui 
gT(i_run) = gT(i_run) + Sum(gSdFuFdcSui) 
 
gSdFdFvSvImi = 0._dp 
Call SdToFdFvSvIm(i_run,MFd,MFv,MSvIm,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,             & 
& cplChiFvSvImL,cplChiFvSvImR,deltaM,epsI,check,gSdFdFvSvImi)

gSdFdFvSvIm(i_run,:,:,:) = gSdFdFvSvImi 
gT(i_run) = gT(i_run) + Sum(gSdFdFvSvImi) 
 
gSdFdFvSvRei = 0._dp 
Call SdToFdFvSvRe(i_run,MFd,MFv,MSvRe,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,             & 
& cplChiFvSvReL,cplChiFvSvReR,deltaM,epsI,check,gSdFdFvSvRei)

gSdFdFvSvRe(i_run,:,:,:) = gSdFdFvSvRei 
gT(i_run) = gT(i_run) + Sum(gSdFdFvSvRei) 
 
gSdHpmFdcChai = 0._dp 
Call SdToHpmFdcCha(i_run,MHpm,MFd,MCha,MSu,MChi,MSd,cplHpmSucSd,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcChaFdcSuL,cplcChaFdcSuR,cplChiFdcSdL,cplChiFdcSdR,deltaM,           & 
& epsI,check,gSdHpmFdcChai)

gSdHpmFdcCha(i_run,:,:,:) = gSdHpmFdcChai 
gT(i_run) = gT(i_run) + Sum(gSdHpmFdcChai) 
 
gSdSdFdcFdi = 0._dp 
Call SdToSdFdcFd(i_run,MSd,MFd,MVZ,MVZp,MAh,Mhh,MChi,MGlu,cplAhSdcSd,cplhhSdcSd,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& deltaM,epsI,check,gSdSdFdcFdi)

gSdSdFdcFd(i_run,:,:,:) = gSdSdFdcFdi 
gT(i_run) = gT(i_run) + Sum(gSdSdFdcFdi) 
 
gSdFdSecFei = 0._dp 
Call SdToFdSecFe(i_run,MFd,MSe,MFe,MChi,MSd,cplcFeChiSeL,cplcFeChiSeR,cplChiFdcSdL,   & 
& cplChiFdcSdR,deltaM,epsI,check,gSdFdSecFei)

gSdFdSecFe(i_run,:,:,:) = gSdFdSecFei 
gT(i_run) = gT(i_run) + Sum(gSdFdSecFei) 
 
gSdSuFdcFui = 0._dp 
Call SdToSuFdcFu(i_run,MSu,MFd,MFu,MVWm,MHpm,MChi,MGlu,MSd,cplHpmSucSd,               & 
& cplSucSdVWm,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuGluSuL,cplcFuGluSuR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,        & 
& cplGluFdcSdR,deltaM,epsI,check,gSdSuFdcFui)

gSdSuFdcFu(i_run,:,:,:) = gSdSuFdcFui 
gT(i_run) = gT(i_run) + Sum(gSdSuFdcFui) 
 
gSdFuFeSvImi = 0._dp 
Call SdToFuFeSvIm(i_run,MFu,MFe,MSvIm,MCha,MSd,cplcChaFeSvImL,cplcChaFeSvImR,         & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdFuFeSvImi)

gSdFuFeSvIm(i_run,:,:,:) = gSdFuFeSvImi 
gT(i_run) = gT(i_run) + Sum(gSdFuFeSvImi) 
 
gSdFuFeSvRei = 0._dp 
Call SdToFuFeSvRe(i_run,MFu,MFe,MSvRe,MCha,MSd,cplcChaFeSvReL,cplcChaFeSvReR,         & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdFuFeSvRei)

gSdFuFeSvRe(i_run,:,:,:) = gSdFuFeSvRei 
gT(i_run) = gT(i_run) + Sum(gSdFuFeSvRei) 
 
gSdFuFvSei = 0._dp 
Call SdToFuFvSe(i_run,MFu,MFv,MSe,MCha,MSd,cplcChaFvSeL,cplcChaFvSeR,cplChaFucSdL,    & 
& cplChaFucSdR,deltaM,epsI,check,gSdFuFvSei)

gSdFuFvSe(i_run,:,:,:) = gSdFuFvSei 
gT(i_run) = gT(i_run) + Sum(gSdFuFvSei) 
 
gSdSdFucFui = 0._dp 
Call SdToSdFucFu(i_run,MSd,MFu,MVZ,MVZp,MAh,Mhh,MCha,cplAhSdcSd,cplhhSdcSd,           & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplcFuFuAhL,cplcFuFuAhR,            & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSdSdFucFui)

gSdSdFucFu(i_run,:,:,:) = gSdSdFucFui 
gT(i_run) = gT(i_run) + Sum(gSdSdFucFui) 
 
gSdhhFdGlui = 0._dp 
Call SdTohhFdGlu(i_run,Mhh,MFd,MGlu,MSd,cplhhSdcSd,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,gSdhhFdGlui)

gSdhhFdGlu(i_run,:,:,:) = gSdhhFdGlui 
gT(i_run) = gT(i_run) + Sum(gSdhhFdGlui) 
 
gSdHpmFuGlui = 0._dp 
Call SdToHpmFuGlu(i_run,MHpm,MFu,MGlu,MSu,MFd,MSd,cplHpmSucSd,cplcFdFuHpmL,           & 
& cplcFdFuHpmR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,               & 
& epsI,check,gSdHpmFuGlui)

gSdHpmFuGlu(i_run,:,:,:) = gSdHpmFuGlui 
gT(i_run) = gT(i_run) + Sum(gSdHpmFuGlui) 
 
gSdGluGluSdi = 0._dp 
Call SdToGluGluSd(i_run,MGlu,MSd,MFd,cplcFdGluSdL,cplcFdGluSdR,cplGluFdcSdL,          & 
& cplGluFdcSdR,deltaM,epsI,check,gSdGluGluSdi)

gSdGluGluSd(i_run,:,:,:) = gSdGluGluSdi 
gT(i_run) = gT(i_run) + Sum(gSdGluGluSdi) 
 
gSdSdFecFei = 0._dp 
Call SdToSdFecFe(i_run,MSd,MFe,MVZ,MVZp,MAh,Mhh,cplAhSdcSd,cplhhSdcSd,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,gSdSdFecFei)

gSdSdFecFe(i_run,:,:,:) = gSdSdFecFei 
gT(i_run) = gT(i_run) + Sum(gSdSdFecFei) 
 
gSdSdFvFvi = 0._dp 
Call SdToSdFvFv(i_run,MSd,MFv,MVZ,MVZp,MAh,Mhh,cplAhSdcSd,cplhhSdcSd,cplSdcSdVZ,      & 
& cplSdcSdVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,         & 
& cplFvFvVZpL,cplFvFvVZpR,deltaM,epsI,check,gSdSdFvFvi)

gSdSdFvFv(i_run,:,:,:) = gSdSdFvFvi 
gT(i_run) = gT(i_run) + Sum(gSdSdFvFvi) 
 
gSdSuFeFvi = 0._dp 
Call SdToSuFeFv(i_run,MSu,MFe,MFv,MVWm,MHpm,MSd,cplHpmSucSd,cplSucSdVWm,              & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,deltaM,epsI,check,gSdSuFeFvi)

gSdSuFeFv(i_run,:,:,:) = gSdSuFeFvi 
gT(i_run) = gT(i_run) + Sum(gSdSuFeFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=3,4
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gSdAhChaFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,4
  Do gt2=1,7
    Do gt3=1,3
gPartial(i1,n_length)= gSdAhChiFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,4
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gSdAhFdGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,7
gPartial(i1,n_length)= gSdSuChaChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=2,2
gPartial(i1,n_length)= gSdChaFdcHpm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,4
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gSdhhChaFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,1
    Do gt3=1,6
gPartial(i1,n_length)= gSdChaGluSu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gSdSdChacCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=gt2,7
gPartial(i1,n_length)= gSdSdChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,4
  Do gt2=1,7
    Do gt3=1,3
gPartial(i1,n_length)= gSdhhChiFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,7
    Do gt3=1,3
gPartial(i1,n_length)= gSdHpmChiFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,7
  Do gt2=1,1
    Do gt3=1,6
gPartial(i1,n_length)= gSdChiGluSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdFdFdcSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdFdFecSe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdFuFdcSu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gSdFdFvSvIm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gSdFdFvSvRe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,2
gPartial(i1,n_length)= gSdHpmFdcCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSdSdFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gSdFdSecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSdSuFdcFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdFuFeSvIm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdFuFeSvRe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,6
gPartial(i1,n_length)= gSdFuFvSe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSdSdFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,4
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gSdhhFdGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gSdHpmFuGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=gt1,1
    Do gt3=1,6
gPartial(i1,n_length)= gSdGluGluSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSdSdFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gSdSdFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSdSuFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Iname = Iname - 1 
 
End Subroutine SdThreeBodyDecay
 
 
Subroutine SdToAhChaFu(iIN,MAh,MCha,MFu,MSd,cplAhSdcSd,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcFuFuAhL,cplcFuFuAhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MCha(2),MFu(3),MSd(6)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcFuFuAhL(3,3,4),       & 
& cplcFuFuAhR(3,3,4),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 121 
Allocate( gSum(4,2,3, Isum) ) 
Allocate( Contribution(4,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,4
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MSd(iIN))**2 
rm2 = (MFu(gt3)/MSd(iIN))**2 
rj2 = (MAh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFu(gt3))+Abs(MCha(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFuFuAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt3,iIN)) 
coup(4) = Conjg(cplcChaChaAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplAhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplChaFucSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChaFucSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fu 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFuFuAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFuFuAhR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Sd,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Fu'
        End Do 
      End Do 



!-------------- 
!  Sd, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChaFucSdL(i2,gt3,iIN) 
coup(2) = cplChaFucSdR(i2,gt3,iIN) 
coup(4) = Conjg(cplcChaChaAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(i2,gt2,gt1))  
coup(5) = cplAhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Sd,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Cha'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuFuAhL(i1,gt3,gt1) 
coup(4) = cplcFuFuAhR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(gt2,i2,iIN) 
coup(6) = cplChaFucSdR(gt2,i2,iIN)  
coup(7) = cplcFuFuAhL(i2,gt3,gt1) 
coup(8) = cplcFuFuAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Cha 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuFuAhL(i1,gt3,gt1) 
coup(4) = cplcFuFuAhR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChaAhL(i2,gt2,gt1) 
coup(8) = cplcChaChaAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Fu,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt3,iIN) 
coup(2) = cplChaFucSdR(i1,gt3,iIN) 
coup(3) = cplcChaChaAhL(i1,gt2,gt1) 
coup(4) = cplcChaChaAhR(i1,gt2,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChaAhL(i2,gt2,gt1) 
coup(8) = cplcChaChaAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Cha Fu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,4
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToAhChaFu 
 
 
Subroutine SdToAhChiFd(iIN,MAh,MChi,MFd,MSd,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MChi(7),MFd(3),MSd(6)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplChiChiAhL(7,7,4),          & 
& cplChiChiAhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 256 
Allocate( gSum(4,7,3, Isum) ) 
Allocate( Contribution(4,7,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,4
      Do gt2=1,7
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSd(iIN))**2 
rm2 = (MFd(gt3)/MSd(iIN))**2 
rj2 = (MAh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFd(gt3))+Abs(MChi(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFdFdAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChiAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplAhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFdcSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFdcSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Sd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Fd'
        End Do 
      End Do 



!-------------- 
!  Sd, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt3,iIN) 
coup(2) = cplChiFdcSdR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt2,gt1))  
coup(5) = cplAhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Sd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Chi'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFdAhL(i1,gt3,gt1) 
coup(4) = cplcFdFdAhR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt2,i2,iIN) 
coup(6) = cplChiFdcSdR(gt2,i2,iIN)  
coup(7) = cplcFdFdAhL(i2,gt3,gt1) 
coup(8) = cplcFdFdAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFdAhL(i1,gt3,gt1) 
coup(4) = cplcFdFdAhR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(i2,gt3,iIN) 
coup(6) = cplChiFdcSdR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Fd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt3,iIN) 
coup(2) = cplChiFdcSdR(i1,gt3,iIN) 
coup(3) = cplChiChiAhL(i1,gt2,gt1) 
coup(4) = cplChiChiAhR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(i2,gt3,iIN) 
coup(6) = cplChiFdcSdR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Chi Fd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,4
      Do gt2=1,7
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToAhChiFd 
 
 
Subroutine SdToAhFdGlu(iIN,MAh,MFd,MGlu,MSd,cplAhSdcSd,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MFd(3),MGlu,MSd(6)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplGluFdcSdL(3,6),            & 
& cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 81 
Allocate( gSum(4,3,1, Isum) ) 
Allocate( Contribution(4,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,4
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (MAh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MGlu)+Abs(MFd(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Fd Glu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Sd'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdFdAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Fd Glu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Fd'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplAhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))  
coup(4) = cplAhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplGluFdcSdL(gt2,i2)) 
coup(5) = Conjg(cplGluFdcSdR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Fd Glu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplGluFdcSdL(i2,iIN) 
coup(2) = cplGluFdcSdR(i2,iIN) 
coup(4) = Conjg(cplcFdFdAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdAhR(i2,gt2,gt1))  
coup(5) = cplAhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(6) = Conjg(cplGluFdcSdR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Fd Glu Propagator: Sd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdFdAhL(i1,gt2,gt1) 
coup(4) = cplcFdFdAhR(i1,gt2,gt1) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdFdAhL(i2,gt2,gt1) 
coup(8) = cplcFdFdAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Ah Fd Glu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=3,4
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:81))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
End Subroutine SdToAhFdGlu 
 
 
Subroutine SdToSuChaChi(iIN,MSu,MCha,MChi,MVWm,MHpm,MFu,MFd,MSd,cplHpmSucSd,          & 
& cplSucSdVWm,cplcFdChaSuL,cplcFdChaSuR,cplcFuChiSuL,cplcFuChiSuR,cplChaFucSdL,          & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MCha(2),MChi(7),MVWm,MHpm(2),MFu(3),MFd(3),MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplSucSdVWm(6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),          & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),   & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 81 
Allocate( gSum(6,2,7, Isum) ) 
Allocate( Contribution(6,2,7, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,7
Isum = 0 
 
rk2 = (MCha(gt2)/MSd(iIN))**2 
rm2 = (MChi(gt3)/MSd(iIN))**2 
rj2 = (MSu(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MChi(gt3))+Abs(MCha(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSucSdVWm(gt1,iIN)) 
coup(3) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(2) = Conjg(cplChiChacVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFuChiSuL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSucSdVWm(gt1,iIN) 
coup(2) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt2))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFu2(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFuChiSuL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(i2,gt3,gt1))  
coup(5) = cplSucSdVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: VWm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fu'
      End Do 



!-------------- 
!  VWm, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFd2(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChaSuL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(i2,gt2,gt1))  
coup(5) = cplSucSdVWm(gt1,iIN) 
coup(7) = Conjg(cplChiChacVWmL(gt3,gt2)) 
coup(6) = Conjg(cplChiChacVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: VWm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Fd'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplHpmSucSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChacHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplChiChacHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fu 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFuChiSuL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(i2,gt3,gt1))  
coup(5) = cplHpmSucSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Hpm,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fu'
        End Do 
      End Do 



!-------------- 
!  Hpm, Fd 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChaSuL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChaSuR(i2,gt2,gt1))  
coup(5) = cplHpmSucSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChacHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplChiChacHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Hpm,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Fd'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuChiSuL(i1,gt3,gt1) 
coup(4) = cplcFuChiSuR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(gt2,i2,iIN) 
coup(6) = cplChaFucSdR(gt2,i2,iIN)  
coup(7) = cplcFuChiSuL(i2,gt3,gt1) 
coup(8) = cplcFuChiSuR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuChiSuL(i1,gt3,gt1) 
coup(4) = cplcFuChiSuR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt3,i2,iIN) 
coup(6) = cplChiFdcSdR(gt3,i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt2,gt1) 
coup(8) = cplcFdChaSuR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Fu,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i1,iIN) 
coup(2) = cplChiFdcSdR(gt3,i1,iIN) 
coup(3) = cplcFdChaSuL(i1,gt2,gt1) 
coup(4) = cplcFdChaSuR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(gt3,i2,iIN) 
coup(6) = cplChiFdcSdR(gt3,i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt2,gt1) 
coup(8) = cplcFdChaSuR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Cha Chi Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,2
        Do gt3=1,7
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSuChaChi 
 
 
Subroutine SdToChaFdcHpm(iIN,MCha,MFd,MHpm,MFu,MChi,MSd,cplcFuFdcHpmL,cplcFuFdcHpmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiFdcSdL,cplChiFdcSdR,     & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFd(3),MHpm(2),MFu(3),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),    & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 100 
Allocate( gSum(2,3,2, Isum) ) 
Allocate( Contribution(2,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=2,2
Isum = 0 
 
rk2 = (MCha(gt1)/MSd(iIN))**2 
rm2 = (MFd(gt2)/MSd(iIN))**2 
rj2 = (MHpm(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MHpm(gt3))+Abs(MFd(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt1,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt1,i1,iIN)) 
coup(4) = Conjg(cplcFuFdcHpmL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcFuFdcHpmR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Fd cHpm Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiChacHpmR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Fd cHpm Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt1,i1,iIN) 
coup(2) = cplChaFucSdR(gt1,i1,iIN) 
coup(3) = cplcFuFdcHpmL(i1,gt2,gt3) 
coup(4) = cplcFuFdcHpmR(i1,gt2,gt3) 
coup(5) = cplChaFucSdL(gt1,i2,iIN) 
coup(6) = cplChaFucSdR(gt1,i2,iIN)  
coup(7) = cplcFuFdcHpmL(i2,gt2,gt3) 
coup(8) = cplcFuFdcHpmR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Fd cHpm Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChaFucSdL(gt1,i1,iIN) 
coup(2) = cplChaFucSdR(gt1,i1,iIN) 
coup(3) = cplcFuFdcHpmL(i1,gt2,gt3) 
coup(4) = cplcFuFdcHpmR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiChacHpmL(i2,gt1,gt3) 
coup(8) = cplChiChacHpmR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Fd cHpm Propagator: Fu,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiChacHpmL(i1,gt1,gt3) 
coup(4) = cplChiChacHpmR(i1,gt1,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiChacHpmL(i2,gt1,gt3) 
coup(8) = cplChiChacHpmR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Fd cHpm Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=2,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToChaFdcHpm 
 
 
Subroutine SdTohhChaFu(iIN,Mhh,MCha,MFu,MSd,cplhhSdcSd,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(4),MCha(2),MFu(3),MSd(6)

Complex(dp),Intent(in) :: cplhhSdcSd(4,6,6),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcFuFuhhL(3,3,4),       & 
& cplcFuFuhhR(3,3,4),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 121 
Allocate( gSum(4,2,3, Isum) ) 
Allocate( Contribution(4,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,4
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MSd(iIN))**2 
rm2 = (MFu(gt3)/MSd(iIN))**2 
rj2 = (Mhh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFu(gt3))+Abs(MCha(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFuFuhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt3,iIN)) 
coup(4) = Conjg(cplcChaChahhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplhhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplChaFucSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChaFucSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fu 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFuFuhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFuFuhhR(i2,gt3,gt1))  
coup(5) = cplhhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Sd,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Fu'
        End Do 
      End Do 



!-------------- 
!  Sd, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChaFucSdL(i2,gt3,iIN) 
coup(2) = cplChaFucSdR(i2,gt3,iIN) 
coup(4) = Conjg(cplcChaChahhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(i2,gt2,gt1))  
coup(5) = cplhhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChaFucSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFucSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Sd,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Cha'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuFuhhL(i1,gt3,gt1) 
coup(4) = cplcFuFuhhR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(gt2,i2,iIN) 
coup(6) = cplChaFucSdR(gt2,i2,iIN)  
coup(7) = cplcFuFuhhL(i2,gt3,gt1) 
coup(8) = cplcFuFuhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Cha 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcFuFuhhL(i1,gt3,gt1) 
coup(4) = cplcFuFuhhR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChahhL(i2,gt2,gt1) 
coup(8) = cplcChaChahhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Fu,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt3,iIN) 
coup(2) = cplChaFucSdR(i1,gt3,iIN) 
coup(3) = cplcChaChahhL(i1,gt2,gt1) 
coup(4) = cplcChaChahhR(i1,gt2,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChahhL(i2,gt2,gt1) 
coup(8) = cplcChaChahhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Cha Fu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,4
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdTohhChaFu 
 
 
Subroutine SdToChaGluSu(iIN,MCha,MGlu,MSu,MFu,MFd,MSd,cplcFdChaSuL,cplcFdChaSuR,      & 
& cplcFuGluSuL,cplcFuGluSuR,cplChaFucSdL,cplChaFucSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MGlu,MSu(6),MFu(3),MFd(3),MSd(6)

Complex(dp),Intent(in) :: cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),          & 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 36 
Allocate( gSum(2,1,6, Isum) ) 
Allocate( Contribution(2,1,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
        Do gt3=1,6
Isum = 0 
 
rk2 = (MCha(gt1)/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (MSu(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSu(gt3))+Abs(MGlu)+Abs(MCha(gt1)))) Then 
!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt1,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt1,i1,iIN)) 
coup(4) = Conjg(cplcFuGluSuL(i1,gt3)) 
coup(3) = Conjg(cplcFuGluSuR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Glu Su Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(i1,gt1,gt3)) 
coup(3) = Conjg(cplcFdChaSuR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Glu Su Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt1,i1,iIN) 
coup(2) = cplChaFucSdR(gt1,i1,iIN) 
coup(3) = cplcFuGluSuL(i1,gt3) 
coup(4) = cplcFuGluSuR(i1,gt3) 
coup(5) = cplChaFucSdL(gt1,i2,iIN) 
coup(6) = cplChaFucSdR(gt1,i2,iIN)  
coup(7) = cplcFuGluSuL(i2,gt3) 
coup(8) = cplcFuGluSuR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Glu Su Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChaFucSdL(gt1,i1,iIN) 
coup(2) = cplChaFucSdR(gt1,i1,iIN) 
coup(3) = cplcFuGluSuL(i1,gt3) 
coup(4) = cplcFuGluSuR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt1,gt3) 
coup(8) = cplcFdChaSuR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Glu Su Propagator: Fu,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fu,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdChaSuL(i1,gt1,gt3) 
coup(4) = cplcFdChaSuR(i1,gt1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdChaSuL(i2,gt1,gt3) 
coup(8) = cplcFdChaSuR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Cha Glu Su Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,2
        Do gt3=1,6
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:36))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
End Subroutine SdToChaGluSu 
 
 
Subroutine SdToSdChacCha(iIN,MSd,MCha,MVZ,MVZp,MAh,Mhh,MFu,cplAhSdcSd,cplhhSdcSd,     & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MCha(2),MVZ,MVZp,MAh(4),Mhh(4),MFu(3)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),& 
& cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),   & 
& cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),        & 
& cplcChaChaVZpR(2,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 169 
Allocate( gSum(6,2,2, Isum) ) 
Allocate( Contribution(6,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
rk2 = (MCha(gt2)/MSd(iIN))**2 
rm2 = (MCha(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fu 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFu(i1) 
mass(2) = MFu(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChacFuSdL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFu2(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(gt3,i2,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZ,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fu'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZpR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZpR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  VZp, Fu 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFu2(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(gt3,i2,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: VZp,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Fu'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Fu 
!-------------- 
Do i1=1,4
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(gt3,i2,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Ah,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fu'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fu 
!-------------- 
Do i1=1,4
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i2,iIN) 
coup(2) = cplChaFucSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(gt3,i2,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: hh,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fu'
        End Do 
      End Do 



!-------------- 
!  Fu, Fu 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFu(i1)  
mass(2) = MFu(i2)  
coup(1) = cplChaFucSdL(gt2,i1,iIN) 
coup(2) = cplChaFucSdR(gt2,i1,iIN) 
coup(3) = cplcChacFuSdL(gt3,i1,gt1) 
coup(4) = cplcChacFuSdR(gt3,i1,gt1) 
coup(5) = cplChaFucSdL(gt2,i2,iIN) 
coup(6) = cplChaFucSdR(gt2,i2,iIN)  
coup(7) = cplcChacFuSdL(gt3,i2,gt1) 
coup(8) = cplcChacFuSdR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Cha cCha Propagator: Fu,Fu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fu,Fu'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdChacCha 
 
 
Subroutine SdToSdChiChi(iIN,MSd,MChi,MVZ,MVZp,MAh,Mhh,MFd,cplAhSdcSd,cplhhSdcSd,      & 
& cplSdcSdVZ,cplSdcSdVZp,cplcFdChiSdL,cplcFdChiSdR,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MChi(7),MVZ,MVZp,MAh(4),Mhh(4),MFd(3)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcFdChiSdL(3,7,6),& 
& cplcFdChiSdR(3,7,6),cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),       & 
& cplChiChihhR(7,7,4),cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),            & 
& cplChiChiVZpR(7,7),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 169 
Allocate( gSum(6,7,7, Isum) ) 
Allocate( Contribution(6,7,7, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,7
        Do gt3=gt2,7
Isum = 0 
 
rk2 = (MChi(gt2)/MSd(iIN))**2 
rm2 = (MChi(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZpR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFd(i1)  
mass(2) = MFd(i1)  
coup(1) = cplChiFdcSdL(gt3,i1,iIN) 
coup(2) = cplChiFdcSdR(gt3,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt2,gt1) 
coup(4) = cplcFdChiSdR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(gt2,i1,iIN) 
coup(6) = cplChiFdcSdR(gt2,i1,iIN)  
coup(7) = cplcFdChiSdL(i1,gt3,gt1) 
coup(8) = cplcFdChiSdR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFd2(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt3,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZ2  
mass(1) = MFd2(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt2,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZ,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fd'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  VZp, Fd 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFd2(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt3,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZp2  
mass(1) = MFd2(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt2,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: VZp,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Fd'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Fd 
!-------------- 
Do i1=1,4
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MAh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt2,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Ah,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fd'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Fd 
!-------------- 
Do i1=1,4
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt3,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i2,iIN) 
coup(2) = cplChiFdcSdR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(i2,gt2,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: hh,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt3,gt1) 
coup(4) = cplcFdChiSdR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt2,i2,iIN) 
coup(6) = cplChiFdcSdR(gt2,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt3,gt1) 
coup(8) = cplcFdChiSdR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i1,iIN) 
coup(2) = cplChiFdcSdR(gt3,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt2,gt1) 
coup(4) = cplcFdChiSdR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(gt2,i2,iIN) 
coup(6) = cplChiFdcSdR(gt2,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt3,gt1) 
coup(8) = cplcFdChiSdR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt3,i1,iIN) 
coup(2) = cplChiFdcSdR(gt3,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt2,gt1) 
coup(4) = cplcFdChiSdR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(gt3,i2,iIN) 
coup(6) = cplChiFdcSdR(gt3,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt2,gt1) 
coup(8) = cplcFdChiSdR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt3,gt1) 
coup(4) = cplcFdChiSdR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt3,i2,iIN) 
coup(6) = cplChiFdcSdR(gt3,i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt2,gt1) 
coup(8) = cplcFdChiSdR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Chi Chi Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,7
        Do gt3=gt2,7
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdChiChi 
 
 
Subroutine SdTohhChiFd(iIN,Mhh,MChi,MFd,MSd,cplhhSdcSd,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(4),MChi(7),MFd(3),MSd(6)

Complex(dp),Intent(in) :: cplhhSdcSd(4,6,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplChiChihhL(7,7,4),          & 
& cplChiChihhR(7,7,4),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 256 
Allocate( gSum(4,7,3, Isum) ) 
Allocate( Contribution(4,7,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,4
      Do gt2=1,7
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSd(iIN))**2 
rm2 = (MFd(gt3)/MSd(iIN))**2 
rj2 = (Mhh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFd(gt3))+Abs(MChi(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFdFdhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChihhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplhhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFdcSdL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFdcSdR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i2,gt3,gt1))  
coup(5) = cplhhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Sd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Fd'
        End Do 
      End Do 



!-------------- 
!  Sd, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt3,iIN) 
coup(2) = cplChiFdcSdR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt2,gt1))  
coup(5) = cplhhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFdcSdL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFdcSdR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Sd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Chi'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFdhhL(i1,gt3,gt1) 
coup(4) = cplcFdFdhhR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt2,i2,iIN) 
coup(6) = cplChiFdcSdR(gt2,i2,iIN)  
coup(7) = cplcFdFdhhL(i2,gt3,gt1) 
coup(8) = cplcFdFdhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFdhhL(i1,gt3,gt1) 
coup(4) = cplcFdFdhhR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(i2,gt3,iIN) 
coup(6) = cplChiFdcSdR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Fd,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt3,iIN) 
coup(2) = cplChiFdcSdR(i1,gt3,iIN) 
coup(3) = cplChiChihhL(i1,gt2,gt1) 
coup(4) = cplChiChihhR(i1,gt2,gt1) 
coup(5) = cplChiFdcSdL(i2,gt3,iIN) 
coup(6) = cplChiFdcSdR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Chi Fd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,4
      Do gt2=1,7
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdTohhChiFd 
 
 
Subroutine SdToHpmChiFu(iIN,MHpm,MChi,MFu,MSu,MFd,MCha,MSd,cplHpmSucSd,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplChaFucSdL,cplChaFucSdR,     & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MChi(7),MFu(3),MSu(6),MFd(3),MCha(2),MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcFdFuHpmL(3,3,2),   & 
& cplcFdFuHpmR(3,3,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(7,3,6),       & 
& cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 121 
Allocate( gSum(2,7,3, Isum) ) 
Allocate( Contribution(2,7,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,7
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSd(iIN))**2 
rm2 = (MFu(gt3)/MSd(iIN))**2 
rj2 = (MHpm(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFu(gt3))+Abs(MChi(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  Su 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFucSuR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Su'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFdFuHpmL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt3,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Su, Su 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplHpmSucSd(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
coup(4) = cplHpmSucSd(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFucSuL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFucSuR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Su,Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Su'
        End Do 
      End Do 



!-------------- 
!  Su, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i2,iIN) 
coup(2) = cplChiFdcSdR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i2,gt3,gt1))  
coup(5) = cplHpmSucSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Su,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Fd'
        End Do 
      End Do 



!-------------- 
!  Su, Cha 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChaFucSdL(i2,gt3,iIN) 
coup(2) = cplChaFucSdR(i2,gt3,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(i2,gt2,gt1))  
coup(5) = cplHpmSucSd(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFucSuL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFucSuR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Su,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Cha'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFuHpmL(i1,gt3,gt1) 
coup(4) = cplcFdFuHpmR(i1,gt3,gt1) 
coup(5) = cplChiFdcSdL(gt2,i2,iIN) 
coup(6) = cplChiFdcSdR(gt2,i2,iIN)  
coup(7) = cplcFdFuHpmL(i2,gt3,gt1) 
coup(8) = cplcFdFuHpmR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Cha 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiFdcSdL(gt2,i1,iIN) 
coup(2) = cplChiFdcSdR(gt2,i1,iIN) 
coup(3) = cplcFdFuHpmL(i1,gt3,gt1) 
coup(4) = cplcFdFuHpmR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt2,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Fd,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fd,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt3,iIN) 
coup(2) = cplChaFucSdR(i1,gt3,iIN) 
coup(3) = cplcChaChiHpmL(i1,gt2,gt1) 
coup(4) = cplcChaChiHpmR(i1,gt2,gt1) 
coup(5) = cplChaFucSdL(i2,gt3,iIN) 
coup(6) = cplChaFucSdR(i2,gt3,iIN)  
coup(7) = cplcChaChiHpmL(i2,gt2,gt1) 
coup(8) = cplcChaChiHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Chi Fu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,2
      Do gt2=1,7
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToHpmChiFu 
 
 
Subroutine SdToChiGluSd(iIN,MChi,MGlu,MSd,MFd,cplcFdChiSdL,cplcFdChiSdR,              & 
& cplcFdGluSdL,cplcFdGluSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(7),MGlu,MSd(6),MFd(3)

Complex(dp),Intent(in) :: cplcFdChiSdL(3,7,6),cplcFdChiSdR(3,7,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),          & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 36 
Allocate( gSum(7,1,6, Isum) ) 
Allocate( Contribution(7,1,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,7
        Do gt3=1, iIN-1
Isum = 0 
 
rk2 = (MChi(gt1)/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (MSd(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSd(gt3))+Abs(MGlu)+Abs(MChi(gt1)))) Then 
!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(gt1,i1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(gt1,i1,iIN)) 
coup(4) = Conjg(cplcFdGluSdL(i1,gt3)) 
coup(3) = Conjg(cplcFdGluSdR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Chi Glu Sd Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(i1,gt1,gt3)) 
coup(3) = Conjg(cplcFdChiSdR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Chi Glu Sd Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt1,i1,iIN) 
coup(2) = cplChiFdcSdR(gt1,i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplChiFdcSdL(gt1,i2,iIN) 
coup(6) = cplChiFdcSdR(gt1,i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt3) 
coup(8) = cplcFdGluSdR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Chi Glu Sd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplChiFdcSdL(gt1,i1,iIN) 
coup(2) = cplChiFdcSdR(gt1,i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt1,gt3) 
coup(8) = cplcFdChiSdR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Chi Glu Sd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdChiSdL(i1,gt1,gt3) 
coup(4) = cplcFdChiSdR(i1,gt1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdChiSdL(i2,gt1,gt3) 
coup(8) = cplcFdChiSdR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Chi Glu Sd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,7
        Do gt3=1, iIN-1
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:36))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
End Subroutine SdToChiGluSd 
 
 
Subroutine SdToFdFdcSd(iIN,MFd,MSd,MChi,MGlu,cplChiFdcSdL,cplChiFdcSdR,               & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MSd(6),MChi(7),MGlu

Complex(dp),Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFd(gt1)/MSd(iIN))**2 
rm2 = (MFd(gt2)/MSd(iIN))**2 
rj2 = (MSd(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSd(gt3))+Abs(MFd(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFdcSdR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiFdcSdR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1)  
mass(2) = MChi(i1)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplChiFdcSdL(i1,gt1,iIN) 
coup(6) = cplChiFdcSdR(i1,gt1,iIN)  
coup(7) = cplChiFdcSdL(i1,gt2,gt3) 
coup(8) = cplChiFdcSdR(i1,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fd cSd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Glu 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MGlu 
mass(2) = MGlu 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(gt1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(gt1,iIN)) 
coup(4) = Conjg(cplGluFdcSdL(gt2,gt3)) 
coup(3) = Conjg(cplGluFdcSdR(gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp/3._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MGlu 
mass(2) = MGlu 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(gt2,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(gt2,iIN)) 
coup(4) = Conjg(cplGluFdcSdL(gt1,gt3)) 
coup(3) = Conjg(cplGluFdcSdR(gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp/3._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MGlu  
mass(2) = MGlu  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(3) = cplGluFdcSdL(gt1,gt3) 
coup(4) = cplGluFdcSdR(gt1,gt3) 
coup(5) = cplGluFdcSdL(gt1,iIN) 
coup(6) = cplGluFdcSdR(gt1,iIN)  
coup(7) = cplGluFdcSdL(gt2,gt3) 
coup(8) = cplGluFdcSdR(gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 2._dp/3._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fd cSd Propagator: Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Glu'



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFdcSdL(i1,gt2,gt3) 
coup(4) = cplChiFdcSdR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplChiFdcSdL(i2,gt2,gt3) 
coup(8) = cplChiFdcSdR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplChiFdcSdL(i2,gt2,gt3) 
coup(8) = cplChiFdcSdR(i2,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt1,gt3) 
coup(8) = cplChiFdcSdR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFdcSdL(i1,gt2,gt3) 
coup(4) = cplChiFdcSdR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiFdcSdL(i2,gt1,gt3) 
coup(8) = cplChiFdcSdR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fd cSd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Glu 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFdcSdL(i1,gt2,gt3) 
coup(4) = cplChiFdcSdR(i1,gt2,gt3) 
coup(5) = cplGluFdcSdL(gt1,iIN) 
coup(6) = cplGluFdcSdR(gt1,iIN)  
coup(7) = cplGluFdcSdL(gt2,gt3) 
coup(8) = cplGluFdcSdR(gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplGluFdcSdL(gt1,iIN) 
coup(6) = cplGluFdcSdR(gt1,iIN)  
coup(7) = cplGluFdcSdL(gt2,gt3) 
coup(8) = cplGluFdcSdR(gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFdcSdL(i1,gt1,gt3) 
coup(4) = cplChiFdcSdR(i1,gt1,gt3) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplGluFdcSdL(gt1,gt3) 
coup(8) = cplGluFdcSdR(gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFdcSdL(i1,gt2,gt3) 
coup(4) = cplChiFdcSdR(i1,gt2,gt3) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplGluFdcSdL(gt1,gt3) 
coup(8) = cplGluFdcSdR(gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fd cSd Propagator: Chi,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Glu'
        End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFdFdcSd 
 
 
Subroutine SdToFdFecSe(iIN,MFd,MFe,MSe,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,            & 
& cplChiFecSeL,cplChiFecSeR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MSe(6),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 49 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFd(gt1)/MSd(iIN))**2 
rm2 = (MFe(gt2)/MSd(iIN))**2 
rj2 = (MSe(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSe(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFecSeL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFecSeR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fe cSe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFecSeL(i1,gt2,gt3) 
coup(4) = cplChiFecSeR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplChiFecSeL(i2,gt2,gt3) 
coup(8) = cplChiFecSeR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fe cSe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFdFecSe 
 
 
Subroutine SdToFuFdcSu(iIN,MFu,MFd,MSu,MCha,MChi,MGlu,MSd,cplcChaFdcSuL,              & 
& cplcChaFdcSuR,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,        & 
& cplChiFucSuR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,               & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFd(3),MSu(6),MCha(2),MChi(7),MGlu,MSd(6)

Complex(dp),Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),    & 
& cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFucSuL(7,3,6),cplChiFucSuR(7,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFu(gt1)/MSd(iIN))**2 
rm2 = (MFd(gt2)/MSd(iIN))**2 
rj2 = (MSu(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSu(gt3))+Abs(MFd(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcChaFdcSuL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcChaFdcSuR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFucSuL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiFucSuR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Glu 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MGlu 
mass(2) = MGlu 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(gt2,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(gt2,iIN)) 
coup(4) = Conjg(cplGluFucSuL(gt1,gt3)) 
coup(3) = Conjg(cplGluFucSuR(gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Glu'



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFdcSuL(i1,gt2,gt3) 
coup(4) = cplcChaFdcSuR(i1,gt2,gt3) 
coup(5) = cplChaFucSdL(i2,gt1,iIN) 
coup(6) = cplChaFucSdR(i2,gt1,iIN)  
coup(7) = cplcChaFdcSuL(i2,gt2,gt3) 
coup(8) = cplcChaFdcSuR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFdcSuL(i1,gt2,gt3) 
coup(4) = cplcChaFdcSuR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiFucSuL(i2,gt1,gt3) 
coup(8) = cplChiFucSuR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Cha,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Chi'
        End Do 
      End Do 



!-------------- 
!  Cha, Glu 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MGlu  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFdcSuL(i1,gt2,gt3) 
coup(4) = cplcChaFdcSuR(i1,gt2,gt3) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplGluFucSuL(gt1,gt3) 
coup(8) = cplGluFucSuR(gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Cha,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Glu'
        End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFucSuL(i1,gt1,gt3) 
coup(4) = cplChiFucSuR(i1,gt1,gt3) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplChiFucSuL(i2,gt1,gt3) 
coup(8) = cplChiFucSuR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Glu 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplChiFucSuL(i1,gt1,gt3) 
coup(4) = cplChiFucSuR(i1,gt1,gt3) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplGluFucSuL(gt1,gt3) 
coup(8) = cplGluFucSuR(gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fd cSu Propagator: Chi,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Glu'
        End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFuFdcSu 
 
 
Subroutine SdToFdFvSvIm(iIN,MFd,MFv,MSvIm,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFvSvImL,cplChiFvSvImR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(6),MSvIm(6),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 49 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFd(gt1)/MSd(iIN))**2 
rm2 = (MFv(gt2)/MSd(iIN))**2 
rj2 = (MSvIm(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSvIm(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFvSvImL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFvSvImR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fv SvIm Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFvSvImL(i1,gt2,gt3) 
coup(4) = cplChiFvSvImR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplChiFvSvImL(i2,gt2,gt3) 
coup(8) = cplChiFvSvImR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fv SvIm Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFdFvSvIm 
 
 
Subroutine SdToFdFvSvRe(iIN,MFd,MFv,MSvRe,MChi,MSd,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFvSvReL,cplChiFvSvReR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(6),MSvRe(6),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 49 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFd(gt1)/MSd(iIN))**2 
rm2 = (MFv(gt2)/MSd(iIN))**2 
rj2 = (MSvRe(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSvRe(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFvSvReL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFvSvReR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fv SvRe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplChiFvSvReL(i1,gt2,gt3) 
coup(4) = cplChiFvSvReR(i1,gt2,gt3) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplChiFvSvReL(i2,gt2,gt3) 
coup(8) = cplChiFvSvReR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Fv SvRe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFdFvSvRe 
 
 
Subroutine SdToHpmFdcCha(iIN,MHpm,MFd,MCha,MSu,MChi,MSd,cplHpmSucSd,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaFdcSuL,cplcChaFdcSuR,cplChiFdcSdL,cplChiFdcSdR,deltaM,           & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFd(3),MCha(2),MSu(6),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaFdcSuL(2,3,6),  & 
& cplcChaFdcSuR(2,3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 169 
Allocate( gSum(2,3,2, Isum) ) 
Allocate( Contribution(2,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,3
        Do gt3=1,2
Isum = 0 
 
rk2 = (MFd(gt2)/MSd(iIN))**2 
rm2 = (MCha(gt3)/MSd(iIN))**2 
rj2 = (MHpm(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MCha(gt3))+Abs(MFd(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  Su 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaFdcSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFdcSuR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fd cCha Propagator: Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Su'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fd cCha Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Su, Su 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplHpmSucSd(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFdcSuL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFdcSuR(gt3,gt2,i1))  
coup(4) = cplHpmSucSd(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFdcSuL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFdcSuR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fd cCha Propagator: Su,Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Su'
        End Do 
      End Do 



!-------------- 
!  Su, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChiHpmL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChiHpmR(gt3,i2,gt1))  
coup(5) = cplHpmSucSd(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFdcSuL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFdcSuR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fd cCha Propagator: Su,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Su,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplcChaChiHpmL(gt3,i1,gt1) 
coup(4) = cplcChaChiHpmR(gt3,i1,gt1) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplcChaChiHpmL(gt3,i2,gt1) 
coup(8) = cplcChaChiHpmR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fd cCha Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,2
      Do gt2=1,3
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:169))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToHpmFdcCha 
 
 
Subroutine SdToSdFdcFd(iIN,MSd,MFd,MVZ,MVZp,MAh,Mhh,MChi,MGlu,cplAhSdcSd,             & 
& cplhhSdcSd,cplSdcSdVZ,cplSdcSdVZp,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,               & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdGluSdL,cplcFdGluSdR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MFd(3),MVZ,MVZp,MAh(4),Mhh(4),MChi(7),MGlu

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcFdChiSdL(3,7,6),& 
& cplcFdChiSdR(3,7,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),          & 
& cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),& 
& cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),           & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 324 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSd(iIN))**2 
rm2 = (MFd(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Glu 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MGlu 
mass(2) = MGlu 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(gt2,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(gt2,iIN)) 
coup(4) = Conjg(cplcFdGluSdL(gt3,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Glu'



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Chi 
!-------------- 
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i2,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Chi'
      End Do 



!-------------- 
!  VZ, Glu 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MGlu2  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFdGluSdL(gt3,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(gt3,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 4._dp/3._dp*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZ,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Glu'



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZpR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZpR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  VZp, Chi 
!-------------- 
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i2,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZp,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Chi'
      End Do 



!-------------- 
!  VZp, Glu 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MGlu2  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFdGluSdL(gt3,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(gt3,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 4._dp/3._dp*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: VZp,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Glu'



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Chi 
!-------------- 
Do i1=1,4
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i2,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Ah,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Chi'
        End Do 
      End Do 



!-------------- 
!  Ah, Glu 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MGlu  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFdGluSdL(gt3,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(gt3,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Ah,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Glu'
        End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Chi 
!-------------- 
Do i1=1,4
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i2,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: hh,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Chi'
        End Do 
      End Do 



!-------------- 
!  hh, Glu 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MGlu  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFdGluSdL(gt3,gt1)) 
coup(3) = Conjg(cplcFdGluSdR(gt3,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: hh,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Glu'
        End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplcFdChiSdL(gt3,i1,gt1) 
coup(4) = cplcFdChiSdR(gt3,i1,gt1) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplcFdChiSdL(gt3,i2,gt1) 
coup(8) = cplcFdChiSdR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Glu 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplcFdChiSdL(gt3,i1,gt1) 
coup(4) = cplcFdChiSdR(gt3,i1,gt1) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplcFdGluSdL(gt3,gt1) 
coup(8) = cplcFdGluSdR(gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fd cFd Propagator: Chi,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Glu'
        End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:324))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdFdcFd 
 
 
Subroutine SdToFdSecFe(iIN,MFd,MSe,MFe,MChi,MSd,cplcFeChiSeL,cplcFeChiSeR,            & 
& cplChiFdcSdL,cplChiFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MSe(6),MFe(3),MChi(7),MSd(6)

Complex(dp),Intent(in) :: cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 49 
Allocate( gSum(3,6,3, Isum) ) 
Allocate( Contribution(3,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt1)/MSd(iIN))**2 
rm2 = (MFe(gt3)/MSd(iIN))**2 
rj2 = (MSe(gt2)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFe(gt3))+Abs(MSe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i1,gt2)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Se cFe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt1,iIN) 
coup(2) = cplChiFdcSdR(i1,gt1,iIN) 
coup(3) = cplcFeChiSeL(gt3,i1,gt2) 
coup(4) = cplcFeChiSeR(gt3,i1,gt2) 
coup(5) = cplChiFdcSdL(i2,gt1,iIN) 
coup(6) = cplChiFdcSdR(i2,gt1,iIN)  
coup(7) = cplcFeChiSeL(gt3,i2,gt2) 
coup(8) = cplcFeChiSeR(gt3,i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fd Se cFe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:49))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFdSecFe 
 
 
Subroutine SdToSuFdcFu(iIN,MSu,MFd,MFu,MVWm,MHpm,MChi,MGlu,MSd,cplHpmSucSd,           & 
& cplSucSdVWm,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,       & 
& cplcFuFdcVWmR,cplcFuGluSuL,cplcFuGluSuR,cplChiFdcSdL,cplChiFdcSdR,cplGluFdcSdL,        & 
& cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MFd(3),MFu(3),MVWm,MHpm(2),MChi(7),MGlu,MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplSucSdVWm(6,6),cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),          & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6),           & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 121 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSd(iIN))**2 
rm2 = (MFu(gt3)/MSd(iIN))**2 
rj2 = (MSu(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSucSdVWm(gt1,iIN)) 
coup(3) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFdcVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChiFdcSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFdcSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFuChiSuL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Glu 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MGlu 
mass(2) = MGlu 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(gt2,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(gt2,iIN)) 
coup(4) = Conjg(cplcFuGluSuL(gt3,gt1)) 
coup(3) = Conjg(cplcFuGluSuR(gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Glu'



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSucSdVWm(gt1,iIN) 
coup(2) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Chi 
!-------------- 
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuChiSuL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(gt3,i2,gt1))  
coup(5) = cplSucSdVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: VWm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Chi'
      End Do 



!-------------- 
!  VWm, Glu 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MGlu2  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFuGluSuL(gt3,gt1)) 
coup(3) = Conjg(cplcFuGluSuR(gt3,gt1))  
coup(5) = cplSucSdVWm(gt1,iIN) 
coup(7) = Conjg(cplcFuFdcVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFdcVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 4._dp/3._dp*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: VWm,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Glu'



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplHpmSucSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFdcHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFdcHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Chi 
!-------------- 
Do i1=1,2
  Do i2=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFdcSdL(i2,gt2,iIN) 
coup(2) = cplChiFdcSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFuChiSuL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFuChiSuR(gt3,i2,gt1))  
coup(5) = cplHpmSucSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Hpm,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Chi'
        End Do 
      End Do 



!-------------- 
!  Hpm, Glu 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MGlu  
coup(1) = cplGluFdcSdL(gt2,iIN) 
coup(2) = cplGluFdcSdR(gt2,iIN) 
coup(4) = Conjg(cplcFuGluSuL(gt3,gt1)) 
coup(3) = Conjg(cplcFuGluSuR(gt3,gt1))  
coup(5) = cplHpmSucSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFdcHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFdcHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Hpm,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Glu'
        End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,6
  Do i2=i1+1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplcFuChiSuL(gt3,i1,gt1) 
coup(4) = cplcFuChiSuR(gt3,i1,gt1) 
coup(5) = cplChiFdcSdL(i2,gt2,iIN) 
coup(6) = cplChiFdcSdR(i2,gt2,iIN)  
coup(7) = cplcFuChiSuL(gt3,i2,gt1) 
coup(8) = cplcFuChiSuR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Glu 
!-------------- 
Do i1=1,7
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MGlu  
coup(1) = cplChiFdcSdL(i1,gt2,iIN) 
coup(2) = cplChiFdcSdR(i1,gt2,iIN) 
coup(3) = cplcFuChiSuL(gt3,i1,gt1) 
coup(4) = cplcFuChiSuR(gt3,i1,gt1) 
coup(5) = cplGluFdcSdL(gt2,iIN) 
coup(6) = cplGluFdcSdR(gt2,iIN)  
coup(7) = cplcFuGluSuL(gt3,gt1) 
coup(8) = cplcFuGluSuR(gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 0*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fd cFu Propagator: Chi,Glu" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Glu'
        End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSuFdcFu 
 
 
Subroutine SdToFuFeSvIm(iIN,MFu,MFe,MSvIm,MCha,MSd,cplcChaFeSvImL,cplcChaFeSvImR,     & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MSvIm(6),MCha(2),MSd(6)

Complex(dp),Intent(in) :: cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFu(gt1)/MSd(iIN))**2 
rm2 = (MFe(gt2)/MSd(iIN))**2 
rj2 = (MSvIm(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSvIm(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcChaFeSvImL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcChaFeSvImR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fe SvIm Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFeSvImL(i1,gt2,gt3) 
coup(4) = cplcChaFeSvImR(i1,gt2,gt3) 
coup(5) = cplChaFucSdL(i2,gt1,iIN) 
coup(6) = cplChaFucSdR(i2,gt1,iIN)  
coup(7) = cplcChaFeSvImL(i2,gt2,gt3) 
coup(8) = cplcChaFeSvImR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fe SvIm Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFuFeSvIm 
 
 
Subroutine SdToFuFeSvRe(iIN,MFu,MFe,MSvRe,MCha,MSd,cplcChaFeSvReL,cplcChaFeSvReR,     & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MSvRe(6),MCha(2),MSd(6)

Complex(dp),Intent(in) :: cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFu(gt1)/MSd(iIN))**2 
rm2 = (MFe(gt2)/MSd(iIN))**2 
rj2 = (MSvRe(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSvRe(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcChaFeSvReL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcChaFeSvReR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fe SvRe Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFeSvReL(i1,gt2,gt3) 
coup(4) = cplcChaFeSvReR(i1,gt2,gt3) 
coup(5) = cplChaFucSdL(i2,gt1,iIN) 
coup(6) = cplChaFucSdR(i2,gt1,iIN)  
coup(7) = cplcChaFeSvReL(i2,gt2,gt3) 
coup(8) = cplcChaFeSvReR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fe SvRe Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFuFeSvRe 
 
 
Subroutine SdToFuFvSe(iIN,MFu,MFv,MSe,MCha,MSd,cplcChaFvSeL,cplcChaFvSeR,             & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(6),MSe(6),MCha(2),MSd(6)

Complex(dp),Intent(in) :: cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 4 
Allocate( gSum(3,6,6, Isum) ) 
Allocate( Contribution(3,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFu(gt1)/MSd(iIN))**2 
rm2 = (MFv(gt2)/MSd(iIN))**2 
rj2 = (MSe(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSe(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcChaFvSeL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcChaFvSeR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fv Se Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt1,iIN) 
coup(2) = cplChaFucSdR(i1,gt1,iIN) 
coup(3) = cplcChaFvSeL(i1,gt2,gt3) 
coup(4) = cplcChaFvSeR(i1,gt2,gt3) 
coup(5) = cplChaFucSdL(i2,gt1,iIN) 
coup(6) = cplChaFucSdR(i2,gt1,iIN)  
coup(7) = cplcChaFvSeL(i2,gt2,gt3) 
coup(8) = cplcChaFvSeR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Fu Fv Se Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToFuFvSe 
 
 
Subroutine SdToSdFucFu(iIN,MSd,MFu,MVZ,MVZp,MAh,Mhh,MCha,cplAhSdcSd,cplhhSdcSd,       & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplcFuFuAhL,cplcFuFuAhR,            & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MFu(3),MVZ,MVZp,MAh(4),Mhh(4),MCha(2)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),& 
& cplcChacFuSdR(2,3,6),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),         & 
& cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),& 
& cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 144 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MSd(iIN))**2 
rm2 = (MFu(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  Cha 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplChaFucSdL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChaFucSdR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChacFuSdL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZ, Cha 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MCha2(i2)  
coup(1) = cplChaFucSdL(i2,gt2,iIN) 
coup(2) = cplChaFucSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i2,gt3,gt1))  
coup(5) = cplSdcSdVZ(gt1,iIN) 
coup(7) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZ,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Cha'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZpR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZpR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  VZp, Cha 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MCha2(i2)  
coup(1) = cplChaFucSdL(i2,gt2,iIN) 
coup(2) = cplChaFucSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i2,gt3,gt1))  
coup(5) = cplSdcSdVZp(gt1,iIN) 
coup(7) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: VZp,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Cha'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Cha 
!-------------- 
Do i1=1,4
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChaFucSdL(i2,gt2,iIN) 
coup(2) = cplChaFucSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i2,gt3,gt1))  
coup(5) = cplAhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Ah,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Cha'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



!-------------- 
!  hh, Cha 
!-------------- 
Do i1=1,4
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplChaFucSdL(i2,gt2,iIN) 
coup(2) = cplChaFucSdR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChacFuSdL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcChacFuSdR(i2,gt3,gt1))  
coup(5) = cplhhSdcSd(i1,gt1,iIN) 
coup(7) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: hh,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Cha'
        End Do 
      End Do 



!-------------- 
!  Cha, Cha 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChaFucSdL(i1,gt2,iIN) 
coup(2) = cplChaFucSdR(i1,gt2,iIN) 
coup(3) = cplcChacFuSdL(i1,gt3,gt1) 
coup(4) = cplcChacFuSdR(i1,gt3,gt1) 
coup(5) = cplChaFucSdL(i2,gt2,iIN) 
coup(6) = cplChaFucSdR(i2,gt2,iIN)  
coup(7) = cplcChacFuSdL(i2,gt3,gt1) 
coup(8) = cplcChacFuSdR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fu cFu Propagator: Cha,Cha" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Cha,Cha'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdFucFu 
 
 
Subroutine SdTohhFdGlu(iIN,Mhh,MFd,MGlu,MSd,cplhhSdcSd,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplGluFdcSdL,cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(4),MFd(3),MGlu,MSd(6)

Complex(dp),Intent(in) :: cplhhSdcSd(4,6,6),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplGluFdcSdL(3,6),            & 
& cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 81 
Allocate( gSum(4,3,1, Isum) ) 
Allocate( Contribution(4,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,4
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (Mhh(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MGlu)+Abs(MFd(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSd(i1) 
mass(2) = MSd(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Fd Glu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Sd'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdFdhhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Fd Glu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Fd'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSd(i1)  
mass(2) = MSd(i2)  
coup(1) = cplhhSdcSd(gt1,i1,iIN) 
coup(3) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(2) = Conjg(cplGluFdcSdR(gt2,i1))  
coup(4) = cplhhSdcSd(gt1,i2,iIN) 
coup(6) = Conjg(cplGluFdcSdL(gt2,i2)) 
coup(5) = Conjg(cplGluFdcSdR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Fd Glu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSd(i1)  
mass(1) = MFd(i2)  
coup(1) = cplGluFdcSdL(i2,iIN) 
coup(2) = cplGluFdcSdR(i2,iIN) 
coup(4) = Conjg(cplcFdFdhhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(i2,gt2,gt1))  
coup(5) = cplhhSdcSd(gt1,i1,iIN) 
coup(7) = Conjg(cplGluFdcSdL(gt2,i1)) 
coup(6) = Conjg(cplGluFdcSdR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Fd Glu Propagator: Sd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdFdhhL(i1,gt2,gt1) 
coup(4) = cplcFdFdhhR(i1,gt2,gt1) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdFdhhL(i2,gt2,gt1) 
coup(8) = cplcFdFdhhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->hh Fd Glu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,4
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:81))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
End Subroutine SdTohhFdGlu 
 
 
Subroutine SdToHpmFuGlu(iIN,MHpm,MFu,MGlu,MSu,MFd,MSd,cplHpmSucSd,cplcFdFuHpmL,       & 
& cplcFdFuHpmR,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM,               & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MFu(3),MGlu,MSu(6),MFd(3),MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplGluFdcSdL(3,6),         & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 81 
Allocate( gSum(2,3,1, Isum) ) 
Allocate( Contribution(2,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (MHpm(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MGlu)+Abs(MFu(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  Su 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSu(i1) 
mass(2) = MSu(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(gt1,i1,iIN)) 
coup(3) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(2) = Conjg(cplGluFucSuR(gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fu Glu Propagator: Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Su'
      End Do 



!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdFuHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fu Glu Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Fd'
      End Do 



!-------------- 
!  Su, Su 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSu(i1)  
mass(2) = MSu(i2)  
coup(1) = cplHpmSucSd(gt1,i1,iIN) 
coup(3) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(2) = Conjg(cplGluFucSuR(gt2,i1))  
coup(4) = cplHpmSucSd(gt1,i2,iIN) 
coup(6) = Conjg(cplGluFucSuL(gt2,i2)) 
coup(5) = Conjg(cplGluFucSuR(gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fu Glu Propagator: Su,Su" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Su,Su'
        End Do 
      End Do 



!-------------- 
!  Su, Fd 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSu(i1)  
mass(1) = MFd(i2)  
coup(1) = cplGluFdcSdL(i2,iIN) 
coup(2) = cplGluFdcSdR(i2,iIN) 
coup(4) = Conjg(cplcFdFuHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFdFuHpmR(i2,gt2,gt1))  
coup(5) = cplHpmSucSd(gt1,i1,iIN) 
coup(7) = Conjg(cplGluFucSuL(gt2,i1)) 
coup(6) = Conjg(cplGluFucSuR(gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fu Glu Propagator: Su,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Su,Fd'
        End Do 
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdFuHpmL(i1,gt2,gt1) 
coup(4) = cplcFdFuHpmR(i1,gt2,gt1) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdFuHpmL(i2,gt2,gt1) 
coup(8) = cplcFdFuHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 4._dp/3._dp*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Hpm Fu Glu Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=2,2
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:81))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
End Subroutine SdToHpmFuGlu 
 
 
Subroutine SdToGluGluSd(iIN,MGlu,MSd,MFd,cplcFdGluSdL,cplcFdGluSdR,cplGluFdcSdL,      & 
& cplGluFdcSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MGlu,MSd(6),MFd(3)

Complex(dp),Intent(in) :: cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 9 
Allocate( gSum(1,1,6, Isum) ) 
Allocate( Contribution(1,1,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
        Do gt3=1, iIN-1
Isum = 0 
 
rk2 = (MGlu/MSd(iIN))**2 
rm2 = (MGlu/MSd(iIN))**2 
rj2 = (MSd(gt3)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MSd(gt3))+Abs(MGlu)+Abs(MGlu))) Then 
!-------------- 
!  Fd 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdGluSdL(i1,gt3)) 
coup(3) = Conjg(cplcFdGluSdR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFd(i1) 
mass(2) = MFd(i1) 
m_in = MSd(iIN) 
coup(2) = Conjg(cplGluFdcSdL(i1,iIN)) 
coup(1) = Conjg(cplGluFdcSdR(i1,iIN)) 
coup(4) = Conjg(cplcFdGluSdL(i1,gt3)) 
coup(3) = Conjg(cplcFdGluSdR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFd(i1)  
mass(2) = MFd(i1)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i1,iIN) 
coup(6) = cplGluFdcSdR(i1,iIN)  
coup(7) = cplcFdGluSdL(i1,gt3) 
coup(8) = cplcFdGluSdR(i1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Glu Glu Sd Propagator: Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp
Else 
gSum(1,1,gt3,Isum)=resD
End If 
Contribution(1,1,gt3,Isum)='Fd'
      End Do 



!-------------- 
!  Fd, Fd 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt3) 
coup(8) = cplcFdGluSdR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt3) 
coup(8) = cplcFdGluSdR(i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt3) 
coup(8) = cplcFdGluSdR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFd(i1)  
mass(2) = MFd(i2)  
coup(1) = cplGluFdcSdL(i1,iIN) 
coup(2) = cplGluFdcSdR(i1,iIN) 
coup(3) = cplcFdGluSdL(i1,gt3) 
coup(4) = cplcFdGluSdR(i1,gt3) 
coup(5) = cplGluFdcSdL(i2,iIN) 
coup(6) = cplGluFdcSdR(i2,iIN)  
coup(7) = cplcFdGluSdL(i2,gt3) 
coup(8) = cplcFdGluSdR(i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 16._dp/9._dp*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Glu Glu Sd Propagator: Fd,Fd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp  
Else 
gSum(1,1,gt3,Isum)= resS  
End If 
Contribution(1,1,gt3,Isum)='Fd,Fd'
        End Do 
      End Do 



Else 
gSum(1,1,gt3,:)= 0._dp  
End If 
       End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
        Do gt3=1, iIN-1
g(1,1,gt3)=Sum(gSum(1,1,gt3,1:9))
If (g(1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,1,gt3)=0._dp
End If
       End Do 
End Subroutine SdToGluGluSd 
 
 
Subroutine SdToSdFecFe(iIN,MSd,MFe,MVZ,MVZp,MAh,Mhh,cplAhSdcSd,cplhhSdcSd,            & 
& cplSdcSdVZ,cplSdcSdVZp,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,    & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MFe(3),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcFeFeAhL(3,3,4),& 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 100 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MSd(iIN))**2 
rm2 = (MFe(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZpR(gt3,gt2))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZpR(gt3,gt2))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fe cFe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdFecFe 
 
 
Subroutine SdToSdFvFv(iIN,MSd,MFv,MVZ,MVZp,MAh,Mhh,cplAhSdcSd,cplhhSdcSd,             & 
& cplSdcSdVZ,cplSdcSdVZp,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,         & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSd(6),MFv(6),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplAhSdcSd(4,6,6),cplhhSdcSd(4,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplFvFvAhL(6,6,4),& 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 100 
Allocate( gSum(6,6,6, Isum) ) 
Allocate( Contribution(6,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
rk2 = (MFv(gt2)/MSd(iIN))**2 
rm2 = (MFv(gt3)/MSd(iIN))**2 
rj2 = (MSd(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MSd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZ(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSdcSdVZp(gt1,iIN)) 
coup(3) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZpR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplAhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhSdcSd(i1,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplhhSdcSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt3,gt2,i1))  
coup(4) = cplhhSdcSd(i1,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(3) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(2) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplSdcSdVZp(gt1,iIN) 
coup(5) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(6) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZ(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSdcSdVZp(gt1,iIN) 
coup(2) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplAhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvAhR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSdcSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvFvhhR(gt2,gt3,i1))  
coup(4) = cplhhSdcSd(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvFvhhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Sd Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSdFvFv 
 
 
Subroutine SdToSuFeFv(iIN,MSu,MFe,MFv,MVWm,MHpm,MSd,cplHpmSucSd,cplSucSdVWm,          & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSu(6),MFe(3),MFv(6),MVWm,MHpm(2),MSd(6)

Complex(dp),Intent(in) :: cplHpmSucSd(2,6,6),cplSucSdVWm(6,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),          & 
& cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSd(iIN) 
 
Isum = 9 
Allocate( gSum(6,3,6, Isum) ) 
Allocate( Contribution(6,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFe(gt2)/MSd(iIN))**2 
rm2 = (MFv(gt3)/MSd(iIN))**2 
rj2 = (MSu(gt1)/MSd(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSd(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MSu(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSd(iIN) 
coup(1) = Conjg(cplSucSdVWm(gt1,iIN)) 
coup(3) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(2) = Conjg(cplFvFecVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fe Fv Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSd(iIN) 
coup(1) = Conjg(cplHpmSucSd(i1,gt1,iIN)) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fe Fv Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSucSdVWm(gt1,iIN) 
coup(2) = Conjg(cplFvFecVWmL(gt3,gt2)) 
coup(3) = Conjg(cplFvFecVWmR(gt3,gt2))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(5) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fe Fv Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplHpmSucSd(i1,gt1,iIN) 
coup(3) = Conjg(cplFvFecHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplFvFecHpmR(gt3,gt2,i1))  
coup(4) = cplHpmSucSd(i2,gt1,iIN) 
coup(6) = Conjg(cplFvFecHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplFvFecHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sd->Su Fe Fv Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SdToSuFeFv 
 
 
End Module Sd3Decays_BLSSM 
 
