

(defun insert-into-sorted (item sorted-list)
  "Insert an item into a sorted list in acending order"
  
  (cond 
    ((null sorted-list) (list item)) ; If list is empty, return item as the new list
    ((<= item (car sorted-list)) (cons item sorted-list)) ; Insert at head of list if item is less than or equal
    (t (cons (car sorted-list) (insert-into-sorted item (cdr sorted-list))))))
    ; Otherwise, recursively call until unsorted list is empty


(defun insertion-sort (unsorted-list)
  "Sort a list using insertion sort."
  (if (null unsorted-list)
    nil ;Base caseL empty list is already sorted
      (insert-into-sorted (car unsorted-list) (insertion-sort (cdr unsorted-list)))))


