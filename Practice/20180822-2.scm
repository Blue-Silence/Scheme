(define (Fibonacci-sequence x)
  (define (cal x y) (cons y (delay (cal y (+ x y)))))
  (define (get x list)(if (= x 1)
                        (car list)
                        (get (- x 1) (force (cdr list)))))
  (get x (cal 0 1)))

