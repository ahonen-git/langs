program fortran_netcdf
  use netcdf
  implicit none 
  integer, parameter :: nrow = 3, ncol = 4
  integer :: i,j
  integer :: fo0, varid, ncol_dimid, nrow_dimid
  integer, dimension(2) :: dimids

  real*8 :: tmp
  real*8, dimension(ncol, nrow) :: ary

  tmp = 0.0
  do j = 1, nrow
    do i = 1, ncol
      tmp = tmp + 1.d0
      ary(i,j) = tmp
    end do
  end do

  call check( nf90_create('fortran.nc',NF90_CLOBBER,fo0) )

  call check( nf90_def_dim(fo0, "x", ncol, ncol_dimid) )
  call check( nf90_def_dim(fo0, "y", nrow, nrow_dimid) )

  dimids = (/ ncol_dimid, nrow_dimid /)

  call check( nf90_def_var(fo0, "ary", NF90_DOUBLE, dimids, varid) )
  call check( nf90_enddef(fo0) )

  call check( nf90_put_var(fo0, varid, ary) )
  
  call check( nf90_close(fo0) )
  


contains
  subroutine check(status)
    integer, intent ( in) :: status
    
    if(status /= nf90_noerr) then 
      print *, trim(nf90_strerror(status))
      stop "Stopped"
    end if
  end subroutine check  

end program fortran_netcdf
