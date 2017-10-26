// -*- C++ -*-
#ifndef avl_h
#define avl_h

#include <stdio.h>

enum {
  MAX_AVL_DEPTH = 50,
  left		= 0,
  right		= 1
};

template<class DATA, class KEY> class AVL_element {
 public:
  KEY key;
  int balance;
  AVL_element<DATA, KEY> *son[2];
  DATA data;
  AVL_element() {
    balance   = 0;
    son[left] = son[right] = 0;
  };
  AVL_element(const AVL_element<DATA,KEY> &cp) {
    data = cp.data;
    balance = 0;
    son[left] = son[right] = 0;
    key = cp.key;
  };
  AVL_element(const DATA &element, const KEY &new_key)
    : data(element), key(new_key) {
      balance	= 0;
      son[left] = son[right] = 0;
  };
  ~AVL_element() {
    delete son[left];
    delete son[right];
  };
/*   void print(int i, int j); */
  void change(const DATA &element);
};

template<class DATA, class KEY> class AVL {
 private:
  AVL_element<DATA, KEY>
    *root;

  void single_rotate(int stackp,
  		     int direction[],
  		     AVL_element<DATA, KEY> **path[]);

  void double_rotate(int stackp,
  		     int direction[],
  		     AVL_element<DATA, KEY> **path[]);

 public:
  AVL() {
    root = 0;
  };
  AVL(const AVL<DATA, KEY> &element) {
    root = new AVL_element<DATA, KEY>(*element.root);
  };
  AVL(const DATA &element, const KEY &new_key) {
    root = new AVL_element<DATA, KEY>(element, new_key);
  };

  ~AVL() {
    delete root;
  };

  void insert(const DATA &element, const KEY &insert_key);
  void clear() {
    delete root;
    root = 0;
  };

  DATA *get(const KEY &search_key);

/*   void print(int i, int j) { */
/*     fprintf(stderr, "==== %d ==============\n", j); */
/*     if(root) */
/*       root->print(i, j); */
/*     fprintf(stderr, "==== %d ==============\n", j); */
/*   }; */
};

#endif
