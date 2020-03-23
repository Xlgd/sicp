#lang sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (random-pairs low1 high1 low2 high2)
  (cons-stream (cons (random-in-range low1 high1)
                     (random-in-range low2 high2))
               (random-pairs low1 high1 low2 high2)))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define (estimate-integral p x1 y1 x2 y2)
  (let ((area (* (- x2 x1) (- y2 y1)))
        (random (random-pairs x1 x2 y1 y2))
        (experiment-random (p random)))
    (scale-stream (monte-carlo experiment-random 0 0) area)))


(define (square x) (* x x))

(define (f stream)
  (cons-stream (<= (+ (square (car (stream-car stream)))
                      (square (cadr (stream-car stream))))
                   1)
               (f (stream-cdr stream))))

(define pi-stream (estimate-integral f -1 -1 1 1))
