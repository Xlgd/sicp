#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
;> (define x '(a b))
;> x
;(a b)
;> (count-pairs x)
;2
;> (cdr x)
;(b)
;> (pair? (cdr x))
;#t

;可以看出，对于一个序对(a b)来说，计算(count-pairs (cdr x)
;过程也会将(cdr x)归为一个序对，所以结果为2，是错误的。