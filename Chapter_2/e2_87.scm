#lang sicp

;;=zero?

(define (=zero? x)
  (cond ((number? x) (= x 0))
        ((pair? x) false)
        (else (error "Unknown type -- =ZERO?" x))))
