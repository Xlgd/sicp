;求b的n次方
(define (fast-expt-iter b n)
  (fast-expt-internal b n 1))
(define (fast-expt-internal b n a)
  (cond ((= n 0) a)
		((even? n) (fast-expt-internal (square b) (/ n 2) a))
		(else (fast-expt-internal b (- n 1) (* b a)))))

