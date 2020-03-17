#lang sicp

(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount)))
    (define (dispatch m)
        (cond ((eq? m 'withdraw) withdraw) 
              ((eq? m 'deposit) deposit)
              (else
                (error "Unknown request -- MAKE-ACCOUNT" m))))
    dispatch)

;; acc和acc2都在全局环境中，两个账户互不共享过程和数据
;;具体分析：
;;https://sicp.readthedocs.io/en/latest/chp3/11.html