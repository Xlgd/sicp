#lang sicp

(define (cycle? l)
  (define (iter x y)
    (let ((x-walk (walk 1 x))
          (y-walk (walk 2 y)))
      (cond ((or (null? x-walk) (null? y-walk)) false)
            ((eq? x-walk y-walk) true)
            (else (iter x-walk y-walk)))))
  (iter l l))

(define (walk step x)
  (cond ((null? x) '())
        ((= step 0) x)
        (else (walk (- step 1)
                    (cdr x)))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define z (make-cycle (list 'a 'b 'c)))