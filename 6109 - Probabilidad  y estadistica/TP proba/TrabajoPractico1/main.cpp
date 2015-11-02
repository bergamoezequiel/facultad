#include <iostream>
#include <math.h>
#include <iomanip>
using namespace std;

/*lambda = 1/10 (medido en 1/10 dias) */
long double ProbabilidadPoisson(int x);
double FN(int x);
long double factorial(long double x);
int main()
{
    double tablaDeValoresFN[74];
    tablaDeValoresFN[73]=1;
    int i;
   // cout << "2 al cub es "<< 2**3;
    cout << "Hello wopprld!" << endl;

    for (i=0; i<73; i++){

        tablaDeValoresFN[i]=ProbabilidadPoisson(i);
        //si es distinto de 0 agrega lo acumulado anteriormente
        if (i!=0){
                tablaDeValoresFN[i]+= tablaDeValoresFN[i-1];
        }
        cout <<i<<": ";
        std::cout<< std::setprecision(11) << tablaDeValoresFN[i]<< endl;

    }
    std::cout<< std::setprecision(11) << tablaDeValoresFN[73]<< endl;

    return 0;

}
double FN(int x) {
    return 55;
}
long double ProbabilidadPoisson(int x){

    return (powl(exp(1),-36.525) * powl(36.525,x))/factorial(x) ;

}
 long double factorial(long double x){
    if (x==0 or x==1){
        return 1 ;
    }
    else{
        return factorial(x-1) * x;
    }}


