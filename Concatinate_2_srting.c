#include<conio.h>
#include<stdio.h>
void main()
{
    char A[10],B[10],C[100];
    int i=0,j=0,k=0;
    printf("Enter The Fist String\n");
    scanf("%s",&A);
    printf("Enter The Second String\n");
    scanf("%s",&B);
    while (A[i]!='\0')      
    {
        C[j]=A[i];
        j++;
        i++;
    }
    
    while (B[k]!='\0')
    {
        C[j]=B[k];
        j++;
        k++;
    }
    C[j]='\0';
    printf("%s",C);
    
    

}