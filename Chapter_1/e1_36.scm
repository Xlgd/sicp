(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	(< (abs (- v1 v2)) tolerance))
  (define (try guess step)
	(display-info guess step)
	(let ((next (f guess)))
	  (if (close-enough? guess next)
		(begin
		  (display-info next (+ 1 step))
		  next)
		  (try next (+ 1 step)))))
  (try first-guess 1))

;打印guess和step
(define (display-info guess step)
  (display "Step: ")
  (display step)
  (display " ")

  (display "Guess: ")
  (display guess)
  (newline))

;平均阻尼
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

;函数f
(define formula
  (lambda (x) (/ (log 1000) (log x))))

