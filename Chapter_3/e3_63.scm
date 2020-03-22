#lang sicp

;old
(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

;new
(define (sqrt-stream x)
  (cons-stream 1.0
               (stream-map (lambda (guess)
                             (sqrt-imporve guess x))
                           (sqrt-stream x))))

;;新版本低效的原因是会递归调用(sqrt-stream x)，每次得到一个更精确的值的时候
;;都要重新将之前的值算一遍，没有记忆功能
;;如果不使用memo-proc提供的优化，则两个版本效率一样