program Trap
  implicit none


  integer::N=12, i
  real(kind=4):: a=0.0, b_deg=60.0
  real(kind=4):: pi, b_rad, area, mult_rad


  ! Convert pi/3 to radians 
  pi=atan(1.0)*4.0
  b_rad=(pi*b_deg)/180.0
  write(6, *) 'The value of pi/3 in radians', b_rad

  
  ! f(x0) + f(xN)
  area = tan(a)+tan(b_rad)
  write(6, *) 'Initial area', area


  ! 2*f(x1) + ... + 2*f(xN-1)
  do i=5, 55, 5
     area=area+2*tan((pi*i)/180.0)
     write(6, *) 'New area at x', i/5, '= ' , area
  end do


  ! Multiply with b-a/2N
  mult_rad=pi*((b_deg-a)/(2*N))/180.0
  area = mult_rad * area


  ! Approximated result 
  write(6, *) 'Trapezoid result ', area
  ! Real Result
  write(6, *) 'Real result ', log(2.0)


  stop
end program