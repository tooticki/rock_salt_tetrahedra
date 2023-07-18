// Library for interval arithmetic
#include <boost/numeric/interval.hpp>
using namespace boost::numeric;
using namespace interval_lib;


#include <array>
#include <iostream>


// Fix rounding policies for the transcendental functions
typedef interval<double, policies<save_state<rounded_transc_std<double>>, checking_base<double>>> I;

typedef std::array<I,6> block; // 5 pour gagner 1/6 de mémoire ? 96 bits, i.e. 8bits for each I

// size ratio for halite
I r=sqrt(I(2))-I(1);
I u=I(1);

// radii
I ra=r; // #if defined(ruuu)||defined(rruu)||defined(rrru)||defined(rrrr)
I rb=r; // if defined(rruu)||defined(urrr)||defined(rrru)||defined(rrrr)
I rc=r; // if defined(uurr)||defined(urrr)||defined(rrru)||defined(rrrr)
I rd=u; // if defined(uuur)||defined(uurr)||defined(urrr)||defined(rrrr)
// radii used in compilation to optimize the formula for the radius of sphere support
#define rrru


// routines for tetrahedra (volume, angles, radius of the support sphere etc.)
#include "routines.cpp"
#include "radius.cpp"
//#include "radius_general.cpp"

// delta_bound: lower bound on the conjectured maximal density
// eps: neighborhood of the densest conjectured tetrahedra
#if defined(ruuu)
const I delta_bound=I(812542027810834)/I(1000000000000000); // r111 with one edge 11 stretched
const I eps=I(5)/I(10000); // ruuu : ok, 9min22s 28703078 blocs
#elif defined(uuur)
const I delta_bound=I(812542027810834)/I(1000000000000000); // r111 with one edge 11 stretched
const I eps=I(8)/I(10000); // uuur : ok, 22s, 1039782 blocs
#elif defined(uurr)
const I delta_bound=I(810466032832072)/I(1000000000000000); // 11rr tight
const I eps=I(5)/I(1000); //uurr : ok, 18s, 826632 blocs
#elif defined(rruu)
const I delta_bound=I(810466032832072)/I(1000000000000000); // 11rr tight
const I eps=I(9)/I(1000); //rruu : ok, 14min, 46629199 blocs
#elif defined(uuuu)
const I delta_bound=I(779635570044253)/I(1000000000000000); // 1111 tight
const I eps=I(3)/I(100); // ok, 1s, 52176 blocs
#elif defined(urrr)
const I delta_bound=I(806503318194811)/I(1000000000000000); // 1rrr tight
const I eps=I(6)/I(1000); // urrr : ok, 22s, 1181736 blocs
#elif defined(rrru)
const I delta_bound=I(806503318194811)/I(1000000000000000); // 1rrr tight
const I eps=I(6)/I(1000); // rrru : ok, 4min30, 12215213 blocs
#elif defined(rrrr)
const I delta_bound=I(784688454045207)/I(1000000000000000); // rrrr with two incident edges rr stretched
const I eps=I(9)/I(10000); // ok, 45min,  120923613 blocs (depth 69)
//const I eps=I(96)/I(100000); // ok, 44min,120840323 blocs (depth 69)
#endif
// track densest deleted block
block densest_block;
float delta_max=0;

void printB(block B)
{
    for(int i=3;i<6;i++)
    {
        printf("%.10f",lower(B[i]));
        if (i<5) printf(","); else printf("\n");
    }
}

void print_block(block B)
{
    printf("(");
    for(int i=0;i<6;i++)
        printf("\nRIF(%.50f,%.50f),",lower(B[i]),upper(B[i]));
    printf("\b \n)\n");
}

bool eps_tight(block B)
{
    // count the number of contacts
    int contacts=3;
    if (upper(B[3])<lower(rb+rc+eps)) contacts++;
    if (upper(B[4])<lower(rb+rd+eps)) contacts++;
    if (upper(B[5])<lower(rc+rd+eps)) contacts++;
    int stretched=0;
    #if defined(ruuu) || defined(uuur)
    for(int j=3;j<6;j++)
        if (upper(B[j])>upper(I(4)*(r+I(1))*sqrt(r/(I(2)*r+I(1)))-eps)) stretched++;
    return (contacts==5 && stretched==1);
    #elif defined(rrrr)
    for(int j=3;j<6;j++)
        if (upper(B[j])>upper(r*sqrt(I(2)*sqrt(I(6))+I(6))-eps)) stretched++;
    return (contacts==4 && stretched==2);
    #else
    return (contacts==6);
    #endif
}


// decide whether to keep block B for further refinement)
bool keep(block B)
{
    // skip eps-tight blocks
    if (eps_tight(B)) return false;

    // reject blocks which do not correspond to any tetrahedron
    if (!tetrahedral(B[0],B[1],B[2],B[3],B[4],B[5]))
         {printf("bla\n");return false;}

    // radius of the support sphere of the block B
    I rhoB=radius(B[0],B[1],B[2],B[3],B[4],B[5]);
    if (lower(rhoB)>upper(r)) return false; // too large -> reject block

    // density of the block B
    I deltaB=density(B[0],B[1],B[2],B[3],B[4],B[5]);

    if (upper(deltaB)<lower(delta_bound)) // the block B is surely not a counter-example -> reject it
    {
        // update the lower bound on the density of the densest rejected block
        // actually we should check that the support sphere has radius at most r...
        if (lower(deltaB)>delta_max)
        {
            densest_block=B;
            delta_max=lower(deltaB);
        }
        return false;
    }

    // now the density MAY be larger than the conjectured upper bound
    // if the radius of the support sphere is not SURELY at most r then the block MAY be not valid -> we need to refine
    if (upper(rhoB)>=lower(r)) return true;

    // if the block is more dense : counter-example!
    if (lower(deltaB)>=lower(delta_bound))
    {
        printf("The following block has density at least %f:\n",lower(deltaB));
        print_block(B);
/*
        I a=vol(B[0],B[1],B[2],B[3],B[4],B[5]);
        printf("vol %f,%f\n",lower(a),upper(a));
        a=cov(B[0],B[1],B[2],B[3],B[4],B[5]);
        printf("cov %f,%f\n",lower(a),upper(a));
        printf("density %f,%f\n",lower(deltaB),upper(deltaB));
        rhoB=radius(B[0],B[1],B[2],B[3],B[4],B[5],true);
        printf("radius %f,%f\n",lower(rhoB),upper(rhoB));
        rhoB=radius2(B[0],B[1],B[2],B[3],B[4],B[5]);
        printf("radius2 %f,%f\n",lower(rhoB),upper(rhoB));
*/
        throw "denser block found!";
    }

    // the block MAY be valid and MAY have highest density -> we need to refine
    return true;

}

// split the largest edge
std::pair<block,block> split(block B)
{
    int i=0;
    for(int j=1;j<6;j++)
        if (width(B[j])>width(B[i])) i=j;
    std::pair<I,I> e=bisect(B[i]);
    block C=B;
    B[i]=e.first;
    C[i]=e.second;
    return (std::pair<block,block>(B,C));
}


int main(int argc, char *argv[])
{
    printf("Tetrahedron ");
    if (ra==I(1)) printf("1"); else printf("r");
    if (rb==I(1)) printf("1"); else printf("r");
    if (rc==I(1)) printf("1"); else printf("r");
    if (rd==I(1)) printf("1"); else printf("r");
    printf("\n");

    I gap=I(2)*hull(I(0),r);


    // initial block
    block B;
    B[0]=ra+rb;
    B[1]=ra+rc;
    B[2]=ra+rd;
    B[3]=rb+rc+gap;
    B[4]=rb+rd+gap;
    B[5]=rc+rd+gap;
    
    
    
    
    // let's go
    printf("Initial block: ");
    print_block(B);

    block* blocks=new block[1];
    blocks[0]=B;
    int actifs=1;
    int newactifs=0;
    int del=0;
    int step=0;
    
    while (actifs>0)
    {
        int newdel=0;
        if (actifs>=0) printf("step %2d: %9d blocks considered",step,2*actifs); fflush(stdout);
        block* newblocks=new(std::nothrow) block[2*actifs]; // each block will give at most two new blocks
        newactifs=0;
        int timer=1 ;
        for(int i=0;i<actifs;i++)
        {
            if (actifs>=10 && i*10/actifs==timer) {timer++;std::cout << "." << std::flush;}
            auto BB=split(blocks[i]);
            if (keep(BB.first)) {newblocks[newactifs]=BB.first; newactifs++;} else newdel++;
            if (keep(BB.second)) {newblocks[newactifs]=BB.second; newactifs++;} else newdel++;
        }
        del+=newdel;
        if (actifs>=0) printf("|%9d| blocks deleted (%2d\%)\n",newdel,100*newdel/2/actifs);
        delete blocks;
        blocks=newblocks;
        actifs=newactifs;
        if (actifs>=20000000)
        {
            printf("to much blocks -> give up\n");
            printf("Random remaining block:\n");
            print_block(blocks[rand()%actifs]);
            break;
        }
        step++;
    }
    delete blocks;

    printf("Total number of considered blocks: %d\n",del);

    printf("Block with the highest lower bound on the density (%.20f):\n",delta_max);
    print_block(densest_block);

    return 0;
}
