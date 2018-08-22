#lang racket

(define (guess-root pro guess1 guess2)
  (define (average x y) (/ (+ x y) 2))
  (cond ((< (- guess2 guess1) 0.00000000001) guess2)
        ((< (pro (average guess1 guess2)) 0)
         (fi-r pro (average guess1 guess2) guess2))
        (else (fi-r pro guess1 (average guess1 guess2)))))

                                    