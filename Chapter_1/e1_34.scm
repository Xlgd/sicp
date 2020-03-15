#lang sicp

(define (f g) (g 2))

;(f f)

;(f (lambda (g)
;       (g 2)))

;((lambda (g)
;     (g 2))
; (lambda (g)
;     (g 2)))

;((lambda (g)
;    (g 2))
; 2)

;(2 2)
;最后一步解释器以2作为函数进行调用，执行出错