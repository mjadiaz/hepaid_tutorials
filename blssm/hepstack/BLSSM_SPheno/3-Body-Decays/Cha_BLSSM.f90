! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:52 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Cha3Decays_BLSSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_BLSSM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine ChaThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gTAh,gThh,gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChaChacChaCha,          & 
& gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,         & 
& gChaChiFvFe,gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),  & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),      & 
& cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),    & 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),       & 
& cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeChaSvImL(3,2,6),& 
& cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeFeAhL(3,3,4),  & 
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
& cplChiFecSeR(7,3,6),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),    & 
& cplChiFvSvReR(7,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),      & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZpL(6,6),& 
& cplFvFvVZpR(6,6),cplFvFvVZR(6,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: gChaChacChaCha(2,2,2,2),gChaChaChiChi(2,2,7,7),gChaChacFdFd(2,2,3,3),gChaChacFeFe(2,2,3,3),& 
& gChaChacFuFu(2,2,3,3),gChaChaFvFv(2,2,6,6),gChaChicFuFd(2,7,3,3),gChaChiFvFe(2,7,6,3), & 
& gChaFdcFuGlu(2,3,3,1),gChaFecChaFe(2,3,2,3)

Real(dp),Intent(in) :: gTAh(4),gThh(4),gTHpm(2),gTSd(6),gTSe(6),gTSu(6),gTSvIm(6),gTSvRe(6),gTVWm,           & 
& gTVZ,gTVZp

Real(dp) :: gChaChacChaChai(2,2,2),gChaChaChiChii(2,7,7),gChaChacFdFdi(2,3,3),gChaChacFeFei(2,3,3),& 
& gChaChacFuFui(2,3,3),gChaChaFvFvi(2,6,6),gChaChicFuFdi(7,3,3),gChaChiFvFei(7,6,3),     & 
& gChaFdcFuGlui(3,3,1),gChaFecChaFei(3,2,3)

Real(dp) :: gTAhtemp(4),gThhtemp(4),gTHpmtemp(2),gTSdtemp(6),gTSetemp(6),gTSutemp(6)              & 
& ,gTSvImtemp(6),gTSvRetemp(6),gTVWmtemp,gTVZtemp,gTVZptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'ChaThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTAhtemp = 0._dp 
gThhtemp = 0._dp 
gTHpmtemp = 0._dp 
gTSdtemp = 0._dp 
gTSetemp = 0._dp 
gTSutemp = 0._dp 
gTSvImtemp = 0._dp 
gTSvRetemp = 0._dp 
gTVWmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZptemp = 0._dp 
Else 
gTAhtemp = gTAh 
gThhtemp = gThh 
gTHpmtemp = gTHpm 
gTSdtemp = gTSd 
gTSetemp = gTSe 
gTSutemp = gTSu 
gTSvImtemp = gTSvIm 
gTSvRetemp = gTSvRe 
gTVWmtemp = gTVWm 
gTVZtemp = gTVZ 
gTVZptemp = gTVZp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 2 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 2) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,2) = ',n_in,2 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Cha_decays_3B(MCha(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,              & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,              & 
& cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,        & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,        & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplChaFucSdL,cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,     & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,cplFvFvVZpR,cplFvFvVZR,cplGluFdcSdL,      & 
& cplGluFdcSdR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gChaChacChaChai = 0._dp 
Call ChaToChacChaCha(i_run,MCha,MVZ,MVZp,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,        & 
& gTVZptemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacChaChai)

gChaChacChaCha(i_run,:,:,:) = gChaChacChaChai 
gT(i_run) = gT(i_run) + Sum(gChaChacChaChai) 
 
gChaChaChiChii = 0._dp 
Call ChaToChaChiChi(i_run,MCha,MChi,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,            & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZtemp,gTVZptemp,gTVWmtemp,gTHpmtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gChaChaChiChii)

gChaChaChiChi(i_run,:,:,:) = gChaChaChiChii 
gT(i_run) = gT(i_run) + Sum(gChaChaChiChii) 
 
gChaChacFdFdi = 0._dp 
Call ChaToChacFdFd(i_run,MCha,MFd,MVZ,MVZp,MSu,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSutemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFdFdi)

gChaChacFdFd(i_run,:,:,:) = gChaChacFdFdi 
gT(i_run) = gT(i_run) + Sum(gChaChacFdFdi) 
 
gChaChacFeFei = 0._dp 
Call ChaToChacFeFe(i_run,MCha,MFe,MVZ,MVZp,MAh,Mhh,MSvIm,MSvRe,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,            & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,              & 
& gTVZptemp,gTAhtemp,gThhtemp,gTSvImtemp,gTSvRetemp,deltaM,epsI,check,gChaChacFeFei)

gChaChacFeFe(i_run,:,:,:) = gChaChacFeFei 
gT(i_run) = gT(i_run) + Sum(gChaChacFeFei) 
 
gChaChacFuFui = 0._dp 
Call ChaToChacFuFu(i_run,MCha,MFu,MVZ,MVZp,MSd,MAh,Mhh,cplcChacFuSdL,cplcChacFuSdR,   & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplChaFucSdL,cplChaFucSdR,           & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSdtemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFuFui)

gChaChacFuFu(i_run,:,:,:) = gChaChacFuFui 
gT(i_run) = gT(i_run) + Sum(gChaChacFuFui) 
 
gChaChaFvFvi = 0._dp 
Call ChaToChaFvFv(i_run,MCha,MFv,MVZ,MVZp,MSe,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,    & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaFvSeL,cplcChaFvSeR,cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,        & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSetemp,gTAhtemp,            & 
& gThhtemp,deltaM,epsI,check,gChaChaFvFvi)

gChaChaFvFv(i_run,:,:,:) = gChaChaFvFvi 
gT(i_run) = gT(i_run) + Sum(gChaChaFvFvi) 
 
gChaChicFuFdi = 0._dp 
Call ChaToChicFuFd(i_run,MChi,MFu,MFd,MVWm,MHpm,MSu,MSd,MCha,cplcChacFuSdL,           & 
& cplcChacFuSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiFdcSdL,cplChiFdcSdR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWmtemp,gTHpmtemp,gTSutemp,gTSdtemp,deltaM,              & 
& epsI,check,gChaChicFuFdi)

gChaChicFuFd(i_run,:,:,:) = gChaChicFuFdi 
gT(i_run) = gT(i_run) + Sum(gChaChicFuFdi) 
 
gChaChiFvFei = 0._dp 
Call ChaToChiFvFe(i_run,MChi,MFv,MFe,MVWm,MHpm,MSe,MSvIm,MSvRe,MCha,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,cplcChaFeSvImR,            & 
& cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplChiFecSeL,cplChiFecSeR,     & 
& cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWmL,cplFvFecVWmR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,             & 
& IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& gTVWmtemp,gTHpmtemp,gTSetemp,gTSvImtemp,gTSvRetemp,deltaM,epsI,check,gChaChiFvFei)

gChaChiFvFe(i_run,:,:,:) = gChaChiFvFei 
gT(i_run) = gT(i_run) + Sum(gChaChiFvFei) 
 
gChaFdcFuGlui = 0._dp 
Call ChaToFdcFuGlu(i_run,MFd,MFu,MGlu,MSu,MSd,MCha,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuGluSuL,cplcFuGluSuR,cplGluFdcSdL,cplGluFdcSdR,       & 
& IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTSutemp,gTSdtemp,deltaM,         & 
& epsI,check,gChaFdcFuGlui)

gChaFdcFuGlu(i_run,:,:,:) = gChaFdcFuGlui 
gT(i_run) = gT(i_run) + Sum(gChaFdcFuGlui) 
 
gChaFecChaFei = 0._dp 
Call ChaToFecChaFe(i_run,MFe,MCha,MSvIm,MSvRe,cplcChaFeSvImL,cplcChaFeSvImR,          & 
& cplcChaFeSvReL,cplcChaFeSvReR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,          & 
& NSSst,gTSvImtemp,gTSvRetemp,deltaM,epsI,check,gChaFecChaFei)

gChaFecChaFe(i_run,:,:,:) = gChaFecChaFei 
gT(i_run) = gT(i_run) + Sum(gChaFecChaFei) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,2
  Do gt2=1,2
    Do gt3=gt1,2
gPartial(i1,n_length)= gChaChacChaCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,7
    Do gt3=gt2,7
gPartial(i1,n_length)= gChaChaChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gChaChaFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,7
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChicFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,7
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gChaChiFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gChaFdcFuGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=gt1,3
gPartial(i1,n_length)= gChaFecChaFe(i1,gt1,gt2,gt3)
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
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine ChaThreeBodyDecay
 
 
Subroutine ChaToChacChaCha(iIN,MCha,MVZ,MVZp,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZp,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 100 
Allocate( gSum(2,2,2, Isum) ) 
Allocate( Contribution(2,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt3)) 
coup(4) = Conjg(cplcChaChaVZL(gt2,gt1)) 
coup(3) = Conjg(cplcChaChaVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt3)) 
coup(4) = Conjg(cplcChaChaVZpL(gt2,gt1)) 
coup(3) = Conjg(cplcChaChaVZpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp" 
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
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChaAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChaAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaChaAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaChaAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i1))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChahhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChahhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaChahhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaChahhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i1))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: hh" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt3,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt1,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt3,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChaChaVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,VZp" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,hh" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp,hh" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah,hh" 
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
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt3,i1) 
coup2(6) = cplcChaChahhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt3,i1) 
coup2(6) = cplcChaChahhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: hh,hh" 
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
      Do gt2=1,2
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacChaCha 
 
 
Subroutine ChaToChaChiChi(iIN,MCha,MChi,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,            & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZ,gTVZp,gTVWm,gTHpm,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MChi(7),MVZ,MVZp,MVWm,MHpm(2),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),   & 
& cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),   & 
& cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),       & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTVWm,gTHpm(2),gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 169 
Allocate( gSum(2,7,7, Isum) ) 
Allocate( Contribution(2,7,7, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,7
        Do gt3=gt2,7
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZR(gt1,iIN))  
coup2(5) = cplChiChiVZL(gt3,gt2) 
coup2(6) = cplChiChiVZR(gt3,gt2) 
coup2(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplChiChiVZpL(gt3,gt2) 
coup2(6) = cplChiChiVZpR(gt3,gt2) 
coup2(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt2)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt2)) 
coup(4) = Conjg(cplChiChacVWmL(gt3,gt1)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt3)) 
coup(4) = Conjg(cplChiChacVWmL(gt2,gt1)) 
coup(3) = Conjg(cplChiChacVWmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm" 
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
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiChacHpmL(gt3,gt1,i1)) 
coup(3) = Conjg(cplChiChacHpmR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplChiChacHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplChiChacHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i1)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i1) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm" 
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
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i1))  
coup2(5) = cplChiChiAhL(gt3,gt2,i1) 
coup2(6) = cplChiChiAhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChihhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChihhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i1))  
coup2(5) = cplChiChihhL(gt3,gt2,i1) 
coup2(6) = cplChiChihhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: hh" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, VWm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt3) 
coup2(3) = cplcChaChiVWmR(iIN,gt3)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt2,gt1) 
coup2(7) = cplChiChacVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWm'



!-------------- 
!  VZ, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hpm'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,hh" 
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
!  VZp, VWm 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt3) 
coup2(3) = cplcChaChiVWmR(iIN,gt3)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt2,gt1) 
coup2(7) = cplChiChacVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,VWm'



!-------------- 
!  VZp, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Hpm'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,hh" 
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
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt2) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,Hpm" 
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
!  VWm, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Ah'
      End Do 



!-------------- 
!  VWm, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,hh'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt2) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,Hpm" 
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
!  Hpm, Ah 
!-------------- 
Do i1=1,2
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Ah'
        End Do 
      End Do 



!-------------- 
!  Hpm, hh 
!-------------- 
Do i1=1,2
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah,hh" 
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
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChihhL(gt2,gt3,i1) 
coup2(6) = cplChiChihhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChaChiChi 
 
 
Subroutine ChaToChacFdFd(iIN,MCha,MFd,MVZ,MVZp,MSu,MAh,Mhh,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSu,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFd(3),MVZ,MVZp,MSu(6),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSu(6),gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 256 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdChaSuL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdChaSuR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: hh" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Su]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,hh" 
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
!  VZp, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[Su]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,hh" 
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
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Ah 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Su], hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah,hh" 
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
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFdFd 
 
 
Subroutine ChaToChacFeFe(iIN,MCha,MFe,MVZ,MVZp,MAh,Mhh,MSvIm,MSvRe,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFeSvImL,cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,            & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTAh,gThh,gTSvIm,gTSvRe,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFe(3),MVZ,MVZp,MAh(4),Mhh(4),MSvIm(6),MSvRe(6)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(4),gThh(4),gTSvIm(6),gTSvRe(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 484 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp" 
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
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh" 
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
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvIm(i1) 
Boson2(2) =gTSvIm(i1) 
 
Boson4(1) = MSvIm(i1) 
Boson4(2) =gTSvIm(i1) 
Boson4(3) = MSvIm(i1) 
Boson4(4) =gTSvIm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFeSvImL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvImR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeChaSvImL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeChaSvImR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvRe(i1) 
Boson2(2) =gTSvRe(i1) 
 
Boson4(1) = MSvRe(i1) 
Boson4(2) =gTSvRe(i1) 
Boson4(3) = MSvRe(i1) 
Boson4(4) =gTSvRe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFeSvReL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvReR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeChaSvReL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeChaSvReR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,VZp" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,hh" 
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
!  VZ, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplcFeChaSvImL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvImR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,SvIm'
      End Do 



!-------------- 
!  VZ, SvRe 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,SvRe'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,hh" 
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
!  VZp, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplcFeChaSvImL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvImR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,SvIm'
      End Do 



!-------------- 
!  VZp, SvRe 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,SvRe'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,hh" 
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
!  Ah, SvIm 
!-------------- 
Do i1=1,4
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvImL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvImR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,SvIm'
        End Do 
      End Do 



!-------------- 
!  Ah, SvRe 
!-------------- 
Do i1=1,4
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,SvRe'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh,hh" 
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
!  hh, SvIm 
!-------------- 
Do i1=1,4
  Do i2=1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvImL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvImR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,SvIm'
        End Do 
      End Do 



!-------------- 
!  hh, SvRe 
!-------------- 
Do i1=1,4
  Do i2=1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcFeChaSvImL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvImR(gt2,gt1,i1) 
coup2(8) = cplcFeChaSvImL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvImR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeChaSvImL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvImR(gt2,gt1,i1) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvRe(i1) 
Boson4(2) = gTSvRe(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcFeChaSvReL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvReR(gt2,gt1,i1) 
coup2(8) = cplcFeChaSvReL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvReR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:484))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFeFe 
 
 
Subroutine ChaToChacFuFu(iIN,MCha,MFu,MVZ,MVZp,MSd,MAh,Mhh,cplcChacFuSdL,             & 
& cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplChaFucSdL,            & 
& cplChaFucSdR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSd,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFu(3),MVZ,MVZp,MSd(6),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),  & 
& cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),         & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSd(6),gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 256 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MFu(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChaFucSdL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChaFucSdR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd" 
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
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: hh" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Sd'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,hh" 
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
!  VZp, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Sd'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,hh" 
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
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MFu(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,Sd" 
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
!  Sd, Ah 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFu(gt2) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Ah'
        End Do 
      End Do 



!-------------- 
!  Sd, hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFu(gt2) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah,hh" 
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
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFuFu 
 
 
Subroutine ChaToChaFvFv(iIN,MCha,MFv,MVZ,MVZp,MSe,MAh,Mhh,cplcChaChaAhL,              & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFvSeL,cplcChaFvSeR,cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,         & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,gTSe,gTAh,               & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFv(6),MVZ,MVZp,MSe(6),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6),       & 
& cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSe(6),gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 256 
Allocate( gSum(2,6,6, Isum) ) 
Allocate( Contribution(2,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,6
        Do gt3=gt2,6
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZ" 
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
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplFvFvVZpL(gt3,gt2) 
coup2(6) = cplFvFvVZpR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSe(i1) 
Boson2(2) =gTSe(i1) 
 
Boson4(1) = MSe(i1) 
Boson4(2) =gTSe(i1) 
Boson4(3) = MSe(i1) 
Boson4(4) =gTSe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFvSeL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChaFvSeR(iIN,gt2,i1)) 
coup(4) = Conjg(cplFvChacSeL(gt3,gt1,i1)) 
coup(3) = Conjg(cplFvChacSeR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFvSeL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFvSeR(iIN,gt3,i1)) 
coup(4) = Conjg(cplFvChacSeL(gt2,gt1,i1)) 
coup(3) = Conjg(cplFvChacSeR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt3,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt3,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i1)  
coup2(5) = cplFvChacSeL(gt2,gt1,i1) 
coup2(6) = cplFvChacSeR(gt2,gt1,i1) 
coup2(8) = cplFvChacSeL(gt3,gt1,i1) 
coup2(7) = cplFvChacSeR(gt3,gt1,i1) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i1))  
coup2(5) = cplFvFvAhL(gt3,gt2,i1) 
coup2(6) = cplFvFvAhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Ah" 
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
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i1))  
coup2(5) = cplFvFvhhL(gt3,gt2,i1) 
coup2(6) = cplFvFvhhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: hh" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt3,gt1,i2) 
coup2(7) = cplFvChacSeR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(iIN,gt3,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt3,i2)  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt2,gt1,i2) 
coup2(7) = cplFvChacSeR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZ,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Se'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZ,Ah" 
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
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZ,hh" 
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
!  VZp, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt3,gt1,i2) 
coup2(7) = cplFvChacSeR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(iIN,gt3,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt3,i2)  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt2,gt1,i2) 
coup2(7) = cplFvChacSeR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZp,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Se'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZp,Ah" 
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
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: VZp,hh" 
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
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvChacSeL(gt3,gt1,i1) 
coup2(6) = cplFvChacSeR(gt3,gt1,i1) 
coup2(8) = cplFvChacSeL(gt3,gt1,i2) 
coup2(7) = cplFvChacSeR(gt3,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt3,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt3,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvChacSeL(gt2,gt1,i1) 
coup2(6) = cplFvChacSeR(gt2,gt1,i1) 
coup2(8) = cplFvChacSeL(gt3,gt1,i2) 
coup2(7) = cplFvChacSeR(gt3,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt3,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt3,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt3,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt3,i2)  
coup2(5) = cplFvChacSeL(gt2,gt1,i1) 
coup2(6) = cplFvChacSeR(gt2,gt1,i1) 
coup2(8) = cplFvChacSeL(gt2,gt1,i2) 
coup2(7) = cplFvChacSeR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt3,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt3,i2)  
coup2(5) = cplFvChacSeL(gt3,gt1,i1) 
coup2(6) = cplFvChacSeR(gt3,gt1,i1) 
coup2(8) = cplFvChacSeL(gt2,gt1,i2) 
coup2(7) = cplFvChacSeR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Ah 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplFvChacSeL(gt3,gt1,i1) 
coup2(6) = cplFvChacSeR(gt3,gt1,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaFvSeL(iIN,gt3,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplFvChacSeL(gt2,gt1,i1) 
coup2(6) = cplFvChacSeR(gt2,gt1,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Se,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Ah'
        End Do 
      End Do 



!-------------- 
!  Se, hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvChacSeL(gt3,gt1,i1) 
coup2(6) = cplFvChacSeR(gt3,gt1,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaFvSeL(iIN,gt3,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvChacSeL(gt2,gt1,i1) 
coup2(6) = cplFvChacSeR(gt2,gt1,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Se,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Ah,Ah" 
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
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: Ah,hh" 
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
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Fv Fv Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChaFvFv 
 
 
Subroutine ChaToChicFuFd(iIN,MChi,MFu,MFd,MVWm,MHpm,MSu,MSd,MCha,cplcChacFuSdL,       & 
& cplcChacFuSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiFdcSdL,cplChiFdcSdR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWm,gTHpm,gTSu,gTSd,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(7),MFu(3),MFd(3),MVWm,MHpm(2),MSu(6),MSd(6),MCha(2)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),& 
& cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcFuChiSuL(3,7,6),cplcFuChiSuR(3,7,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplChiFdcSdL(7,3,6),cplChiFdcSdR(7,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWm,gTHpm(2),gTSu(6),gTSd(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 225 
Allocate( gSum(7,3,3, Isum) ) 
Allocate( Contribution(7,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,7
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MChi(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdcVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm" 
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
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFdcHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm" 
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
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuChiSuL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuChiSuR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MFd(gt3) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiFdcSdL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChiFdcSdR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Sd" 
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
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplcFuFdcHpmL(gt2,gt3,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,Hpm" 
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
!  VWm, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,conj[Su]'
      End Do 



!-------------- 
!  VWm, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFd(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Sd'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplcFuFdcHpmL(gt2,gt3,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,Hpm" 
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
!  Hpm, conj[Su] 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,conj[Su]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Sd 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFd(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Sd'
        End Do 
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuChiSuL(gt2,gt1,i1) 
coup2(6) = cplcFuChiSuR(gt2,gt1,i1) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Sd 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MFd(gt3) 
mass(3) = -MChi(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuChiSuL(gt2,gt1,i1) 
coup2(6) = cplcFuChiSuR(gt2,gt1,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su],Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MFd(gt3) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplChiFdcSdL(gt1,gt3,i1) 
coup2(6) = cplChiFdcSdR(gt1,gt3,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Sd,Sd" 
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
    Do gt1=1,7
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChicFuFd 
 
 
Subroutine ChaToChiFvFe(iIN,MChi,MFv,MFe,MVWm,MHpm,MSe,MSvIm,MSvRe,MCha,              & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFeSvImL,            & 
& cplcChaFeSvImR,cplcChaFeSvReL,cplcChaFeSvReR,cplcChaFvSeL,cplcChaFvSeR,cplChiFecSeL,   & 
& cplChiFecSeR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,IntegralSs,IntegralSSss,IntegralSSst,           & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,           & 
& NVSst,NVVss,gTVWm,gTHpm,gTSe,gTSvIm,gTSvRe,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(7),MFv(6),MFe(3),MVWm,MHpm(2),MSe(6),MSvIm(6),MSvRe(6),MCha(2)

Complex(dp),Intent(in) :: cplcChaChiHpmL(2,7,2),cplcChaChiHpmR(2,7,2),cplcChaChiVWmL(2,7),cplcChaChiVWmR(2,7),  & 
& cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6),& 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplChiFecSeL(7,3,6),cplChiFecSeR(7,3,6),       & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWm,gTHpm(2),gTSe(6),gTSvIm(6),gTSvRe(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 441 
Allocate( gSum(7,6,3, Isum) ) 
Allocate( Contribution(7,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,7
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MChi(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt1)) 
coup(4) = Conjg(cplFvFecVWmL(gt2,gt3)) 
coup(3) = Conjg(cplFvFecVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: VWm" 
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
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFecHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFecHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Hpm" 
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
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSe(i1) 
Boson2(2) =gTSe(i1) 
 
Boson4(1) = MSe(i1) 
Boson4(2) =gTSe(i1) 
Boson4(3) = MSe(i1) 
Boson4(4) =gTSe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFe(gt3) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFvSeL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChaFvSeR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiFecSeL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChiFecSeR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvIm(i1) 
Boson2(2) =gTSvIm(i1) 
 
Boson4(1) = MSvIm(i1) 
Boson4(2) =gTSvIm(i1) 
Boson4(3) = MSvIm(i1) 
Boson4(4) =gTSvIm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFeSvImL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvImR(iIN,gt3,i1)) 
coup(4) = Conjg(cplChiFvSvImL(gt1,gt2,i1)) 
coup(3) = Conjg(cplChiFvSvImR(gt1,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvRe(i1) 
Boson2(2) =gTSvRe(i1) 
 
Boson4(1) = MSvRe(i1) 
Boson4(2) =gTSvRe(i1) 
Boson4(3) = MSvRe(i1) 
Boson4(4) =gTSvRe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFeSvReL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvReR(iIN,gt3,i1)) 
coup(4) = Conjg(cplChiFvSvReL(gt1,gt2,i1)) 
coup(3) = Conjg(cplChiFvSvReR(gt1,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplFvFecVWmL(gt2,gt3) 
coup2(6) = cplFvFecVWmR(gt2,gt3) 
coup2(8) = cplFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: VWm,Hpm" 
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
!  VWm, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvFecVWmL(gt2,gt3) 
coup2(6) = cplFvFecVWmR(gt2,gt3) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: VWm,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Se'
      End Do 



!-------------- 
!  VWm, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplFvFecVWmL(gt2,gt3) 
coup2(6) = cplFvFecVWmR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvImL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: VWm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,SvIm'
      End Do 



!-------------- 
!  VWm, SvRe 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplFvFecVWmL(gt2,gt3) 
coup2(6) = cplFvFecVWmR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvReL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: VWm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,SvRe'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Hpm,Hpm" 
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
!  Hpm, Se 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Hpm,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Se'
        End Do 
      End Do 



!-------------- 
!  Hpm, SvIm 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Hpm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,SvIm'
        End Do 
      End Do 



!-------------- 
!  Hpm, SvRe 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Hpm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,SvRe'
        End Do 
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFe(gt3) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChaFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChaFvSeR(iIN,gt2,i2)  
coup2(5) = cplChiFecSeL(gt1,gt3,i1) 
coup2(6) = cplChiFecSeR(gt1,gt3,i1) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, SvIm 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MChi(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplChiFecSeL(gt1,gt3,i1) 
coup2(6) = cplChiFecSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Se,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,SvIm'
        End Do 
      End Do 



!-------------- 
!  Se, SvRe 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MChi(gt1) 
 
coup2(1) = cplcChaFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChaFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplChiFecSeL(gt1,gt3,i1) 
coup2(6) = cplChiFecSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: Se,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplChiFvSvImL(gt1,gt2,i1) 
coup2(6) = cplChiFvSvImR(gt1,gt2,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplChiFvSvImL(gt1,gt2,i1) 
coup2(6) = cplChiFvSvImR(gt1,gt2,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvRe(i1) 
Boson4(2) = gTSvRe(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplChiFvSvReL(gt1,gt2,i1) 
coup2(6) = cplChiFvSvReR(gt1,gt2,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi Fv Fe Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
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
    Do gt1=1,7
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:441))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChiFvFe 
 
 
Subroutine ChaToFdcFuGlu(iIN,MFd,MFu,MGlu,MSu,MSd,MCha,cplcChacFuSdL,cplcChacFuSdR,   & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuGluSuL,cplcFuGluSuR,cplGluFdcSdL,cplGluFdcSdR,       & 
& IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTSu,gTSd,deltaM,epsI,            & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFu(3),MGlu,MSu(6),MSd(6),MCha(2)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),  & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTSu(6),gTSd(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 144 
Allocate( gSum(3,3,1, Isum) ) 
Allocate( Contribution(3,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MGlu)+Abs(MFu(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MGlu 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuGluSuL(gt2,i1)) 
coup(3) = Conjg(cplcFuGluSuR(gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 4*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MGlu 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplGluFdcSdL(gt1,i1)) 
coup(3) = Conjg(cplGluFdcSdR(gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 4*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: Sd" 
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
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MGlu 
 
coup2(1) = cplcChaFdcSuL(iIN,gt1,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt1,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt1,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt1,i2)  
coup2(5) = cplcFuGluSuL(gt2,i1) 
coup2(6) = cplcFuGluSuR(gt2,i1) 
coup2(8) = cplcFuGluSuL(gt2,i2) 
coup2(7) = cplcFuGluSuR(gt2,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Sd 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MFd(gt1) 
mass(3) = -MGlu 
 
coup2(1) = cplcChaFdcSuL(iIN,gt1,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt1,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuGluSuL(gt2,i1) 
coup2(6) = cplcFuGluSuR(gt2,i1) 
coup2(8) = cplGluFdcSdL(gt1,i2) 
coup2(7) = cplGluFdcSdR(gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su],Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su],Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MGlu 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplGluFdcSdL(gt1,i1) 
coup2(6) = cplGluFdcSdR(gt1,i1) 
coup2(8) = cplGluFdcSdL(gt1,i2) 
coup2(7) = cplGluFdcSdR(gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: Sd,Sd" 
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



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:144))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToFdcFuGlu 
 
 
Subroutine ChaToFecChaFe(iIN,MFe,MCha,MSvIm,MSvRe,cplcChaFeSvImL,cplcChaFeSvImR,      & 
& cplcChaFeSvReL,cplcChaFeSvReR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,          & 
& NSSst,gTSvIm,gTSvRe,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MCha(2),MSvIm(6),MSvRe(6)

Complex(dp),Intent(in) :: cplcChaFeSvImL(2,3,6),cplcChaFeSvImR(2,3,6),cplcChaFeSvReL(2,3,6),cplcChaFeSvReR(2,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTSvIm(6),gTSvRe(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 144 
Allocate( gSum(3,2,3, Isum) ) 
Allocate( Contribution(3,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=gt1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFe(gt3))+Abs(MCha(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  SvIm 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvIm(i1) 
Boson2(2) =gTSvIm(i1) 
 
Boson4(1) = MSvIm(i1) 
Boson4(2) =gTSvIm(i1) 
Boson4(3) = MSvIm(i1) 
Boson4(4) =gTSvIm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaFeSvImL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaFeSvImR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaFeSvImL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaFeSvImR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcChaFeSvImL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvImR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaFeSvImL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaFeSvImR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt1,i1) 
coup2(3) = cplcChaFeSvImR(iIN,gt1,i1)  
coup2(5) = cplcChaFeSvImL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvImL(gt2,gt3,i1) 
coup2(7) = cplcChaFeSvImR(gt2,gt3,i1) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fe cCha Fe Propagator: SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm'
      End Do 



!-------------- 
!  SvRe 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSvRe(i1) 
Boson2(2) =gTSvRe(i1) 
 
Boson4(1) = MSvRe(i1) 
Boson4(2) =gTSvRe(i1) 
Boson4(3) = MSvRe(i1) 
Boson4(4) =gTSvRe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaFeSvReL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaFeSvReR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaFeSvReL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaFeSvReR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcChaFeSvReL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFeSvReR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaFeSvReL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaFeSvReR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt1,i1) 
coup2(3) = cplcChaFeSvReR(iIN,gt1,i1)  
coup2(5) = cplcChaFeSvReL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvReR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt3,i1) 
coup2(7) = cplcChaFeSvReR(gt2,gt3,i1) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fe cCha Fe Propagator: SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe'
      End Do 



!-------------- 
!  SvIm, SvIm 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvImL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvImR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvImL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvImR(gt2,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvImL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvImR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvImL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvImR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvImL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvImR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fe cCha Fe Propagator: SvIm,SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvIm'
        End Do 
      End Do 



!-------------- 
!  SvIm, SvRe 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvImL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvImR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvImL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvImR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fe cCha Fe Propagator: SvIm,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,SvRe'
        End Do 
      End Do 



!-------------- 
!  SvRe, SvRe 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSvRe(i1) 
Boson4(2) = gTSvRe(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvReL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvReR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt1,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt1,i2)  
coup2(5) = cplcChaFeSvReL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvReR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt3,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt3,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt3,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvReL(gt2,gt1,i1) 
coup2(6) = cplcChaFeSvReR(gt2,gt1,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFeSvReL(iIN,gt1,i1) 
coup2(2) = cplcChaFeSvReR(iIN,gt1,i1) 
coup2(4) = cplcChaFeSvReL(iIN,gt3,i2) 
coup2(3) = cplcChaFeSvReR(iIN,gt3,i2)  
coup2(5) = cplcChaFeSvReL(gt2,gt3,i1) 
coup2(6) = cplcChaFeSvReR(gt2,gt3,i1) 
coup2(8) = cplcChaFeSvReL(gt2,gt1,i2) 
coup2(7) = cplcChaFeSvReR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fe cCha Fe Propagator: SvRe,SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,SvRe'
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
      Do gt2=1,2
        Do gt3=gt1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToFecChaFe 
 
 
End Module Cha3Decays_BLSSM 
 
