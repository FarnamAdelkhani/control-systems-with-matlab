syms s t
Ys = ((1/s)+(2/s^2)+(1/(s+1))+(2/(s+1)^2));
ilaplace(Ys)
laplace(ilaplace(Ys)) % to see partial fraction expansion