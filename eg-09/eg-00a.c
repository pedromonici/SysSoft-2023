/* eg-09.c - A buffer-overflow vulnerable program.
 
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

int verify_password (const char *);

int main (void)
{
  int verified = 0;
  char user_key[10];

  /* Read user's credentials. */

  printf ("Enter password: ");  
  scanf ("%s", user_key);

  /* Verify credentials. */
  
  if (verify_password (user_key))
    verified = 1;

  if (!verified)
    {
      printf ("Access denied\n");
      exit (1);
    }

  printf ("Access granted.\n");
  
  /* Priviledged code follows... */

  return 0;
}

/* This might be a function which encrypts the supplied 'key' and
   checks it agains a well-secured database.*/

int verify_password (const char *key)
{
  return 0;  /* Let's assume the supplied credentials are wrong. */
}

