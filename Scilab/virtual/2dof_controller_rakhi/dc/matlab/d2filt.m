% function [B,A,k] = d2filt(num,den)
% Converts numerator and denominator in powers of z to 
% filter form, in powers of z^{-1}
% k is the resulting delay

function [B,A,k] = d2filt(num,den)
B = num; A = den; k = length(A) - length(B);
