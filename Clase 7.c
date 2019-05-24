#include <stdio.h>

void miles(){
    for(int i=0; i<=10; i++){
        printf("%d kilómetros son %lf millas\n", i, i*0.625);
    }
}

void celsiusToFarenheit(double celsius){
    printf("%.2f grados Celsius equivale a %.2f grados Farenheit", celsius, (celsius*8/5)+32);
}

int digitos(int num){
    if(num == 0){
        return 0;
    }else{
        return 1 + digitos(num/10);
    }
}

int main(){
    miles();
    celsiusToFarenheit(25);
    printf("El número 123456 posee %d dígitos", digitos(123456));
    printf("%d", digitos(654));
    return 0;
}

