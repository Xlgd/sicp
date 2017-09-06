(define (make-segment start end)
  (cons start end))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment line)
  (let ((start (start-segment line))
        (end (end-segment line)))
      (make-point (average (x-point start)
                           (x-point end))
                  (average (y-point start)
                           (y-point end)))))
(define (average x y)
  (/ (+ x y) 2.0))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
