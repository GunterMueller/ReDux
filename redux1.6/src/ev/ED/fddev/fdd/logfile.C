
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include "logfile.h"

extern char
  *progname,
  *prompt,
  *hostname,
  *username,
  compiler_used[],
  progdate[],
  progversion[],
  *versionmotto[];

#define makelogname(xx) xx[0] > 0 ? "logfile `" : "",\
			xx[0] > 0 ? xx : "stdout",\
			xx[0] > 0 ? "'" : ""
			
#define limittype(xx) ((xx) == LOG_LIM_HARD \
		       ? "hard" \
		       : ((xx) == LOG_LIM_SOFT \
			  ? "soft" \
			  : "*** unknown ***" \
			 ) \
		      )

typedef struct logfile_struct {
  // Name der Logfile-Datei.
  // fname == 0 : Konsolenlogging.
  char
    *fname;
  // Logfile Datei.
  FILE
    *stream;
  unsigned long
    lim_chars,
    no_chars;
  // lim_mode: was passiert, wenn ein Logfile "ueberlaeuft"? Programm
  // abbrechen oder einfach nicht mehr weiterloggen?
  int
    lim_mode;
  // Verbosity-level dieses logfiles. Je groesser desto laberlaber.
  // Die `override_verb' ist eine Verbosity hoehrerer Prioritaet.
  // Ist sie = 0, so gilt die `normale' Verbosity. Ist sie > 0,
  // so wird die `normale' Verbosity ignoriert.
  int
    override_verb,
    verb;
  // Logging auf mehrere Logfiles simultan moeglich.
  struct logfile_struct
    *next;
} logfile_t;

logfile_t
  *console_log = 0,
  *loglist = 0;

// Ist exceed_limit auf 1 gesetzt, so wird ein ggf. gesetztes
// Loglimit nicht beachtet. Dieser Mechanismus dient zum Ausgeben der
// letzten Atemzuege auf einem Logfile nachdem ein Loglimit ueberschritten
// wurde.
int
  exceed_limit = 0;

void exceed(int i)
{
  exceed_limit = i;
}

/* Arbeitet analog zu vfprintf. */
/* Bekommt also KEINE VARIABLE ARGUMENTLISTE. */
void vlogprintf(int verbosity, char *fmt, va_list args)
{
  logfile_t
    *lf;
  int
    force_logoff = 0, // Wurde ein Loglimit ueberschritten, so muss mindestens
    // das betroffene Logfile geschlossen werden. Ggf. muss sogar das ganze
    // Programm abgebrochen werden. Was genau passieren soll steht in
    // force_logoff:
    // Bit 0 => Logfiles durchsuchen nach Loglimitueberschreitungen.
    // Bit 1 => CLS abbrechen.
    msg_is_printed = 0,
    newchars;
  
  for(lf = loglist; lf; lf = lf->next)
    if(verbosity <= lf->override_verb ||
       (lf->override_verb == 0 && verbosity <= lf->verb)) {
      newchars = vfprintf(lf->stream, fmt, args);
      if(newchars < 0)
	fprintf(stdout, "%s: problems writing to %s%s%s.\n",
		progname, makelogname(lf->fname));
      else {
	lf->no_chars += newchars;
	msg_is_printed = 1;
	if(lf->lim_chars > 0 &&
	   lf->no_chars > lf->lim_chars &&
	   exceed_limit == 0) {
	  // Loglimit wurde ueberschritten.
	  exceed(1);
	  logprintf(ERROR_MSG,
		    "%s: %s%s%s %s size limit of %lu bytes exceeded.\n",
		    progname, makelogname(lf->fname),
		    limittype(lf->lim_mode), lf->lim_chars);
	  exceed(0);
	  if(lf->lim_mode == LOG_LIM_HARD)
	    force_logoff |= 2;
	  else 
	    force_logoff |= 1;
	}
      }
    }
  
  /* Zur Sicherheit werden Fehler auf jeden Fall irgendwo ausgegeben */
  if(verbosity == ERROR_MSG && !msg_is_printed)
    vfprintf(stdout, fmt, args);

  if(force_logoff > 0) {
    if(force_logoff & 2) {
      // Mindestens ein hard Loglimit wurde soeben uebrschritten.
      // Deshalb CLS beenden.
      exceed(1);
      logprintf(ERROR_MSG, "%s: aborting execution.\n", progname);
      exceed(0);
      exit(1);
    }
    else if(force_logoff & 1) {
      // Mindestens ein soft Loglimit wurde soeben uebrschritten.
      // Deshalb jetzt alle Logfiles beenden, bei denen das der Fall war.
      do {
	for(lf = loglist;
	    lf && !(lf->lim_chars > 0 && lf->no_chars > lf->lim_chars);
	    lf = lf->next);
	if(lf)
	  logoff(lf->fname);
      } while (lf);
    }
    else {
      // Das sollte nicht vorkommen!!!
      exceed(1);
      logprintf(ERROR_MSG, "%s: oooooops: very weird.\n", progname);
      exceed(0);      
    }
  }
}

/* Print Funktion zu benutzen analog printf: */
/* Erhaelt resprintf() als erstes Argument die NULL, so wird */
/* die Ausgabe auf die Logfiles geleitet. Der Verbosity-Level ist hier */
/* fest auf RESULT_MSG eingestellt. */
/* Ist das erste Argument, ein Zeiger auf eine geoeffnete Datei, */
/* so wird die Ausgabe dorthingeschrieben. */
/* Diese Funktion soll es erleichtern, Ausgaberoutinen zu erstellen, */
/* die wahlweise auf die Konsole/Logfiles oder in eine gegebene Datei */
/* schreiben sollen. */
void resprintf(FILE *fp, char *fmt, ...)
{
va_list
  args;

  va_start(args, fmt);

  if(fp == NULL)
    vlogprintf(RESULT_MSG, fmt, args);
  else
    vfprintf(fp, fmt, args);

  va_end(args);
}

/* Schreibt etwas NUR auf die Konsole (den Bildschirm). Und das auch */
/* nur dann, wenn der Verbositylevel entsprechend gesetzt ist. */
void conprintf(int verbosity, char *fmt, ...)
{
  if(isatty(1) && console_log && console_log->verb >= verbosity) {
    va_list args;
    va_start(args, fmt);
    vfprintf(console_log->stream, fmt, args);
    va_end(args);
  }
}

/* Print Funktion zu benutzen analog printf: */
/* Schreibt die angegebenen Daten auf alle geoeffneten Logfiles, deren */
/* Verbosity groesser oder gleich dem Argument verbosity von logprintf() */
/* ist. */
void logprintf(int verbosity, char *fmt, ...)
{
va_list
  args;

  va_start(args, fmt);

  vlogprintf(verbosity, fmt, args);

  va_end(args);
}

/* ============================================ */
/* Logging auf Datei logfilename mit Verb.level */
/* verbosity aktivieren. */
/* ============================================ */
int logon(char *logfilename, int verbosity, int open_mode,
	  unsigned long limit, int lim_mode)
{
  logfile_t
    *lf,
    *newlf;
  FILE
    *stream;
  char
    *fopenmode,
    nix = 0;

  if(open_mode == LOG_APPEND)
    fopenmode = "a";
  else if(open_mode == LOG_OVERWRITE)
    fopenmode = "w";
  else
    return 0;

  if(verbosity < 0 || verbosity > 31)
    return 0;

  if(logfilename == 0)
    logfilename = &nix;

  for(lf = loglist; lf; lf = lf->next)
    if(strcmp(logfilename, lf->fname) == 0) {
      logprintf(ERROR_MSG,
      	      "%s: allready logging to %s%s%s.\n",
	      progname, makelogname(logfilename));
      return 0;
    }

  if(logfilename[0]) {
    if((stream = fopen(logfilename, fopenmode)) == NULL) {
      logprintf(ERROR_MSG,
	      "%s: couldn't open %s%s%s.\n",
	      progname, makelogname(logfilename));
      return 0;
    }
  }
  else
    stream	   = stdout;

  if((newlf        = new logfile_t) == 0 ||
     (newlf->fname = new char[strlen(logfilename) + 1]) == 0) {
    if(newlf) {
      if(newlf->fname)
        delete newlf->fname;
      delete newlf;
    }
    logprintf(ERROR_MSG,
	    "%s: out of memory when allocating ctrl struct for %s%s%s.\n",
	    progname, makelogname(logfilename));
    return 0;
  }

  setbuf(stream, (char *) 0);

  if(stream != stdout) {
    time_t time2;
    char* tmstr;
    time(&time2);
    tmstr = ctime(&time2);
    fprintf(stream, "# CLS logfile\n");
    fprintf(stream, "# User: %s@%s\n", username, hostname);
    if(limit > 0)
      fprintf(stream, "# Logfile size limit: %lu bytes (%s)\n",
	      limit, limittype(lim_mode));
    fprintf(stream, "# Start Date: %s", tmstr);
  }

  strcpy(newlf->fname, logfilename);

  newlf->verb		= verbosity;
  newlf->override_verb	= 0;
  newlf->no_chars	= 0;
  newlf->lim_chars	= limit;
  newlf->lim_mode	= lim_mode;
  newlf->stream		= stream;
  newlf->next		= loglist;
  loglist		= newlf;

  if(stream == stdout)
    console_log = newlf;

  // Nur dann ne Meldung machen wenn ne Datei geoeffnet wurde.
  if(logfilename[0] != 0) {
    logprintf(RESULT_MSG,
	    "%s: started logging on %s%s%s (verbosity = %d",
	    progname, makelogname(logfilename), verbosity);
    if(limit > 0)
      logprintf(RESULT_MSG, ", %s limit %lu bytes).\n",
		limittype(lim_mode), limit);
    else
      logprintf(RESULT_MSG, ", no size limit).\n");
  }
  return 1;
}

/* ============================================ */
/* Logging auf Datei logfilename stoppen. */
/* ============================================ */
int logoff(char *logfilename)
{
logfile_t
  *lf,
  *prev;
char
  nix = 0;

  if(logfilename == 0) {
    console_log = 0;
    logfilename = &nix;
  }

  for(prev = 0, lf = loglist; lf; prev = lf, lf = lf->next)
    if(strcmp(logfilename, lf->fname) == 0) {
      if(lf->stream != stdout) {
        time_t time2;
        char* tmstr;
        time(&time2);
        tmstr = ctime(&time2);
        fprintf(lf->stream, "# End Date: %s", tmstr);
        fclose(lf->stream);
      }

      if(prev == 0)
	loglist = lf->next;
      else
        prev->next = lf->next;

      delete lf->fname;
      delete lf;
      return 1;
    }

  logprintf(ERROR_MSG,
          "%s: not currently logging to %s%s%s.\n",
	  progname, makelogname(logfilename));
  return 0;
}

// Beschraenken der Groesse der Logfiles.
int loglimit(char *logfilename, unsigned long limit, int mode)
{
  logfile_t
    *lf;
  char
    nix = 0;

  if(mode != LOG_LIM_HARD && mode != LOG_LIM_SOFT) {
    logprintf(ERROR_MSG, "%s: bad limit mode %d given.\n",
	      progname, mode);
    return 0;
  }
  
  if(logfilename == 0)
    logfilename = &nix;

  for(lf = loglist; lf; lf = lf->next)
    if(strcmp(logfilename, lf->fname) == 0) {
      exceed(1);
      if(limit == 0 && lf->lim_chars > 0)
	logprintf(RESULT_MSG, "%s: logfile size limit disabled on %s%s%s.\n",
		  progname, makelogname(logfilename));
      else if(limit > 0 && lf->lim_chars == 0)
	logprintf(RESULT_MSG,
	       "%s: logfile size limit enabled (%lu bytes, %s) on %s%s%s.\n",
		  progname, limit, limittype(mode),
		  makelogname(logfilename));
      else {
	logprintf(RESULT_MSG, "%s: logfile size limit changed on %s%s%s:\n",
		  progname, makelogname(logfilename));
	logprintf(RESULT_MSG, "%s: from %s %lu bytes to %s %lu bytes.\n",
		  progname, limittype(lf->lim_mode), lf->lim_chars,
		  limittype(mode), limit);
      }
      exceed(0);
      lf->lim_mode  = mode;
      lf->lim_chars = limit;
      return 1;
    }

  logprintf(ERROR_MSG,
	    "%s: not currently logging to %s%s%s.\n",
	    progname, makelogname(logfilename));
  return 0;
}


/* ============================================ */
/* Beim Loggen auf Datei logfilename den Verb.level */
/* auf verbosity setzen. */
/* ============================================ */
int logverb(char *logfilename, int verbosity)
{
  logfile_t
    *lf;
  char
    nix = 0;

  if(verbosity < 0 || verbosity > 31)
    return 0;

  if(logfilename == 0)
    logfilename = &nix;

  for(lf = loglist; lf; lf = lf->next)
    if(strcmp(logfilename, lf->fname) == 0) {
      exceed(1);
      logprintf(RESULT_MSG,
		"%s: verbosity changed from %d to %d on %s%s%s.\n",
		progname, lf->verb, verbosity,
		makelogname(logfilename));
      exceed(0);
      lf->verb = verbosity;
      return 1;
    }

  logprintf(ERROR_MSG,
	    "%s: not currently logging to %s%s%s.\n",
	    progname, makelogname(logfilename));
  return 0;
}

/* Die Verbosity der hoeheren Prioritaet setzen. */
void logverbover(int verbosity)
{
logfile_t
  *lf;

  for(lf = loglist; lf; lf = lf->next)
    if(lf->verb > 0)
      lf->override_verb = verbosity;

}

void logstate()
{
  logfile_t
    *lf;
  unsigned long
    nch;
  
  exceed(1);
  logprintf(RESULT_MSG, "Logfile statistics:\n");
  logprintf(RESULT_MSG, "Filename -- Verbosity -- Size -- Limit\n");

  for(lf = loglist; lf; lf = lf->next) {
    nch = lf->no_chars;
    if(lf->fname[0] != 0)
      logprintf(RESULT_MSG, "`%s' -- %d -- %lu bytes",
	       lf->fname, lf->verb, nch);
    else
      logprintf(RESULT_MSG, "stdout -- %d -- %lu bytes", lf->verb, nch);
    if(lf->lim_chars)
      logprintf(RESULT_MSG, " (%3.1f%%) -- %lu bytes %s\n",
		(nch * 100.0) / lf->lim_chars,
		lf->lim_chars, limittype(lf->lim_mode));
    else
      logprintf(RESULT_MSG, " -- none\n");
  }
  exceed(0);
}
