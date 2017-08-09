;递归版filtered-accumulate函数
(define (filtered-accumulate combine null-value term a next b valid?)
  (if (> a b)
	null-value
	(let ((rest-terms (filtered-accumulate combine null-value term (next a) next b valid?)))
	  (if (valid? a)
		(combine (term a) rest-terms)
		rest-terms))))

;迭代版filtered-accumulate函数
(define (filtered-accumulatei combine null-value term a next b valid?)

  (define (iter a result)
	(cond ((> a b) result)
		  ((valid? a) (iter (next a) (combine (term a) result)))
		  (else (iter (next a) result))))

  (iter a null-value))
	  
;计算素数之和
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (primes-sum a b)
  (filtered-accumulate + 0 (lambda (x) x) a (lambda (i) (+ i 1)) b prime?))

;计算互素正整数之积
(define (coprime? i n)
  (and (< i n)
	   (= 1 (gcd i n))))

(define (product-of-coprimes n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (i) (+ i 1)) n (lambda (x) (coprime? x n))))


