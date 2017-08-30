(define (cont-frac n d k)
  
  (define (cf i)
	(if (= k i)
	  (/ (n k) (d k))
	  (/ (n i)
		 (+ (n i) (cf (+ i 1))))))

  (cf 1))

(define (e k)

  (define (n i) 1)

  (define (d i)
	(if (= 0 (remainder (+ i 1) 3))
	  (* 2 (/ (+ i 1) 3))
	  1))

  (+ 2.0
	 (cont-frac n d k)))

