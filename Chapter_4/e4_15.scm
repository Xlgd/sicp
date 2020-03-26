#lang racket

(define (run-forever) (run-forever))

(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))

;如果(try try)可以停止，则通过if会使之永远运行下去
;如果(try try)不能停止，则通过if会使之停止
  