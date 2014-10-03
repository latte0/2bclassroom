#include <stdio.h>
#include <time.h>
#include <stdlib.h>
/* 関数宣言 */
int main(void)
{
    /* 説明書き */
    printf ("\n<<<手を入力してください>>>\n[グー 0][チョキ 1][パー 2]\n---> ");
    /* プレイヤーとコンピュータの関数宣言 */
    
    int user,cpu;
    /* 時間の取得 */
    srand((unsigned)time(NULL));
    
    /* 乱数生成 , 変数CPUへ代入*/
    cpu = rand() % 3;
    
    /* 入力受付 */
    scanf("%d",&user);
    
    /* 手を表示 */
    if(user==0||user==1||user==2){
        if(user==0)printf("\nプレイヤー『グー』vs");
    	else if(user==1)printf("\nプレイヤー『チョキ』vs");
    	else if(user==2)printf("\nプレイヤー『パー』vs");
	if(cpu==0)printf(" コンピュータ『グー』");
        else if(cpu==1)printf(" コンピュータ『チョキ』");
        else if(cpu==2)printf(" コンピュータ『パー』");

        printf("\n\n結果は『");
    
        /* 条件分岐 */
        if (user == cpu) printf("あいこ");
        else if (user == 0 && cpu == 1) printf("プレイヤーの勝ち");
        else if (user == 0 && cpu == 2) printf("コンピュータの勝ち");
        else if (user == 1 && cpu == 0) printf("コンピュータの勝ち");
        else if (user == 1 && cpu == 2) printf("プレイヤーの勝ち");
        else if (user == 2 && cpu == 0) printf("プレイヤーの勝ち");
        else if (user == 2 && cpu == 1) printf("コンピュータの勝ち");
        printf("』\n");
    }
    else printf("不正な文字列です,終了します。\n”);
    
    /* 返り値なし */
    return 0;
}
