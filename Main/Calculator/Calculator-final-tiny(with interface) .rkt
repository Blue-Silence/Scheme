#lang racket
(define (get-value List);;List --the initial list ;;
                          ;;example: (define input-list (list  (cons 1 (list (cons '+ +) (cons '- -))) (cons 2 (list (cons '* *) (cons '/ /)))))
                        ;;return the calculator
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

(define (exp val list-n)
  (if (or (null? val) (member-new? (car val) (car list-n)))
      '()
      (cons (car val) (exp (cdr val) list-n))))

(define (exp-after val list-n)
  (if (or (null? val) (member-new? (car val) (car list-n)))
      val
      (exp-after (cdr val) list-n)))
;;Else block

(define (value val list-n list-a)
  (cond ((number? val) val)
        ((null? (cdr val)) (value (car val) list-a list-a))
        ((null? (exp-after val list-n)) (value val (cdr list-n) list-a))
        (else
         ((get-opt (car (exp-after val list-n)) (car list-n))
          (value (exp val list-n) (cdr list-n) list-a)
          (value (cdr (exp-after val list-n)) list-n list-a)))))
;;Main block

 (lambda (val) (value val List List)))

