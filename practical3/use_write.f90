program use_write

   implicit none

   !Declare two integers and assign values 
   integer(kind=4)::i1=10, i2=200 ! for single precision use kind 
   

   !Declare two floats and assign values
   real(kind=4)::fl1=1.11, fl2=2.2222 ! single precision kind = 4, 
   !double precision is use for more exact value or better approximation value 
   

   !print values
   write(6, '(a, i2, i4, a, f4.2, f7.4)')'Two integers are ', i1, i2, ' Two floats ', fl1, fl2 ! specifying formatting 
   ! if it is write(6,*) means that no format is specified  
   ! for f4.2 it corresponds to fN.M. N is the no of width or space that is 1.11 (4) and M is the no of digits to the right of the decimal points  
   
   write(6,*)

   
   stop

end program use_write
