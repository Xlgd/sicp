;加法
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))
;减法
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))
;乘法
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
			(* (denom x) (denom y))))
;除法
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
			(* (denom x) (numer y))))
;是否相等
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
	 (* (numer y) (denom x))))

;构建有理数
(define (cons-imp n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (make-rat n d)
  (if (< d 0)
      (cons-imp (- n) (- d))
      (cons-imp n d)))


(define (numer x) (car x))

(define (denom x) (cdr x))

;输出
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
