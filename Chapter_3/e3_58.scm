#lang sicp

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

;;quotient用于求两个整数的商

(expand 1 7 10)
;;会产生1、4、2、8、5、7这些数字的循环

(expand 3 8 10)
;;会产生3、7、5、0......（后面全是0）