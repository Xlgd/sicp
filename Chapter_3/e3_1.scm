#lang sicp

(define (make-accumulator sum)
  (lambda (add-item)
    (begin (set! sum (+ add-item sum))
           sum)))

           