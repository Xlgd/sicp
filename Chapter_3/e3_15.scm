#lang sicp

(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! x)
  (set-car! (car x) 'wow) x)

;> z1
;((a b) a b)
;> (set-to-wow! z1)
;((wow b) wow b)
;> x
;(wow b)
;> z2
;((a b) a b)
;> (set-to-wow! z2)
;((wow b) a b)

;可以看出，对z1的修改会导致x也被修改了，所以z1中会包含两个
;wow，而对z2与z1不同，对z2的修改不会影响到后面的元素