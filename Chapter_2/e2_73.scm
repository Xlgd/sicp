#lang sicp

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else (error "unknown expression type -- DERIV" exp))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;b
(define (install-sum-package)
  ;;internal procedures
  (define (addend exp) (car exp))
  (define (augend exp) (cadr exp))
  (define (make-sum x y)
    (cond ((=number? x 0) y)
          ((=number? y 0) x)
          ((and (number? x) (number? y)) (+ x y))
          (else (attach-tag '+ x y))))
  ;;interface to the rest of the system
  (put 'addend '+ addend)
  (put 'augend '+ augend)
  (put 'make-sum '+ make-sum)

  (put 'deriv '+
       (lambda (operands var) (make-sum
                              (deriv (addend operands) var)
                              (deriv (augend operands) var))))
  'done)

(define (addend exp)
  ((get 'addend '+) (contents exp)))

(define (augend exp)
  ((get 'augend '+) (contents exp)))

(define (make-sum x y)
  ((get 'make-sum '+) x y))

(define (install-product-package)
  ;;internal procedures
  (define (multiplier exp) (car exp))
  (define (multiplicand exp) (cadr exp))
  (define (make-product x y)
    (cond ((=number? x 1) y)
          ((=number? y 1) x)
          ((and (number? x) (number? y)) (* x y))
          (else (attach-tag '* x y))))
  ;;interface to the rest of the system
  (put 'multiplier '* multiplier)
  (put 'multiplicand '* multiplicand)
  (put 'make-product '* make-product)

  (put 'deriv '*
       (lambda (operands var) (make-sum
                               (make-product (multiplier operands)
                                             (deriv (multiplicand operands) var))
                               (make-product (multiplicand operands)
                                             (deriv (multiplier operands) var)))))
  'done)

(define (multiplier exp)
  ((get 'multiplier '*) (contents exp)))

(define (multiplicand exp)
  ((get 'multiplicand '*) (contents exp)))

(define (make-product x y)
  ((get 'make-product '*) x y))

;c
(define (install-exponentiation-package)
  ;;internal procedures
  (define (base exp) (car exp))
  (define (exponent exp) (cadr exp))
  (define (make-exponentiation base n)
    (cond ((= n 0) 1)
          ((= n 1) base)
          (else (attach-tag '** base n))))
  ;;interface to the rest of the system
  (put 'base '** base)
  (put 'exponent '** exponent)
  (put 'make-exponentiation '** make-exponentiation)

  (put deriv '**
       (lambda (operands var)
         (let ((u (base operands))
               (n (exponent operands)))
           (make-product n
                         (make-product (make-exponentiation u (- n 1))
                                       (deriv u var))))))
  'done)

(define (base exp)
  ((get 'base '**) (contents exp)))

(define (exponent exp)
  ((get 'exponent '**) (contents exp)))

(define (make-exponentiation base n)
  ((get 'make-exponentiation '**) base n))

;d
;在put函数中交换参数的顺序
          
    
 