#lang racket
(define (value list)
  (define rest (lambda ()(cdr list)))
  (define (get-opt opt)
  (cond ((eq? opt '+) +)
        ((eq? opt '-) -)
        ((eq? opt '*) *)
        (else /)))
  
  (cond ((number? list) list)
        ((null? (rest)) (value (car list)))
        (else
         (cond ((or (eq? (car (rest)) '+) (eq? (car (rest)) '-))
                ((get-opt (car (rest))) (value (car list)) (value (cdr (rest)))))
               (else
                (value (cons ((get-opt (car (rest))) (value (car list)) (value (car (cdr (rest))))) (cdr (cdr (rest))))))))))

               