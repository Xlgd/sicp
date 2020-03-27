#lang sicp

(define (analyze-sequence exps)
  (define (execute-sequence procs env)
    (cond ((null? (cdr procs)) ((car procs) env))
          (else ((car procs) env)
                (execute-sequence (cdr procs) env))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
        (error "Empty sequence -- ANALYZE"))
    (lambda (env) (execute-sequence procs env))))

;当序列只有一个表达式时，Alyssa的程序和正文中的分析效果一样
;当序列包含两个表达式以上时，Alyssa的程序不能对表达式内部进行分析，正文中
;的程序是可以对表达式内部建立求值过程