#lang sicp

(define (env-loop env base match)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             base)
            ((eq? var (car vars))
             match)
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-valus frame))))

(define (lookup-variable-value var env)
  (env-loop env
            (env-loop (enclosing-environment env))
            (car vals)))

(define (set-variable-value! var val env)
  (env-loop env
            (env-loop (enclosing-environment env))
            (set-car! vals val)))

(define (define-variable! var val env)
  (env-loop env
            (add-binding-to-frame! var val frame)
            (set-car! vals val)))
             
             