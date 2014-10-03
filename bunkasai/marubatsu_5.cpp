else if((line3[0]==piece &&
         line2[0]==piece &&
         line1[0]==piece) ||
         line3[1]==piece &&
         line2[1]==piece && 
         line1[1]==piece) ||
         line3[2]==piece &&
         line2[2]==piece && 
         line1[2]==piece)
){
  if(piece == 'o'){
    printf("›@æè‚ÌŸ‚¿\n");
    return @1@;
  }
  else{
    printf("~@Œãè‚ÌŸ‚¿\n");
    return 1;
  }
}