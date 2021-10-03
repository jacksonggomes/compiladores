#include <stdio.h>

int main(int argc, char *argv[]){
    int a,b,soma;
    printf("Escreva o 1 numero:\n");
    scanf("%d", &a);
    printf("Escreva o 2 numero:\n");
    scanf("%d", &b);
    soma = a+b;
    printf("A soma dos valores é: %d\n",soma);

    return 0;
}