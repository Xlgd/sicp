#lang sicp

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC r c dt)
  (define (proc i v)
    (add-streams (scale-stream i r)
                 (integral (scale-stream i (/ 1 c)) v dt)))
  proc)