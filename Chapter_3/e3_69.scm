#lang sicp

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (steam-car u))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (pairs t u))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (phythagorean-numbers)
  (define (square x) (* x x))
  (define numbers (triples integers integers integers))
  (stream-filter (lambda (x)
                   (= (square (caddr x))
                      (+ (square (car x)) (square (cadr x)))))
                 numbers))

