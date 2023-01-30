function c = U_prior(a,c1,c2)
% Uniform distribution with parameter c1 and c2

if (c1<=a(1)<=c2) & (c1<=a(2)<=c2)

    c = 1;

else

    c= 0;

end