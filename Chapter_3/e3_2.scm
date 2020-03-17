#lang sicp


(define (make-monitored f)
  (define count 0)
  (define (dispatch m)
    (cond ((eq? m 'how-many-call?) count)
          ((eq? m 'reset-count) (set! count 0))
          (else
           (begin (set! count (+ count 1))
                  (f m)))))
  dispatch)
