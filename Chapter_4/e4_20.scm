#lang sicp

(define (f x)
  (letrec ((even?
            (lambda (n)
              (if (= n 0)
                  true
                  (odd? (- n 1)))))
           (odd?
            (lambda (n)
              (if (= n 0)
                  false
                  (even? (- n 1))))))
    <f的其他部分>))

(letrec ((fact
          (lambda (n)
            (if (= n 1)
                1
                (* n (fact (- n 1)))))))
  (fact 10))

;a
(define (letrec? exp) (tagged-list? exp 'letrec))
(define (letrec-inits exp) (cadr exp))
(define (letrec-body exp) (cddr exp))
(define (declare-variables exp)
  (map (lambda (x) (list (car x) '*unassigned*))
       (letrec-inits exp)))
(define (set-variables exp)
  (map (lambda (x) (list 'set! (car x) (cadr x)))
       (letrec-inits exp)))
(define (letrec->let exps)
  (list 'let (declare-variables exps)
        (make-begin (append (set-variables exps)
                            (letrec-body exps)))))