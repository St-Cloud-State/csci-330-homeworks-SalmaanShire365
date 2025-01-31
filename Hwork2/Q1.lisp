;; 3.1
;; What does (NOT (EQUAL 3 (ABS -3))) evaluate to?
;; Explanation: ABS -3 is 3, EQUAL compares 3 and 3 (returns T), NOT negates that to NIL
;; Result: NIL

;; 3.2
;; Write an expression in EVAL notation to add 8 to 12 and divide the result by 2.
(eval '(/ (+ 8 12) (+ 1 1)))

;; 3.3
;; Write an expression in EVAL notation to add the square of 3 and the square of 4
(eval '(+ (* 3 3) (* 4 4)))

;; 3.7
;; Define a function MILES-PER-GALLON that takes three inputs, 
;; called INITIAL-ODOMETER-READING, FINAL-ODOMETER-READING,
;; and GALLONS-CONSUMED, and computes the number of miles traveled per gallon of gas.
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
  (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))

;; 3.10
;; The following expressions all result in errors. Let's explain the error and correct the expressions.
;; Example 1:
;; (third (the quick brown fox))
;; Error: Third’s argument is missing a quote.
;; Correction: (third ‘(the quick brown fox))

;; Example 2:
;; (list 2 and 2 is 4)
;; Error: The and variable is unbound.
;; Correction: (list 2 ‘and 2 ’is 4)

;; Example 3:
;; (+ 1 ’(length (list t t t t)))
;; Error: The quote should not be there
;; Correction: (+ 1 (length (list t t t t)))

;; Example 4:
;; (cons ’patrick (seymour marvin))
;; Error: Missing a quote for list (seymour marvin).
;; Correction: (cons ’patrick ‘(list seymour marvin))

;; Mystery function:
(defun mystery (x)
  (list (second x) (first x)))

;; Evaluate:
;; (mystery ’(dancing bear)) -> (BEAR DANCING)
;; Explanation: Second and first positions of the list are reversed in the result.
;; (mystery ’dancing ’bear) -> Error: Invalid number of arguments
;; Explanation: The function expects a single list argument, not two.
;; (mystery ’(zowie)) -> (NIL ZOWIE)
;; Explanation: The second element is NIL because the list has only one element.
;; (mystery (list ’first ’second)) -> (SECOND FIRST)
;; Explanation: The elements of the list are reversed.

;; 3.21
;; What is wrong with each of the following function definitions?

;; Definition 1:
;; (defun speak (x y) (list ’all ’x ’is ’y))
;; Problem: Variables should not be quoted.
;; Correction: (defun speak (x y) (list ’all x ’is y))

;; Definition 2:
;; (defun speak (x) (y) (list ’all x ’is y))
;; Problem: A function can’t have two arguments: x and y (incorrect syntax).
;; Correction: (defun speak (x y) (list ’all x ’is y))

;; Definition 3:
;; (defun speak ((x) (y)) (list all ’x is ’y))
;; Problem: Variables are parenthesized and quoted incorrectly.
;; Correction: (defun speak (x y) (list ’all x ’is y))

;; 3.25
;; What do each of the following expressions evaluate to?

;; Expression 1:
(list ’cons t nil) 
;; Result: (cons t nil)

;; Expression 2:
(eval (list ’cons t nil)) 
;; Result: (T)

;; Expression 3:
(eval (eval (list ’cons t nil))) 
;; Error: Undefined function t (cannot evaluate to T directly).

;; Expression 4:
(apply #’cons ’(t nil)) 
;; Result: T

;; Expression 5:
(eval nil) 
;; Result: NIL

;; Expression 6:
(list ’eval nil) 
;; Result: (eval nil)

;; Expression 7:
(eval (list ’eval nil)) 
;; Result: NIL
