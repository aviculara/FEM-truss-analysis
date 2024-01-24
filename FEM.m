clc;
clear all;

% PD : Problem Dimension
% NPE : Number of Nodes per Element

% NoN : Number of Nodes
% NoE : Number of Elements

% NL : Nodes List [ NoN * PD ]
% EL : Elements List [ NoE * NPE ]

% ENL : Extended Node List [ NoN * (6*PD)]

% DOFs : Degrees of Freedom

format long

[ENL,DOFs,DOCs] = assign_BCs(ENL);


K = assemble_stiffness(ENL,EL,NL,E,A);

Fp = assemble_forces(ENL, NL);

Up = assemble_displacements(ENL, NL);

%K_reduced = K(1:DOFs,1:DOFs);

Kpu = K(1:DOFs,1:DOFs);
Kpp = K(1:DOFs,DOFs+1:DOFs+DOCs);
Kuu = K(DOFs+1:DOFs+DOCs,1:DOFs);
Kup = K(DOFs+1:DOFs+DOCs,DOFs+1:DOFs+DOCs);

F = Fp - K(1:DOFs,DOFs+1:(DOFs+DOCs)) * Up;

F = Fp - Kpp * Up;

Uu = inv(Kpu) * F;

Fu = Kuu*Uu + Kup*Up;

ENL = update_nodes(ENL,Uu,NL,Fu);

Node_flag = 'on';
Element_flag = 'on';

mag = 400 %magnification
post_process(NL , EL , ENL , E , Node_flag , Element_flag , mag)




