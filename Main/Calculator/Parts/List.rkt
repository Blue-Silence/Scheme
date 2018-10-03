#lang racket
(define (add level pair List)  ;;insert pairs into list.
  (define tar-now (lambda () (car List)))
  (if (null? List)
      (cons (cons level (list pair)) '())
      (cond ((= (car (tar-now)) level) (cons (cons level (cons pair (cdr (tar-now)))) (cdr List)))
            ((< level (car (tar-now))) (cons (cons level (List pair)) (cdr List)))
            (else
             (cons (car List) (add level pair (cdr List)))))))

;;Pair-example:(cons name proc)
;;Use-example:(add 1 (cons '+ +) list)
