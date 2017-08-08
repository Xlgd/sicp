(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a)
	   (sum term (next a) next b))))

(define (simpson f a b n)
  ;计算h
  (define h (/ (- b a) n))
  ;计算yk
  (define (y k)
	(f (+ a
		  (* k h))))
  ;根据下标k返回系数
  (define (factor k)
	(cond ((or (= k 0) (= k n)) 1)
		  ((even? k) 2)
		  (else 4)))

  (define (term k)
	(* (y k)
	   (factor k)))

  (define (next k)
	(+ k 1))

  (if (odd? n)
	(error "n can't be odd.")
	(* (/ h 3)
	   (sum term (exact->inexact 0) next n))))

