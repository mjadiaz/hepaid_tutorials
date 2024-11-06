modname = BLSSM  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoBLSSM.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoBLSSM:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoBLSSM.o 
	 ${F90} -o SPhenoBLSSM ${LFlagsB} SPhenoBLSSM.o ../lib/libSPhenoBLSSM.a ../lib/libSPheno.a
	 mv SPhenoBLSSM ../bin
	 rm SPhenoBLSSM.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_BLSSM.o)  \
 ${name}(RGEs_BLSSM.o)   \
 ${name}(Couplings_BLSSM.o) ${name}(TreeLevelMasses_BLSSM.o) ${name}(TadpoleEquations_BLSSM.o) \
 ${name}(LoopCouplings_BLSSM.o) ${name}(CouplingsForDecays_BLSSM.o) \
 ${name}(TreeLevel_Decays_BLSSM.o) \
 ${name}(Glu_BLSSM.o)  ${name}(Cha_BLSSM.o)  ${name}(Chi_BLSSM.o)  ${name}(Sd_BLSSM.o)  ${name}(Su_BLSSM.o)  ${name}(Se_BLSSM.o)  ${name}(SvRe_BLSSM.o)  ${name}(SvIm_BLSSM.o)  ${name}(Fv_BLSSM.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_BLSSM.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_BLSSM.o) \
 ${name}(LoopMasses_BLSSM.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_BLSSM.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecaySd_BLSSM.o)  ${name}(LoopDecaySu_BLSSM.o)  ${name}(LoopDecaySe_BLSSM.o)  ${name}(LoopDecaySvRe_BLSSM.o)  ${name}(LoopDecaySvIm_BLSSM.o)  ${name}(LoopDecayhh_BLSSM.o)  ${name}(LoopDecayAh_BLSSM.o)  ${name}(LoopDecayHpm_BLSSM.o)  ${name}(LoopDecayGlu_BLSSM.o)  ${name}(LoopDecayCha_BLSSM.o)  ${name}(LoopDecayChi_BLSSM.o)  ${name}(LoopDecayFu_BLSSM.o)  ${name}(LoopDecayFv_BLSSM.o) \
 ${name}(Wrapper_LoopDecay_Sd_BLSSM.o)  ${name}(Wrapper_LoopDecay_Su_BLSSM.o)  ${name}(Wrapper_LoopDecay_Se_BLSSM.o)  ${name}(Wrapper_LoopDecay_SvRe_BLSSM.o)  ${name}(Wrapper_LoopDecay_SvIm_BLSSM.o)  ${name}(Wrapper_LoopDecay_hh_BLSSM.o)  ${name}(Wrapper_LoopDecay_Ah_BLSSM.o)  ${name}(Wrapper_LoopDecay_Hpm_BLSSM.o)  ${name}(Wrapper_LoopDecay_Glu_BLSSM.o)  ${name}(Wrapper_LoopDecay_Cha_BLSSM.o)  ${name}(Wrapper_LoopDecay_Chi_BLSSM.o)  ${name}(Wrapper_LoopDecay_Fu_BLSSM.o)  ${name}(Wrapper_LoopDecay_Fv_BLSSM.o) ${name}(OneLoopDecays_BLSSM.o) \
 ${name}(BranchingRatios_BLSSM.o) ${name}(HiggsCS_BLSSM.o) ${name}(RunSM_BLSSM.o) \
${name}(FlavorKit_LFV_BLSSM.o) ${name}(FlavorKit_QFV_BLSSM.o) ${name}(FlavorKit_Observables_BLSSM.o)\
 ${name}(LowEnergy_BLSSM.o) \
 ${name}(Boundaries_BLSSM.o)  ${name}(InputOutput_BLSSM.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
