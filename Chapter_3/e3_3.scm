#lang sicp

(define (make-account balance secpasswd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch passwd m)
    (if (not (eq? passwd secpasswd))
        "Incorrect password"
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))))
  dispatch)
