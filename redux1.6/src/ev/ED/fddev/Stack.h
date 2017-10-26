//  -*-C++-*- C++ Mode

//  Project              : 
//  module name          : $Source: /home/lauterba/CA/StudienArbeit/src/RCS/Stack.h,v $
//  module specification : 
//  programmer           : Werner Lauterbach
//  address              : Sudetenring 4
//                         71636 Ludwigsburg
//                         Germany
//  language             : C++
//  last change          : $Date: 1995/07/10 16:55:41 $
//                         by $Author: lauterba $
//  version              : $Revision: 1.1 $
//  bugs                 : none known
//  modules needed       : 

#ifndef _Stack_h
#define _Stack_h

#include "redux.h"

template <class T, int size> class Stack
{
private:
    T elements[size];
    int number;
    
public:
    Stack();
    void push(T & element);
    T pop();
};

template <class T, int size> inline Stack<T,size>::Stack()
    : number(0)
{
}

template <class T, int size> inline void Stack<T,size>::push(T & e)
{
    if (number == size)
    {
	redux_print("*** ERROR in Class Stack: Stack overflow!");
	exit(1);
    }
    elements[number++] = e;
}

template <class T, int size> inline T Stack<T,size>::pop()
{
    if (!number)
    {
	redux_print("*** ERROR in Class Stack: Stack empty!");
	exit(1);
    }
    return elements[--number];
}

#endif // _Stack_h
