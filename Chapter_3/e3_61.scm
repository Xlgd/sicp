#lang sicp

(define (reciprocal-series s)
  (cons-stream 1 (scale-stream (mul-series (stream-cdr s)
                                           (reciprocal-series s))
                               -1)))

  