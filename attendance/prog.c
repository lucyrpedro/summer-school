#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  int h, m, s, x, y, z;
  FILE *fptr_in, *fptr_out;
  char name[80], str[80];

  fptr_in = fopen("file-prog-c.csv","r");

  if(fptr_in == NULL)
  {
    printf("Error!");
    exit(1);
  }

  fptr_out = fopen("output.csv","w");

  if(fptr_out == NULL)
  {
    printf("Error!");
    exit(1);
  }

  fscanf(fptr_in, "%[a-z A-Z-],%d:%d:%d\n", name, &h, &m, &s);

  while (strcmp("END", str) != 0){

    do {
       fscanf(fptr_in, "%[a-z A-Z-],%d:%d:%d\n", str, &x, &y, &z);

       h += x;
       m += y;
       s += z;

    } while (strcmp(name, str) == 0);

    h -= x;
    m -= y;
    s -= z;

    m += (s/60);
    h += (m/60);
    s = s%60;
    m = m%60;

    fprintf(fptr_out, "%s,%02d:%02d:%02d\n", name, h, m, s);
    h = x;
    m = y;
    s = z;
    strcpy(name, str);

  }

  fclose(fptr_in);
  fclose(fptr_out);

  return 0;
}
