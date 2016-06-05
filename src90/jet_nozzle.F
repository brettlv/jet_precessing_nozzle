c=======================================================================
c
c    \\\\\\\\\\      B E G I N   S U B R O U T I N E      //////////
c    //////////        J E T    P R E C E S S I N G       \\\\\\\\\\
c
c=======================================================================
C      STELLAR WINDS FROM INDIVIDUAL STARS

C      Written by Zhaoming GAN (zmgan@shao.ac.cn)
C      Created:: Jun. 05, 2016
C      Modified: Jun. 05, 2016

#define V1_JET   0        /* jet velocity */
#define V2_JET   0        /* jet velocity */
#define V3_JET   1.0E+1   /* jet velocity */
#define DEN_JET  1.0E-3   /* mass-loading rate        */
#define SE_JET   1.0E-2   /* specific internal energy */
#define R_JET    1.0      /* "size" of jet engine     */  

       subroutine jet_nozzle
c      
       use real_prec
       use param
       use cons
       use field
       use bndry
       use grid
       use root
       use scratch
#ifdef MPI_USED
       use mpiyes
#else
       use mpino
#endif
       use mpipar

       implicit none
       integer  i,j,k


       do k=ks-1,ke
           do j=js-1,je
               do i=is-1,ie
                  if(sqrt(x1b(i)**2+x2b(j)**2+x3b(k)**2).le.R_JET) then
                       v1(i,j,k) = V1_JET
                       v2(i,j,k) = V2_JET
                       v3(i,j,k) = V3_JET

                       d (i,j,k) = DEN_JET
                       e (i,j,k) = DEN_JET*SE_JET
                  endif
               enddo
           enddo
       enddo

       do i=1,6
          do j=1,5
             bvstat(i,j) = 0
          enddo
       enddo

       return
       end
c
c======================================================================
c    \\\\\\\\\\        E N D   S U B R O U T I N E        //////////
c======================================================================


