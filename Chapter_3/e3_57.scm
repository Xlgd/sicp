#lang sicp

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs)
                                         fibs))))

;;计算第n个斐波那契数时，需要执行(n - 2)次加法
;;如果不用memo-proc过程提供的优化，那么在计算第n个数时，也要重新计算之前的数
;;所以加法运算会增多