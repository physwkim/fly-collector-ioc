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
   * Field C is the output (waveform)
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
      valc[0] = 0;
    } else {
      valc[0] = 1;
    }
  } else if(a[0] == 2){
    // Clear the array
    _index = 0;
    valb[0] = 0; 
    valc[0] = 0;
    for(i=0;i<prec->nova;i++){
      vala[i] = 0;
    }
  }

  return 0; /* process output links */
}

epicsRegisterFunction(buffer);
