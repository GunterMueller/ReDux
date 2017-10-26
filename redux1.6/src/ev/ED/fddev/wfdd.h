//  -*-C++-*- C++ Mode

//  Project              : 
//  module name          : $Source:$
//  module specification : 
//  programmer           : Werner Lauterbach
//  address              : Sudetenring 4
//                         71636 Ludwigsburg
//                         Germany
//  language             : C++
//  last change          : $Date:$
//                         by $Author:$
//  version              : $Revision:$
//  bugs                 : none known
//  modules needed       : 

#ifndef _wfdd_h
#define _wfdd_h

#include "Stack.h"

extern "C"
{
    void CWRITE(int);
    void IWRITE(int);
    void WRITE();
    void HALT();
}

const int DICTSIZE = 100;
const int STACKSIZE = 100;
const int PTERMSSIZE = 10000;

FDD dict[DICTSIZE];
Stack<FDD,STACKSIZE> argStack;

char * fddstr;
char * fterm;

char *progname = "", *username = "", *hostname = "";

#endif // _wfdd_h
