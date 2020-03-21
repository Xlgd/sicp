#lang sicp

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

;;Louis的话不是完全正确的，在处理交换问题上transfer的串行化已经足够了
;;exchange操作需要计算两个账户之间的差额，而transfer不用计算