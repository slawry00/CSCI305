; Function for #1
; returns the sum of the numbers in a list
(defun summation (my_list)
   (cond
   ((null my_list) 0)
   (t (+ (car my_list) (summation (cdr my_list))))))

; Functions for #(2-4)

; returns the greatest consecutive sum of elements beginning with the first element in a list
(defun cons_helper (c_sum my_list)
   (cond
   ((null my_list) c_sum)
   ((listp (car my_list)) (cons_helper c_sum (append (fix_list (car my_list)) (cdr my_list))))
   (t
      (max
         c_sum
         (cons_helper (+ (car my_list) c_sum) (cdr my_list))))))

; condenses a nested list into a 1 dimensional list
(defun fix_list (my_list)
   (if (endp my_list) ; if it's an empty list
      my_list ; return it
      (if (atom (car my_list)) ; otherwise, if it's an atom
         (append (list (car my_list)) (fix_list (cdr my_list))) ; make a list w/ that ele + rest
         (append (fix_list (car my_list)) (fix_list (cdr my_list))))))
         ; car is a list, go deeper, then append the eventual result to the fixed rest


; returns the greatest consecutive sum found in a list
(defun find_max_cons (my_list)
   ;(write my_list)
   ;(terpri)
   (cond
   ((null my_list) -10000) ;symbolically = -infinity
   ((listp (car my_list)) (find_max_cons (append (fix_list (car my_list)) (cdr my_list))))
   (t
      (max
         (cons_helper (car my_list) (cdr my_list))
         (find_max_cons (cdr my_list))))))


; #1 Test
(write (summation (list 1 2 3 4 5 6 7 8 9 10))) ; should give 55
(terpri)

; #(2-4) Tests
(write (find_max_cons (list 10 10 10 -26 10 10 10 10 10))) ; should give 54
(terpri)
(write (find_max_cons (list 10 10 10 -26 10 -26 10 10 10 10))) ; should give 40
(terpri)
(write (find_max_cons (list 10 10 10 -26 10 -26 10 10))) ; should give 30
(terpri)
(write (find_max_cons (list 10 10 -26 10 -26 10 10 10 -26))) ; should give 30
(terpri)
(write (find_max_cons (list -5 -5 -5 -5 -5 -5))) ; should give -5
(terpri)
(write (find_max_cons (list -5 -5 -5 0 -5 -5 -5))) ; should give 0
(terpri)
(write (find_max_cons  '((5 2) (5 -3 -5)))) ; treats as (5 2 5 -3 5), so should give 12
(terpri)
(write (find_max_cons  '((5 2) (-5 10 5)((-3))))) ; should give 17
(terpri)
(write (find_max_cons  '((((5 (((2)))))) (()()) ((()((3))5 -3) -5)))) ; garbage handling 12
