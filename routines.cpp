

// return false if x<y+z (or one of the permutation) does not hold 
bool trig(I x, I y, I z)
{
    return (lower(x)<upper(y+z) && lower(y)<upper(x+z) && lower(z)<upper(x+y));
}

// return false if the facial condition is not satisfied
bool facial(I ab, I ac, I ad, I bc, I bd, I cd)
{
    return (trig(ab,ac,bc) && trig(ab,bd,ad) && trig(ac,cd,ad) && trig(bc,bd,cd));
}

// return false if the cayley-menger nonnegative determinant is not satisfied
bool cayley_menger(I ab, I ac, I ad, I bc, I bd, I cd)
{
    return (upper(square(ab*ac*bd)+square(ab*ac*cd)+square(ab*ad*bc)+square(ab*ad*cd)+square(ab*bc*cd)+square(ab*bd*cd)+square(ac*ad*bc)+square(ac*ad*bd)+square(ac*bc*bd)+square(ac*bd*cd)+square(ad*bc*bd)+square(ad*bc*cd)-square(ab*ab*cd)-square(ab*ac*bc)-square(ab*ad*bd)-square(ab*cd*cd)-square(ac*ac*bd)-square(ac*ad*cd)-square(ac*bd*bd)-square(ad*ad*bc)-square(ad*bc*bc)-square(bc*bd*cd))>0);
}

// return false if edge lengths are not compatible with a tetrahedron
bool tetrahedral(I ab, I ac, I ad, I bc, I bd, I cd)
{
    return (facial(ab,ac,ad,bc,bd,cd) && cayley_menger(ab,ac,ad,bc,bd,cd));
}

// solid angle in A
I solid(I ab, I ac, I ad, I bc, I bd, I cd)
{
    I ab2=square(ab);
    I ac2=square(ac);
    I ad2=square(ad);
    I bc2=square(bc);
    I bd2=square(bd);
    I cd2=square(cd);
    return I(2)*atan(sqrt((ac2*bd2 + (bc2 - bd2)*ad2 - (ab2 - ac2 - ad2 - bc2 - bd2 + cd2)*cd2)*ab2 - (ab2*bc2 - (bc2 - cd2)*ad2 + (ac2 - ad2 - bc2 + bd2 - cd2)*bd2)*ac2 - (bd2*cd2 + (ad2 + bc2 - bd2 - cd2)*ad2)*bc2)/(I(2)*ab*ac*ad + (ac2 + ad2 - cd2)*ab + (ab2 + ad2 - bd2)*ac + (ab2 + ac2 - bc2)*ad));
}

// volume of the tetrahedron
I vol(I ab, I ac, I ad, I bc, I bd, I cd)
{
    I ab2=square(ab);
    I ac2=square(ac);
    I ad2=square(ad);
    I bc2=square(bc);
    I bd2=square(bd);
    I cd2=square(cd);
    #if defined (ruuu) // optimized for 3 contacts
    return sqrt(-I(2)*square(bc2-bd2)+cd2*((I(4)*bc2-(bc2-I(4))*bd2)-I(2)*cd2))/I(12);
    #elif defined (rruu) // optimized for 3 contacts
    return sqrt((I(-2))*(square(bc2-bd2))-cd2*((I(-3)+I(4)*r)*(I(2)*bc2)+(I(-160))*r+bd2*(I(8)*r+I(-6)+bc2)+I(68)+(I(-1)+I(2)*r)*((I(-4))*cd2)))/I(12);
    #else
    return sqrt((ac2*bd2+(bc2-bd2)*ad2-(ab2-ac2-ad2-bc2-bd2+cd2)*cd2)*ab2-(ab2*bc2-(bc2-cd2)*ad2+(ac2-ad2-bc2+bd2-cd2)*bd2)*ac2-(bd2*cd2+(ad2+bc2-bd2-cd2)*ad2)*bc2)/I(12);
    #endif
}


// volume of the part covered by balls
I cov(I ab, I ac, I ad, I bc, I bd, I cd)
{
    return solid(ab,ac,ad,bc,bd,cd)/I(3)*pow(ra,3)+solid(bc,bd,ab,cd,ac,ad)/I(3)*pow(rb,3)+solid(cd,ac,bc,ad,bd,ab)/I(3)*pow(rc,3)+solid(ad,bd,cd,ab,ac,bc)/I(3)*pow(rd,3);
}

// density
I density(I ab, I ac, I ad, I bc, I bd, I cd)
{
    return cov(ab,ac,ad,bc,bd,cd)/vol(ab,ac,ad,bc,bd,cd);
}

