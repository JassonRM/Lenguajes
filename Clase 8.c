#include <stdio.h>

int strcmp(char *s, char *p){
    printf(s);
    if(s[0] == '\0' && p[0] == '\0'){
        return 0;
    }else if(s[0] == '\0'){
        return -1;
    }else if(p[0] == '\0'){
        return 1;
    }else{
        return strcmp(*(s+1), *(p+1));
    }
}

void strcat1(char *dest, char *src){
    return;
}

int main(int argc, char const *argv[])
{
    char string[] = "hola\0";
    char string1[] = "adios\0";

    char *str = string;
    char *str1 = string1;

    printf("%d", strcmp(str, str1));
    return 0;
}
