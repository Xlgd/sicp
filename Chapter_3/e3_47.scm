#lang sicp

;;a
(define (make-semaphore n)
  (let ((mutex (make-mutex)))
    (define (acquire)
      (mutex 'acquire)
      (if (> n 0)
          (begin (set! n (- n 1))
                 (mutex 'release)
                 'ok)
          (begin (mutex 'release)
                 (acquire))))

    (define (release)
      (mutex 'acquire)
      (set! n (+ n 1))
      (mutex 'release)
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'acquire) (acquire))
            ((eq? m 'realease) (release))
            (else
             (error "Unknown mode MAKE-SEMAPHORE" m))))

    dispatch))

;;b
(define (make-semaphore n)
  (define (acquire)
    (if (test-and-set! n)
        'ok
        (acquire)))

  (define (release)
    (set! n (+ n 1))
    'ok)

  (define (dispatch m)
    (cond ((eq? m 'acquire) (acquire))
          ((eq? m 'release) (release))
          (else
           (error "Unknown mode MAKE-SEMAPHORE" m))))

  dispatch)

;;原子操作test-and-set!
(define (test-and-set! n)
  (if (> n 0)
      (begin (set! n (- n 1))
             true)
      false))

      