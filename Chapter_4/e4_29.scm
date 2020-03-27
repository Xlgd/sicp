#lang sicp

(define (square x) (* x x))
(define (id x)
  (set! count (+ count 1))
  x)

;;; L-Eval input:
;(square (id 10))
;;; L-Eval value:
;100

;;; L-Eval input:
;count
;;; L-Eval value:
;1 （有记忆）
;2 （无记忆）

;有记忆功能时，在square中求(* x x)时，由于记忆，第二个x不用再次计算直接得到结果
;没有记忆功能时，要计算两次x，即(id 10)，运算变慢