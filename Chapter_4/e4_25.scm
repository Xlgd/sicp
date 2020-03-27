#lang sicp

(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1)
    (* n (factorial (- n 1)))
    1))

;计算(factorial 5)会导致死循环，以上的定义不能在正则序语言里工作
;因为unless会求值所有的参数，导致又会进入一个factorial中继续循环