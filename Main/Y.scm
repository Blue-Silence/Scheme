(define Y (lambda (input)
            ((lambda (proc) (proc proc))
             (lambda (proc)
               (input (lambda () (proc proc)))))))

(define input_example
 (lambda (proc)
   (lambda (x)
     ((proc) x))))
