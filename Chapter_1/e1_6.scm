#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;由于应用序求值规则，new-if函数中的then-clause和else-clause都会被执行，
;而语言自带的if只会其中一个，所以新定义的sqrt-iter函数中无论predicate是真是假,
;后面的两个表达式都会被执行，所以就导致无限递归下去