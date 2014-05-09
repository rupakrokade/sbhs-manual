// Updated(31-7-07)
// Input arguments are numerator and denominator
// polynomials' co efficients  in ascending
// powers of z^-1

// Scicos blocks need input polynomials
// with positive powers of z

function [nume,deno] = cosfil_ip(num,den)

[Nn,Nd] = polyno(num,'z');
[Dn,Dd] = polyno(den,'z');
nume = Nn*Dd;
deno = Nd*Dn;

endfunction;

