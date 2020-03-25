#lang sicp

(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-body exp) (caddr exp))
(define (let*-inits exp) (cadr exp))
(define (let*->nested-lets exp)
  (let ((inits (let*-inits exp))
        (body (let*-body exp)))
    (define (make-lets exps)
      (if (null? exps)
          body
          (list 'let (list (car exps)) (make-lets (cdr exps)))))
    (make-lets inits)))
