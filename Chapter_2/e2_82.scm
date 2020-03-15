#lang sicp

(define (apply-generic op . args)
  (define (type-tags args)
    (map type-tag args))
  (define (try-coerce-to target)
    (map (lambda (x)
           (let ((coercor (get-coercion(type-tag x)
                                       (type-tag target))))
             (if coercor
                 (coercor x)
                 x)))
           args))
  (define (iterate next)
    (if (null? next)
        (error "No coersion strategy for these types"
               (list op (type-tags args)))
        (let ((coerced (try-coerce-to (car next))))
          (let ((proc (get op (type-tags coerced))))
            (if proc
                (apply proc (map contents coerced))
                (iterate (cdr next next)))))))

  (let ((proc (get op (type-tags args))))
    (if proc
        (apply proc (map contents args))
        (iterate args))))

    