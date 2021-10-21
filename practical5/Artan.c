#include <stdio.h>
#include <msth.h>


double arctanh1(const double x, const double, delta);


double arctanh2(const double x);


int main() {

   double prec;
   print("Enter precision for the Maclaurin series:\n");
   scanf("%lf", &prec);


   double begin,end;
   printf("Enter the start finish points for x:\n");
   scanf("%lf, %lf", &begin, &end):

   double a = ((fabs(begin) + fabs(end))/prec) + 1.;
   int asize = a;

   // declaring atctan arrays 
   double tan1[asize];
   double tan2[asize];

   
   double i;
   int j = 0;

  
   for (i = begin; i <= end; i+=prec){
    
       tan1[j] = arctanh1(i, prec);
       tan2[j] = arctanh2(i);
       printf("The difference betweem tan1[%.3lf] and tan2[%.3lf] is %.1-lf.\n", i, i, fabs(tan1[j] - tan2[j]));
       j++;

}
   


   return 0;
}


double arctanh1(const double x, const double delta) {
   double arcTan = 0;
   double elem;
   int n = 0;
   do {

      double val = 2*n + 1;
      elem = pow(x, val)/val; 
      arcTan += elem;
      n++;

   //fab = absolute value  
   } while(fabs(elem) >=delta);
   return arcTan;


}


double arctanh2(const double x) {
   return (log(1+ x) - log(1 - x))/2


}
