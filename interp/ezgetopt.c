/* RMNLIB - Library of useful routines for C and FORTRAN programming
 * Copyright (C) 1975-2001  Division de Recherche en Prevision Numerique
 *                          Environnement Canada
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation,
 * version 2.1 of the License.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "ezscint.h"
#include "ez_funcdef.h"


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

wordint f77name(ezgetopt)(char *option, char *value, F2Cl lenoption, F2Cl lenvalue)
{
   wordint icode;
   wordint l_lenoption, l_lenvalue;
   char local_opt[32], local_val[32];

   l_lenoption = (wordint) lenoption;
   l_lenvalue = (wordint) lenvalue;
   
   ftnstrclean(option,l_lenoption);
   ftnstrclean(value,l_lenvalue);
   strncpy(local_opt, option, l_lenoption);
   local_opt[l_lenoption] = '\0';
   
   icode = c_ezgetopt(local_opt, value);

   return icode;
}

wordint c_ezgetopt(char *option, char *value)
{
  char local_opt[32], local_val[32];
  wordint i;
  
  strcpy(local_opt, option);
  
  for (i=0; i < strlen(local_opt); i++)
    local_opt[i] = (char) tolower((int)local_opt[i]);
  
  if (0 == strcmp(local_opt, "verbose"))
    {
    switch (groptions.verbose)
      {
      case 1:
	strcpy(value, "yes");
	break;
	
      case 2:
	strcpy(value, "yesyesyes");
	break;
	
      default:
	strcpy(value, "no");
	break;
      }
    }
  
  if (0 == strcmp(local_opt, "polar_correction"))
    {
    switch (groptions.polar_correction)
      {
      case 1:
	strcpy(value, "yes");
	break;
	
      default:
	strcpy(value, "no");
	break;
      }
    }
  
  if (0 == strcmp(local_opt, "interp_degree"))
    {
    switch (groptions.degre_interp)
      {
      case 0:
	strcpy(value, "nearest");
	break;
	
      case 1:
	strcpy(value, "linear");
	break;
	
      case 3:
	strcpy(value, "cubic");
	  break;
	  
      default:
	strcpy(value, "error");
	break;
      }
    }
  
  if (0 == strcmp(local_opt, "degre_interp"))
    {
    switch (groptions.degre_interp)
      {
      case 0:
	strcpy(value, "voisin");
	break;
	
      case 1:
	strcpy(value, "lineaire");
	break;
	
      case 3:
	strcpy(value, "cubique");
	  break;
	  
      default:
	strcpy(value, "erreur");
	break;
      }
    }
  
  if (0 == strcmp(local_opt, "extrap_degree"))
    {
    switch (groptions.degre_extrap)
      {
      case 0:
	strcpy(value, "nearest");
	break;
	
      case 1:
	strcpy(value, "linear");
	break;
	
      case 3:
	strcpy(value, "cubic");
	break;
	
      case MAXIMUM:
	strcpy(value, "maximum");
	break;
	
      case MINIMUM:
	strcpy(value, "minimum");
	break;
	
      case VALEUR:
	strcpy(value, "value");
	break;
	
      case ABORT:
	strcpy(value, "abort");
	break;
	
      default:
	strcpy(value, "error");
	break;
      }
    }
   
  if (0 == strcmp(local_opt, "degre_extrap"))
    {
    switch (groptions.degre_extrap)
      {
      case 0:
	strcpy(value, "voisin");
	break;
	
      case 1:
	strcpy(value, "lineaire");
	break;
	
      case 3:
	strcpy(value, "cubique");
	break;
	
      case MAXIMUM:
	strcpy(value, "maximum");
	break;
	
      case MINIMUM:
	strcpy(value, "minimum");
	break;
	
      case VALEUR:
	strcpy(value, "valeur");
	break;
	
      case ABORT:
	strcpy(value, "abort");
	break;
	
      default:
	strcpy(value, "erreur");
	break;
      }
    }
   
  return 0;
}
      
