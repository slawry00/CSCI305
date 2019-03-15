! Spencer Lawry
! Fortran Assignment
! 1/31/19
! CSCI 305

PROGRAM firstFortran1
   IMPLICIT NONE

   integer              :: cents, quart, dime, nick, pen
   character(len = 20)  :: dateinfo, timeinfo, date, time, fulldt

   call date_and_time(dateinfo, timeinfo)
   date = dateinfo(5:6) // '-' // dateinfo(7:8) // '-' // dateinfo(1:4)
   time = timeinfo(1:2) // ':' // timeinfo(3:4)
   fulldt = trim(date) // ', ' // time
   write (*,*) fulldt

   write (*,*) "How many cents do you want to make change from (1-99)?"
   read (*,*) cents

   if (cents > 99 .OR. cents < 1) then
   write (*,*) "Invalid Input"
   stop
   end if

   quart = count_coins(cents, 25)
   cents = cents - (25*quart)
   dime = count_coins(cents, 10)
   cents = cents - (10*dime)
   nick = count_coins(cents, 5)
   cents = cents - (5*nick)
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

contains
   integer function count_coins(coins, worth)
   IMPLICIT NONE
   integer, intent(in) :: coins, worth

   count_coins = coins/worth
   end function count_coins


END PROGRAM firstFortran1
