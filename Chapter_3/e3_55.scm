#lang sicp

(define (partial-sums stream)
  (define iter-sums
    (cons-stream (stream-car stream)
                 (add-streams iter-sums
                              (cdr stream))))
  iter-sums)

                             