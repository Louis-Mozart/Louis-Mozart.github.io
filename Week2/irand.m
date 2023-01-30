 function r = irand(lower,upper,nr)
%function r = irand(lower,upper,nr)
%uniformly distributed integers in the interval [lower,upper] 
%INPUT    lower   the lower limit
%                 scalar or row vector
%         upper   the upperlimit
%                 scalar or row vector
%         nr      n of random integers created
%OUTPUT   r       the random numbers

lower = lower-1;
no    = length(lower);
one   = ones(nr,1);
r=fix(one*lower + rand(nr,no).*(one*(upper-lower)))+1;
