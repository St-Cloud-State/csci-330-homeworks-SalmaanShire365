(defun makeEqual (unprocessed l1 l2)
  (cond ((null unprocessed) (list l1 l2)) ; Base case: if no items left, return two lists
	((null (cdr unprocessed)) (list (cons (car unprocessed) l1) l2)) ; Only one item left, put in list 2
	(t (makeEqual (cdr (cdr unprocessed)) ; Recursively call to process to items
		      (cons (car unprocessed) l1) ; Add first item to list 1
		      (cons (car (cdr unprocessed)) l2))))) ; Add second item to list 2


(defun mergeLists (list1 list2) 
  "Merge two sorted lists int one sorted list."
  (cond 
    ((null list1) list2) ; If list1 is empty, return list2
    ((null list2) list1) ; If list2 is empty, return list1
    ((< (car list1) (car list2)) ; if first element of list1 is smaller
     (cons (car list1) (mergeLists (cdr list1) list2))) ; Place the first element of list1 in result
   (t (cons (car list2) (mergeLists list1 (cdr list2)))))) ; Else place car of list2 in the result

(defun mergesort (lst)
  "Sort a list using mergesort algorithm recursively"
  (if (or (null lst) (null (cdr lst))) ; if the list is empty or has at least one element, return as is
   	lst
	
    (let* ((half (makeEqual lst '() '()))); Split the lsit into two halves
	   (let ((left (car half)) ; First half
	   (right (car (cdr half)))) ;Second half
      (mergeLists (mergesort left) (mergesort right)))))); Recursively sort each half and merge
