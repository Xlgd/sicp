#lang sicp

(define (smooth stream)
  (define (iter stream last-value)
    (cons-stream (/ (+ (stream-car stream) last-value) 2)
                 (iter (stream-cdr stream) (stream-car stream))))
  iter stream 0)


(define (make-zero-crossings input-stream smooth)
  (let ((new-stream (smooth input-stream)))
    (stream-map sign-change-detector new-stream (cons-stream 0 new-stream))))

                