pragma circom 2.0.0;

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template multiplier (){  
   // input signal
      signal input a;
      signal input b;

   // Intermediate signal
      signal x;
      signal y;
   
   // output signal
   signal output q;

   // creating instances of gates
   component and= AND();
   component not = NOT();
   component or  = OR();

   // generating x
   and.a <== a;
   and.b <== b;
   x<== and.out;

   // generating y;
   not.in <== b;
   y<== not.out;

   // generating q
   or.a <== x;
   or.b<== y;

   q<== or.out;
}

component main = multiplier();