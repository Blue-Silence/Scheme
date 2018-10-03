#lang racket
(define (get-opt name target)
  (define list (cdr target))
  (define (get name list)
    (if (eq? (car (car list)) name)
        (cdr (car list))
        (get name (cdr list))))
  (get name list))

(define (member-new? name target)
  (define list (cdr target))
  (define (? name list)
    (cond ((null? list) #f)
          ((eq? (car (car list)) name) #t)
          (else (? name (cdr list)))))        
  (? name list))

(define (1st-opt list)
  (car (cdr list)))

        