#lang sicp

(define (squarer a b)
  (multiplier a a b))

;;当我们只给b设置值的时候，我们无法算出a
;;这是因为process-new-value过程无法处理m1和m2都没有值的情况