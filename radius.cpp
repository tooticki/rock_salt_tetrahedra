// the radius is the root of A*x^2+B*x*C where A,B,C are complicate polynomials in the edge lengths and sphere radii
// the formulas for A,B,C are here specialized, depending on the radii and assuming that there is contact along ab, ac and ad -> much lighter (and precise) formulas

I radius(I ab, I ac, I ad, I bc, I bd, I cd, bool verbose=false)
{
    I x=square(bc);
    I y=square(bd);
    I z=square(cd);
    #if defined (uuuu)
    I A=(y*(I(-8)+x)+I(-8)*x)*z+I(4)*square(x-y)+I(4)*square(z);
    I B=z*((I(-8)+x)*I(2)*y+I(-16)*x)+I(8)*square(x-y)+I(8)*square(z);
    I C=z*x*y;
    #elif defined (rrrr)
    I A=z*(y*(I(16)*r+I(-8)+x)+(I(-1)+I(2)*r)*I(8)*x)+(I(-1)+I(2)*r)*(I(-4)*square(x-y)+I(-4)*square(z));
    I B=((I(-2)+I(5)*r)*I(8)*x-y*(I(-40)*r+I(16)+x*r))*I(-2)*z+(I(-2)+I(5)*r)*(I(8)*square(x-y)+I(8)*square(z));
    I C=(I(1)-I(2)*r)*z*y*x;
    #elif defined (uurr)
    I A=(I(-64)*r+I(-6)*x+I(36)+y*(I(-6)+x))*z+r*I(4)*square(x-y)+I(4)*square(z);
    I B=z*(I(112)*r+(I(4)+I(2)*r-x)*I(-2)*y+I(-40)+(I(2)+r)*I(-4)*x)+(I(-1)+r)*I(-4)*square(x-y)+I(8)*square(z);
    I C=z*(I(-48)*r+(I(-1)+I(2)*r)*I(2)*x+I(20)+y*(I(4)*r+I(-2)+x));
    #elif defined (rruu)
    I A=(I(-1)+I(2)*r)*I(-4)*square(z)+z*(I(-544)*r+(I(-3)+I(4)*r)*I(2)*x+I(228)+y*(I(8)*r+I(-6)+x))+r*I(4)*square(x-y);
    I B=(I(-60)*r+I(24)+(I(-1)+I(4)*r)*I(2)*x-y*(I(-8)*r+I(2)+x*r))*I(-2)*z+(I(-1)+r)*I(-4)*square(x-y)+(I(-2)+I(5)*r)*I(8)*square(z);
    I C=z*(I(-280)*r+I(116)+(I(-5)+I(12)*r)*I(2)*x-y*(I(-24)*r+I(10)+x*(I(-1)+I(2)*r)));
    #elif defined (urrr)
    I A=I(4)*r*(square(x-y)+square(z))-(I(8)*r*x+(I(8)*r-x)*y)*z;
    I B=(I(4)-I(4)*r)*(square(x-y)+square(z))-I(2)*((I(4)-I(4)*r)*x+(I(4)-I(4)*r-x)*y)*z;
    I C=x*y*z;
    #elif defined (rrru)
    I A=(I(-57)+I(136)*r)*I(-4)*x+r*I(4)*square(x)+z*(y*(I(16)*r+I(-8)+x)+(I(-3)+I(4)*r)*I(2)*x)+(I(-3)+I(4)*r)*y*I(2)*x+(I(-1)+I(2)*r)*(I(-4)*square(y)+I(-4)*square(z));
    I B=(I(-1)+r)*I(-4)*square(x)+(I(-2)+I(5)*r)*I(24)*x+(I(-2)+I(5)*r)*(I(8)*square(y)+I(8)*square(z))+(I(-1)+I(4)*r)*y*I(-4)*x+((I(-1)+I(4)*r)*I(2)*x-y*(I(-40)*r+I(16)+x*r))*I(-2)*z;
    I C=(I(-5)+I(12)*r)*y*I(2)*x+(I(-29)+I(70)*r)*I(-4)*x-((I(-1)+I(2)*r)*x*y+(I(-5)+I(12)*r)*I(-2)*x)*z;
    #elif defined (ruuu)
    I A=I(4)*r*square(x-y)+z*((x-I(8)*r)*(y-I(8)*r)+I(128)*r-I(64)+I(4)*r*z);
    I B=(I(4)-I(4)*r)*square(x-y)+I(2)*r*z*((x-I(4)*r-I(4))*(y-I(4)*r-I(4))-I(32)+(I(2)*r+I(2))*z);
    I C=(I(1)-I(2)*r)*x*y*z;
    #elif defined (uuur)
    I A=I(4)*(x*(I(4)*r*(I(16)-x)-(y-I(6))*(z-I(6)))-I(4)*square(y-z));
    I B=I(4)*(-I(8)*square(y-z)+I(2)*x*((y-I(2)*r-I(4))*(I(2)*r+I(4)-z)+I(40)-I(48)*r+(I(2)*r-I(2))*x));
    I C=I(4)*x*(I(2)-I(4)*r-y)*(z-I(2)+I(4)*r);
    #else
    // insert the ugly general formula for A,B,C here?
    #endif
    if (verbose)
    {
        printf("A=%f,%f\n",lower(A),upper(A));
        printf("B=%f,%f\n",lower(B),upper(B));
        printf("C=%f,%f\n",lower(C),upper(C));
        I X=(A*hull(I(0),r)+B)*hull(I(0),r)+C;
        printf("A*r^2+B*r+C=%f,%f\n",lower(X),upper(X));
    }
    // no chance to have a root smaller than r
    if (!zero_in((A*hull(I(0),r)+B)*hull(I(0),r)+C)) return I(INFINITY);
    // usual formula through discriminant
    I D=square(B)-I(4)*A*C;
    if (upper(D)<=0) return I(INFINITY); // no real root (seems never happen)
    I rs=(upper(C)<0 ? (-B+sqrt(D))/(I(2)*A) : (-B-sqrt(D))/(I(2)*A));
    // if A contains 0 or is very small: use the continuity of the roots in the coefficients!
    if (zero_in(A)||zero_in(C))
    {
        I X=I(4)*A*C/square(B);
        X=hull(x,I(0)); // the interval x must contain 0
        if (upper(x)<0.78) rs=intersect(rs,-C/B*(I(1)+X));
    }
    return rs;
}

