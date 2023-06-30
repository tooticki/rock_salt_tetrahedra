from sage.symbolic.expression_conversions import RingConverter
RIF = RealIntervalField(10000)
R100 = RingConverter(RIF)


var('x,y,z,ra,rb,rc,rd,ab,ac,ad,bc,bd,cd')
r = sqrt(2)-1


A_def=1/64*(4*ab^2*ra^2 - 8*ab^2*ra*rc + 4*ab^2*rc^2 + (ra^2 - 2*ra*rb + rb^2)*(ab + (ac^2 - bc^2)/ab)^2 - 4*(ab*ra^2 - ab*ra*rb - (ab*ra - ab*rb)*rc)*(ab + (ac^2 - bc^2)/ab))*(4*sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2) - ((ab + (ac^2 - bc^2)/ab)*(ab - (ac^2 - bc^2)/ab + 2*(ad^2 - bd^2)/ab) - 4*ad^2 + 4*cd^2)/sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2))^2 - 1/4*(4*ab^2*ra^2 - 4*ab^2*ra*rc - 2*(ab*ra^2 - ab*ra*rb - (ab*ra - ab*rb)*rd)*(ab + (ac^2 - bc^2)/ab) - (2*ab*ra^2 - 2*ab*ra*rb - (ra^2 - 2*ra*rb + rb^2)*(ab + (ac^2 - bc^2)/ab) - 2*(ab*ra - ab*rb)*rc)*(ab + (ad^2 - bd^2)/ab) - 4*(ab^2*ra - ab^2*rc)*rd)*sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2)*(4*sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2) - ((ab + (ac^2 - bc^2)/ab)*(ab - (ac^2 - bc^2)/ab + 2*(ad^2 - bd^2)/ab) - 4*ad^2 + 4*cd^2)/sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2)) - 1/4*(4*ab^2*ra^2 - 8*ab^2*ra*rd + 4*ab^2*rd^2 + (ra^2 - 2*ra*rb + rb^2)*(ab + (ad^2 - bd^2)/ab)^2 - 4*(ab*ra^2 - ab*ra*rb - (ab*ra - ab*rb)*rd)*(ab + (ad^2 - bd^2)/ab))*((ab + (ac^2 - bc^2)/ab)^2 - 4*ac^2) - 1/64*(4*ab^2*ra^2 - 8*ab^2*ra*rc + 4*ab^2*rc^2 + (ra^2 - 2*ra*rb + rb^2)*(ab + (ac^2 - bc^2)/ab)^2 + ((ab + (ac^2 - bc^2)/ab)^2 - 4*ac^2)*(ab^2 - ra^2 + 2*ra*rb - rb^2) - 4*(ab*ra^2 - ab*ra*rb - (ab*ra - ab*rb)*rc)*(ab + (ac^2 - bc^2)/ab))*(16*(ab + (ad^2 - bd^2)/ab)^2 - 64*ad^2 + (4*sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2) - ((ab + (ac^2 - bc^2)/ab)*(ab - (ac^2 - bc^2)/ab + 2*(ad^2 - bd^2)/ab) - 4*ad^2 + 4*cd^2)/sqrt(-1/4*(ab + (ac^2 - bc^2)/ab)^2 + ac^2))^2)

B_def=-(bc^4 - 2*bc^2*bd^2 + bd^4 + cd^4 - 2*(bc^2 + bd^2)*cd^2)*ra^3 + (cd^4 + (ac^2 - ad^2)*bc^2 - (ac^2 - ad^2)*bd^2 + (2*ab^2 - ac^2 - ad^2 - bc^2 - bd^2)*cd^2)*ra*rb^2 - (ac^4 - 2*ac^2*ad^2 + ad^4 + cd^4 - 2*(ac^2 + ad^2)*cd^2)*rb^3 - (ab^4 - 2*ab^2*ad^2 + ad^4 + bd^4 - 2*(ab^2 + ad^2)*bd^2)*rc^3 - (ab^4 - 2*ab^2*ac^2 + ac^4 + bc^4 - 2*(ab^2 + ac^2)*bc^2)*rd^3 + ((bd^4 + (ab^2 - ad^2)*bc^2 - (ab^2 - 2*ac^2 + ad^2 + bc^2)*bd^2 - (ab^2 - ad^2 + bd^2)*cd^2)*ra + (ab^2*ac^2 + ad^4 + 2*ad^2*bc^2 - (ab^2 + ac^2)*ad^2 - (ac^2 + ad^2)*bd^2 - (ab^2 + ad^2 - bd^2)*cd^2)*rb)*rc^2 + ((bc^4 - (ab^2 + ac^2 - 2*ad^2)*bc^2 + (ab^2 - ac^2 - bc^2)*bd^2 - (ab^2 - ac^2 + bc^2)*cd^2)*ra - (ab^2*ac^2 - ac^4 - 2*ac^2*bd^2 - (ab^2 - ac^2)*ad^2 + (ac^2 + ad^2)*bc^2 + (ab^2 + ac^2 - bc^2)*cd^2)*rb + (ab^4 - ab^2*ac^2 + 2*ab^2*cd^2 - (ab^2 - ac^2)*ad^2 - (ab^2 + ad^2)*bc^2 - (ab^2 + ac^2 - bc^2)*bd^2)*rc)*rd^2 + (ad^2*bc^4 + ac^2*bd^4 + ab^2*cd^4 - (ac^2 + ad^2)*bc^2*bd^2 - ((ab^2 + ad^2)*bc^2 + (ab^2 + ac^2 - 2*bc^2)*bd^2)*cd^2)*ra + (ab^2*cd^4 - (ac^2*ad^2 - ad^4)*bc^2 + (ac^4 - ac^2*ad^2)*bd^2 - (ab^2*ac^2 + ad^2*bc^2 + ac^2*bd^2 + (ab^2 - 2*ac^2)*ad^2)*cd^2 + (cd^4 + (ac^2 - ad^2)*bc^2 - (ac^2 - ad^2)*bd^2 + (2*ab^2 - ac^2 - ad^2 - bc^2 - bd^2)*cd^2)*ra^2)*rb + (ac^2*bd^4 - (ab^2*ad^2 - ad^4)*bc^2 - (ab^2*ac^2 + ad^2*bc^2 - (2*ab^2 - ac^2)*ad^2)*bd^2 + (ab^4 - ab^2*ad^2 - ab^2*bd^2)*cd^2 + (bd^4 + (ab^2 - ad^2)*bc^2 - (ab^2 - 2*ac^2 + ad^2 + bc^2)*bd^2 - (ab^2 - ad^2 + bd^2)*cd^2)*ra^2 + (ab^2*ac^2 + ad^4 + 2*ad^2*bc^2 - (ab^2 + ac^2)*ad^2 - (ac^2 + ad^2)*bd^2 - (ab^2 + ad^2 - bd^2)*cd^2)*rb^2)*rc + (ad^2*bc^4 + (2*ab^2*ac^2 - (ab^2 + ac^2)*ad^2)*bc^2 - (ab^2*ac^2 - ac^4 + ac^2*bc^2)*bd^2 + (ab^4 - ab^2*ac^2 - ab^2*bc^2)*cd^2 + (bc^4 - (ab^2 + ac^2 - 2*ad^2)*bc^2 + (ab^2 - ac^2 - bc^2)*bd^2 - (ab^2 - ac^2 + bc^2)*cd^2)*ra^2 - (ab^2*ac^2 - ac^4 - 2*ac^2*bd^2 - (ab^2 - ac^2)*ad^2 + (ac^2 + ad^2)*bc^2 + (ab^2 + ac^2 - bc^2)*cd^2)*rb^2 + (ab^4 - ab^2*ac^2 + 2*ab^2*cd^2 - (ab^2 - ac^2)*ad^2 - (ab^2 + ad^2)*bc^2 - (ab^2 + ac^2 - bc^2)*bd^2)*rc^2)*rd

C_def=-1/4*ad^4*bc^4 + 1/2*ac^2*ad^2*bc^2*bd^2 - 1/4*ac^4*bd^4 - 1/4*ab^4*cd^4 - 1/4*(bc^4 - 2*bc^2*bd^2 + bd^4 + cd^4 - 2*(bc^2 + bd^2)*cd^2)*ra^4 - 1/4*(ac^4 - 2*ac^2*ad^2 + ad^4 + cd^4 - 2*(ac^2 + ad^2)*cd^2)*rb^4 - 1/4*(ab^4 - 2*ab^2*ad^2 + ad^4 + bd^4 - 2*(ab^2 + ad^2)*bd^2)*rc^4 - 1/4*(ab^4 - 2*ab^2*ac^2 + ac^4 + bc^4 - 2*(ab^2 + ac^2)*bc^2)*rd^4 + 1/2*(ab^2*ad^2*bc^2 + ab^2*ac^2*bd^2)*cd^2 + 1/2*(ad^2*bc^4 + ac^2*bd^4 + ab^2*cd^4 - (ac^2 + ad^2)*bc^2*bd^2 - ((ab^2 + ad^2)*bc^2 + (ab^2 + ac^2 - 2*bc^2)*bd^2)*cd^2)*ra^2 + 1/2*(ab^2*cd^4 - (ac^2*ad^2 - ad^4)*bc^2 + (ac^4 - ac^2*ad^2)*bd^2 - (ab^2*ac^2 + ad^2*bc^2 + ac^2*bd^2 + (ab^2 - 2*ac^2)*ad^2)*cd^2 + (cd^4 + (ac^2 - ad^2)*bc^2 - (ac^2 - ad^2)*bd^2 + (2*ab^2 - ac^2 - ad^2 - bc^2 - bd^2)*cd^2)*ra^2)*rb^2 + 1/2*(ac^2*bd^4 - (ab^2*ad^2 - ad^4)*bc^2 - (ab^2*ac^2 + ad^2*bc^2 - (2*ab^2 - ac^2)*ad^2)*bd^2 + (ab^4 - ab^2*ad^2 - ab^2*bd^2)*cd^2 + (bd^4 + (ab^2 - ad^2)*bc^2 - (ab^2 - 2*ac^2 + ad^2 + bc^2)*bd^2 - (ab^2 - ad^2 + bd^2)*cd^2)*ra^2 + (ab^2*ac^2 + ad^4 + 2*ad^2*bc^2 - (ab^2 + ac^2)*ad^2 - (ac^2 + ad^2)*bd^2 - (ab^2 + ad^2 - bd^2)*cd^2)*rb^2)*rc^2 + 1/2*(ad^2*bc^4 + (2*ab^2*ac^2 - (ab^2 + ac^2)*ad^2)*bc^2 - (ab^2*ac^2 - ac^4 + ac^2*bc^2)*bd^2 + (ab^4 - ab^2*ac^2 - ab^2*bc^2)*cd^2 + (bc^4 - (ab^2 + ac^2 - 2*ad^2)*bc^2 + (ab^2 - ac^2 - bc^2)*bd^2 - (ab^2 - ac^2 + bc^2)*cd^2)*ra^2 - (ab^2*ac^2 - ac^4 - 2*ac^2*bd^2 - (ab^2 - ac^2)*ad^2 + (ac^2 + ad^2)*bc^2 + (ab^2 + ac^2 - bc^2)*cd^2)*rb^2 + (ab^4 - ab^2*ac^2 + 2*ab^2*cd^2 - (ab^2 - ac^2)*ad^2 - (ab^2 + ad^2)*bc^2 - (ab^2 + ac^2 - bc^2)*bd^2)*rc^2)*rd^2

d_def=8*(ra^3*arctan(sqrt((ac^2*bd^2 + (bc^2 - bd^2)*ad^2 - (ab^2 - ac^2 - ad^2 - bc^2 - bd^2 + cd^2)*cd^2)*ab^2 - (ab^2*bc^2 - (bc^2 - cd^2)*ad^2 + (ac^2 - ad^2 - bc^2 + bd^2 - cd^2)*bd^2)*ac^2 - (bd^2*cd^2 + (ad^2 + bc^2 - bd^2 - cd^2)*ad^2)*bc^2)/(2*ab*ac*ad + (ac^2 + ad^2 - cd^2)*ab + (ab^2 + ad^2 - bd^2)*ac + (ab^2 + ac^2 - bc^2)*ad)) + rb^3*arctan(sqrt((ac^2*bd^2 - (ac^2 - cd^2)*ab^2 + (ab^2 + ac^2 - ad^2 - bc^2 + bd^2 + cd^2)*ad^2)*bc^2 - (bc^2*cd^2 + (ad^2 - cd^2)*ab^2 - (ab^2 - ac^2 + ad^2 - bd^2 + cd^2)*ac^2)*bd^2 - (ac^2*ad^2 + (ab^2 - ac^2 - ad^2 + cd^2)*ab^2)*cd^2)/(2*ab*bc*bd + (bc^2 + bd^2 - cd^2)*ab + (ab^2 - ad^2 + bd^2)*bc + (ab^2 - ac^2 + bc^2)*bd)) + rc^3*arctan(sqrt(-(ad^2*cd^2 + (ab^2 - ad^2)*bc^2 - (ab^2 - ac^2 + ad^2 + bc^2 - bd^2)*bd^2)*ac^2 - (ab^2*bd^2 - (ab^2 - ad^2 - bc^2 + bd^2)*bc^2)*ad^2 + (ac^2*bd^2 - (ab^2 - ac^2 - ad^2 - bc^2 - bd^2 + cd^2)*ab^2 + (ad^2 - bd^2)*bc^2)*cd^2)/(2*ac*bc*cd + (bc^2 - bd^2 + cd^2)*ac + (ac^2 - ad^2 + cd^2)*bc - (ab^2 - ac^2 - bc^2)*cd)) + rd^3*arctan(sqrt(-(ac^2*bc^2 + (ab^2 - ac^2 - bc^2 + cd^2)*cd^2)*ab^2 + (ac^2*bd^2 + (ab^2 + ac^2 - ad^2 - bc^2 + bd^2 + cd^2)*bc^2 + (ab^2 - ac^2)*cd^2)*ad^2 - (ab^2*ad^2 - (ab^2 - ac^2 + bc^2 - bd^2 + cd^2)*ac^2 - (ab^2 - bc^2)*cd^2)*bd^2)/(2*ad*bd*cd - (bc^2 - bd^2 - cd^2)*ad - (ac^2 - ad^2 - cd^2)*bd - (ab^2 - ad^2 - bd^2)*cd)))/sqrt((ac^2*bd^2 + (bc^2 - bd^2)*ad^2 - (ab^2 - ac^2 - ad^2 - bc^2 - bd^2 + cd^2)*cd^2)*ab^2 - (ab^2*bc^2 - (bc^2 - cd^2)*ad^2 + (ac^2 - ad^2 - bc^2 + bd^2 - cd^2)*bd^2)*ac^2 - (bd^2*cd^2 + (ad^2 + bc^2 - bd^2 - cd^2)*ad^2)*bc^2)

rif2str = lambda x: str((RealField(400)(RIF(x).lower()), RealField(400)(RIF(x).upper())))



def draw(xmin, ymin, zmin, xmax, ymax, zmax,  x0, y0, z0, a,b,c,d, px,py):
    '''x0,y0,z0 -- target point, a,b,c,d -- formulas for A,B,C, delta
    px,py-- x- and y- coefficient for the plane passing by x0,y0,z0
    '''
    g=Polyhedron(cartesian_product([[xmin,xmax],[ymin,ymax],[zmin,zmax]])).render_wireframe()
    g+=implicit_plot3d(a*r^2+b*r+c,(x,xmin,xmax),(y,ymin,ymax),(z,zmin,zmax)) # border of the domain
    g+=point3d([x0,y0,z0],color='red',size=1) # target point
    d0=d.subs({x:x0,y:y0,z:z0})
    # Points where density = target density
    g+=implicit_plot3d(d-d0,(x,xmin,xmax),(y,ymin,ymax),(z,zmin,zmax),color='green')
    g+=implicit_plot3d(z-z0 - px*(x-x0)-py*(y-y0),(x,xmin,xmax),(y,ymin,ymax),(z,zmin,zmax), color='yellow', opacity=.6)
    return g


# -------------------------------- rrrr -------------------------------
print("---------------rrrr-------------------")
dico={ra:r,rb:r,rc:r,rd:r, ab:2*r,ac:2*r,ad:2*r, bc:x,bd:y,cd:z}

A = A_def.subs(dico).simplify_full()
B = B_def.subs(dico).simplify_full()
C = C_def.subs(dico).simplify_full()

eps = .0005 #rrrr
print("eps="+str(eps))

dico_eps={ra:RIF(r),rb:RIF(r),rc:RIF(r),rd:RIF(r),ab:RIF(2*r),ac:RIF(2*r),ad:RIF(2*r),bc:x,bd:y,cd:z}
x0, y0, z0 =  (sqrt(2)-1)*sqrt(2*sqrt(6)+6), (sqrt(2)-1)*sqrt(2*sqrt(6)+6), 2*r
xyz = {x:x0, y:y0, z:z0}
x0_eps, y0_eps, z0_eps= RIF(x0-eps,x0+eps), RIF(y0-eps,y0+eps), RIF(z0,z0+eps)
xyz_eps = {x:x0_eps, y:y0_eps, z:z0_eps}

d = d_def.subs(dico)
d0 = RIF(d.subs(xyz))
print("d0 = " + rif2str(d0))

Dx_eps = derivative(d,x).subs(xyz_eps)
Dy_eps = derivative(d,y).subs(xyz_eps)
Dz_eps = derivative(d,z).subs(xyz_eps)
print("dd/dx= " + rif2str(Dx_eps))
print("dd/dy= " + rif2str(Dy_eps))
print("dd/dz= " + rif2str(Dz_eps))

# r_s
l=solve(A*r^2+B*r+C==0,z)
print(RealField(300)(l[3].right_hand_side().subs({x:x0,y:y0})))

zz = l[3].right_hand_side()

zz=sqrt(-1372105/3*sqrt(2)*x^4*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 1293633/2*x^4*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 15994428*sqrt(2)*x^4/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 58646236*sqrt(2)*x^2*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) - 22619537*x^4/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) - 248814907/3*x^2*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) - 1491557728*sqrt(2)*x^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) - 1491557728*sqrt(2)*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 2109381168*x^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 2109381168*y^2/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168) + 1/12*sqrt(-85200014758320*sqrt(2)*x^8*y^4 + 120491016385604*x^8*y^4 + 5958984924554016*sqrt(2)*x^8*y^2 + 21849611390031392*sqrt(2)*x^6*y^4 - 8427277298281104*x^8*y^2 - 30900016760364048*x^6*y^4 - 1528186412289867264*sqrt(2)*x^6*y^2 - 1852347166411960320*sqrt(2)*x^4*y^4 + 2161181950094612544*x^6*y^2 + 2619614484963166720*x^4*y^4 + 129555245629946572800*sqrt(2)*x^4*y^2 + 51822098251978629120*sqrt(2)*x^2*y^4 - 183218785446448097280*x^4*y^2 - 73287514178579238912*x^2*y^4 - 3624495877357132382208*sqrt(2)*x^2*y^2 + 5125811226523826798592*x^2*y^2)/(15994428*sqrt(2)*x^2 - 22619537*x^2 - 1491557728*sqrt(2) + 2109381168))

zz_eps = sqrt(-1372105/3*sqrt(RIF(2))*x^4*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 1293633/2*x^4*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 15994428*sqrt(RIF(2))*x^4/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 58646236*sqrt(RIF(2))*x^2*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) - 22619537*x^4/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) - 248814907/3*x^2*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) - 1491557728*sqrt(RIF(2))*x^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) - 1491557728*sqrt(RIF(2))*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 2109381168*x^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 2109381168*y^2/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168) + 1/12*sqrt(-85200014758320*sqrt(RIF(2))*x^8*y^4 + 120491016385604*x^8*y^4 + 5958984924554016*sqrt(RIF(2))*x^8*y^2 + 21849611390031392*sqrt(RIF(2))*x^6*y^4 - 8427277298281104*x^8*y^2 - 30900016760364048*x^6*y^4 - 1528186412289867264*sqrt(RIF(2))*x^6*y^2 - 1852347166411960320*sqrt(RIF(2))*x^4*y^4 + 2161181950094612544*x^6*y^2 + 2619614484963166720*x^4*y^4 + 129555245629946572800*sqrt(RIF(2))*x^4*y^2 + 51822098251978629120*sqrt(RIF(2))*x^2*y^4 - 183218785446448097280*x^4*y^2 - 73287514178579238912*x^2*y^4 - 3624495877357132382208*sqrt(RIF(2))*x^2*y^2 + 5125811226523826798592*x^2*y^2)/(15994428*sqrt(RIF(2))*x^2 - 22619537*x^2 - 1491557728*sqrt(RIF(2)) + 2109381168))

# Problem: pas assez de precision...
print("d z_rs/dx ="+rif2str(derivative(zz,x).subs(xyz_eps))) 
print("d z_rs/dy ="+rif2str(derivative(zz,y).subs(xyz_eps)))

# print("  d z_rs/dx < " + str(RIF(derivative(zz_eps,x).subs(xyz_eps)).upper()+0.01) + " < 0")
# print("  d z_rs/dy < " + str(RIF(derivative(zz_eps,y).subs(xyz_eps)).upper()+0.01) + " < 0")

# print("  dd/dx < "+str(RIF(Dx_eps).upper()+.000001)+" < ax = -0.0006")
# print("  dd/dy < "+str(RIF(Dy_eps).upper()+.000001)+" < ay = -0.0006")
# print("  dd/dz > "+str(RIF(Dz_eps).lower()-.000001)+" > az = 0.6")

# xmin,ymin,zmin = 2,2,2
# xmax,ymax,zmax = list(map(n, [2+2*r,2+2*r,2+2*r]))
# x0,y0,z0 = list(map(n, [x0,y0,z0]))


# draw(xmin,ymin,zmin,  xmax,ymax,zmax, x0,y0,z0, A,B,C, d, 0, 0).show() # the whole domain
# draw(x0,x0,z0-eps,  x0+eps,y0+eps,z0+eps, x0,y0,z0, A,B,C, d, 0, 0).show() # eps-neighborhood

# # -------------------------------- 1r11 -------------------------------


# print("---------------1r11-------------------")
# dico={ra:1,rb:r,rc:1,rd:1, ab:1+r,ac:2,ad:2, bc:x,bd:y,cd:z}

# A = A_def.subs(dico).simplify_full()
# B = B_def.subs(dico).simplify_full()
# C = C_def.subs(dico).simplify_full()

# eps = .0008 #1r11
# print("eps="+str(eps))

# dico_eps={ra:RIF(1),rb:RIF(r),rc:RIF(1),rd:RIF(1),ab:RIF(1+r),ac:RIF(2),ad:RIF(2),bc:x,bd:y,cd:z}
# x0, y0, z0 = 1+r, 1+r, 4*sqrt(2*r/(1+2*r))
# x0_eps, y0_eps, z0_eps= RIF(x0,x0+eps), RIF(y0,y0+eps), RIF(z0-eps,z0+eps)
# xyz_eps = {x:x0_eps, y:y0_eps, z:z0_eps}

# d = d_def.subs(dico_eps)
# d0 = RIF(d.subs(xyz_eps))
# print("d0 = " + rif2str(d0))

# Dx_eps = derivative(d,x).subs(xyz_eps)
# Dy_eps = derivative(d,y).subs(xyz_eps)
# Dz_eps = derivative(d,z).subs(xyz_eps)
# print("dd/dx= " + rif2str(Dx_eps))
# print("dd/dy= " + rif2str(Dy_eps))
# print("dd/dz= " + rif2str(Dz_eps))

# # r_s
# l=solve(A*r^2+B*r+C==0,z)
# print(RR(l[1].right_hand_side().subs({x:x0,y:y0})))

# zz=sqrt(-1/4*x^2*y^2/(8*sqrt(2) - 11) - 2*sqrt(2)*x^2/(8*sqrt(2) - 11) - 2*sqrt(2)*y^2/(8*sqrt(2) - 11) + 7/2*x^2/(8*sqrt(2) - 11) + 7/2*y^2/(8*sqrt(2) - 11) + 88*sqrt(2)/(8*sqrt(2) - 11) + 1/4*sqrt(x^4*y^4 + 16*sqrt(2)*x^4*y^2 + 16*sqrt(2)*x^2*y^4 - 28*x^4*y^2 - 28*x^2*y^4 - 352*sqrt(2)*x^4 - 896*sqrt(2)*x^2*y^2 - 352*sqrt(2)*y^4 + 500*x^4 + 1296*x^2*y^2 + 500*y^4 + 17856*sqrt(2)*x^2 + 17856*sqrt(2)*y^2 - 25264*x^2 - 25264*y^2 - 352000*sqrt(2) + 497808)/(8*sqrt(2) - 11) - 125/(8*sqrt(2) - 11))

# zz_eps = sqrt(-1/4*x^2*y^2/(8*RIF(sqrt(2)) - 11) - 2*RIF(sqrt(2))*x^2/(8*RIF(sqrt(2)) - 11) - 2*RIF(sqrt(2))*y^2/(8*RIF(sqrt(2)) - 11) + 7/2*x^2/(8*RIF(sqrt(2)) - 11) + 7/2*y^2/(8*RIF(sqrt(2)) - 11) + 88*RIF(sqrt(2))/(8*RIF(sqrt(2)) - 11) + 1/4*sqrt(x^4*y^4 + 16*RIF(sqrt(2))*x^4*y^2 + 16*RIF(sqrt(2))*x^2*y^4 - 28*x^4*y^2 - 28*x^2*y^4 - 352*RIF(sqrt(2))*x^4 - 896*RIF(sqrt(2))*x^2*y^2 - 352*RIF(sqrt(2))*y^4 + 500*x^4 + 1296*x^2*y^2 + 500*y^4 + 17856*RIF(sqrt(2))*x^2 + 17856*RIF(sqrt(2))*y^2 - 25264*x^2 - 25264*y^2 - 352000*RIF(sqrt(2)) + 497808)/(8*RIF(sqrt(2)) - 11) - 125/(8*RIF(sqrt(2)) - 11))

# print("d z_rs/dx ="+rif2str(derivative(zz_eps,x).subs(xyz_eps)))
# print("d z_rs/dy ="+rif2str(derivative(zz_eps,y).subs(xyz_eps)))



# ax,ay,az = -.88,-.88,1.1
# bx,by = .6,.6


# print("  dz_rs/dx<"+str(RIF(Dx_eps).upper()+.000001)+" < ax=" + str(ax))
# print("  dz_rs/dy<"+str(RIF(Dy_eps).upper()+.000001)+" < ay=" + str(ay))
# print("  dz_rs/dz<"+str(RIF(Dz_eps).upper()+.000001)+" < az=" + str(az))

# print("  bx<"+str(RIF(derivative(zz_eps,x).subs(xyz_eps)).upper()+.0001)+" < bx="+str(bx))
# print("  by<"+str(RIF(derivative(zz_eps,y).subs(xyz_eps)).upper()+.0001)+" < by="+str(by))

# zzx,zzy = derivative(zz_eps,x).subs(xyz_eps), derivative(zz_eps,x).subs(xyz_eps)

# print("    ax+az*bx = "+ str(ax+az*bx)  +" < 0")
# print("    ay+az*by = "+ str(ay+az*by) + " < 0") 


# xmin,ymin,zmin = list(map(n, [1+r,1+r,2]))
# xmax,ymax,zmax = list(map(n, [1+3*r,1+3*r,2+2*r]))
# x0,y0,z0 = list(map(n, [x0,y0,z0]))


# #draw(xmin,ymin,zmin,  xmax,ymax,zmax, x0,y0,z0, A,B,C, d, px, py).show() # the whole domain
# #draw(x0,x0,z0-eps,  x0+eps,y0+eps,z0+eps, x0,y0,z0, A,B,C, d, px, py).show() # eps-neighborhood

