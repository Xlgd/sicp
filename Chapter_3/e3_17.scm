#lang sicp

(define (count-pairs x)
  (length (inner x '())))

(define (inner x box)
  (if (and (pair? x)
           (not (memq x box)))
      (inner (car x) (inner (cdr x)
                            (cons x box)))
      box))