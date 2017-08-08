;递归版accumulate函数
(define (accumulate combiner null-value term a next b)
  (if (> a b)
	null-value
	(combiner (term a)
			  (accumulate combiner null-value term (next a) next b))))

;新的sum函数
(define (sum term a next b)
  (accumulate + 0 term a next b))

;新的product函数
(define (product term a next b)
  (accumulate * 1 term a next b))

;迭代版accumulate函数
(define (accumulatei combiner null-value term a next b)
  
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (combiner (term a) result))))
  
  (iter a null-value))

