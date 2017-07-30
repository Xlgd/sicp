(define (expt-cur b n)
  (cond ((= n 0) 1)
		(else (* b (expt-cur b (- n 1))))))

(define (expt-ite b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (cond ((= counter 0) product)
		(else (expt-iter b (- counter 1) (* b product)))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))))

