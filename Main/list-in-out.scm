(define main-list (cons '() (list (cons '() '()))));;example

(define (search name list)
  (cond ((null? list)'())
        ((eq? (car (car list)) name)(car list))
        (else (search name (cdr list)))))

(define (put main-list-obj name-list x)
  (define target
    (search (car name-list) (cdr main-list-obj)))
  (if (eq? target '())
      (begin 
        (set-cdr! main-list-obj (append (list (cons (car name-list) '())) (cdr main-list-obj)))
             (if (null? (cdr name-list))
                 (set-cdr! (car (cdr main-list-obj)) x)
                 (put (car (cdr main-list-obj)) (cdr name-list) x)))
      (put target (cdr name-list) x)))

(define (get main name-list)
  (if (null? name-list)
      (cdr main)
      (get (search (car name-list) (cdr main) ) (cdr name-list))))
