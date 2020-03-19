#lang sicp

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define memo-fib
  (memorize (lambda (n)
              (cond ((= n 0) 0)
                    ((= n 1) 1)
                    (else (+ (memo-fib (- n 1))
                             (memo-fib (- n 2))))))))

(define (memorize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
        (or previouely-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))


;;每次计算出一个斐波那契数的时候，memo-fib都会调用memorize过程将这个数
;;保存到表格中，下次如果需要使用这个数，可以直接找到，不用二次计算
;;所以memo-fib能以正比于n的步数计算

;;改变memo-fib的定义后，还是可以工作，不过运行时间会变长。因为我们在调用
;;memo-fib x的时候，最终memoize过程只会将第x个斐波那契数保存到表格中。