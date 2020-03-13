#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                  (A x (- y 1))))))

(A 1 10)

(A 2 4)

(A 3 3)

(define (f n) (A 0 n)) ;f = 2 * n

(define (g n) (A 1 n)) ;g = 2 ** n

(define (h n) (A 2 n)) ;h = 2 ** (A 2 (- n 1)), (A 2 1) = 2
