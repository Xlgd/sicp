;repeated函数
(define (repeated f n)
  (lambda (x)
	(if (= n 1)
	  (f x)
	  ((repeated f (- n 1)) (f x)))))
;fixed-point函数
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		next
		(try next))))
  (try first-guess))
;average-damp函数
(define (average v1 v2)
  (/ (+ v1 v2) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))
;expt函数
(define (expt base n)
  (if (= n 0)
	1
	((repeated (lambda (x) (* base x)) n) 1)))

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x) (fixed-point (average-damp-n-times
							 (lambda (y) (/ x (expt y (- n 1))))
							 damp-times)
						   1.0)))

(define (lg n)
  (cond ((> (/ n 2) 1)
		 (+ 1 (lg (/ n 2))))
		((< (/ n 2) 1)
		 0)
		(else
		  1)))
;计算n次方根
(define (nth-root n)
  (damped-nth-root n (lg n)))

