#include <registryFunction.h>
#include <epicsExport.h>
#include <aSubRecord.h>
#include <stdio.h>

long _index = 0;

static long buffer(aSubRecord *prec) {
  long *a;
  double *b, *vala;
  long *valb, *valc;
  int i;

  /* 
   * Field A is the switch to start recording. 
   * Field B is the input field. 
   * Field VALA is the output (waveform)
   * Field VALB is the number of elements in the buffer
   * Field VALC is the status (0 = OK, 1 = Buffer Full)
   */

  a = (long *)prec->a;
  b = (double *)prec->b;
  vala = (double *)prec->vala;
  valb = (long *)prec->valb;
  valc = (long *)prec->valc;

  if(a[0] == 1){
    // Add value to array
    if(_index < prec->nova){
      vala[_index] = b[0];
      _index++;
      valb[0] = _index;
      prec->neva = _index;
      valc[0] = 0;
    } else {
      valc[0] = 1;
    }
  } else if(a[0] == 2){
    if(_index){
      // Clear the array
      _index = 0;
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

epicsRegisterFunction(buffer);
