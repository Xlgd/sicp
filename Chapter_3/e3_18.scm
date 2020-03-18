#lang sicp

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define z (make-cycle (list 'a 'b 'c)))

(define (cycle? x)
  (define head (car x))
  (define (iter head rest)
    (cond ((null? rest) false)
          ((eq? head (car rest)) true)
          (else (iter head (cdr rest)))))
  (iter head (cdr x)))
