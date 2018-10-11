#lang racket
(define (value val list-n list-a)
  (cond ((number? val) val)
        ((null? (cdr val)) (value (car val) list-a list-a))
        ((null? (exp-after val list-n)) (value val (cdr list-n) list-a))
        (else
         ((get-opt (car (exp-after val list-n)) (car list-n))
          (value (exp val list-n) (cdr list-n) list-a)
          (value (cdr (exp-after val list-n)) list-n list-a)))))