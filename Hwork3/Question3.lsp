
(defun make-pairs (lst)
  "Create sorted pairs from list"
  (cond
    
    ((null lst) '()) ; If list1 is empty , return list2

    ((null (cdr lst)) (list (list (car lst)))) ; At least one element, make a list of it
    
    (t 
      (cons (list (min (car lst) (cadr lst)) (max (car lst) (cadr lst))) ; Make a sorted pair and recursively process the list 
	     (make-pairs (cddr lst))))))



(defun mergeLists (list1 list2)
    "Merges two sorted lists into one sorted list."
      (cond
	    ((null list1) list2)  ; If list1 is empty, return list2
	        ((null list2) list1)  ; If list2 is empty, return list1
		    ((<= (car list1) (car list2))  ; If the first element of list1 is smaller than or equal to the first element of list2
		          (cons (car list1) (mergeLists (cdr list1) list2)))  ; Recursively merge the rest of list1 with list2
		        (t  ; Otherwise, if the first element of list2 is smaller
			       (cons (car list2) (mergeLists list1 (cdr list2))))))  ; Recursively merge list1 with the rest of list2




(defun merge-pairs-help (lst)
; Helper function for adjacent pairs
  (cond 
    ((null lst) '()) ; If list is empty, return an empty list
    ((null (cdr lst)) lst) ; If only 1 list remains, return it
    (t (cons (mergeLists (car lst) (cadr lst)) ; Merge the first 2 pairs and recursively process the rest
	      (merge-pairs-help (cddr lst))))))

(defun merge-pairs (lst)
  ; Merge pairs 
  (cond
    ((null lst) '()) 
    ((null (cdr lst)) lst)
    (t (merge-pairs (merge-pairs-help lst)))))


(defun bottom-up-mergesort (lst)
  "bottom up mergesort calling merge pairs and make-pairs on the lst"
  (merge-pairs (make-pairs lst)))
