    if (user == cpu) printf("あいこ");
    else if (user == 0 && cpu == 1) printf("プレイヤーの勝ち");
    else if (user == 0 && cpu == 2) printf("コンピュータの勝ち");
    else if (user == 1 && cpu == 0) printf("コンピュータの勝ち");
    else if (user == 1 && cpu == 2) printf("プレイヤーの勝ち");
    else if (user == 2 && cpu == 0) printf("プレイヤーの勝ち");
    else if (user == 2 && cpu == 1) printf("コンピュータの勝ち");
    else printf("不正な文字列です。");
    
    printf("』\n");
    
    /* 返り値なし */
   @return 0;@
}
