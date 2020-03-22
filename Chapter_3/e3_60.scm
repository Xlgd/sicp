#lang sicp

(define (mul-series s1 s2)
  (cons-stream
   (* (stream-car s1) (stream-car s2))
   (add-streams (scale-stream (stream-car s1)
                              (stream-cdr s2))
                (mul-series (stream-cdr s1) s2))))
