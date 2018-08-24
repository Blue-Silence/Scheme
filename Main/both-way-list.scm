(define (create-list list)
  (define (list-both list last-node)
  (if (null? list)
        'done
      (begin
        (set-cdr! (cdr last-node) (cons (car list) (cons last-node '()))))))
  (define a (cons (car list) (cons '() '())))
  (begin
   (list-both (cdr list) a)
   a))

(define (get-data x) (car x))

(define (newcar x) (cadr x))

(define (newcdr x) (cdr (cdr x)))


  
  