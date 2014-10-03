printf("%s%s%s\n",line1,line2,line3);
if(judge(turn) == 1){
  return 0;
}
if(turn=='@o@'){
  turn='x';

}
else turn='o';
