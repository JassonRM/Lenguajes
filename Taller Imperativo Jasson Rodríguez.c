//Jasson Rodríguez Méndez
//2017238970

#include <stdio.h>
#include <string.h>

//Función que imprime los equivalentes en millas del rango de 1 a 10 kilómetros
void miles(){
    for(int i=0; i<=10; i++){
        printf("%d kilómetros son %.2f millas\n", i, i*0.625);
    }
}

//Función que imprime el equivalente de grados celsius en grados celsiusToFarenheit
//Entrada: grados celsius a convertir (double)
void celsiusToFarenheit(double celsius){
    printf("%.2f grados Celsius equivale a %.2f grados Farenheit \n", celsius, (celsius*8/5)+32);
}

//Función recursiva que calcula la cantidad de dígitos de un número
//Entrada: integer cuya cantidad de digitos se quiere encontrar.
//Salida: integer con la cantidad de digitos
int digitos(int num){
    if(num == 0){
        return 0;
    }else{
        return 1 + digitos(num/10);
    }
}

//Función recursiva que calcula la cantidad de dígitos pares de un número
//Entrada: integer cuya cantidad de digitos pares se quiere encontrar.
//Salida: integer con la cantidad de digitos pares
int pares(int num){
    if(num == 0){
        return 0;
    }else if(num % 2 == 0){
        return 1 + pares(num/10);
    }else{
        return pares(num/10);
    }
}

//Función que compara el largo de dos strings
//Entrada: 2 punteros a cadenas de caracteres
//Salida: integer con valor 0 si son iguales, -1 si la primera cadena es más larga o 1 si la segunda cadena es más larga
int myStrcmp(char *s, char *p){
    if(*s == '\0' && *p == '\0'){
        return 0;
    }else if(*s == '\0'){
        return -1;
    }else if(*p == '\0'){
        return 1;
    }else{
        return myStrcmp(s+1, p+1);
    }
}

//Función que concatena dos strings
//Entrada: 2 punteros a cadenas de caracteres
//Salida: no posee pero modifica la primera cadena de caracteres
void myStrcat(char *dest, char *src){
    if(*src == '\0'){
        return;
    }else if(*dest == '\0'){
        *dest = *src;
        return myStrcat(dest + 1, src + 1);
    }else{
        return myStrcat(dest + 1, src);
    }
}

//Estructura de una palabra con su número de lineas y la cantidad de apariciones
struct Word{
    int lines;
    int line[100];
    char word[25];
};

//Función auxiliar que determina si una palabra es un conector
//Entrada: cadena de caracteres
//Salida: 0 si es conector o -1 si no lo es
int isConnector(char word[]){
    int counter;
    int connSize = 9;
    char *connectors[] = {"el", "la", "del", "a", "al", "de", "las", "los", "y"};

    for(counter = 0; counter < connSize; counter++){
        if(strcmp(word, connectors[counter]) == 0){
            return 0;
        }
    }
    return -1;
}

//Función auxiliar que determina si una palabra ya fue encontrada antes
//Entrada: cadena de caracteres, lista de palabras, cantidad de palabras y número de línea
//Salida: 0 si es ya existe (además añade el número de linea donde se encuentra) o -1 si no lo es
int exists(char word[], struct Word wordList[], int listCounter, int lineNumber){
    int counter;
    for(counter = 0; counter < listCounter; counter++){
        if(strcmp(word, wordList[counter].word) == 0){
            wordList[counter].line[wordList[counter].lines] = lineNumber;
            wordList[counter].lines++;
            return 0;
        }
    }
    return -1;
}

//Función que imprime una lista de un documento y la lista de líneas donde aparece.
//Entrada: path al archivo
//Salida: imprime la lista de palabras y sus lineas
void document(char *filename){
    FILE *file = fopen(filename, "r");

    if(file == NULL){
        printf("Error leyendo el archivo\n");
        return;
    }

    int lineNumber = 0;

    char buffer[25];
    char letter;
    int bufferCounter = 0;
    int listCounter = 0;
    struct Word wordList[10000];


    while((letter = fgetc(file)) != EOF){
        //Si no hay espacio y newline
        if(letter != ' ' && letter != '\n' && letter != '.' && letter != ','){
            buffer[bufferCounter] = letter;
            bufferCounter++;
        }else{
            buffer[bufferCounter] = '\0';
            bufferCounter = 0;

            //Buscar si es un conector
            if(isConnector(buffer) == 0){
                if(letter == '\n'){
                    lineNumber++;
                }
                continue;
            }

            //Buscar si ya existe
            if(exists(buffer, wordList, listCounter, lineNumber) == 0){
                if(letter == '\n'){
                    lineNumber++;
                }
                continue;
            }

            //Crea una nueva palabra
            struct Word palabra = {.lines = 0};
            strcpy(palabra.word, buffer);
            palabra.line[palabra.lines] = lineNumber;
            palabra.lines++;
            wordList[listCounter] = palabra;
            listCounter++;
            if(letter == '\n'){
                lineNumber++;
            }
        }
    }

    //Imprimir todas las palabras
    struct Word actual;
    int counter;
    for(counter = 0; counter < listCounter; counter++){
        printf("Palabra: %s\n", wordList[counter].word);
        printf("Lineas: ");
        int i;
        for(i = 0; i < wordList[counter].lines; i++){
            printf("%d ", wordList[counter].line[i]);
        }
        printf("\n");
    }
}

//Función que imprime las palabras de su entrada en orden descendente de acuerdo a su frecuencia.
//Entrada: cadena de caracteres a analizar
//Salida: imprime la lista de palabras y la cantidad de sus apariciones
void frequency(char entrada[]){
    char buffer[25];
    char letter;
    int bufferCounter = 0;
    int listCounter = 0;
    struct Word wordList[10000];

    int charCounter = 0;
    while((letter = entrada[charCounter]) != '\0'){
        charCounter++;
        //Si no hay espacio y newline
        if(letter != ' ' && letter != '\n' && letter != '.' && letter != ','){
            buffer[bufferCounter] = letter;
            bufferCounter++;
        }else{
            buffer[bufferCounter] = '\0';
            bufferCounter = 0;

            //Buscar si ya existe
            if(exists(buffer, wordList, listCounter, 0) == 0){
                continue;
            }

            //Crea una nueva palabra
            struct Word palabra = {.lines = 1};
            strcpy(palabra.word, buffer);
            wordList[listCounter] = palabra;
            listCounter++;
        }
    }

    //Insertion sort
    struct Word temp;
    int sortCounter;
    int auxCounter;
    for(sortCounter = 1; sortCounter < listCounter - 1; sortCounter++){
        auxCounter = sortCounter;
        while(auxCounter > 0 && wordList[auxCounter - 1].lines < wordList[auxCounter].lines){
            temp = wordList[auxCounter];
            wordList[auxCounter] = wordList[auxCounter - 1];
            wordList[auxCounter - 1] = temp;
            auxCounter--;
        }
    }

        //Imprimir todas las palabras
    struct Word actual;
    int counter;
    for(counter = 0; counter < listCounter; counter++){
        printf("Palabra: %s\n", wordList[counter].word);
        printf("Apariciones: %d\n", wordList[counter].lines);
    }
}

//Función principal que ejecuta un ejemplo de cada función implementada
//Nota: debe ejecutarla en la misma carpeta que el archivo Ejemplo.txt para que funcione
int main(){
    miles();
    celsiusToFarenheit(25);
    printf("El número 123456 posee %d dígitos \n", digitos(123456));
    printf("El número 123456 posee %d dígitos pares \n", pares(123456));

    char string1[100] = "buenas tardes";
    char string2[] = "adios";
    char *str1 = string1;
    char *str2 = string2;

    printf("Resultado myStrcmp: %d \n", myStrcmp(str1, str2));
    myStrcat(str1, str2);
    printf("Resultado de myStrcat: %s \n", str1);

    document("Ejemplo.txt");

    char mensaje[] = "Este es un mensaje con muchas palabras que se pueden repetir en el mensaje para medir la frecuencia de las palabras del mensaje la la la la la.";
    printf("Frecuencia en: %s\n", mensaje);
    frequency(mensaje);

    return 0;
}
