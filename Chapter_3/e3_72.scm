#lang sicp

(define (sum-square x) (+ (square (car x)) (square (cadr x))))
(define (square x) (* x x))

(define (some s)
  (if (and (= (sum-square (stream-car s))
              (sum-square (stream-car (stream-cdr s))))
           (= (sum-square (stream-car s))
              (sum-square (stream-car (stream-cdr (stream-cdr s))))))
      (cons-stream (list (sum-square (stream-car s))
                         (stream-car s)
                         (stream-car (stream-cdr s))
                         (stream-car (stream-cdr (stream-cdr s))))
                   (some (stream-cdr s)))
      (Ramanujan (stream-cdr s))))

(define numbers
  (some (weight-pairs integers integers sum-square)))
