(define (iterative-improve close-enough? improve)
  (lambda (first-guess)
	(define (try guess)
	  (let ((next (improve guess)))
		(if (close-enough? guess next)
		  next
		  (try next))))
	(try first-guess)))

;实现fixed-point函数
(define (fixed-point f first-guess)

  (define tolerance 0.00001)

  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))

  (define (improve guess)
	(f guess))

  ((iterative-improve close-enough? improve) first-guess))

;实现sqrt函数
(define (sqrt x)

  (define dx 0.00001)

  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) dx))

  (define (improve guess)
	(average guess (/ x guess)))

  (define (average v1 v2)
	(/ (+ v1 v2) 2))

  ((iterative-improve close-enough? improve) 1.0))

