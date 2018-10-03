#lang racket
(define (get-value List);;List --the initial list ;;
                          ;;example: (define input-list (list  (cons 1 (list (cons '+ +) (cons '- -))) (cons 2 (list (cons '* *) (cons '/ /)))))
                        ;;return an interface that has 2 options:
                          ;;1.'get --for getting the calculator; 2.(cons order (cons 'name proc)) --for adding an proc
  
  (define (get-opt name target);;
  (define list (cdr target));;
  (define (get name list);;
    (if (eq? (car (car list)) name)
        (cdr (car list))
        (get name (cdr list))))
  (get name list))
(define (member-new? name target);;
  (define list (cdr target))
  (define (? name list)
    (cond ((null? list) #f)
          ((eq? (car (car list)) name) #t)
          (else (? name (cdr list)))))        
  (? name list))
(define (1st-opt list);;
  (car (cdr list)))
 (define (add order pair List)  ;;insert pairs into list.
  (define tar-now (lambda () (car List)))
  (if (null? List)
      (cons (cons order (list pair)) '())
      (cond ((= (car (tar-now)) order) (cons (cons order (cons pair (cdr (tar-now)))) (cdr List)))
            ((< order (car (tar-now))) (cons (cons order (List pair)) (cdr List)))
            (else
             (cons (car List) (add order pair (cdr List)))))))

(define (value-begin val list)
  (define (value val list-n list-a)
  (define rest (lambda () (cdr (cdr val))))
  (define from-2nd (lambda () (cons (car val) (cons (car (cdr val)) (cons (car (rest)) '())))))
  (cond ((number? val) val)
        ((null? (cdr val)) (value (car val)list-a list-a))
        (else
         (if (member-new? (1st-opt val) (car list-n))
             ((get-opt (1st-opt val) (car list-n)) (value (car val) list-a list-a) (value (rest) list-a list-a))
             (value (cons (value (from-2nd ) (cdr list-n) list-a) (cdr (rest))) list-n list-a)))))
  (value val list list))

(define (interface option)
  (if (eq? option 'get)
      (lambda (x) (value-begin x List))
      (get-value (add (car option) (cdr option) List))))

 interface)


