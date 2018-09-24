(define (make-struct)
  (define list '())
  (define (delete name list)
    (if (eq? name (car (car list))) (cdr list)
        (cons (car list) (delete name (cdr list)))))
  (define (add name) (cons (cons name 0) list))
  (define (set name value list)
    (if (eq? name (car (car list))) (cons (cons name value) (cdr list))
        (cons (car list) (set name value (cdr list)))))
  (define (get name list)
    (if(eq? (car (car list)) name)
       (cdr (car list))
       (get name (cdr list))))
  (define (interface name opt)
    (cond ((eq? opt 'add) (set! list (add name)))
          ((eq? opt 'del) (set! list (delete name list)))
          ((eq? opt 'get) (get name list))
          (else (set! list (set name opt list)))))
  interface)


                          
                          
  
  