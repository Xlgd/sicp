(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f x)
					(f (- x dx))
					(f (+ x dx)))
				 3)))

(define (repeated f n)
  (lambda (x)
	(if (= n 1)
	  (f x)
	  ((repeated f (- n 1)) (f x)))))

(define (smooth-n-times f n)
  (let ((n-times-smooth (repeated smooth n)))
	(n-times-smooth f)))

