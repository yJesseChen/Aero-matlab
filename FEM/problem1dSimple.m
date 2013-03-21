% 1D Simple Bar 
% clear memory
clear all
 
% E: modulus of elasticity
% A: area of cross section
% L: length of bar
E=30e6; A=1; L=[30 30 30];  
 
% numberElements: number of elements
numberElements=3; 
% numberNodes: number of nodes
numberNodes=4;
% generation of coordinates and connectivities
elementNodes=[1 2;2 3;3 4];
nodeCoordinates=[0 30 60 90];
% for structure:
   % displacements: displacement vector
   % force : force vector
   % stiffness: stiffness matrix
force=zeros(numberNodes,1);
stiffness=zeros(numberNodes,numberNodes); 
% applied load at node 2
force(2)=3000.0;
 
% computation of the system stiffness matrix
for e=1:numberElements; 
  % elementDof: element degrees of freedom (Dof)
  elementDof=elementNodes(e,:) ;
  k(e)=E*A/L(e) ;
  stiffness(elementDof,elementDof)=...
       stiffness(elementDof,elementDof)+k(e)*[1 -1;-1 1];
end
% boundary conditions and solution
% prescribed dofs
prescribedDof=[1;4];
% solution
GDof=numberNodes;
displacements=solution(GDof,prescribedDof,stiffness,force);
% output displacements/reactions
outputDisplacementsReactions(displacements,stiffness, ...
    numberNodes,prescribedDof,force)
