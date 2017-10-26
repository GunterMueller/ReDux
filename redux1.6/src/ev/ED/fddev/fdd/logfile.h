// -*- C++ -*-
#ifndef logfile_h
#define logfile_h

#include <stdio.h>
#include <stdarg.h>

/* ==================================== */
/* Diese Datei Gehoert zum Modul shell. */
/* ==================================== */

/* Symbolische Konstante fuer Verbosities */
/* und den Logfile-Schreib-Modus. */
enum {
  LOG_APPEND    = 0,
  LOG_OVERWRITE = 1,
  LOG_LIM_HARD  = 2,
  LOG_LIM_SOFT  = 3,
  //========================================================
  LOGCMD_MSG	= 0, // Mitloggen der Kommandozeilen. Fuer
		     // alles Andere STRENGSTENS VERBOTEN!!!
  //========================================================
  ERROR_MSG	= 1, // Fehlermeldungen.
  RESULT_MSG	= 2, // Ergebnisbotschaften.
  BIGSTEP_MSG	= 3, // Abschluss von Teilalgorithmen.
  TRACE_MSG	= 4, // Was passiert genau alles?
  DEBUG_MSG     = 5  // Ausgeben allen Muells zum Debuggen.
                     // Wenn der Kram spaeter laeuft, sollten die 
                     // entspr. logprintf\'s aus Laufzeitgruenden
                     // rauskommentiert werden (sagt Bulli!)
};

void vlogprintf(int verbosity, char *fmt, va_list args);

void resprintf(FILE *fp, char *fmt, ...);

void conprintf(int verbosity, char *fmt, ...);

void logprintf(int verbosity, char *fmt, ...);

int logon(char *logfilename, int verbosity,
	  int open_mode = LOG_OVERWRITE,
	  unsigned long limit = 0,
	  int lim_mode = LOG_LIM_SOFT);

int logoff(char *logfilename);

int loglimit(char *logfilename, unsigned long limit, int mode);

int logverb(char *logfilename, int verbosity);

void logverbover(int verbosity);

void logstate();

#endif
