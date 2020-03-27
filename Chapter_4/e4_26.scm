#lang sicp

;add to eval
((unless? exp) (eval (unless->if exp) env))

;
(define (unless? exp) (tagged-list? exp 'unless))
(define (unless-predicate exp) (cadr exp))
(define (unless-consequence exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))
(define (unless-alternative exp) (caddr exp))

(define (unless->if exp)
  (make-if (unless-predicate exp) (unless-consequence exp)
           (unless-alternative exp)))
