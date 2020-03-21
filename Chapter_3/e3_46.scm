#lang sicp

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))

;;如果按常规过程实现test-and-set!，没有使之原子化，导致两个进程可以同时访问互斥元
;;则可能会发生一种情况，两个进行都在进行test-and-set!，检查互斥元的结果为假
;;所以两个进程都会将互斥元设置为真并继续执行，这样就不能实现两个进程的串行化