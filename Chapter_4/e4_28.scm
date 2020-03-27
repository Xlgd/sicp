#lang sicp

(define (g x) (+ x 1)) 
(define (f g x) (g x))

;调用(f g 10)
;如果不使用actual-value来强制执行，则g会被认为是一个参数而被delay
;导致g变为一个thunk，在之后在apply中对g求值的时候产生错误