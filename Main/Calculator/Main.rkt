#lang racket
(define (value val list-n list-a)
  (define rest (lambda () (cdr (cdr val))))
  (define from-2nd (lambda () (cons (car val) (cons (car (cdr val)) (car (rest))))))
  (cond ((number? val) val)
        ((null? (cdr val)) (value (car val)list-a list-a))
        (else
         (if (member-new? (1st-opt val) (car list-n))
             ((get-opt (1st-opt val) (car list-n)) (value (car val) list-a list-a) (value (rest) list-n list-a))
             (value (cons (value (from-2nd ) (cdr list-n) list-a) (cdr (rest))) list-n list-a)))))