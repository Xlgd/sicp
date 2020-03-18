#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

;;此过程相当于(reverse x)，就是将x中的元素反序排列

;;(define v (list 'a 'b 'c))
;;(define w (mystery v))
;;v
;;(a b c)
;;w
;;(c b a)