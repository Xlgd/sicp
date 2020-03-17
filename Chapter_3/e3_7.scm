#lang sicp

;;ex3.3 code
(define (make-account balance secpasswd)
  (define passwd-box (list secpasswd))
  (define (add-new-passwd new-passwd)
    (cons new-passwd passwd-box))
  (define (passwd-right? passwd passwdlist)
    (cond ((null? passwdlist) false)
          ((eq? passwd (car passwdlist)) true)
          (else (passwd-right? passwd (cdr passwdlist)))))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  (define (dispatch passwd m)
    (if (not (passwd-right? passwd passwd-box))
        "Incorrect password"
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'addpasswd) add-new-passwd)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))))
  dispatch)

;;make-joint
(define (make-joint old-account old-passwd new-passwd)
  (begin ((old-account old-passwd 'addpasswd) new-passwd))
  (define (withdraw amount)
    ((old-account old-passwd 'withdraw) amount))
  (define (deposit amount)
    ((old-account old-passwd 'deposit) amount))
  (define (dispatch passwd m)
    (if (not (eq? passwd new-passwd))
        (error "Incorrect password")
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))))
  dispatch)

  
  