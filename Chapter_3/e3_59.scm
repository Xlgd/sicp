#lang sicp

;;a
(define (integrate-series stream)
  (mul-streams stream
               (div-streams ones integers)))

(define (div-streams s1 s2)
  (stream-map / s1 s2))

;;b
(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (mul-streams (stream-cdr one-zero-negative-zero)
               (stream-cdr exp-series)))

(define sine-series
  (mul-streams (stream-cdr zero-one-zero-negative)
               (stream-cdr exp-series)))

(define (one-zero-negative-zero)
  (cons-stream 1
               (cons-stream 0
                            (cons-stream -1
                                         (cons-stream 0
                                                      one-zero-negative-zero)))))

(define (zero-one-zero-negative)
  (cons-stream 0
               (cons-stream 1
                            (cons-stream 0
                                         (cons-stream -1
                                                      zero-one-zero-negative)))))