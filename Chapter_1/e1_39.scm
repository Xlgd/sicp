(define (cont-frac n d k)
  
  (define (cf i)
	(if (= k i)
	  (/ (n k) (d k))
	  (/ (n i)
		 (+ (n i) (cf (+ i 1))))))

  (cf 1))

(define (tan-cf x k)

  (define (d i) 
	(- (* i 2) 1))

  (define (n i)
	(if (= i 1)
	  x
	  (- (square x))))
  
  (exact->inexact (cont-frac n d k)))
