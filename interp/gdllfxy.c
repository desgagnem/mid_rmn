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
wordint f77name(gdllfxy)(wordint *gdid, ftnfloat *lat, ftnfloat *lon, ftnfloat *x, ftnfloat *y, wordint *n)
{
  return c_gdllfxy(*gdid, lat, lon, x, y, *n);

}

wordint c_gdllfxy(wordint gdid, ftnfloat *lat, ftnfloat *lon, ftnfloat *x, ftnfloat *y, wordint n)
{
  ftnfloat xlat1, xlon1, xlat2, xlon2;
  wordint i,j, npts, un;
  ftnfloat *tmpx, *tmpy;
  ftnfloat delxx, delyy;
  ftnfloat dlat, dlon, swlat, swlon;
  wordint indx, indy;

  _Grille gr;

  wordint gdrow_id, gdcol_id;

  c_gdkey2rowcol(gdid,  &gdrow_id,  &gdcol_id);

  gr = Grille[gdrow_id][gdcol_id];
  npts = n;
  un = 1;

  switch(gr.grtyp[0])
    {
    case 'A':
      for (i=0; i < n; i++)
	      {
	      lat[i] = (y[i]-1.0)*gr.fst.xg[DLAT]+gr.fst.xg[SWLAT];
	      lon[i] = (x[i]-1.0)*gr.fst.xg[DLON]+gr.fst.xg[SWLON];
	      lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	      }
      break;

    case 'B':
      for (i=0; i < n; i++)
	      {
	      lat[i] = (y[i]-1.0)*gr.fst.xg[DLAT]+gr.fst.xg[SWLAT];
	      lon[i] = (x[i]-1.0)*gr.fst.xg[DLON]+gr.fst.xg[SWLON];
	      lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	      }
      break;

    case 'E':
      tmpx = (ftnfloat *) malloc(n*sizeof(ftnfloat));
      tmpy = (ftnfloat *) malloc(n*sizeof(ftnfloat));
      for (i=0; i < n; i++)
	      {
	      dlat  = 180.0 / gr.nj;
	      dlon  = 360.0 / (gr.ni - 1);
	      swlat = -90.0 + 0.5 * dlat;
	      swlon = 0.0;
	      tmpx[i] = (x[i]-1.0)*dlon+swlon;
	      tmpy[i] = (y[i]-1.0)*dlat+swlat;
	      }

      f77name(ez_gfllfxy)(lon,lat,tmpx,tmpy,&n,&gr.fst.xg[XLAT1],&gr.fst.xg[XLON1],&gr.fst.xg[XLAT2],&gr.fst.xg[XLON2]);
      free(tmpx);
      free(tmpy);
      break;


    case 'L':
      for (i=0; i < n; i++)
	      {
	      lon[i] = (x[i]-1.0)*gr.fst.xg[DLON]+gr.fst.xg[SWLON];
	      lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	      lat[i] = (y[i]-1.0)*gr.fst.xg[DLAT]+gr.fst.xg[SWLAT];
	      }
      break;

    case 'N':
    case 'S':
      f77name(ez_vllfxy)(lat,lon,x,y,&npts,&un,&gr.fst.xg[D60],&gr.fst.xg[DGRW],&gr.fst.xg[PI],&gr.fst.xg[PJ],&gr.fst.hemisphere);
      for (i=0; i < n; i++)
	      {
	      lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	      }
      break;

    case 'T':
      f77name(ez_vtllfxy)(lat,lon,x,y, &gr.fst.xg[CLAT], &gr.fst.xg[CLON], &gr.fst.xg[TD60], &gr.fst.xg[TDGRW], &gr.ni, &gr.nj, &npts);
      break;

    case '!':
      f77name(ez_llflamb)(lat,lon,x,y,&npts,&gr.grtyp,&gr.fst.ig[IG1], &gr.fst.ig[IG2], &gr.fst.ig[IG3], &gr.fst.ig[IG4]);
      break;


    case 'Y':
      switch (gr.grref[0])
         {
         case 'O':
         for (i=0; i < n; i++)
            {
            lat[i] = (tmpy[i])*gr.fst.xgref[DLAT]+gr.fst.xgref[SWLAT];
            lon[i] = (tmpx[i])*gr.fst.xgref[DLON]+gr.fst.xgref[SWLON];
            lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
            }
         break;

         default:
         fprintf(stderr, "********************************************************\n");
         fprintf(stderr, "<gdllfxy>: This operation is not supported for 'Y' grids\n");
         fprintf(stderr, "********************************************************\n");
         break;
         }
      break;

    case '#':
    case 'Z':
    case 'G':
      tmpx = (ftnfloat *) malloc(n*sizeof(ftnfloat));
      tmpy = (ftnfloat *) malloc(n*sizeof(ftnfloat));
      for (i=0; i < n; i++)
	      {
	      indx = (int)x[i]-1;
	      indy = (int)y[i]-1;

	      indx = indx < 0 ? 0 : indx;
	      indy = indy < 0 ? 0 : indy;
	      indx = indx > gr.ni-2 ? gr.ni-2 : indx;
	      indy = indy > gr.j2-2 ? gr.j2-2 : indy;
	      delxx = gr.ax[indx+1]-gr.ax[indx];
	      tmpx[i] = gr.ax[indx] + ((x[i]-1.0-indx)*delxx);

	      delyy = gr.ay[indy+1]-gr.ay[indy];
	      tmpy[i] = gr.ay[indy] + ((y[i]-1.0-indy)*delyy);
	      }

      switch (gr.grref[0])
	      {
	      case 'E':
	        f77name(cigaxg)(&gr.grref,&xlat1,&xlon1,&xlat2,&xlon2,
			        &gr.fst.igref[IG1],&gr.fst.igref[IG2],&gr.fst.igref[IG3],&gr.fst.igref[IG4]);
	        f77name(ez_gfllfxy)(lon, lat, tmpx, tmpy, &npts, &gr.fst.xgref[XLAT1], &gr.fst.xgref[XLON1],
			            &gr.fst.xgref[XLAT2], &gr.fst.xgref[XLON2]);
	        break;

	      case 'S':
	      case 'N':
	        f77name(ez_vllfxy)(lat,lon,tmpx,tmpy,&npts,&un,&gr.fst.xgref[D60],
			           &gr.fst.xgref[DGRW],&gr.fst.xgref[PI],&gr.fst.xgref[PJ],&gr.fst.hemisphere);
	        for (i=0; i < n; i++)
	          {
	          lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	          }
	        break;

	      case 'L':
	        for (i=0; i < n; i++)
	          {
	          lat[i] = (tmpy[i])*gr.fst.xgref[DLAT]+gr.fst.xgref[SWLAT];
	          lon[i] = (tmpx[i])*gr.fst.xgref[DLON]+gr.fst.xgref[SWLON];
	          lon[i] = (ftnfloat) (fmod((double) (lon[i] + 360.0), (double) 360.0));
	          }
	        break;

	      default:
	      fprintf(stderr,"<gdllfxy> Errrrrrrrrrrreur!\n");
	      break;
      	}
      free(tmpx);
      free(tmpy);
      break;
    }

  return 0;

}
