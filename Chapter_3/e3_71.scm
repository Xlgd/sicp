#lang sicp

(define (sum-triple x) (+ (triple (car x)) (triple (cadr x))))
(define (triple x) (* x x x))

(define (Ramanujan s)
  (if (= (sum-triple (stream-car s))
         (sum-triple (stream-car (stream-cdr s))))
      (cons-stream (list (sum-triple (stream-car s))
                         (stream-car s)
                         (stream-car (stream-cdr s)))
                   (Ramanujan (stream-cdr s)))
      (Ramanujan (stream-cdr s))))

(define Ramanujan-numbers
  (Ramanujan (weight-pairs integers integers sum-triple)))

; (4104 (2 16) (9 15)) 
; (13832 (2 24) (18 20)) 
; (20683 (10 27) (19 24)) 
; (32832 (4 32) (18 30)) 
; (39312 (2 34) (15 33)) 