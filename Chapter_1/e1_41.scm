(define (inc x) (+ x 1))

(define (double g)
  (lambda (x) (g (g x))))
