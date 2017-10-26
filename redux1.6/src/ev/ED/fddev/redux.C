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


extern "C" 
{
    void CWRITE(int);
    void IWRITE(int);
    void WRITE();
}

void redux_print(const char * cl)
{
    int i;
    
    for (i = 0; cl[i]; i++)
        CWRITE(cl[i]);
}
