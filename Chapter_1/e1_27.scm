#lang sicp

(define (carmichael-test n)
  (test-iter 1 n))

(define (test-iter a n)
  (cond ((= a n) true)
        ((congruent? a n)
         (test-iter (+ a 1) n))
        (else false)))

(define (congruent? a n)
  (= (expmod a n n) a))