#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;此函数输出 a加上b的绝对值
;> (a-plus-abs-b -1 1)
;0
;> (a-plus-abs-b 1 -1)
;2