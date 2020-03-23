#lang sicp

;从左向右求值
(define (list-of-values exps env)
    (if (not-operands? exps)
        '()
        (let ((first-value (eval (first-operand exps) env)))
            (cons first-value
                  (list-of-values (rest-operands exps) env)))))

;从右向左求值
(define (list-of-values exps env)
    (if (no-operands? exps)
        '()
        (let ((rest-values (list-of-values (rest-operands exps) env)))
            (cons (eval (first-operand exps) env)
                  rest-values))))

