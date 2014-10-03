#include <stdio.h>
#include <time.h>
#include <stdlib.h>
int main(void)
{
    printf ("\n<<<手を入力してください>>>\n\n[グー 0][チョキ 1][パー 2]\n\n---> ");
    
    int user,cpu;
    srand((unsigned)time(NULL));
    
    cpu = rand() % 3;
    
   @scanf@("%d",&user);
