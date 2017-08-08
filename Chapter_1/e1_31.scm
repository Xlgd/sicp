;product递归版本
(define (product term a next b)
  (if (> a b)
	1
	(* (term a)
	   (product term (next a) next b))))

;product迭代版本
(define (producti term a next b)

  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (* (term a) result))))

  (iter a 1))

;计算阶乘
(define (factorial n)

  (define (term k) k)

  (define (next k) (+ k 1))

  (product term 1 next n))

;计算pi的近似值

;分子序列
(define (numer-term i)
  (cond ((= i 1) 2)
		((even? i) (+ i 2))
		(else (+ i 1))))
;分母序列
(define (denom-term i)
  (cond ((even? i) (+ i 1))
		(else (+ i 2))))

;计算pi的近似值
(define (pi n)
  (* 4
	 (exact->inexact
	   (/ (product numer-term 1 (lambda (i) (+ i 1)) n)
		  (product denom-term 1 (lambda (i) (+ i 1)) n)))))


