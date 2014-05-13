% function [P,degP] = clcoef(Q,degQ)
% MATLAB FUNCTION clcoef TO CLEAR ZERO LEADING
% COEFFICIENT MATRICES OF A POLYNOMIAL MATRIX

% H. Kwakernaak, July, 1990
% Modified by Kannan Moudgalya in Nov. 1992

function [P,degP] = clcoef(Q,degQ)

[rQ,cQ] = polsize(Q,degQ);

if all(all(Q==0))
  P = zeros(rQ,cQ);
  degP = 0;
else
  P = Q; degP = degQ; rP = rQ; cP = cQ;
  j = degP+1;
  while j >= 0
    if norm(P(:,(j-1)*cP+1:j*cP),inf) < (1e-8)*norm(P,inf)
       P = P(:,1:(j-1)*cP);
       degP = degP-1;
    else
       j = 0;
    end
    j = j-1;
  end
end
