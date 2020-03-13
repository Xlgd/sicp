#lang sicp

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

(define (plus a b)
  (if (= a 0)
      b
      (plus (dec a) (inc b))))

;第一个函数是递归的，第二个函数是迭代的