#lang sicp

(define (make-zero-crossings input-stream last-value origin-value)
  (let ((avpt (/ (+ (stream-car input-stream) origin-value) 2)))
    (cons-stream (sign-change-detector avpt last-value)
                 (make-zero-crossings (stream-cdr input-stream)
                                      avpt
                                      (stream-car input-stream)))))

