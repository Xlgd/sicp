;递归版cont-frac
(define (cont-frac n d k)
  
  (define (cf i)
	(if (= k i)
	  (/ (n k) (d k))
	  (/ (n i)
		 (+ (n i) (cf (+ i 1))))))

  (cf 1))

;迭代版cont-frac
(define (cont-fraci n d k)
   
  (define (iter i result)
	(if (= i 0)
	  result
	  (iter (- i 1)
			(/ (n i)
			   (+ (d i) result)))))

  (iter (- k 1)
		(/ (n k) (d k))))

;连分式定义的黄金分割率函数
(define (golden-ratio k)
  (+ 1
	 (cont-fraci (lambda (i) 1.0)
				(lambda (i) 1.0)
				k)))


