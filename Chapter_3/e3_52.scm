#lang sicp

(define sum 0)
;;sum = 0

(define (accum x)
  (set! sum (+ x sum))
  sum)
;;sum = 0

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;;sum = 1

(define y (stream-filter even? seq))
;;sum = 3

(define z (stream-fileter (lambda (x) (= (remainder x 5) 0))
                          seq))
;;sum = 15

(stream-ref y 7)
;;sum = 136

(display-stream z)
;;sum = 210

;;如果不用memo-proc所提供的优化，则会重复调用accum，则会导致sum的值发生变化
