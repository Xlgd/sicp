#lang sicp

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car-weight (weight (stream-car s1)))
               (s2car-weight (weight (stream-car s2))))
           (cond ((< s1car-weight s2car-weight)
                  (cons-stream (stream-car s1)
                               (merge-weighted (stream-cdr s1) s2 weight)))
                 ((> s1car-weight s2car-weight)
                  (cons-stream (stream-car s2)
                               (merge-weighted s1 (stream-cdr s2) weight)))
                 (else
                  (cons-stream (stream-car s1)
                               (merge-weighted (stream-cdr s1)
                                               (stream-cdr s2)
                                               weight))))))))

(define (weighted-pairs s1 s2 cal-weight)
  (merge-weighted
   (list (stream-car s1) (stream-car s2))
   (interleave
    (stream-map (lambda (x) (list (stream-car s1) x))
                (stream-cdr s2))
    (weighted-pairs (stream-cdr s1) (stream-cdr s2)))
   cal-weight))

;;a
(weight-pairs integers integers sum)

(define (sum pair)
  (+ (car pair) (cadr pair)))

;;b
(weight-pairs s1 s2 sum2)

(define s1
  (stream-filter (lambda (x) (or (= (remainder x 2) 0)
                                 (= (remainder x 3) 0)
                                 (= (remainder x 5) 0)))
                 integers))


(define s2
  (stream-filter (lambda (x) (or (= (remainder x 2) 0)
                                 (= (remainder x 3) 0)
                                 (= (remainder x 5) 0)))
                 integers))

(define (sum2 pair)
  (+ (* 2 (car pair))
     (* 3 (cadr pair))
     (* 5 (car pair) (cadr pair))))

