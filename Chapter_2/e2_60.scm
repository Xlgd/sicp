#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) (remove-element (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))

(define (remove-element x set)
  (define (remove-iter new rest)
    (cond ((null? rest) new)
          ((equal? x (car rest))
           (append new (cdr rest)))
          (else (remove-iter (adjoin-set (car rest) new)
                             (cdr rest)))))
  (remove-iter '() set))

(define (union-set set1 set2)
  (append set1 set2))