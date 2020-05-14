clear;clc;
m=3; M=4;k=50;
K=[k,-k,0;-k,2*k,-k;0,-k,k];
S=[m,0,0;0,M,0;0,0,m];
[O,L]=eig(K,S)
OL=sqrt(L)
