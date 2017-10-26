// -*- C++ -*-
#ifndef avl_c
#define avl_c

#include "AVL.h"

template<class DATA, class KEY>
  void AVL_element<DATA, KEY>::change(const DATA &element)
{
  printf("AVL: Achtung, ein Element soll zweimal eingetragen werden.\n"); 
}

/* template<class DATA, class KEY> */
/*   void AVL_element<DATA, KEY>::print(int i, int j) */
/* { */
/*   if(son[1]) son[1]->print(i + 1, j); */
/*  */
/*   data.print(i, j + 1); */
/*  */
/*   if(son[0]) son[0]->print(i + 1, j); */
/*  */
/* } */

/*
Schema der "einfachen Rotation"
(Zwei Sternchen (`*') entsprechen einer AVL-Baum-Ebene)
Vorher:
          B
        /   \
       A     B1 
      / \    *
     A0  A1  *
     *   *
     *   *
     *
     *
Nachher:
       A
     /   \
    A0    B
    *	 / \
    *   A1  B1 
    *   *   *
    *   *   *
*/
template<class DATA, class KEY>
inline void AVL<DATA, KEY>::single_rotate(int stackp,
  		     		   int direction[],
  		     		   AVL_element<DATA, KEY> **path[])
{
  // Aus den Richtungen -1 oder 1 die Indizes 0 oder 1 erzeugen.
  int
    dir = (direction[stackp] + 1) >> 1;

  AVL_element<DATA, KEY>
    *a = *(path[stackp + 1]),
    *b = *(path[stackp]);

  // Alles ist jetzt ausgeglichen.
  b->balance = 0;
  a->balance = 0;

  // B.left := A.right
  b->son[dir] = a->son[!dir];

  // A.right := B
  a->son[!dir] = b;

  // Vorgaenger(B).son := A
  if(stackp) {
    int dad_dir = (direction[stackp - 1] + 1) >> 1;
    (*(path[stackp - 1]))->son[dad_dir] = a;
  }
  else
    root = a;
}

template<class DATA, class KEY>
inline void AVL<DATA, KEY>::double_rotate(int stackp,
  		   		   int direction[],
  		   		   AVL_element<DATA, KEY> **path[])
{
  // Aus den Richtungen -1 oder 1 die Indizes 0 oder 1 erzeugen.
  int
    dir = (direction[stackp] + 1) >> 1;

  AVL_element<DATA, KEY>
    *b = *(path[stackp + 2]),
    *a = *(path[stackp + 1]),
    *c = *(path[stackp]);

  if(b->balance == direction[stackp]) {
    a->balance = 0;
    c->balance = -direction[stackp];
  }
  else if(b->balance == -direction[stackp]) {
    c->balance = 0;
    a->balance = direction[stackp];
  }
  else {
    c->balance = 0;
    a->balance = 0;
  }
  b->balance = 0;

  // C.left := B.right
  c->son[dir] = b->son[!dir];

  // A.right := B.left
  a->son[!dir] = b->son[dir];

  // B.left := A
  b->son[dir] = a;

  // B.right := C
  b->son[!dir] = c;

  // Vorgaenger(C).son := B
  if(stackp) {
    int dad_dir = (direction[stackp - 1] + 1) >> 1;
    (*(path[stackp - 1]))->son[dad_dir] = b;
  }
  else
    root = b;
}

template<class DATA, class KEY>
   DATA *AVL<DATA, KEY>::get(const KEY &search_key)
{
static AVL_element <DATA, KEY>
  *node;

  for(node = root; node; node = node->son[node->key < search_key])
    if(node->key == search_key)
      return &(node->data);
  
  return 0;
}

template<class DATA, class KEY>
  void AVL<DATA, KEY>::insert(const DATA &element, const KEY &insert_key)
{
int
  bal,
  longer;
static AVL_element<DATA, KEY>
  *pnt,
  **adr,
  // Stack als Rekursionsersatz.
  **path[MAX_AVL_DEPTH]; // Knoten auf dem Weg.
static int
  // Richtungen, die an den Knoten eingeschlagen wurden.
  direction[MAX_AVL_DEPTH],
  // Stackpointer
  stackp;

  // Stack des Pfades durch den Baum ist zunaechst leer.
  // Nachher steht darin der Weg von der Wurzel zur
  // Einfuegestelle.
  stackp = 0;

  // Wir durchsuchen den Baum nach der passenden Stelle.
  pnt = root;

  // Hier kommt die Adresse rein, in die der Zeiger auf das
  // neue Blatt geschrieben werden soll.
  adr = &root;

  // Einfuegestelle suchen
  while(pnt && pnt->key != insert_key) {
    path[stackp] = adr;
    if(pnt->key > insert_key) {
      adr		  = &(pnt->son[left]);
      pnt		  = pnt->son[left];
      direction[stackp++] = -1;
    }
    else {
      adr		  = &(pnt->son[right]);
      pnt		  = pnt->son[right];
      direction[stackp++] = 1;
    }
  }

  // Daten eintragen.
  if(pnt == 0) {
    // Schluessel `insert_key' war noch nicht vorhanden.
    *adr	 = new AVL_element<DATA, KEY>(element, insert_key);
    longer	 = 1;
    path[stackp] = adr;
    // Nun den AVL-Baum wieder balancieren.
    while(--stackp >= 0 && longer) {
      bal = (*(path[stackp]))->balance += direction[stackp];
      if(bal == 2 || bal == -2) {
        if(bal * (*(path[stackp + 1]))->balance > 0)
          single_rotate(stackp, direction, path);
        else
          double_rotate(stackp, direction, path);
        longer = 0;
      }
      else if(bal == 0)
        longer = 0;
    }
  }
  else {
    pnt->change(element);
    // Schluessel `insert_key' war bereits vorhanden.
  }
}

#endif
