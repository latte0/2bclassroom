int input(char c, char piece)
{

  int flg=0;
  switch(c){
    case '1': if(line3[0]==' ') line3[0]=piece; else flg=1; break;
    case '2': if(line3[1]==' ') line3[1]=piece; else flg=1; break;
    case '3': if(line3[2]==' ') line3[2]=piece; else flg=1; break;
    case '4': if(line2[0]==' ') line2[0]=piece; else flg=1; break;
    case '5': if(line2[1]==' ') line2[1]=piece; else flg=1; break;
    case '6': if(line2[2]==' ') line2[2]=piece; else flg=1; break;
    case '7': if(line1[0]==' ') line1[0]=piece; else flg=1; break;

    case '8': if(line1[1]==' ') line1[1]=piece; else flg=1; break;
    case '9': if(line1[2]==' ') line1[2]=piece; else flg=1; break;

    default : @flg=1@;
  }
  return flg;
}
