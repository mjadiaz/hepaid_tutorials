! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 18:54 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module Fv3Decays_BLSSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_BLSSM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FvThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gTAh,gThh,gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gFvFvcChaCha,gFvFvChiChi,          & 
& gFvFvcFdFd,gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,epsI,               & 
& deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Complex(dp) :: cplcChaChaAhL(2,2,4),cplcChaChaAhR(2,2,4),cplcChaChahhL(2,2,4),cplcChaChahhR(2,2,4),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaFvSeL(2,6,6),cplcChaFvSeR(2,6,6),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),         & 
& cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),              & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),            & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),       & 
& cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),   & 
& cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplcFuFuAhL(3,3,4),            & 
& cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplChiChacHpmL(7,2,2),            & 
& cplChiChacHpmR(7,2,2),cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChiChiAhL(7,7,4),     & 
& cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),cplChiChiVZL(7,7),         & 
& cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),cplChiChiVZR(7,7),cplChiFvSvImL(7,6,6),          & 
& cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvChacSeL(6,2,6),    & 
& cplFvChacSeR(6,2,6),cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),         & 
& cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),               & 
& cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6),cplFvFvVZR(6,6)

Real(dp),Intent(in) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22,vd,vu,x1,x2

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(inout) :: gFvFvcChaCha(6,6,2,2),gFvFvChiChi(6,6,7,7),gFvFvcFdFd(6,6,3,3),gFvFvcFeFe(6,6,3,3),   & 
& gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6),gFvcFeChiCha(6,3,7,2),gFvFecFdFu(6,3,3,3)

Real(dp),Intent(in) :: gTAh(4),gThh(4),gTHpm(2),gTSe(6),gTSvIm(6),gTSvRe(6),gTVWm,gTVZ,gTVZp

Real(dp) :: gFvFvcChaChai(6,2,2),gFvFvChiChii(6,7,7),gFvFvcFdFdi(6,3,3),gFvFvcFeFei(6,3,3),       & 
& gFvFvcFuFui(6,3,3),gFvFvFvFvi(6,6,6),gFvcFeChiChai(3,7,2),gFvFecFdFui(3,3,3)

Real(dp) :: gTAhtemp(4),gThhtemp(4),gTHpmtemp(2),gTSetemp(6),gTSvImtemp(6),gTSvRetemp(6)          & 
& ,gTVWmtemp,gTVZtemp,gTVZptemp
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
NameOfUnit(Iname) = 'FvThreeBodyDecay' 
 
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
gTSetemp = 0._dp 
gTSvImtemp = 0._dp 
gTSvRetemp = 0._dp 
gTVWmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZptemp = 0._dp 
Else 
gTAhtemp = gTAh 
gThhtemp = gThh 
gTHpmtemp = gTHpm 
gTSetemp = gTSe 
gTSvImtemp = gTSvIm 
gTSvRetemp = gTSvRe 
gTVWmtemp = gTVWm 
gTVZtemp = gTVZ 
gTVZptemp = gTVZp 
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
 
Call CouplingsFor_Fv_decays_3B(MFv(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,             & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,              & 
& Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,              & 
& M3,MBp,vd,vu,x1,x2,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,            & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaFvSeL,cplcChaFvSeR,   & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,              & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,              & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,    & 
& cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,        & 
& cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZpL,       & 
& cplFvFvVZpR,cplFvFvVZR,deltaM)

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

 
gFvFvcChaChai = 0._dp 
Call FvToFvcChaCha(i_run,MFv,MCha,MVZ,MVZp,MSe,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaFvSeL,cplcChaFvSeR,cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,cplFvFvAhR,             & 
& cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,        & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSetemp,gTAhtemp,            & 
& gThhtemp,deltaM,epsI,check,gFvFvcChaChai)

gFvFvcChaCha(i_run,:,:,:) = gFvFvcChaChai 
gT(i_run) = gT(i_run) + Sum(gFvFvcChaChai) 
 
gFvFvChiChii = 0._dp 
Call FvToFvChiChi(i_run,MFv,MChi,MVZ,MVZp,MAh,MSvIm,MSvRe,Mhh,cplChiChiAhL,           & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFvAhL,      & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTAhtemp,        & 
& gTSvImtemp,gTSvRetemp,gThhtemp,deltaM,epsI,check,gFvFvChiChii)

gFvFvChiChi(i_run,:,:,:) = gFvFvChiChii 
gT(i_run) = gT(i_run) + Sum(gFvFvChiChii) 
 
gFvFvcFdFdi = 0._dp 
Call FvToFvcFdFd(i_run,MFv,MFd,MVZ,MVZp,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFvFvcFdFdi)

gFvFvcFdFd(i_run,:,:,:) = gFvFvcFdFdi 
gT(i_run) = gT(i_run) + Sum(gFvFvcFdFdi) 
 
gFvFvcFeFei = 0._dp 
Call FvToFvcFeFe(i_run,MFv,MFe,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcFeFeAhL,cplcFeFeAhR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplFvFecHpmL,cplFvFecHpmR,         & 
& cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,      & 
& cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralSSst,               & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZptemp,gTVWmtemp,gTHpmtemp,              & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gFvFvcFeFei)

gFvFvcFeFe(i_run,:,:,:) = gFvFvcFeFei 
gT(i_run) = gT(i_run) + Sum(gFvFvcFeFei) 
 
gFvFvcFuFui = 0._dp 
Call FvToFvcFuFu(i_run,MFv,MFu,MVZ,MVZp,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZptemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFvFvcFuFui)

gFvFvcFuFu(i_run,:,:,:) = gFvFvcFuFui 
gT(i_run) = gT(i_run) + Sum(gFvFvcFuFui) 
 
gFvFvFvFvi = 0._dp 
Call FvToFvFvFv(i_run,MFv,MVZ,MVZp,MAh,Mhh,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,          & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,      & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZptemp,gTAhtemp,               & 
& gThhtemp,deltaM,epsI,check,gFvFvFvFvi)

gFvFvFvFv(i_run,:,:,:) = gFvFvFvFvi 
gT(i_run) = gT(i_run) + Sum(gFvFvFvFvi) 
 
gFvcFeChiChai = 0._dp 
Call FvTocFeChiCha(i_run,MFe,MChi,MCha,MVWm,MSe,MHpm,MSvIm,MSvRe,MFv,cplcFeChaSvImL,  & 
& cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFvHpmL,   & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,   & 
& cplFvChacSeR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVWmtemp,             & 
& gTSetemp,gTHpmtemp,gTSvImtemp,gTSvRetemp,deltaM,epsI,check,gFvcFeChiChai)

gFvcFeChiCha(i_run,:,:,:) = gFvcFeChiChai 
gT(i_run) = gT(i_run) + 2._dp*Sum(gFvcFeChiChai) 
 
gFvFecFdFui = 0._dp 
Call FvToFecFdFu(i_run,MFe,MFd,MFu,MVWm,MHpm,MFv,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWmtemp,gTHpmtemp,deltaM,epsI,check,gFvFecFdFui)

gFvFecFdFu(i_run,:,:,:) = gFvFecFdFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gFvFecFdFui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gFvFvcChaCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,7
    Do gt3=gt2,7
gPartial(i1,n_length)= gFvFvChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFvFvcFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFvFvcFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFvFvcFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=gt1,6
    Do gt3=gt2,6
gPartial(i1,n_length)= gFvFvFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,7
    Do gt3=1,2
gPartial(i1,n_length)= 2._dp*gFvcFeChiCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gFvFecFdFu(i1,gt1,gt2,gt3)
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
 
End Subroutine FvThreeBodyDecay
 
 
Subroutine FvToFvcChaCha(iIN,MFv,MCha,MVZ,MVZp,MSe,MAh,Mhh,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFvSeL,cplcChaFvSeR,cplFvChacSeL,cplFvChacSeR,cplFvFvAhL,         & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,gTSe,gTAh,               & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MCha(2),MVZ,MVZp,MSe(6),MAh(4),Mhh(4)

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
mass(1) = MFv(iIN) 
 
Isum = 484 
Allocate( gSum(6,2,2, Isum) ) 
Allocate( Contribution(6,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[Se] 
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
 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplFvChacSeL(iIN,gt3,i1)) 
coup(1) = Conjg(cplFvChacSeR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaFvSeL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaFvSeR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se]'
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
 
mass(2) = MCha(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaFvSeL(gt2,iIN,i1)) 
coup(1) = Conjg(cplcChaFvSeR(gt2,iIN,i1)) 
coup(4) = Conjg(cplFvChacSeL(gt1,gt3,i1)) 
coup(3) = Conjg(cplFvChacSeR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Se" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChaAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChaAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Ah" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChahhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChahhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[Se] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplFvChacSeL(iIN,gt3,i2) 
coup2(3) = cplFvChacSeR(iIN,gt3,i2)  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = cplcChaFvSeL(gt2,gt1,i2) 
coup2(7) = cplcChaFvSeR(gt2,gt1,i2) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ,conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Se]'
      End Do 



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
mass(2) = MCha(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(gt2,iIN,i2) 
coup2(3) = cplcChaFvSeR(gt2,iIN,i2)  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt1,gt3,i2) 
coup2(7) = cplFvChacSeR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ,Se" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZ,hh" 
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
!  VZp, conj[Se] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplFvChacSeL(iIN,gt3,i2) 
coup2(3) = cplFvChacSeR(iIN,gt3,i2)  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = cplcChaFvSeL(gt2,gt1,i2) 
coup2(7) = cplcChaFvSeR(gt2,gt1,i2) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZp,conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[Se]'
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
mass(2) = MCha(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplcChaFvSeL(gt2,iIN,i2) 
coup2(3) = cplcChaFvSeR(gt2,iIN,i2)  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = cplFvChacSeL(gt1,gt3,i2) 
coup2(7) = cplFvChacSeR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZp,Se" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZp,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: VZp,hh" 
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
!  conj[Se], conj[Se] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = cplFvChacSeL(iIN,gt3,i2) 
coup2(3) = cplFvChacSeR(iIN,gt3,i2)  
coup2(5) = cplcChaFvSeL(gt2,gt1,i1) 
coup2(6) = cplcChaFvSeR(gt2,gt1,i1) 
coup2(8) = cplcChaFvSeL(gt2,gt1,i2) 
coup2(7) = cplcChaFvSeR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: conj[Se],conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],conj[Se]'
        End Do 
      End Do 



!-------------- 
!  conj[Se], Se 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt2) 
mass(4) = MCha(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = cplcChaFvSeL(gt2,iIN,i2) 
coup2(3) = cplcChaFvSeR(gt2,iIN,i2)  
coup2(5) = cplcChaFvSeL(gt2,gt1,i1) 
coup2(6) = cplcChaFvSeR(gt2,gt1,i1) 
coup2(8) = cplFvChacSeL(gt1,gt3,i2) 
coup2(7) = cplFvChacSeR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: conj[Se],Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],Se'
        End Do 
      End Do 



!-------------- 
!  conj[Se], Ah 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcChaFvSeL(gt2,gt1,i1) 
coup2(6) = cplcChaFvSeR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: conj[Se],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Se], hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcChaFvSeL(gt2,gt1,i1) 
coup2(6) = cplcChaFvSeR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: conj[Se],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],hh'
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
mass(2) = MCha(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaFvSeL(gt2,iIN,i1) 
coup2(2) = cplcChaFvSeR(gt2,iIN,i1) 
coup2(4) = cplcChaFvSeL(gt2,iIN,i2) 
coup2(3) = cplcChaFvSeR(gt2,iIN,i2)  
coup2(5) = cplFvChacSeL(gt1,gt3,i1) 
coup2(6) = cplFvChacSeR(gt1,gt3,i1) 
coup2(8) = cplFvChacSeL(gt1,gt3,i2) 
coup2(7) = cplFvChacSeR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Se,Se" 
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
mass(2) = MFv(gt1) 
mass(4) = MCha(gt2) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFvSeL(gt2,iIN,i1) 
coup2(2) = cplcChaFvSeR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvChacSeL(gt1,gt3,i1) 
coup2(6) = cplFvChacSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Se,Ah" 
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
mass(2) = MFv(gt1) 
mass(4) = MCha(gt2) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaFvSeL(gt2,iIN,i1) 
coup2(2) = cplcChaFvSeR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvChacSeL(gt1,gt3,i1) 
coup2(6) = cplFvChacSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Se,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Ah,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: Ah,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcChaChahhL(gt2,gt3,i1) 
coup2(6) = cplcChaChahhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cCha Cha Propagator: hh,hh" 
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
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:484))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvcChaCha 
 
 
Subroutine FvToFvChiChi(iIN,MFv,MChi,MVZ,MVZp,MAh,MSvIm,MSvRe,Mhh,cplChiChiAhL,       & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFvSvImL,cplChiFvSvImR,cplChiFvSvReL,cplChiFvSvReR,cplFvFvAhL,      & 
& cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,        & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,gTAh,gTSvIm,             & 
& gTSvRe,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MChi(7),MVZ,MVZp,MAh(4),MSvIm(6),MSvRe(6),Mhh(4)

Complex(dp),Intent(in) :: cplChiChiAhL(7,7,4),cplChiChiAhR(7,7,4),cplChiChihhL(7,7,4),cplChiChihhR(7,7,4),      & 
& cplChiChiVZL(7,7),cplChiChiVZR(7,7),cplChiChiVZpL(7,7),cplChiChiVZpR(7,7),             & 
& cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),   & 
& cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),               & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(4),gTSvIm(6),gTSvRe(6),gThh(4)

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
mass(1) = MFv(iIN) 
 
Isum = 484 
Allocate( gSum(6,7,7, Isum) ) 
Allocate( Contribution(6,7,7, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,7
        Do gt3=gt2,7
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZp" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: Ah" 
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
 
mass(2) = MChi(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplChiFvSvImL(gt2,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvImR(gt2,iIN,i1)) 
coup(4) = Conjg(cplChiFvSvImL(gt3,gt1,i1)) 
coup(3) = Conjg(cplChiFvSvImR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplChiFvSvImL(gt3,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvImR(gt3,iIN,i1)) 
coup(4) = Conjg(cplChiFvSvImL(gt2,gt1,i1)) 
coup(3) = Conjg(cplChiFvSvImR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i1)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i1))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i1)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i1)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvIm" 
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
 
mass(2) = MChi(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplChiFvSvReL(gt2,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvReR(gt2,iIN,i1)) 
coup(4) = Conjg(cplChiFvSvReL(gt3,gt1,i1)) 
coup(3) = Conjg(cplChiFvSvReR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplChiFvSvReL(gt3,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvReR(gt3,iIN,i1)) 
coup(4) = Conjg(cplChiFvSvReL(gt2,gt1,i1)) 
coup(3) = Conjg(cplChiFvSvReR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvReL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i1)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i1))  
coup2(5) = cplChiFvSvReL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i1)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i1)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvRe" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChihhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChihhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ,VZp" 
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ,Ah" 
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
!  VZ, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvImL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt3,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvImL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ,SvIm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ,SvRe" 
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
!  VZ, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZ,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZp,Ah" 
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
!  VZp, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvImL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt3,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvImL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Chi Chi Propagator: VZp,SvIm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Chi Chi Propagator: VZp,SvRe" 
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
!  VZp, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: VZp,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: Ah,Ah" 
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
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt3,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt2,gt1,i2)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: Ah,SvIm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: Ah,SvRe" 
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: Ah,hh" 
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
mass(2) = MChi(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt2,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvImL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvImR(gt2,gt1,i2)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvIm,SvIm" 
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
mass(2) = MChi(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvImL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvIm,SvRe" 
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
!  SvIm, hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSvIm(i1) 
Boson4(2) = gTSvIm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplChiFvSvImL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt3,gt1,i1) 
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
mass(2) = MFv(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplChiFvSvImL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt3,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplChiFvSvImL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvImR(gt2,gt1,i1) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvIm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvIm,hh'
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
mass(2) = MChi(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplChiFvSvReL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvReL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvReL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiFvSvReL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt3,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MFv(gt1) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplChiFvSvReL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt3,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvReL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
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
mass(3) = -MFv(gt1) 
 
coup2(1) = cplChiFvSvReL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt3,iIN,i2))  
coup2(5) = cplChiFvSvReL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiFvSvReL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplChiFvSvReR(gt2,gt1,i2)) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvRe,SvRe" 
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



!-------------- 
!  SvRe, hh 
!-------------- 
Do i1=1,6
  Do i2=1,4
Boson4(1) = MSvRe(i1) 
Boson4(2) = gTSvRe(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplChiFvSvReL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplChiFvSvReL(gt3,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt3,gt1,i1) 
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
mass(2) = MFv(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplChiFvSvReL(gt3,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt3,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplChiFvSvReL(gt2,gt1,i1) 
coup2(6) = cplChiFvSvReR(gt2,gt1,i1) 
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
Write(*,*) "Fv->Fv Chi Chi Propagator: SvRe,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='SvRe,hh'
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
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv Chi Chi Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:484))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvChiChi 
 
 
Subroutine FvToFvcFdFd(iIN,MFv,MFd,MVZ,MVZp,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFd(3),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplFvFvAhL(6,6,4),& 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFv(iIN) 
 
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
 
If(Abs(MFv(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFd Fd Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFd Fd Propagator: VZp" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFd Fd Propagator: Ah" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFd Fd Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: VZ,VZp" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: VZ,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: VZ,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: VZp,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: VZp,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: Ah,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: Ah,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFd Fd Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvcFdFd 
 
 
Subroutine FvToFvcFeFe(iIN,MFv,MFe,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplFvFecHpmL,         & 
& cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,               & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,      & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZp,gTVWm,gTHpm,gTAh,               & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFe(3),MVZ,MVZp,MVWm,MHpm(2),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFvHpmL(3,6,2),& 
& cplcFeFvHpmR(3,6,2),cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplFvFecHpmL(6,3,2),           & 
& cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3),cplFvFvAhL(6,6,4),             & 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

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
mass(1) = MFv(iIN) 
 
Isum = 256 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[VWm] 
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
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplFvFecVWmL(iIN,gt3)) 
coup(1) = Conjg(cplFvFecVWmR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFvVWmL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFvVWmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



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
 
mass(2) = MFe(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFvVWmL(gt2,iIN)) 
coup(1) = Conjg(cplcFeFvVWmR(gt2,iIN)) 
coup(4) = Conjg(cplFvFecVWmL(gt1,gt3)) 
coup(3) = Conjg(cplFvFecVWmR(gt1,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  conj[Hpm] 
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
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplFvFecHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplFvFecHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeFvHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeFvHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



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
 
mass(2) = MFe(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFvHpmL(gt2,iIN,i1)) 
coup(1) = Conjg(cplcFeFvHpmR(gt2,iIN,i1)) 
coup(4) = Conjg(cplFvFecHpmL(gt1,gt3,i1)) 
coup(3) = Conjg(cplFvFecHpmR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: Hpm" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: Ah" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[VWm] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplFvFecVWmL(iIN,gt3) 
coup2(3) = cplFvFecVWmR(iIN,gt3)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplcFeFvVWmL(gt2,gt1) 
coup2(7) = cplcFeFvVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWm]'



!-------------- 
!  VZ, VWm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplcFeFvVWmL(gt2,iIN) 
coup2(3) = cplcFeFvVWmR(gt2,iIN)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplFvFecVWmL(gt1,gt3) 
coup2(7) = cplFvFecVWmR(gt1,gt3) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWm'



!-------------- 
!  VZ, conj[Hpm] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplFvFecHpmL(iIN,gt3,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplcFeFvHpmL(gt2,gt1,i2) 
coup2(7) = cplcFeFvHpmR(gt2,gt1,i2) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Hpm]'
      End Do 



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
mass(2) = MFe(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,Hpm" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: VZ,hh" 
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
!  VZp, conj[VWm] 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplFvFecVWmL(iIN,gt3) 
coup2(3) = cplFvFecVWmR(iIN,gt3)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplcFeFvVWmL(gt2,gt1) 
coup2(7) = cplcFeFvVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[VWm]'



!-------------- 
!  VZp, VWm 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplcFeFvVWmL(gt2,iIN) 
coup2(3) = cplcFeFvVWmR(gt2,iIN)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplFvFecVWmL(gt1,gt3) 
coup2(7) = cplFvFecVWmR(gt1,gt3) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,VWm'



!-------------- 
!  VZp, conj[Hpm] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplFvFecHpmL(iIN,gt3,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplcFeFvHpmL(gt2,gt1,i2) 
coup2(7) = cplcFeFvHpmR(gt2,gt1,i2) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[Hpm]'
      End Do 



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
mass(2) = MFe(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,Hpm" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: VZp,hh" 
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
!  conj[VWm], VWm 
!-------------- 
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFecVWmL(iIN,gt3) 
coup2(2) = cplFvFecVWmR(iIN,gt3) 
coup2(4) = cplcFeFvVWmL(gt2,iIN) 
coup2(3) = cplcFeFvVWmR(gt2,iIN)  
coup2(5) = cplcFeFvVWmL(gt2,gt1) 
coup2(6) = cplcFeFvVWmR(gt2,gt1) 
coup2(8) = cplFvFecVWmL(gt1,gt3) 
coup2(7) = cplFvFecVWmR(gt1,gt3) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm],VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],VWm'



!-------------- 
!  conj[VWm], conj[Hpm] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplFvFecVWmL(iIN,gt3) 
coup2(2) = cplFvFecVWmR(iIN,gt3) 
coup2(4) = cplFvFecHpmL(iIN,gt3,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt3,i2)  
coup2(5) = cplcFeFvVWmL(gt2,gt1) 
coup2(6) = cplcFeFvVWmR(gt2,gt1) 
coup2(8) = cplcFeFvHpmL(gt2,gt1,i2) 
coup2(7) = cplcFeFvHpmR(gt2,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWm], Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFecVWmL(iIN,gt3) 
coup2(2) = cplFvFecVWmR(iIN,gt3) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplcFeFvVWmL(gt2,gt1) 
coup2(6) = cplcFeFvVWmR(gt2,gt1) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm],Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],Hpm'
      End Do 



!-------------- 
!  conj[VWm], Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFecVWmL(iIN,gt3) 
coup2(2) = cplFvFecVWmR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFvVWmL(gt2,gt1) 
coup2(6) = cplcFeFvVWmR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],Ah'
      End Do 



!-------------- 
!  conj[VWm], hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFecVWmL(iIN,gt3) 
coup2(2) = cplFvFecVWmR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFvVWmL(gt2,gt1) 
coup2(6) = cplcFeFvVWmR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[VWm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],hh'
      End Do 



!-------------- 
!  VWm, conj[Hpm] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplcFeFvVWmL(gt2,iIN) 
coup2(2) = cplcFeFvVWmR(gt2,iIN) 
coup2(4) = cplFvFecHpmL(iIN,gt3,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt3,i2)  
coup2(5) = cplFvFecVWmL(gt1,gt3) 
coup2(6) = cplFvFecVWmR(gt1,gt3) 
coup2(8) = cplcFeFvHpmL(gt2,gt1,i2) 
coup2(7) = cplcFeFvHpmR(gt2,gt1,i2) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VWm,conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,conj[Hpm]'
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
mass(2) = MFe(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFvVWmL(gt2,iIN) 
coup2(2) = cplcFeFvVWmR(gt2,iIN) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplFvFecVWmL(gt1,gt3) 
coup2(6) = cplFvFecVWmR(gt1,gt3) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VWm,Hpm" 
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
mass(2) = MFv(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFvVWmL(gt2,iIN) 
coup2(2) = cplcFeFvVWmR(gt2,iIN) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFecVWmL(gt1,gt3) 
coup2(6) = cplFvFecVWmR(gt1,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VWm,Ah" 
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
mass(2) = MFv(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFvVWmL(gt2,iIN) 
coup2(2) = cplcFeFvVWmR(gt2,iIN) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFecVWmL(gt1,gt3) 
coup2(6) = cplFvFecVWmR(gt1,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: VWm,hh" 
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
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplFvFecHpmL(iIN,gt3,i1) 
coup2(2) = cplFvFecHpmR(iIN,gt3,i1) 
coup2(4) = cplFvFecHpmL(iIN,gt3,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt3,i2)  
coup2(5) = cplcFeFvHpmL(gt2,gt1,i1) 
coup2(6) = cplcFeFvHpmR(gt2,gt1,i1) 
coup2(8) = cplcFeFvHpmL(gt2,gt1,i2) 
coup2(7) = cplcFeFvHpmR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Hpm 
!-------------- 
Do i1=1,2
  Do i2=1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFecHpmL(iIN,gt3,i1) 
coup2(2) = cplFvFecHpmR(iIN,gt3,i1) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplcFeFvHpmL(gt2,gt1,i1) 
coup2(6) = cplcFeFvHpmR(gt2,gt1,i1) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[Hpm],Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Hpm'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Ah 
!-------------- 
Do i1=1,2
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFecHpmL(iIN,gt3,i1) 
coup2(2) = cplFvFecHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplcFeFvHpmL(gt2,gt1,i1) 
coup2(6) = cplcFeFvHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[Hpm],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], hh 
!-------------- 
Do i1=1,2
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplFvFecHpmL(iIN,gt3,i1) 
coup2(2) = cplFvFecHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFvHpmL(gt2,gt1,i1) 
coup2(6) = cplcFeFvHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: conj[Hpm],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],hh'
        End Do 
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
mass(2) = MFe(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFvHpmL(gt2,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt2,iIN,i1) 
coup2(4) = cplcFeFvHpmL(gt2,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt2,iIN,i2)  
coup2(5) = cplFvFecHpmL(gt1,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt1,gt3,i1) 
coup2(8) = cplFvFecHpmL(gt1,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: Hpm,Hpm" 
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
mass(2) = MFv(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFvHpmL(gt2,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFecHpmL(gt1,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: Hpm,Ah" 
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
mass(2) = MFv(gt1) 
mass(4) = MFe(gt2) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFvHpmL(gt2,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt2,iIN,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFecHpmL(gt1,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFe Fe Propagator: Hpm,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: Ah,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: Ah,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFe Fe Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvcFeFe 
 
 
Subroutine FvToFvcFuFu(iIN,MFv,MFu,MVZ,MVZp,MAh,Mhh,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,         & 
& cplFvFvVZpR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZp,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MFu(3),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),          & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplFvFvAhL(6,6,4),& 
& cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),cplFvFvVZL(6,6),cplFvFvVZR(6,6), & 
& cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFv(iIN) 
 
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
 
If(Abs(MFv(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFu Fu Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFu Fu Propagator: VZp" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFu Fu Propagator: Ah" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv cFu Fu Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: VZ,VZp" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: VZ,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: VZ,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: VZp,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: VZp,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: Ah,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: Ah,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
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
Write(*,*) "Fv->Fv cFu Fu Propagator: hh,hh" 
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
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvcFuFu 
 
 
Subroutine FvToFvFvFv(iIN,MFv,MVZ,MVZp,MAh,Mhh,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,      & 
& cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZpL,cplFvFvVZpR,IntegralSs,IntegralSSss,      & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZp,gTAh,gThh,deltaM,               & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(6),MVZ,MVZp,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplFvFvAhL(6,6,4),cplFvFvAhR(6,6,4),cplFvFvhhL(6,6,4),cplFvFvhhR(6,6,4),              & 
& cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZpL(6,6),cplFvFvVZpR(6,6)

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
mass(1) = MFv(iIN) 
 
Isum = 100 
Allocate( gSum(6,6,6, Isum) ) 
Allocate( Contribution(6,6,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=gt1, iIN-1
        Do gt3=gt2, iIN-1
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvVZL(iIN,gt2)) 
coup(1) = Conjg(cplFvFvVZR(iIN,gt2)) 
coup(4) = Conjg(cplFvFvVZL(gt1,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt1,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZ" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvVZpL(iIN,gt2)) 
coup(1) = Conjg(cplFvFvVZpR(iIN,gt2)) 
coup(4) = Conjg(cplFvFvVZpL(gt1,gt3)) 
coup(3) = Conjg(cplFvFvVZpR(gt1,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZp" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvAhL(iIN,gt2,i1)) 
coup(1) = Conjg(cplFvFvAhR(iIN,gt2,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt1,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i1))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: Ah" 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFvFvhhL(iIN,gt2,i1)) 
coup(1) = Conjg(cplFvFvhhR(iIN,gt2,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt1,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt3,i1) 
coup2(2) = cplFvFvhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt1,gt2,i1) 
coup2(6) = cplFvFvhhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt3,i1) 
coup2(2) = cplFvFvhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt1,gt2,i1) 
coup2(6) = cplFvFvhhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt2,i1) 
coup2(2) = cplFvFvhhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt1,gt3,i1) 
coup2(6) = cplFvFvhhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt2,i1) 
coup2(2) = cplFvFvhhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i1)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i1))  
coup2(5) = cplFvFvhhL(gt1,gt3,i1) 
coup2(6) = cplFvFvhhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt2)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt1,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt1,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt3)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt1)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt3)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplFvFvVZpR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt2)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt1,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt1,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt2)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(7) = Conjg(cplFvFvVZpL(gt1,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt1,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt1)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZpR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(3) = Conjg(cplFvFvVZpL(iIN,gt3)) 
coup2(4) = Conjg(cplFvFvVZpR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(7) = Conjg(cplFvFvVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplFvFvVZpR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZ,VZp" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt1,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZ,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt1,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt1) 
coup2(2) = cplFvFvVZR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt3) 
coup2(2) = cplFvFvVZR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZL(gt1,gt2) 
coup2(6) = cplFvFvVZR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZL(iIN,gt2) 
coup2(2) = cplFvFvVZR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZL(gt1,gt3) 
coup2(6) = cplFvFvVZR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZ,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt1,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZp,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt1,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt1) 
coup2(2) = cplFvFvVZpR(iIN,gt1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt2,gt3) 
coup2(6) = cplFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZpL(iIN,gt3) 
coup2(2) = cplFvFvVZpR(iIN,gt3) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt2) 
coup2(6) = cplFvFvVZpR(gt1,gt2) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
coupT = coup2(5) 
coup2(5) = coup2(6) 
coup2(6) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvVZpL(iIN,gt2) 
coup2(2) = cplFvFvVZpR(iIN,gt2) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvVZpL(gt1,gt3) 
coup2(6) = cplFvFvVZpR(gt1,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: VZp,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvAhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvAhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: Ah,Ah" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt1,i1) 
coup2(2) = cplFvFvAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvAhL(iIN,gt3,i1) 
coup2(2) = cplFvFvAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvAhL(gt1,gt2,i1) 
coup2(6) = cplFvFvAhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvAhL(iIN,gt2,i1) 
coup2(2) = cplFvFvAhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvAhL(gt1,gt3,i1) 
coup2(6) = cplFvFvAhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: Ah,hh" 
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
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt1,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt1,i1) 
coup2(2) = cplFvFvhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplFvFvhhL(iIN,gt3,i1) 
coup2(2) = cplFvFvhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvhhL(gt1,gt2,i1) 
coup2(6) = cplFvFvhhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvhhL(iIN,gt3,i1) 
coup2(2) = cplFvFvhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt2,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt2,i2))  
coup2(5) = cplFvFvhhL(gt1,gt2,i1) 
coup2(6) = cplFvFvhhR(gt1,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplFvFvhhL(iIN,gt2,i1) 
coup2(2) = cplFvFvhhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt1,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt1,i2))  
coup2(5) = cplFvFvhhL(gt1,gt3,i1) 
coup2(6) = cplFvFvhhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplFvFvhhL(iIN,gt2,i1) 
coup2(2) = cplFvFvhhR(iIN,gt2,i1) 
coup2(4) = Conjg(cplFvFvhhL(iIN,gt3,i2)) 
coup2(3) = Conjg(cplFvFvhhR(iIN,gt3,i2))  
coup2(5) = cplFvFvhhL(gt1,gt3,i1) 
coup2(6) = cplFvFvhhR(gt1,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If ((gt1.Eq.gt2).And.(gt2.Eq.gt3)) Then 
resC=resC/6._dp
Else If ((gt1.Eq.gt2).Or.(gt2.Eq.gt3).Or.(gt1.Eq.gt3)) Then
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fv Fv Fv Propagator: hh,hh" 
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
      Do gt2=gt1, iIN-1
        Do gt3=gt2, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFvFvFv 
 
 
Subroutine FvTocFeChiCha(iIN,MFe,MChi,MCha,MVWm,MSe,MHpm,MSvIm,MSvRe,MFv,             & 
& cplcFeChaSvImL,cplcFeChaSvImR,cplcFeChaSvReL,cplcFeChaSvReR,cplcFeChiSeL,              & 
& cplcFeChiSeR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplChiChacHpmL,       & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiFvSvImL,cplChiFvSvImR,              & 
& cplChiFvSvReL,cplChiFvSvReR,cplFvChacSeL,cplFvChacSeR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWm,gTSe,gTHpm,gTSvIm,gTSvRe,deltaM,epsI,check,          & 
& g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MChi(7),MCha(2),MVWm,MSe(6),MHpm(2),MSvIm(6),MSvRe(6),MFv(6)

Complex(dp),Intent(in) :: cplcFeChaSvImL(3,2,6),cplcFeChaSvImR(3,2,6),cplcFeChaSvReL(3,2,6),cplcFeChaSvReR(3,2,6),& 
& cplcFeChiSeL(3,7,6),cplcFeChiSeR(3,7,6),cplcFeFvHpmL(3,6,2),cplcFeFvHpmR(3,6,2),       & 
& cplcFeFvVWmL(3,6),cplcFeFvVWmR(3,6),cplChiChacHpmL(7,2,2),cplChiChacHpmR(7,2,2),       & 
& cplChiChacVWmL(7,2),cplChiChacVWmR(7,2),cplChiFvSvImL(7,6,6),cplChiFvSvImR(7,6,6),     & 
& cplChiFvSvReL(7,6,6),cplChiFvSvReR(7,6,6),cplFvChacSeL(6,2,6),cplFvChacSeR(6,2,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWm,gTSe(6),gTHpm(2),gTSvIm(6),gTSvRe(6)

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
mass(1) = MFv(iIN) 
 
Isum = 441 
Allocate( gSum(3,7,2, Isum) ) 
Allocate( Contribution(3,7,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,7
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MCha(gt3))+Abs(MChi(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcFeFvVWmL(gt1,iIN)) 
coup(1) = Conjg(cplcFeFvVWmR(gt1,iIN)) 
coup(4) = Conjg(cplChiChacVWmL(gt2,gt3)) 
coup(3) = Conjg(cplChiChacVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  conj[Se] 
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
 
mass(2) = MCha(gt3) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplFvChacSeL(iIN,gt3,i1)) 
coup(1) = Conjg(cplFvChacSeR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeChiSeL(gt1,gt2,i1)) 
coup(3) = Conjg(cplcFeChiSeR(gt1,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se]'
      End Do 



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
 
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcFeFvHpmL(gt1,iIN,i1)) 
coup(1) = Conjg(cplcFeFvHpmR(gt1,iIN,i1)) 
coup(4) = Conjg(cplChiChacHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChacHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: Hpm" 
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
 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplChiFvSvImL(gt2,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvImR(gt2,iIN,i1)) 
coup(4) = Conjg(cplcFeChaSvImL(gt1,gt3,i1)) 
coup(3) = Conjg(cplcFeChaSvImR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: SvIm" 
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
 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplChiFvSvReL(gt2,iIN,i1)) 
coup(1) = Conjg(cplChiFvSvReR(gt2,iIN,i1)) 
coup(4) = Conjg(cplcFeChaSvReL(gt1,gt3,i1)) 
coup(3) = Conjg(cplcFeChaSvReR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: SvRe" 
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
!  VWm, conj[Se] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcFeFvVWmL(gt1,iIN) 
coup2(2) = cplcFeFvVWmR(gt1,iIN) 
coup2(4) = cplFvChacSeL(iIN,gt3,i2) 
coup2(3) = cplFvChacSeR(iIN,gt3,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt3) 
coup2(6) = cplChiChacVWmR(gt2,gt3) 
coup2(8) = cplcFeChiSeL(gt1,gt2,i2) 
coup2(7) = cplcFeChiSeR(gt1,gt2,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: VWm,conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,conj[Se]'
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
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcFeFvVWmL(gt1,iIN) 
coup2(2) = cplcFeFvVWmR(gt1,iIN) 
coup2(4) = cplcFeFvHpmL(gt1,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt1,iIN,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt3) 
coup2(6) = cplChiChacVWmR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt2,gt3,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: VWm,Hpm" 
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
!  VWm, SvIm 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt3) 
 
coup2(1) = cplcFeFvVWmL(gt1,iIN) 
coup2(2) = cplcFeFvVWmR(gt1,iIN) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt3) 
coup2(6) = cplChiChacVWmR(gt2,gt3) 
coup2(8) = cplcFeChaSvImL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvImR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: VWm,SvIm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt3) 
 
coup2(1) = cplcFeFvVWmL(gt1,iIN) 
coup2(2) = cplcFeFvVWmR(gt1,iIN) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt3) 
coup2(6) = cplChiChacVWmR(gt2,gt3) 
coup2(8) = cplcFeChaSvReL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvReR(gt1,gt3,i2) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: VWm,SvRe" 
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
!  conj[Se], conj[Se] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt3) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = cplFvChacSeL(iIN,gt3,i2) 
coup2(3) = cplFvChacSeR(iIN,gt3,i2)  
coup2(5) = cplcFeChiSeL(gt1,gt2,i1) 
coup2(6) = cplcFeChiSeR(gt1,gt2,i1) 
coup2(8) = cplcFeChiSeL(gt1,gt2,i2) 
coup2(7) = cplcFeChiSeR(gt1,gt2,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: conj[Se],conj[Se]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],conj[Se]'
        End Do 
      End Do 



!-------------- 
!  conj[Se], Hpm 
!-------------- 
Do i1=1,6
  Do i2=1,2
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = cplcFeFvHpmL(gt1,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt1,iIN,i2)  
coup2(5) = cplcFeChiSeL(gt1,gt2,i1) 
coup2(6) = cplcFeChiSeR(gt1,gt2,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt3,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: conj[Se],Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],Hpm'
        End Do 
      End Do 



!-------------- 
!  conj[Se], SvIm 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSvIm(i2) 
Boson4(4) = gTSvIm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplcFeChiSeL(gt1,gt2,i1) 
coup2(6) = cplcFeChiSeR(gt1,gt2,i1) 
coup2(8) = cplcFeChaSvImL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvImR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: conj[Se],SvIm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],SvIm'
        End Do 
      End Do 



!-------------- 
!  conj[Se], SvRe 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSvRe(i2) 
Boson4(4) = gTSvRe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplFvChacSeL(iIN,gt3,i1) 
coup2(2) = cplFvChacSeR(iIN,gt3,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplcFeChiSeL(gt1,gt2,i1) 
coup2(6) = cplcFeChiSeR(gt1,gt2,i1) 
coup2(8) = cplcFeChaSvReL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvReR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: conj[Se],SvRe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Se],SvRe'
        End Do 
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
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcFeFvHpmL(gt1,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt1,iIN,i1) 
coup2(4) = cplcFeFvHpmL(gt1,iIN,i2) 
coup2(3) = cplcFeFvHpmR(gt1,iIN,i2)  
coup2(5) = cplChiChacHpmL(gt2,gt3,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt3,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt3,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: Hpm,Hpm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt3) 
 
coup2(1) = cplcFeFvHpmL(gt1,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt1,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt3,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvImL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvImR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: Hpm,SvIm" 
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
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MCha(gt3) 
 
coup2(1) = cplcFeFvHpmL(gt1,iIN,i1) 
coup2(2) = cplcFeFvHpmR(gt1,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt3,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt3,i1) 
coup2(8) = cplcFeChaSvReL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvReR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: Hpm,SvRe" 
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
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvImL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvImR(gt2,iIN,i2))  
coup2(5) = cplcFeChaSvImL(gt1,gt3,i1) 
coup2(6) = cplcFeChaSvImR(gt1,gt3,i1) 
coup2(8) = cplcFeChaSvImL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvImR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: SvIm,SvIm" 
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
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplChiFvSvImL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvImR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplcFeChaSvImL(gt1,gt3,i1) 
coup2(6) = cplcFeChaSvImR(gt1,gt3,i1) 
coup2(8) = cplcFeChaSvReL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvReR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: SvIm,SvRe" 
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
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplChiFvSvReL(gt2,iIN,i1) 
coup2(2) = cplChiFvSvReR(gt2,iIN,i1) 
coup2(4) = Conjg(cplChiFvSvReL(gt2,iIN,i2)) 
coup2(3) = Conjg(cplChiFvSvReR(gt2,iIN,i2))  
coup2(5) = cplcFeChaSvReL(gt1,gt3,i1) 
coup2(6) = cplcFeChaSvReR(gt1,gt3,i1) 
coup2(8) = cplcFeChaSvReL(gt1,gt3,i2) 
coup2(7) = cplcFeChaSvReR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->cFe Chi Cha Propagator: SvRe,SvRe" 
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
      Do gt2=1,7
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:441))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvTocFeChiCha 
 
 
Subroutine FvToFecFdFu(iIN,MFe,MFd,MFu,MVWm,MHpm,MFv,cplcFdFuHpmL,cplcFdFuHpmR,       & 
& cplcFdFuVWmL,cplcFdFuVWmR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWmL,cplFvFecVWmR,         & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFd(3),MFu(3),MVWm,MHpm(2),MFv(6)

Complex(dp),Intent(in) :: cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),          & 
& cplFvFecHpmL(6,3,2),cplFvFecHpmR(6,3,2),cplFvFecVWmL(6,3),cplFvFecVWmR(6,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVWm,gTHpm(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFv(iIN) 
 
Isum = 9 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFv(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  conj[VWm] 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFecVWmL(iIN,gt1)) 
coup(1) = Conjg(cplFvFecVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFuVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFuVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fe cFd Fu Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



!-------------- 
!  conj[Hpm] 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFvFecHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplFvFecHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFuHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFuHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fe cFd Fu Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWm], conj[Hpm] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFecVWmL(iIN,gt1) 
coup2(2) = cplFvFecVWmR(iIN,gt1) 
coup2(4) = cplFvFecHpmL(iIN,gt1,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt1,i2)  
coup2(5) = cplcFdFuVWmL(gt2,gt3) 
coup2(6) = cplcFdFuVWmR(gt2,gt3) 
coup2(8) = cplcFdFuHpmL(gt2,gt3,i2) 
coup2(7) = cplcFdFuHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fe cFd Fu Propagator: conj[VWm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplFvFecHpmL(iIN,gt1,i1) 
coup2(2) = cplFvFecHpmR(iIN,gt1,i1) 
coup2(4) = cplFvFecHpmL(iIN,gt1,i2) 
coup2(3) = cplFvFecHpmR(iIN,gt1,i2)  
coup2(5) = cplcFdFuHpmL(gt2,gt3,i1) 
coup2(6) = cplcFdFuHpmR(gt2,gt3,i1) 
coup2(8) = cplcFdFuHpmL(gt2,gt3,i2) 
coup2(7) = cplcFdFuHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fv->Fe cFd Fu Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
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
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFv(iIN))**3*g
End Subroutine FvToFecFdFu 
 
 
End Module Fv3Decays_BLSSM 
 
