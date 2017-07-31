;求a*b
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))
(define (multi a b)
  (cond ((or (= b 0) (= a 0)) 0)
		((= b 1) a)
		((even? b) (multi (double a) (halve b)))
		(else (+ a (multi a (- b 1))))))

