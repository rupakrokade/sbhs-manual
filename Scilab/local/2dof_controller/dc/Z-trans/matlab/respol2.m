%            z^2 + z          A          B           C
%  G(z) =  -----------  =  ------- + --------- + ---------
%           (z - 1)^3      (z - 1)   (z - 1)^2   (z - 1)^3
num = [1 1 0];
den = conv([1 -1],conv([1 -1],[1 -1])); % poly multiplication
[res,pol] = respol(num,den)

% % Output Interpretation:
% % res =
% %     0.0000      A = 0  
% %     1.0000      B = 1
% %     2.0000      C = 2
% % pol =
% %     1.0000      (z - 1)
% %     1.0000      (z - 1)^2
% %     1.0000      (z - 1)^3
