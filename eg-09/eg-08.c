/* eg-01.c - C source file.
 
   Copyright (c) 2020-2022 - Monaco F. J. <monaco@usp.br>

   This file is part of SYSeg. 

   SYSeg is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   SYSeg repository is accessible at https://gitlab.com/monaco/syseg

*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void foo();

int main()
{
  char a[5];
  
  a[0] = 'H';
  a[1] = 'e';
  a[2] = 'l';
  a[3] = 'l';
  a[4] = 'o';

  /* a[21] =  ( char ) ((int)foo      ) & 0x000000ff; */
  /* a[22] =  ( char ) ((int)foo >>  8) & 0x000000ff; */
  /* a[23] =  ( char ) ((int)foo >> 16) & 0x000000ff; */
  /* a[24] =  ( char ) ((int)foo >> 24) & 0x000000ff; */

  * ((int *) &a[21]) = (int) foo;
  
  return 7;
}

void foo()
{
  write (1, "Ops\n", 4);
  exit(0);
}
