#lang sicp

(define (div-series s1 s2)
  (if (= (stream-car s2) 0 )
      (error "constant term cannot be 0")
      (let ((reciprocal-s2-car (/ 1 (stream-car s2))))
        (mul-series
         (scale-stream s1 reciprocal-s2-car)
         (reciprocal-series (scale-stream s2 reciprocal-s2-car))))))

(define tangent-series (div-series sine-series consine-series))

