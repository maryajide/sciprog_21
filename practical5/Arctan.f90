module hypob
   contains 
! Calculates the inverse hyperbolic tangent of real with a precision error of
! less than 'delta'.
! Assume -1 < x , 1 and delta > 0.
      function artanh(x, delta)
         implicit none 
         real (kind=8) :: artanh,x,delta
         integer (kind=4) :: n
         real (kind=8) :: arcTan, elem, val
         arcTan = x; n = 1;
         elem = x 
         do while (abs(elem) .ge. delta)
            val = 2 * n + 1
            elem = x**val/val
            arcTan = arcTan + elem 
            n = n + 1 
         end do
         artanh = arcTan
         return
      end function artanh
!Calculates the inverse hyperbolic tangent of real 'x'
!Assume -1 < x < 1.
      function artanh2(x)
        implicit none 
        real (kind=8) :: artanh2,x
        artanh2 = (log(1.0+x) - log(1.0-x))/2
        return
      end function artanh2
end module 


program invhypo
    use hypob
    implicit none 
    integer (kind=4) :: i, sample, a
    real (kind=8) :: start, finish, prec, j !sample !tan1, tan2, sample 
    real, allocatable :: tan1(:), tan2(:)
! Reading real x, to compute artanh(x)
    write(6,*) ' Enter the real in range [-1,1]:'
    read(5,*) start, finish 
! Reading the precision to be applied to the numerical method 
    write(6,*) ' Enter the method precision : '
    read(5,*) prec
! Set variable a to the size of the array to store the values
    a = ((abs(start) + abs(finish))/prec) + 1 
    j = start 
    allocate(tan1(a))
    allocate(tan2(a))
! Calculating artanh(x) using 2 different algorithms
    do i=1,a

       tan1(i) = artanh(j, prec)
       tan2(i) = artanh2(j)
       ! prints the numerical difference between the results of both algorithms 
       write(6,fmt='(a,f10.5)') 'At artanh', j
       write(6,fmt='(a,f15.10)'), ' The difference between them is ', abs(tan1(i) - tan2(i))
       j = j + prec
    end do 


end program invhypo
