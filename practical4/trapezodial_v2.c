#include<stdio.h>
#include<math.h>


float degtorad(float degang);

int main(){

  int N=12, i;
  float TanArr[N+1], deg, rad;

  // Calculate the values of f(xi) where i=0, 1, ..., 12
  // as array elements (xi in radians)
  for(i=0; i<=N; i++){
     deg=i*5.0;
     rad=degtorad(deg);
     TanArr[i]=tan(rad);
     printf("TanArr[%d]=%f (f(x) at x=%d)\n", i, TanArr[i], i);

  }

  //Find the area by trapezodial rule 
  float area;
  area=TanArr[0]+TanArr[N];
  for(i=1; i<N; i++){
    area=area+2.0*TanArr[i];
  }


  //Multiply area by (pi/3)/2N after converting it to radians 
  float mult_rad=degtorad((60.0-0.0)/(2.0*N));
  area=mult_rad*area;

  
  //Approximated result 
  printf("\nTrapezodial result:%f\n", area);
  //Actual result (in(2))
  printf("Real Result: %f\n", log(2.0));


return 0;
}


float degtorad(float degang){
  return((M_PI*degang)/180.0);
}
