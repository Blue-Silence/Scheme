(define (connect x y)
  (if (null? (cdr x))(cons (car x) y)
      (cons (car x) (connect (cdr x) y))))
(define (cnt x y)
  (if (null? (cdr x))
      (set-cdr! x y)
      (cnt (cdr x) y)))
                            

(define x (list 1 2 3))
(cnt x (list 4 5))
x
