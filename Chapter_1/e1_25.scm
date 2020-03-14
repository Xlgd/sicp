#lang sicp

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;理论没错，但实际中运行时速度不快