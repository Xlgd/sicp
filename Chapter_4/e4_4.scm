#lang sicp

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ;;and
        ((and? exp) (eval-and exp env))
        ;;or
        ((or? exp) (eval-or exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp)
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))

;;eval-and
(define (and? exp)
  (tagged-list? exp 'and))

(define (eval-and exps env)
  (let ((first-exp (eval (cadr exps) env)))
    (cond ((eq? first-exp false) false)
          ((null? cddr exp) first-exp)
          (else (eval-and (cddr exps) env)))))

;;eval-or
(define (or? exp)
  (tagged-list? exp 'or))

(define (eval-or exps env)
  (let ((first-exp (eval (cadr exps) env)))
    (cond ((eq? first-exp true) true)
          ((null? cddr exp) first-exp)
          (else (eval-or (cddr exps) env)))))

;;派生表达式
(put 'op 'and eval-and)
(put 'op 'or eval-or)