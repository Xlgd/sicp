#lang sicp

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder list-a list-b list-s c)
  (define (iter a b s c-value)
    (if (and (null? a) (null? b) (null? s))
        'ok
        (let ((ak (car list-a))
              (bk (car list-b))
              (sk (car list-s))
              (a-remain (cdr list-a))
              (b-remain (cdr list-b))
              (s-remain (cdr list-s))
              (ck (make-wire)))
          (set-signal ck c-value)
          (full-adder ak bk ck sk c)
          (iter a-remain b-remain s-remain (get-signal c)))))
  (iter list-a list-b list-s (get-signal c)))

;;ripple-carry-adder
;;= (3 * or-gate-delay) + (2 * inveter-delay) + (4 * and-gate-delay)

                                

  
  