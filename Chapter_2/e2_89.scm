#lang sicp

;;只用修改这两个函数即可
(define (first-term term-list)
  (make-term (- (length term-list) 1)
             (car term-list)))

(define (adjoin-term term term-list)
  (cond ((=zero? term) term-list)
        ((=equ? (order term) (length term-list))
         (cons term term-list))
        (else (adjoin-term term (cons 0 term-list)))))