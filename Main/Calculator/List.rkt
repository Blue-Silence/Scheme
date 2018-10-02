#lang racket
(define (add order pair List)  ;;insert pairs into list.
  (define tar-now (lambda () (car List)))
  (if (null? List)
      (cons (cons order (list pair)) '())
      (cond ((= (car (tar-now)) order) (cons (cons order (cons pair (cdr (tar-now)))) (cdr List)))
            ((< order (car (tar-now))) (cons (cons order (List pair)) (cdr List)))
            (else
             (cons (car List) (add order pair (cdr List)))))))

;;Pair-example:(cons name proc)
;;Use-example:(add 1 (cons '+ +) list)
