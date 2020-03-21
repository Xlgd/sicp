#lang sicp

;;如果给账户编号，并在运行时使进程先试图获取编号较小的账户，这样就可以避免
;;上文中的a1和a2被不同的进程获取而导致死锁，因为当一个进程获得a1（编号较小）
;;则另外一个进程也会优先试图获得a1，而不是去获得a2，这样就避免了死锁

(define (make-account balance)
  (let ((id (generate-account-id)))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))

    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)

    (let ((balance-serializer (make-serializer)))
      (define (dispatch m)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'serializer) balance-serializer)
              ((eq? m 'id) id)
              (else
               (error "Unknown request -- MAKE-ACCOUNT" m))))

      dispatch)))

(define (counter)
  (let ((i 0))
    (lambda () (set! i (+ i 1))
      i)))
(define generate-account-id (counter))


(define (serialized-exchange account1 account2)
  (let ((small-id-account (smaller (account1 account2)))
        (big-id-account (bigger (account1 account2))))
    (let ((small-serializer (small-id-account 'serializer)))
      (let ((big-serializer (big-id-account 'serializer)))
        ((small-serializer (bigger-serializer exchange))
         small-id-account
         big-id-account)))))

(define (smaller acc1 acc2)
  (if (< (acc1 'id) (acc2 'id))
      acc1
      acc2))

(define (bigger acc1 acc2)
  (if (< (acc1 'id) (acc2 'id))
      acc2
      acc1))
