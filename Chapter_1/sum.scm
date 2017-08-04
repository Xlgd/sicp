;求和的抽象表示

(define (sum term a next b)
  (if (> a b) 0
	(+ (term a) (sum term (next a) next b))))

;范围中的整数立方和

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

;范围中的整数之和

(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

;另一个例子

(define (pi-sum a b)
  (define (pi-term x)
	(/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
	(+ x 4))
  (sum pi-term a pi-next b))

;求积分

(define (integral f a b dx)
  (define (add-dx x)
	(+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))


