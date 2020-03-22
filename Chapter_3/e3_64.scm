#lang sicp

(define (stream-limit stream tolerance)
  (let ((first (stream-car stream))
        (next (stream-car (stream-cdr stream))))
    (if (< (abs (- first next)) tolerance)
        next
        (stream-limit (stream-cdr stream tolerance)))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

