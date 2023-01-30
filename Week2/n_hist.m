function normed_hist =  n_hist(n,x,flag)

% function normed_hist =  n_hist(n,x,flag); 
% The function normalizes the histogram produced by HIST
% into a PDF (continuous or discrete).
% INPUT   
%         n        the histogram values from HIST
%         x        the bins, histogram intervals from HIST
%        flag      '1' for continuous, '2' for discrete
% OUTPUT   
%    normed_hist   the normalized PDF

if (nargin == 2)
    flag = 1;
end

if (flag==1)
   normed_hist = n/sum(n)/(x(2)-x(1)); %continuous
else
   normed_hist = n/sum(n); %discrete
end

