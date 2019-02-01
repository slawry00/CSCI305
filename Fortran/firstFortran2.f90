! Spencer Lawry
! Fortran Assignment
! 1/31/19
! CSCI 305

PROGRAM firstFortran1
IMPLICIT NONE

   integer :: cents, quart, dime, nick, pen

   write (*,*) "How many cents do you want to make change from (1-99)?"
   read (*,*) cents

   if (cents > 99 .OR. cents < 1) then
   write (*,*) "Invalid Input"
   stop
   end if

   quart = cents/25
   cents = cents - (quart*25)
   dime = cents/10
   cents = cents - (dime*10)
   nick = cents/5
   cents = cents - (nick*5)
   pen = cents

   if (quart > 0) then
   write (*,'(I2, A)',advance='no') quart, " Quarter"
   end if

   if (dime > 0) then
   write (*,'(I2, A)',advance='no') dime, " Dime"
   end if

   if (nick > 0) then
   write (*,'(I2, A)',advance='no') nick, " Nickel"
   end if

   if (pen > 0) then
   write (*,'(I2, A)',advance='no') pen, " Penny"
   end if
   write (*,*)



END PROGRAM firstFortran1
