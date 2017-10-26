#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "logfile.h"
#include "AVL.h"
#if defined(__GNUC__) && (__GNUC_MINOR__ == 5)
#include "AVL.c"
#endif
#include "tree.h"

// Ausgabe eines Baumes in Equation Darstellung
// lit:       so sieht eine pos. Variable aus       (1)
// neglit:    so sieht eine neg. Variable aus       (0/-)
// noLit:     so sieht ein Cube ohne Variablen aus  (0/1)
// incube:    so sieht Verkn"upfung im Cube aus     (*/+)
// betwcube:  so sieht Verkn"upfung zw. Cubes aus   (+/@/=)
// noCubes:   so sieht Fkt ohne Cubes aus           (0/1)
// nrLitEven: wird ans Ende angeh"angt, falls #Literale=2n+2  (@1/=0)
// nrLitOdd:  wird ans Ende angeh"angt, falls #Literale=2n+1  (@1/=0)
char *
tree::printEquation (char lit, char neglit, char nolit, char incube,
		     char betwcube, char *noCubes, char *nrLitEven,
		     char *nrLitOdd)
{
  static char *ret = 0;
  char *path = new char[level_no + 1], *ptr,
    *oneCube = new char[level_no * 6 + 5];
  int i;
  unsigned long nrCubes = tree_count_cubes (root);

  path[0] = 0;
  delete [] ret;
  ptr = ret = new char[nrCubes * (level_no * 6 + 5) + 3];
  ret[0] = 0;

  while (fetch_path (path)) {
    oneCube[0] = 0;
    for (i = 0; i < level_no; i++)
      if (path[i] == lit)
	if (oneCube[0])
	  sprintf (oneCube, "%s%cI%d", oneCube, incube, i);
	else
	  sprintf (oneCube, "I%d", i);
      else if (path[i] == neglit)
	if (oneCube[0])
	  sprintf (oneCube, "%s%c~I%d", oneCube, incube, i);
	else
	  sprintf (oneCube, "~I%d", i);
      else ;

    if (oneCube[0])
      if (ret[0]) {
	sprintf (ptr, "%c(%s)", betwcube, oneCube);
	ptr += strlen (oneCube) + 3;
      }else{
	sprintf (ptr, "(%s)", oneCube);
	ptr += strlen (oneCube) + 2;
      }
    else
      if (ret[0]) {
	sprintf (ptr, "%c%c", betwcube, nolit);
	ptr += 2;
      }else{
	sprintf (ptr, "%c", nolit);
	ptr += 1;
      }
  }

  if (ret[0]) {
    sprintf (ptr, "%s", (nrCubes % 2 == 0) ? nrLitEven : nrLitOdd);
    ptr = ret;
  }else
    ptr = noCubes;
    
  
  delete [] path;
  delete [] oneCube;
  return ptr;
} 


/* Ausgabe des Baums in ASCII-Pseudo-Grafik-Darstellung. */
void
tree::tree_print(treenode *node,
		 unsigned long father_lev,
		 unsigned long father_dir)

{
int i;

  if(node==Mpty)
    return;

  if(!node->flag && node!=Leaf) {
    node->flag = 1;

    printline[father_lev] = ((father_dir==0)? '|' : ' ');

    tree_print(node->son[1], node->level, 1);

    if(father_dir != 2)
      logprintf(tp_verbo, "      ");

    for(i = (int) level_no; i > father_lev; i -= 1)
      logprintf(tp_verbo, "%c     ", printline[i]);

    logprintf(tp_verbo, "+");

    for(i = 1; i < (father_lev - node->level + (father_dir == 2)) * 6; i += 1)
      logprintf(tp_verbo, "-");

    logprintf(tp_verbo, "%d\n", node->id);

    printline[father_lev] = ((father_dir==1)? '|' : ' ');

    tree_print(node->son[0], node->level, 0);

    printline[father_lev] = ' ';
  }
  else {
    if(father_dir != 2)
      logprintf(tp_verbo, "      ");

    for(i = (int) level_no; i > father_lev; i -= 1)
      logprintf(tp_verbo, "%c     ", printline[i]);

    logprintf(tp_verbo, "+");
    for(i = 2; i < (father_lev - node->level + (father_dir == 2)) * 6; i += 1)
      logprintf(tp_verbo, "-");

    if(node==Leaf)
      logprintf(tp_verbo, "-x\n");
    else
      logprintf(tp_verbo, "*%d\n", node->id);
  }
}

/* Gibt einen Pfad aus. Wohin, wird vorher ueber die Initialisierung der */
/* Variablen tp_* eingestellt. */
void
tree::tree_put_single_path()
{
  switch (tp_sink) {
    case MEMORY_SINK:
      // Ausgabe in ein Array schreiben.
      if(tp_cube_cnt < tp_no_cubes_max) {
	if((tp_in_cubes[tp_cube_cnt] = new char[tp_no_inputs + 1]) == 0 ||
	   (tp_tag &&
	   (tp_out_cubes[tp_cube_cnt] = new char[tp_no_outputs + 1]) == 0)) {
	  logprintf(ERROR_MSG, "%s: Memory full in tree_put_paths().\n",
		  MessageHead);
	  exit(1);
	}
	strcpy(tp_in_cubes[tp_cube_cnt], printline);
	if(tp_tag) strcpy(tp_out_cubes[tp_cube_cnt], tp_tag);
      }
      tp_cube_cnt++;
      break;
    case STREAM_SINK:
      // Ausgabe in eine geoeffnete Datei schreiben.
      if(tp_tag)
	fprintf(tp_stream, "%s %s\n", printline, tp_tag);
      else
	fprintf(tp_stream, "%s\n", printline);
      break;
    case LOG_SINK:
      // Ausgabe nach logfile.
      if(tp_tag)
	logprintf(tp_verbo, "%s %s\n", printline, tp_tag);
      else
	logprintf(tp_verbo, "%s\n", printline);
      break;
    default:
      logprintf(ERROR_MSG, "%s: bad sink specified in tree_put_paths().\n",
		MessageHead);
  }
}

/* Gib die Pfadmenge eines Baums aus. Das ist beim BDD die Cubemenge, */
/* beim FDD die pi-Term-Menge und beim EDD die PI-Term-Menge. */
void
tree::tree_put_paths(treenode *node)
{
  if(node==Mpty)
    return;
  if(node==Leaf)
    // Pfad ist fertig. Nun gib ihn aus.
    tree_put_single_path();
  else {
    printline[level_no - node->level] = '0';
    tree_put_paths(node->son[0]);
    printline[level_no - node->level] = '1';
    tree_put_paths(node->son[1]);
    printline[level_no - node->level] = '-';
  }
}

void
tree::tree_put_disj_opti(treenode *node)
{
  if(node==Mpty)
    return;
  if(node==Leaf)
    // Pfad ist fertig. Nun gib ihn aus.
    tree_put_single_path();
  else {
    treenode *path_zero, *path_one, *path_dc;
    tree_spread(node->son[0], node->son[1], &path_zero, &path_dc, &path_one);
    tree_put_disj_opti(path_dc);
    printline[level_no - node->level] = '0';
    tree_put_disj_opti(path_zero);
    printline[level_no - node->level] = '1';
    tree_put_disj_opti(path_one);
    printline[level_no - node->level] = '-';
    tree_empty(path_one);
    tree_empty(path_zero);
    tree_empty(path_dc);
  }
}

void
tree::print(FILE *fp, char *tag, unsigned long mode, int verbosity)
{
int i;

  if(root == 0 || level_no == 0)
    return;

  tp_sink   = (fp != NULL) ? STREAM_SINK : LOG_SINK;
  tp_verbo  = verbosity;
  tp_stream = fp;
  tp_mode   = mode;
  tp_tag    = tag;

  if(mode == PutTreeNoReset || mode == PutTree)
    for(i = 0; i < level_no + 1; i++)
      printline[i] = ' ';
  else {
    for(i = 0; i < level_no; i++)
      printline[i] = '-';
    printline[i] = '\0';
  }

  switch(mode) {
    case PutTree:
      tree_reset_flag(root);
    case PutTreeNoReset:// TREE-Format, aber Flags nicht zuruecksetzen, um
			// globale Knotenmehrfachnutzung sichtbar zu machen.
      tree_print(root, level_no, 2);
      break;
    case PutPlainPaths:
      tree_put_paths(root);
      break;
    case PutDisjOpt:
      tree_put_disj_opti(root);
      clear_caches();
      break;
    case PutCoverOpt:
      logprintf(ERROR_MSG, "%s: function not implemented yet.\n", MessageHead);
      break;
    default:
      logprintf(ERROR_MSG, "%s: bad write format %d given. No output.\n",
		MessageHead, mode);
  }
}

unsigned long
tree_array_out(tree *tree_arr, unsigned long no_outp)
{
unsigned long
  i, j;
char
  *outputline;

  if((outputline = new char[no_outp + 1]) == 0) {
    logprintf(ERROR_MSG, "%s: memory full in tree_array_out().\n",
            tree::MessageHead);
    exit(1);
  }

  for(i = 0; i < no_outp; i += 1) {
    if(tree_arr[i].level_no != tree_arr[0].level_no)
      return 0;
    for(j = 1; j <= tree_arr[i].level_no; j += 1)
      if((tree::tp_mode & ModeTakePol) &&
         tree_arr[i].polarity[j] != tree_arr[0].polarity[j])
        return 0;
  }

  for(i = 0; i < tree_arr[0].level_no; ++i)
    tree::printline[i] = '-';

  tree::printline[i] = '\0';

  for(i = 0; i < no_outp; i++)
    outputline[i] = '0';
  outputline[i] = '\0';

  for(i = 0; i < no_outp; i++){
    outputline[i] = '1';
    tree_arr[i].tree_put_paths(tree_arr[i].root);
    outputline[i] = '0';
  }

  delete [] outputline;
  return tree::tp_cube_cnt;
}

unsigned long
tree_array2memory(tree *tree_arr, unsigned long no_outp,
		  char **in_cubes, char **out_cubes,
		  unsigned long max_cube_no, unsigned long mode)
{

  tree::tp_cube_cnt     = 0;
  tree::tp_no_cubes_max = max_cube_no;
  tree::tp_in_cubes     = in_cubes;
  tree::tp_out_cubes    = out_cubes;
  tree::tp_mode         = mode;
  tree::tp_sink         = MEMORY_SINK;

  return tree_array_out(tree_arr, no_outp);
}

void
tree_write_array(FILE *fout, tree *tree_arr,
		 unsigned long no_outp, unsigned long mode)
{

  tree::tp_mode   = mode;
  tree::tp_sink   = STREAM_SINK;
  tree::tp_stream = fout;

  tree_array_out(tree_arr, no_outp);
  return;
}

void
tree_log_array(tree *tree_arr, unsigned long no_outp, unsigned long mode)
{
  tree::tp_mode   = mode;
  tree::tp_sink   = LOG_SINK;

  tree_array_out(tree_arr, no_outp);
  return;
}

int
tree::fetch_right_path(char path[])
{
  return tree_fetch_rightmost_path(root, path, level_no);
}

/* Diese Funktion dient zum Aufzaehlen aller Pfade eines xDDs. */
/* in `last_path' muss genug Platz fuer einen vollstaendigen Pfad sein. */
/* D.h. level_no + 1 fuer das '\0' am ende. */
/* Ist last_path[0] == '\0', so schreibt fetch_path() den am weitesten links */
/* im Baum stehenden Pfad (den auf der '0'-Seite) in last_path hinein. */
/* Enthaelt last_path einen Pfad, so schreibt fetch_path() den naechsten */
/* Pfad, der direkt rechts vom angegebenen Pfad liegt, in last_path hinein. */
/* Beim Aufruf von fetch_path() muss last_path einen Pfad enthalten, der */
/* auch im Baum steht. Anderenfalls ist das Verhalten von fetch_path() */
/* undefiniert. */
int
tree::fetch_path(char last_path[])
{
  int i;

  if(last_path[0]) {
    // Wenn in last_path ein Pfad drinsteht, nimm von ihm aus Naechsten.
    i = (int) level_no - 1;
    while(1) {
      // Probiere hier solange, bis du den naechsten Pfad gefunden hast.
      for(; i > 0 && last_path[i] != '0'; i--);
      if(i < 0 || last_path[i] != '0')
	return 0;
      else {
	last_path[i]     = '1';
	last_path[i + 1] = '\0';
	if(tree_fetch_next_path(root, last_path, level_no))
	  return 1;
      }
    }
  }

  return tree_fetch_leftmost_path(root, last_path, level_no);

}

/* Hole den am weitesten rechts im Baum stehenden Pfad. */
int
tree::tree_fetch_rightmost_path(treenode *node, char path[], unsigned long lev)
{
  if(node == Mpty)
    return 0;
  else if(lev == 0) {
    path[level_no] = 0;
    return 1;
  }
  else if(node->level < lev) {
    path[level_no - lev] = '-';
    return tree_fetch_rightmost_path(node, path, lev - 1);
  }
  else {
    path[level_no - lev] = node->son[1] != Mpty ? '1' : '0';
    return tree_fetch_rightmost_path(node->son[path[level_no - lev] - '0'],
				     path, lev - 1);
  }
}

/* Hole den am weitesten links im Baum stehenden Pfad. */
int
tree::tree_fetch_leftmost_path(treenode *node, char path[], unsigned long lev)
{
  if(node == Mpty)
    return 0;
  else if(lev == 0) {
    path[level_no] = 0;
    return 1;
  }
  else if(node->level < lev) {
    path[level_no - lev] = '-';
    return tree_fetch_leftmost_path(node, path, lev - 1);
  }
  else {
    path[level_no - lev] = node->son[0] != Mpty ? '0' : '1';
    return tree_fetch_leftmost_path(node->son[path[level_no - lev] - '0'],
				    path, lev - 1);
  }
}

/* Gehe entlang `path' und suche am Ende den dann am weitesten links */
/* stehenden Pfad. */
int
tree::tree_fetch_next_path(treenode *node, char path[], unsigned long lev)
{
  if(node == Mpty)
    return 0;
  else if(lev == 0)
    return 1;
  else if(path[level_no - lev] == 0)
    return tree_fetch_leftmost_path(node, path, lev);
  else if(node->level < lev)
    return tree_fetch_next_path(node, path, lev - 1);
  else
    return tree_fetch_next_path(node->son[path[level_no-lev]-'0'],
				path, lev - 1);

}
