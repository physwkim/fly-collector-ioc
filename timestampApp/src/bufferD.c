#include <registryFunction.h>
#include <epicsExport.h>
#include <aSubRecord.h>
#include <stdio.h>

// Index array for 10 aSub records.
long idx[] = {0,0,0,0,0,0,0,0,0,0};

static long bufferD(aSubRecord *prec) {
  long *a, *c;
  double *b, *vala;
  long *valb, *valc;
  int i;

  /* 
   * Field A is the switch to start recording.
   * Field B is the input data
   * Field C is index of the aSub record
   * Field VALA is the data output (waveform)
   * Field VALB is the number of elements in the buffer
   * Field VALC is the status (0 = OK, 1 = Buffer Full)
   */

  a = (long *)prec->a;
  b = (double *)prec->b;
  c = (long *)prec->c;
  vala = (double *)prec->vala;
  valb = (long *)prec->valb;
  valc = (long *)prec->valc;

  if(a[0] == 1){
    // Add value to array
    if(idx[c[0]] < prec->nova){
      vala[idx[c[0]]] = b[0];
      idx[c[0]]++;
      valb[0] = idx[c[0]];
      prec->neva = idx[c[0]];
      valc[0] = 0;
    } else {
      valc[0] = 1;
    }
  } else if(a[0] == 2){
    if(idx[c[0]]){
      // Clear the array
      idx[c[0]] = 0;
      valb[0] = 0; 
      valc[0] = 0;
      prec->neva = prec->nova;
      for(i=0;i<prec->nova;i++){
        vala[i] = 0;
      }
    }
  }

  return 0; /* process output links */
}

epicsRegisterFunction(bufferD);
