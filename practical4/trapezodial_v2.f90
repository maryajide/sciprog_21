!Module for constant varianes 
module consts
  integer (kind=4), parameter :: N=12
  real (kind=4) :: pi
end module consts 


!Module with subroutines
module subroutines
  interface 
    subroutine degtorad(deg, rad)
      real(kind=4), intent(in)::deg
      real(kind=4), intent(out)::rad
    end subroutine degtorad
  end interface 
end module subroutines

program Trapezoid
  use consts
  use subroutines 
  implicit none 
  integer (kind=4) :: i
  real(kind=4)::TanArr(N+1), deg, rad, area, mult_rad


  ! The value of pi
  pi=atan(1.0)*4.0
 

  !Construct Tan array
  do i=1, N+1
    deg=(i-1)*5.0
    call degtorad(deg, rad)
    TanArr(i)=tan(rad)
    write(6,*)'TanArr[', i, '] ', TanArr(i)
  end do


  !Apply trapezodial rule 
  area=TanArr(1)+TanArr(N+1)
  do i=2, N, 1
     area=area+2.0*TanArr(i)
  end do


  !Multiply with (b-a)/2N after converting to radians 
  call degtorad(((60.0-0.0)/(2.0*N)), mult_rad)
  area=mult_rad*area;

  
  !Approximated
  write(6,*), 'Approximated:', area
  !Exact value 
  write(6,*) 'Exact:', log(2.0)


end program 

! subroutine that test it own local variables
subroutine degtorad(deg, rad)
  use consts
  real(kind=4), intent(in)::deg
  real(kind=4), intent(out)::rad
  rad=(pi*deg)/180.0
end subroutine degtorad
