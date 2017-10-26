//  -*-C++-*- C++ Mode

//  Project              : 
//  module name          : $Source: /home/lauterba/CA/StudienArbeit/src/RCS/wfdd.C,v $
//  module specification : 
//  programmer           : Werner Lauterbach
//  address              : Sudetenring 4
//                         71636 Ludwigsburg
//                         Germany
//  language             : C++
//  last change          : $Date: 1995/07/10 16:37:15 $
//                         by $Author: lauterba $
//  version              : $Revision: 1.1 $
//  bugs                 : none known
//  modules needed       : 

#include <string.h>
#include <math.h>
#include <stdio.h>
#include <iostream.h>
#include "fdd/fdd.h"
#include "wfdd.h"
#include "redux.h"

extern "C" 
{
    int WFDDFG(int K, int R);
    int WFDDZE(int R);
    int WFDDON(int R);
    int WFDDXO(int R, int dictL, int dictR);
    int WFDDAN(int R, int dictL, int dictR);
    int WFDDOR(int R, int dictL, int dictR);
    int WFDDNO(int R, int dictA);
    int WFDDNE(int R, int dictA);
    void FDDSTR(int R, int dictA);
    int FDDVIP();
}

int WFDDFG(int K, int R)
{
// Wrapper FDD Free Generator
// int K is the rank of the free generator,
// int R is the number of levels of the FDD.
// The return value is the index of the dictionary dict.
// A FDD is generated representing the K-th. free generator and entered
// into the dictionary dict.

    int i;
    char intstr[R+1];
    FDD * fdd = new FDD(R);
    if (fdd == NULL)
    {
        redux_print("\n*** ERROR in algorithm WFDDFG: Out of memory!\n");
        HALT();
    }
    intstr[R] = '\0';
    for (i = 0; i < R; i++)
	intstr[i] = '0';
    intstr[R-K] = '1';
    (*fdd) ^= intstr;
    if (K == DICTSIZE)
    {
        redux_print("\n*** ERROR in algorithm WFDDFG: Dictionary overflow!\n");
        redux_print("*** DICTSIZE = ");
        IWRITE(DICTSIZE);
        redux_print(". Increment DICTSIZE in file wfdd.h");
	HALT();
    }
    dict[K] = *fdd;
    return K;
}

int WFDDZE(int R)
{
// Wrapper FDD ZEro.
// Int R is the number of levels of the FDD.
// The return value is always 0 and indicates that the generated FDD
// representing the zero is poped onto the Stack.

    int r, i;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD * fdd = new FDD(r);
    if (fdd == NULL)
    {
        redux_print("\n*** ERROR in algorithm WFDDZE: Out of memory!\n");
        HALT();
    }
    argStack.push(*fdd);
    return 0 ;
}

int WFDDON(int R)
{
// Wrapper FDD ONe.
// Int R is the number of levels of the FDD.
// The return value is always 0 and indicates that the generated FDD
// representing the one is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD * fdd = new FDD(r);
    if (fdd == NULL)
    {
        redux_print("\n*** ERROR in algorithm WFDDON: Out of memory!\n");
        HALT();
    }
    char intstr[r+1];

    intstr[r] = '\0';
    for (int i = 0; i < r; i++)
	intstr[i] = '0';
    (*fdd) ^= intstr;
    argStack.push(*fdd);
    return 0;
}

int WFDDXO(int R, int dictL, int dictR)
{
// Wrapper FDD XOr.
// Int R is the number of levels of the FDD.
// int dictL and int dictR: If the value of dictL resp. dictR is greater
// than 0 the FDD is in the dictionary dict and dict[dictL] resp.
// dict[dictR] is the corresponding FDD. If dictL resp. dictR is 0 the
// corresponding FDD must be poped from the stack.
// The return value is always 0 and indicates that the computed FDD
// (fddL xor fddR) is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fddL(r), fddR(r);

    if (dictR)
 	fddR = dict[dictR];
    else
 	fddR = argStack.pop();
    if (dictL)
	fddL = dict[dictL];
    else
	fddL = argStack.pop();
    fddL ^= fddR;
    argStack.push(fddL);
    return 0;
}

int WFDDAN(int R, int dictL, int dictR)
{
// Wrapper FDD ANd.
// Int R is the number of levels of the FDD.
// int dictL and int dictR: If the value of dictL resp. dictR is greater
// than 0 the FDD is in the dictionary dict and dict[dictL] resp.
// dict[dictR] is the corresponding FDD. If dictL resp. dictR is 0 the
// corresponding FDD must be poped from the stack.
// The return value is always 0 and indicates that the computed FDD
// (fddL and fddR) is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fddL(r), fddR(r);

    if (dictR)
	fddR = dict[dictR];
    else
	fddR = argStack.pop();
    if (dictL)
	fddL = dict[dictL];
    else
	fddL = argStack.pop();
    fddL &= fddR;
    argStack.push(fddL);
    return 0;
}

int WFDDOR(int R, int dictL, int dictR)
{
// Wrapper FDD OR.
// Int R is the number of levels of the FDD.
// int dictL and int dictR: If the value of dictL resp. dictR is greater
// than 0 the FDD is in the dictionary dict and dict[dictL] resp.
// dict[dictR] is the corresponding FDD. If dictL resp. dictR is 0 the
// corresponding FDD must be poped from the stack.
// The return value is always 0 and indicates that the computed FDD
// (fddL or fddR) is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fddL(r), fddR(r);

    if (dictR)
	fddR = dict[dictR];
    else
	fddR = argStack.pop();
    if (dictL)
	fddL = dict[dictL];
    else
	fddL = argStack.pop();
    fddL |= fddR;
    argStack.push(fddL);
    return 0;
}

int WFDDNO(int R, int dictA)
{
// Wrapper FDD NOt.
// Int R is the number of levels of the FDD.
// int dictA: If the value of dictA is greater than 0 the FDD is in the
// dictionary dict and dict[dictA] is the corresponding FDD. If dictA
// is 0 the corresponding FDD must be poped from the stack.
// The return value is always 0 and indicates that the computed FDD
// (not fdd) is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fdd(r);

    if (dictA)
	fdd = dict[dictA];
    else
	fdd = argStack.pop();
    fdd = !fdd;
    argStack.push(fdd);
    return 0;
}

int WFDDNE(int R, int dictA)
{
// Wrapper FDD NEgation.
// Int R is the number of levels of the FDD.
// int dictA: If the value of dictA is greater than 0 the FDD is in the
// dictionary dict and dict[dictA] is the corresponding FDD. If dictA
// is 0 the corresponding FDD must be poped from the stack.
// The return value is always 0 and indicates that the computed FDD
// (neg fdd) is poped onto the Stack.

    int r;
    r = R;
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fdd(r);

    if (dictA)
	fdd = dict[dictA];
    else
	fdd = argStack.pop();
    argStack.push(fdd);
    return 0;
}

void FDDSTR(int R, int dictA)
{
// STRing from FDD.
// Int R is the number of levels of the FDD.
// int dictA: If the value of dictA is greater than 0 the FDD is in the
// dictionary dict and dict[dictA] is the corresponding FDD. If dictA
// is 0 the corresponding FDD must be poped from the stack.
// A global string fterm is computed from the FDD. Each path of the FDD
// fold of and entered into fterm separated by a colon.

    int i, j, s, t, k, l;
    int numdc; // Number of don't cares of a path.
    int numPterms; // Number of paths of the fdd.
    int len = 0; // Length of the global string fterm.
    int r = R; // Number of levels of the fdd.
    if (r == 0) // if the level is 0 we must use a dummy level.
        r = 1;
    FDD fdd(r);
    char * tterm = 0;
    char * pterms[PTERMSSIZE];
    
    fterm = 0;
    if (dictA)
        fdd = dict[dictA];
    else
	fdd = argStack.pop();
    if (fdd.is_empty()) // fdd represents the zero.
    {
        len = 2;
        fterm = new char[len];
        if (fterm == NULL)
        {
            redux_print("\n*** ERROR in algorithm FDDSTR: Out of memory!\n");
            HALT();
        }
        fterm[0] = '2';
    }
    else
    {
        char * pterm = new char[r + 1];
        if (pterm == NULL)
        {
            redux_print("\n*** ERROR in algorithm FDDSTR: Out of memory!\n");
            HALT();
        }
        pterm[0] = 0; // Init.
        while(fdd.fetch_path(pterm))
        {
            numdc = 0;
            for (i = 0; i < r; i++) // Count don't cares.
                if (pterm[i] == '-')
                    numdc++;
            if (numdc) // fold of (eliminate don't cares)
            {
                s = 1;
                for (i = 0; i < numdc - 1; i++)
                    s *= 2;
//                s = (int) pow(2, double (numdc - 1));
//                s = (int) ldexp(1, numdc - 1);
                numPterms = s*2;
                t = 2;
                for (i = 0; i < numPterms; i++)
                {
                    pterms[i] = new char [r + 1];
                    if (pterms[i] == NULL)
                    {
                        redux_print("\n*** ERROR in algorithm FDDSTR: Out of memory!\n");
                        HALT();
                    }
                }
                for (i = 0; i < r; i++)
                {
                    if (pterm[i] == '-')
                    {
                        for (k = 0; k < t; k++)
                        {
                            for (l = 0; l < s; l++)
                            {
                                j = k*s+l;
                                pterms[j][i] = '0';
                            }
                            k++;
                            for (l = 0; l < s; l++)
                            {
                                j = k*s+l;
                                pterms[j][i] = '1';
                            }
                        }
                        s /= 2;
                        t *= 2;
                    }
                    else
                        for (l = 0; l < numPterms; l++)
                            pterms[l][i] = pterm[i];
                }
                for (l = 0; l < numPterms; l++)
                    pterms[l][i] = '\0';
                len = len + numPterms * (r + 1);
                tterm = new char[len + 1];
                if (tterm == NULL)
                {
                    redux_print("\n*** ERROR in algorithm FDDSTR: Out of memory!\n");
                    HALT();
                }
                tterm[0] = '\0';
                if (fterm)
                    strcpy(tterm, fterm);
                for (l = 0; l < numPterms; l++)
                {
                    strcat(tterm, pterms[l]);
                    strcat(tterm, ":");
                }
            }
            else
            {
                len = len + r + 1;
                tterm = new char[len + 1];
                if (tterm == NULL)
                {
                    redux_print("\n*** ERROR in algorithm FDDSTR: Out of memory!\n");
                    HALT();
                }
                tterm[0] = '\0';
                if (fterm)
                    strcpy(tterm, fterm);
                strcat(tterm, pterm);
                strcat(tterm, ":");
            }
            delete [] fterm;
            fterm = tterm;
            fterm[len] = '\0';
        }
    }
    fterm[len-1] = '\0'; // remove the last ":" from fterm
}

int FDDVIP()
{
// FDD Variable is Present.
// The return value:
//     0: end of fterm ('\0')
//     1: variable is not present ('0') in fterm
//     2: variable is present ('1') in fterm
//     3: separator ':' is reached
//     4: no variable is present ('2') in fterm
// The global string fterm is analyzed. Each call of FDDVIP modifies
// fterm (fterm points to the next character).

    if (!*fterm)
        return *fterm;
    if (*fterm == '0')
    {
        fterm++;
        return 1;
    }
    else if (*fterm == '1')
    {
        fterm++;
        return 2;
    }
    else if (*fterm == ':')
    {
        fterm++;
        return 3;
    }
    else if (*fterm == '2')
    {
        fterm++;
        return 4;
    }
}
