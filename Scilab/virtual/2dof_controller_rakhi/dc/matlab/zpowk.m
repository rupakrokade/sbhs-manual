function [zk,dzk] = zpowk(k)
zk = zeros(1,k+1); zk(1,k+1) = 1;
dzk = k;
