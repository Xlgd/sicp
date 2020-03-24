#lang sicp

(define operation-table make-table)
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc))

(put 'op 'quote text-of-quotation)
(put 'op 'assignment eval-assignment)
(put 'op 'definition eval-definition)
(put 'op 'if eval-if)
(put 'op 'lambda (lambda (exp env)
                   (lambda-parameters exp)
                   (lambda-body exp) env))
(put 'op 'begin (lambda (exp env)
                  (eval-sequence (begin-actions exp) env)))
(put 'op cond (lambda (exp env)
                (eval (cond->if exp) env)))

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((get 'op (car exp)) ((get 'op (car exp)) exp env))
        ((application? exp) (apply (eval (operator exp) env)
                                   (list-of-values (operands exp) env)))
        (else (error "Unknown expression type -- EVAL" exp))))

                                   
     