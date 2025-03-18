(defun Ifn (list)
  (print '(in Ifn)) 
  (print list)
  (cond ((eql (car list) 'i) (I-fn (Sfn (Efn (cdr list)))))
  (t (print '(error))))
)

(defun I-fn (list)
  (print '(in I-fn)) 
  (print list)
  (cond 
    ((null list) list)  
    ((eql (car list) 'e) (Sfn (cdr list)))  
    (t (print '(error)))))
  
(defun Efn (list)
  (print '(in Efn)) 
  (print list)
  (E-fn (Gfn list)))

(defun E-fn (list)
  (print '(in E-fn)) 
  (print list)
  (cond 
    ((eql (car list) 'o) (Efn (cdr list)))  
    (t list)))  

(defun Gfn (list)
  (print '(in Gfn)) 
  (print list)
  (cond 
    ((or (eql (car list) 'x) 
         (eql (car list) 'y) 
         (eql (car list) 'z) 
         (eql (car list) 'w)) 
     (cdr list))
    (t '(error))))

(defun Sfn (list)
  (print '(in Sfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (cdr list))  
    ((eql (car list) 'd)  
     (let ((x (Lfn (cdr list))))  
       (cond 
         ((null x) (append (cdr list) (list 'err)))  
         ((eql (car x) 'b) (cdr x))  
         (t (append (cdr list) (list 'err))))))  
    (t '(error))))  

(defun Lfn (list)
  (print '(in Lfn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (L-fn (cdr list)))  
    (t '(error))))  

(defun L-fn (list)
  (print '(in L-fn)) 
  (print list)
  (cond 
    ((eql (car list) 's) (Lfn list))  
    (t list)))  

(defun run-tests ()
  (let ((valid-tests '(
                        (i x o y o w)
                        (i x o y s)
                        (i e o x o y w s)
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
