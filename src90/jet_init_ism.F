c=======================================================================
c
c    \\\\\\\\\\      B E G I N   S U B R O U T I N E      //////////
c    //////////     G C   W I N D   A C C R E T I O N     \\\\\\\\\\
c
c                            Developed by
c                      Zhaoming Gan, Zhiyuan Yao
c                Shanghai Astronomical Observatory, CAS
c                      email to: zmgan@shao.ac.cn
c
c=======================================================================
c
      subroutine jet_init_ism 
c
      use real_prec
      use param
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
      use gravmod
      use cons

      use codeunit
c
      implicit NONE
c
      integer  :: i, j, k
      real(rl) :: mbh, d0floor, csfloor
c
c-----------------------------------------------------------------------
c
      call jet_init_unit

      mbh    = 3.5d+6  ! Msun
      ptmass = mbh*msun/munit 
      guniv  = 6.6738d-08/(lunit**3/munit/tunit**2)

c
c     Set up background ISM.
c
      d0floor = 1.0d-6
      csfloor = 1.0d+1

      do k=1,kn
         do j=1,jn
            do i=1,in
               d (i,j,k) = d0floor
               e (i,j,k) = d(i,j,k)*csfloor**2
               v1(i,j,k) = 0.0D0
               v2(i,j,k) = 0.0D0
               v3(i,j,k) = 0.0D0
            enddo
         enddo
      enddo

      return
      end
c
c=======================================================================
c    \\\\\\\\\\        E N D   S U B R O U T I N E        //////////
c=======================================================================
c
c
      subroutine jet_init_unit
      use codeunit

      parsec = 3.0856d+18
      msun   = 1.9891d+33
      year   = 3.1536d+07
      kmps   = 1.0d5

      D0     = 8.E+3*parsec
      arcsec = D0*3.14159/180/3600

      lunit  = arcsec
      tunit  = year*1.0d+3
      munit  = msun*1.0d-3

      vunit  = lunit/tunit
      dunit  = munit/lunit**3
      eunit  = dunit*vunit**2
      end 


