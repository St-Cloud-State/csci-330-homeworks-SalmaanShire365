(defun Ifn (list &optional (position 0))
  (print '(in Ifn)) 
  (print list)
  (cond ((eql (car list) 'i) (IPfn (Sfn (Efn (cdr list) (1+ position))) (1+ position)))
        (t (format t "Unexpected symbol at position ~A in Ifn: ~A~%" position (car list)))))

(defun IPfn (list &optional (position 0))
  (print '(in IPfn)) 
  (print list)
  (cond 
    ((null list) list)  
    ((eql (car list) 'e) (Sfn (cdr list) (1+ position)))
    (t (format t "Unexpected symbol at position ~A in IPfn: ~A~%" position (car list)))))

(defun Efn (list &optional (position 0))
  (print '(in Efn)) 
  (print list)
  (EPfn (Gfn list position) position))

(defun EPfn (list &optional (position 0))
  (print '(in EPfn)) 
  (print list)
  (cond 
    ((eql (car list) 'o) (Efn (cdr list) (1+ position)))
    ((null list) (format t "Unexpected end of list at position ~A in EPfn~%" position)) ; handle empty list case
    (t (format t "Unexpected symbol at position ~A in EPfn: ~A~%" position (car list)))))

(defun Gfn (list &optional (position 0))
  (print '(in Gfn)) 
  (print list)
  (cond 
    ((or (eql (car list) 'x) 
         (eql (car list) 'y) 
         (eql (car list) 'z) 
         (eql (car list) 'w)) 
     (cdr list))
    ((null list) (format t "Unexpected end of list at position ~A in Gfn~%" position)) ; handle empty list case
    (t (format t "Unexpected symbol at position ~A in Gfn: ~A~%" position (car list)))))

(defun Sfn (list &optional (position 0))
  (print '(in Sfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (cdr list))  
    ((eql (car list) 'd)  
     (let ((x (Lfn (cdr list) (1+ position))))  
       (cond 
         ((null x) (append (cdr list) (list 'err)))  
         ((eql (car x) 'b) (cdr x))  
         (t (append (cdr list) (list 'err))))))  
    ((null list) (format t "Unexpected end of list at position ~A in Sfn~%" position)) ; handle empty list case
    (t (format t "Unexpected symbol at position ~A in Sfn: ~A~%" position (car list)))))

(defun Lfn (list &optional (position 0))
  (print '(in Lfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (LPfn (cdr list) (1+ position)))  
    ((null list) (format t "Unexpected end of list at position ~A in Lfn~%" position)) ; handle empty list case
    (t (format t "Unexpected symbol at position ~A in Lfn: ~A~%" position (car list)))))

(defun LPfn (list &optional (position 0))
  (print '(in LPfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (Lfn (cdr list) (1+ position)))  ; Recursive call to Lfn
    ((null list) (format t "Unexpected end of list at position ~A in LPfn~%" position)) ; handle empty list case
    (t (format t "Unexpected symbol at position ~A in LPfn: ~A~%" position (car list)))))

(defun run-tests ()
  (let ((valid-tests '(
                        (i x o y o w)
                        (i x o y s)
                        (i x d s s b)
                        (i e o x o y w d s s b e s)
                        (i x o y o s d s b s)
                        (i e o x o y w s d s b s)
                        (i x o y o w d s s b e s)
                        ))
        (invalid-tests '(
                          (i x o y b)
                          (i e o x z o w)
                          (i x o y o s s d)
                          (i x o d w s)
                          (i e o y w s b s)
                          (i x o y o s s d s b)
                          (i x o y o w d s s d s b)
                          )))
    (format t "Running Valid Tests:~%")
    (dolist (test valid-tests)
      (format t "Testing valid: ~A~%" test)
      (Ifn test)) 
    
    (format t "~%Running Invalid Tests:~%")
    (dolist (test invalid-tests)
      (format t "Testing invalid: ~A~%" test)
      (Ifn test))))
