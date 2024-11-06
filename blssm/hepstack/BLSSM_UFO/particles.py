# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.14.5 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 19:24 on 3.11.2021   
# ----------------------------------------------------------------------  
 
 
from __future__ import division 
from object_library import all_particles,Particle 
import parameters as Param 


go = Particle(pdg_code =1000021, 
	 name = 'go' ,
	 antiname = 'go' ,
	 spin = 2 ,
	 color = 8 ,
	 mass = Param.Mgo ,
	 width = Param.Wgo ,
	 GhostNumber = 0, 
	 line = 'scurly' ,
	 charge = 0 ,
	 texname = 'go' ,
	 antitexname = 'go' ) 
 
N1 = Particle(pdg_code =1000022, 
	 name = 'N1' ,
	 antiname = 'N1' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN1 ,
	 width = Param.WN1 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N1' ,
	 antitexname = 'N1' ) 
 
N2 = Particle(pdg_code =1000023, 
	 name = 'N2' ,
	 antiname = 'N2' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN2 ,
	 width = Param.WN2 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N2' ,
	 antitexname = 'N2' ) 
 
N3 = Particle(pdg_code =1000025, 
	 name = 'N3' ,
	 antiname = 'N3' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN3 ,
	 width = Param.WN3 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N3' ,
	 antitexname = 'N3' ) 
 
N4 = Particle(pdg_code =1000035, 
	 name = 'N4' ,
	 antiname = 'N4' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN4 ,
	 width = Param.WN4 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N4' ,
	 antitexname = 'N4' ) 
 
N5 = Particle(pdg_code =1000032, 
	 name = 'N5' ,
	 antiname = 'N5' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN5 ,
	 width = Param.WN5 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N5' ,
	 antitexname = 'N5' ) 
 
N6 = Particle(pdg_code =1000036, 
	 name = 'N6' ,
	 antiname = 'N6' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN6 ,
	 width = Param.WN6 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N6' ,
	 antitexname = 'N6' ) 
 
N7 = Particle(pdg_code =1000039, 
	 name = 'N7' ,
	 antiname = 'N7' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MN7 ,
	 width = Param.WN7 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'N7' ,
	 antitexname = 'N7' ) 
 
C1 = Particle(pdg_code =-1000024, 
	 name = 'C1' ,
	 antiname = 'C1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MC1 ,
	 width = Param.WC1 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1 ,
	 texname = 'C1' ,
	 antitexname = 'C1bar' ) 
 
C1bar = C1.anti() 
 
 
C2 = Particle(pdg_code =-1000037, 
	 name = 'C2' ,
	 antiname = 'C2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MC2 ,
	 width = Param.WC2 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1 ,
	 texname = 'C2' ,
	 antitexname = 'C2bar' ) 
 
C2bar = C2.anti() 
 
 
nu1 = Particle(pdg_code =12, 
	 name = 'nu1' ,
	 antiname = 'nu1' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu1 ,
	 width = Param.Wnu1 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu1' ,
	 antitexname = 'nu1' ) 
 
nu2 = Particle(pdg_code =14, 
	 name = 'nu2' ,
	 antiname = 'nu2' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu2 ,
	 width = Param.Wnu2 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu2' ,
	 antitexname = 'nu2' ) 
 
nu3 = Particle(pdg_code =16, 
	 name = 'nu3' ,
	 antiname = 'nu3' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu3 ,
	 width = Param.Wnu3 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu3' ,
	 antitexname = 'nu3' ) 
 
nu4 = Particle(pdg_code =112, 
	 name = 'nu4' ,
	 antiname = 'nu4' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu4 ,
	 width = Param.Wnu4 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu4' ,
	 antitexname = 'nu4' ) 
 
nu5 = Particle(pdg_code =114, 
	 name = 'nu5' ,
	 antiname = 'nu5' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu5 ,
	 width = Param.Wnu5 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu5' ,
	 antitexname = 'nu5' ) 
 
nu6 = Particle(pdg_code =116, 
	 name = 'nu6' ,
	 antiname = 'nu6' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Mnu6 ,
	 width = Param.Wnu6 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu6' ,
	 antitexname = 'nu6' ) 
 
e1 = Particle(pdg_code =11, 
	 name = 'e1' ,
	 antiname = 'e1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e1' ,
	 antitexname = 'e1bar' ) 
 
e1bar = e1.anti() 
 
 
e2 = Particle(pdg_code =13, 
	 name = 'e2' ,
	 antiname = 'e2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e2' ,
	 antitexname = 'e2bar' ) 
 
e2bar = e2.anti() 
 
 
e3 = Particle(pdg_code =15, 
	 name = 'e3' ,
	 antiname = 'e3bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e3' ,
	 antitexname = 'e3bar' ) 
 
e3bar = e3.anti() 
 
 
d1 = Particle(pdg_code =1, 
	 name = 'd1' ,
	 antiname = 'd1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd1' ,
	 antitexname = 'd1bar' ) 
 
d1bar = d1.anti() 
 
 
d2 = Particle(pdg_code =3, 
	 name = 'd2' ,
	 antiname = 'd2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd2' ,
	 antitexname = 'd2bar' ) 
 
d2bar = d2.anti() 
 
 
d3 = Particle(pdg_code =5, 
	 name = 'd3' ,
	 antiname = 'd3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd3' ,
	 antitexname = 'd3bar' ) 
 
d3bar = d3.anti() 
 
 
u1 = Particle(pdg_code =2, 
	 name = 'u1' ,
	 antiname = 'u1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u1' ,
	 antitexname = 'u1bar' ) 
 
u1bar = u1.anti() 
 
 
u2 = Particle(pdg_code =4, 
	 name = 'u2' ,
	 antiname = 'u2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u2' ,
	 antitexname = 'u2bar' ) 
 
u2bar = u2.anti() 
 
 
u3 = Particle(pdg_code =6, 
	 name = 'u3' ,
	 antiname = 'u3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu3 ,
	 width = Param.Wu3 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u3' ,
	 antitexname = 'u3bar' ) 
 
u3bar = u3.anti() 
 
 
sd1 = Particle(pdg_code =1000001, 
	 name = 'sd1' ,
	 antiname = 'sd1c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd1 ,
	 width = Param.Wsd1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd1' ,
	 antitexname = 'sd1c' ) 
 
sd1c = sd1.anti() 
 
 
sd2 = Particle(pdg_code =1000003, 
	 name = 'sd2' ,
	 antiname = 'sd2c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd2 ,
	 width = Param.Wsd2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd2' ,
	 antitexname = 'sd2c' ) 
 
sd2c = sd2.anti() 
 
 
sd3 = Particle(pdg_code =1000005, 
	 name = 'sd3' ,
	 antiname = 'sd3c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd3 ,
	 width = Param.Wsd3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd3' ,
	 antitexname = 'sd3c' ) 
 
sd3c = sd3.anti() 
 
 
sd4 = Particle(pdg_code =2000001, 
	 name = 'sd4' ,
	 antiname = 'sd4c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd4 ,
	 width = Param.Wsd4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd4' ,
	 antitexname = 'sd4c' ) 
 
sd4c = sd4.anti() 
 
 
sd5 = Particle(pdg_code =2000003, 
	 name = 'sd5' ,
	 antiname = 'sd5c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd5 ,
	 width = Param.Wsd5 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd5' ,
	 antitexname = 'sd5c' ) 
 
sd5c = sd5.anti() 
 
 
sd6 = Particle(pdg_code =2000005, 
	 name = 'sd6' ,
	 antiname = 'sd6c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msd6 ,
	 width = Param.Wsd6 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1/3 ,
	 texname = 'sd6' ,
	 antitexname = 'sd6c' ) 
 
sd6c = sd6.anti() 
 
 
su1 = Particle(pdg_code =1000002, 
	 name = 'su1' ,
	 antiname = 'su1c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu1 ,
	 width = Param.Wsu1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su1' ,
	 antitexname = 'su1c' ) 
 
su1c = su1.anti() 
 
 
su2 = Particle(pdg_code =1000004, 
	 name = 'su2' ,
	 antiname = 'su2c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu2 ,
	 width = Param.Wsu2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su2' ,
	 antitexname = 'su2c' ) 
 
su2c = su2.anti() 
 
 
su3 = Particle(pdg_code =1000006, 
	 name = 'su3' ,
	 antiname = 'su3c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu3 ,
	 width = Param.Wsu3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su3' ,
	 antitexname = 'su3c' ) 
 
su3c = su3.anti() 
 
 
su4 = Particle(pdg_code =2000002, 
	 name = 'su4' ,
	 antiname = 'su4c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu4 ,
	 width = Param.Wsu4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su4' ,
	 antitexname = 'su4c' ) 
 
su4c = su4.anti() 
 
 
su5 = Particle(pdg_code =2000004, 
	 name = 'su5' ,
	 antiname = 'su5c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu5 ,
	 width = Param.Wsu5 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su5' ,
	 antitexname = 'su5c' ) 
 
su5c = su5.anti() 
 
 
su6 = Particle(pdg_code =2000006, 
	 name = 'su6' ,
	 antiname = 'su6c' ,
	 spin = 1 ,
	 color = 3 ,
	 mass = Param.Msu6 ,
	 width = Param.Wsu6 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 2/3 ,
	 texname = 'su6' ,
	 antitexname = 'su6c' ) 
 
su6c = su6.anti() 
 
 
se1 = Particle(pdg_code =1000011, 
	 name = 'se1' ,
	 antiname = 'se1c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse1 ,
	 width = Param.Wse1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se1' ,
	 antitexname = 'se1c' ) 
 
se1c = se1.anti() 
 
 
se2 = Particle(pdg_code =1000013, 
	 name = 'se2' ,
	 antiname = 'se2c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse2 ,
	 width = Param.Wse2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se2' ,
	 antitexname = 'se2c' ) 
 
se2c = se2.anti() 
 
 
se3 = Particle(pdg_code =1000015, 
	 name = 'se3' ,
	 antiname = 'se3c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse3 ,
	 width = Param.Wse3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se3' ,
	 antitexname = 'se3c' ) 
 
se3c = se3.anti() 
 
 
se4 = Particle(pdg_code =2000011, 
	 name = 'se4' ,
	 antiname = 'se4c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse4 ,
	 width = Param.Wse4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se4' ,
	 antitexname = 'se4c' ) 
 
se4c = se4.anti() 
 
 
se5 = Particle(pdg_code =2000013, 
	 name = 'se5' ,
	 antiname = 'se5c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse5 ,
	 width = Param.Wse5 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se5' ,
	 antitexname = 'se5c' ) 
 
se5c = se5.anti() 
 
 
se6 = Particle(pdg_code =2000015, 
	 name = 'se6' ,
	 antiname = 'se6c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mse6 ,
	 width = Param.Wse6 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'se6' ,
	 antitexname = 'se6c' ) 
 
se6c = se6.anti() 
 
 
nI1 = Particle(pdg_code =4000012, 
	 name = 'nI1' ,
	 antiname = 'nI1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI1 ,
	 width = Param.WnI1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI1' ,
	 antitexname = 'nI1' ) 
 
nI2 = Particle(pdg_code =4000014, 
	 name = 'nI2' ,
	 antiname = 'nI2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI2 ,
	 width = Param.WnI2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI2' ,
	 antitexname = 'nI2' ) 
 
nI3 = Particle(pdg_code =4000016, 
	 name = 'nI3' ,
	 antiname = 'nI3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI3 ,
	 width = Param.WnI3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI3' ,
	 antitexname = 'nI3' ) 
 
nI4 = Particle(pdg_code =5000012, 
	 name = 'nI4' ,
	 antiname = 'nI4' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI4 ,
	 width = Param.WnI4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI4' ,
	 antitexname = 'nI4' ) 
 
nI5 = Particle(pdg_code =5000014, 
	 name = 'nI5' ,
	 antiname = 'nI5' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI5 ,
	 width = Param.WnI5 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI5' ,
	 antitexname = 'nI5' ) 
 
nI6 = Particle(pdg_code =5000016, 
	 name = 'nI6' ,
	 antiname = 'nI6' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnI6 ,
	 width = Param.WnI6 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nI6' ,
	 antitexname = 'nI6' ) 
 
nR1 = Particle(pdg_code =1000012, 
	 name = 'nR1' ,
	 antiname = 'nR1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR1 ,
	 width = Param.WnR1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR1' ,
	 antitexname = 'nR1' ) 
 
nR2 = Particle(pdg_code =1000014, 
	 name = 'nR2' ,
	 antiname = 'nR2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR2 ,
	 width = Param.WnR2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR2' ,
	 antitexname = 'nR2' ) 
 
nR3 = Particle(pdg_code =1000016, 
	 name = 'nR3' ,
	 antiname = 'nR3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR3 ,
	 width = Param.WnR3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR3' ,
	 antitexname = 'nR3' ) 
 
nR4 = Particle(pdg_code =2000012, 
	 name = 'nR4' ,
	 antiname = 'nR4' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR4 ,
	 width = Param.WnR4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR4' ,
	 antitexname = 'nR4' ) 
 
nR5 = Particle(pdg_code =2000014, 
	 name = 'nR5' ,
	 antiname = 'nR5' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR5 ,
	 width = Param.WnR5 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR5' ,
	 antitexname = 'nR5' ) 
 
nR6 = Particle(pdg_code =2000016, 
	 name = 'nR6' ,
	 antiname = 'nR6' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MnR6 ,
	 width = Param.WnR6 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'nR6' ,
	 antitexname = 'nR6' ) 
 
h1 = Particle(pdg_code =25, 
	 name = 'h1' ,
	 antiname = 'h1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh1 ,
	 width = Param.Wh1 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h1' ,
	 antitexname = 'h1' ) 
 
h2 = Particle(pdg_code =35, 
	 name = 'h2' ,
	 antiname = 'h2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh2 ,
	 width = Param.Wh2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h2' ,
	 antitexname = 'h2' ) 
 
h3 = Particle(pdg_code =9900025, 
	 name = 'h3' ,
	 antiname = 'h3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh3 ,
	 width = Param.Wh3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h3' ,
	 antitexname = 'h3' ) 
 
h4 = Particle(pdg_code =9900035, 
	 name = 'h4' ,
	 antiname = 'h4' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh4 ,
	 width = Param.Wh4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h4' ,
	 antitexname = 'h4' ) 
 
Ah1 = Particle(pdg_code =999900, 
	 name = 'Ah1' ,
	 antiname = 'Ah1' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 GoldstoneBoson = True ,
	 texname = 'Ah1' ,
	 antitexname = 'Ah1' ) 
 
Ah2 = Particle(pdg_code =999901, 
	 name = 'Ah2' ,
	 antiname = 'Ah2' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 GoldstoneBoson = True ,
	 texname = 'Ah2' ,
	 antitexname = 'Ah2' ) 
 
Ah3 = Particle(pdg_code =36, 
	 name = 'Ah3' ,
	 antiname = 'Ah3' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MAh3 ,
	 width = Param.WAh3 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'Ah3' ,
	 antitexname = 'Ah3' ) 
 
Ah4 = Particle(pdg_code =9900036, 
	 name = 'Ah4' ,
	 antiname = 'Ah4' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MAh4 ,
	 width = Param.WAh4 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'Ah4' ,
	 antitexname = 'Ah4' ) 
 
Hm1 = Particle(pdg_code =999902, 
	 name = 'Hm1' ,
	 antiname = 'Hm1c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 GoldstoneBoson = True ,
	 texname = 'Hm1' ,
	 antitexname = 'Hm1c' ) 
 
Hm1c = Hm1.anti() 
 
 
Hm2 = Particle(pdg_code =-37, 
	 name = 'Hm2' ,
	 antiname = 'Hm2c' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MHm2 ,
	 width = Param.WHm2 ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 texname = 'Hm2' ,
	 antitexname = 'Hm2c' ) 
 
Hm2c = Hm2.anti() 
 
 
g = Particle(pdg_code =21, 
	 name = 'g' ,
	 antiname = 'g' ,
	 spin = 3 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'g' ,
	 antitexname = 'g' ) 
 
A = Particle(pdg_code =22, 
	 name = 'A' ,
	 antiname = 'A' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'A' ,
	 antitexname = 'A' ) 
 
Z = Particle(pdg_code =23, 
	 name = 'Z' ,
	 antiname = 'Z' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'Z' ,
	 antitexname = 'Z' ) 
 
Zp = Particle(pdg_code =31, 
	 name = 'Zp' ,
	 antiname = 'Zp' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MZp ,
	 width = Param.WZp ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'Zp' ,
	 antitexname = 'Zp' ) 
 
Wm = Particle(pdg_code =-24, 
	 name = 'Wm' ,
	 antiname = 'Wmc' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = -1 ,
	 texname = 'Wm' ,
	 antitexname = 'Wmc' ) 
 
Wmc = Wm.anti() 
 
 
gG = Particle(pdg_code =999903, 
	 name = 'gG' ,
	 antiname = 'gGc' ,
	 spin = -1 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gG' ,
	 antitexname = 'gGc' ) 
 
gGc = gG.anti() 
 
 
gA = Particle(pdg_code =999904, 
	 name = 'gA' ,
	 antiname = 'gAc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gA' ,
	 antitexname = 'gAc' ) 
 
gAc = gA.anti() 
 
 
gZ = Particle(pdg_code =999905, 
	 name = 'gZ' ,
	 antiname = 'gZc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gZ' ,
	 antitexname = 'gZc' ) 
 
gZc = gZ.anti() 
 
 
gZp = Particle(pdg_code =999906, 
	 name = 'gZp' ,
	 antiname = 'gZpc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MZp ,
	 width = Param.WZp ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gZp' ,
	 antitexname = 'gZpc' ) 
 
gZpc = gZp.anti() 
 
 
gWm = Particle(pdg_code =999907, 
	 name = 'gWm' ,
	 antiname = 'gWmc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = -1 ,
	 texname = 'gWm' ,
	 antitexname = 'gWmc' ) 
 
gWmc = gWm.anti() 
 
 
gWpC = Particle(pdg_code =999908, 
	 name = 'gWpC' ,
	 antiname = 'gWpCc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWm ,
	 width = Param.WWm ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 1 ,
	 texname = 'gWpC' ,
	 antitexname = 'gWpCc' ) 
 
gWpCc = gWpC.anti() 
 
 
