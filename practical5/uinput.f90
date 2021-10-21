program uinput 
  implicit none
  integer (kind=4) :: i
  real (kind=8) :: a 


  integer (kind=4), pointer :: px   
  integer (kind=4), target :: x  ! target = pointer assignment 

  
  write(6,*) ' Enter an integer and a double. '
  read(5, *) i,a  ! program requires input from the user/screen  
  write(6,*) i,a  ! program represent output from the screen 


  x = 10
  px => x ! association operator = associating pointer var with a target var
  

  write(6,*) 'The vaule x is ', x
  write(6,*) 'The value x is also ', px 
  write(6,*) 'The address of x is ', loc(x) ! loc(x)  points to its location in memory


end program uinput 
