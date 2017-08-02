;检查是否是素数（书上的例子直接拿来用）
(define (smallest-divisor n) 
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;获得n的下一个奇数字
(define (next-odd n)
  (if (odd? n)
	(+ n 2)
	(+ n 1)))

;产生counter个大于n的素数
(define (produce-primes n counter)
  (cond ((= counter 0) (display "are primes"))
		((prime? n)
		 (display n)
		 (newline)
		 (produce-primes (next-odd n) (- counter 1)))
		(else (produce-primes (next-odd n) counter))))

;search-for-primes函数（找到在大于n的范围内连续的3 个素数)
(define (search-for-primes n)
  (let ((start-time(real-time-clock)))
	(produce-primes n 3)
	(- (real-time-clock) start-time)))

	
