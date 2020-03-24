#lang sicp
;a
;将过程应用的判断提到前面后，会导致将一般的表达式也当作过程调用来执行
;会降低求值器效率

;b
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))
