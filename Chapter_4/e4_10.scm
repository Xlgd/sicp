#lang sicp

;改为(1 2 3 +)后缀表达式语法

(define (last-element lst)
  (if (null? (cdr lst))
      (car lst)
      (last-element (cdr lst))))

(define (tagged-list? exp sym)
  (if (pair? exp)
      (let ((last (last-element exp)))
        (eq? last sym))
      false))

  
(define (if? exp) (tagged-list? exp 'if)) 
  
(define (if-predicate exp) (car exp)) 
  
(define (if-consequent exp) (cadr exp)) 
  
(define (if-alternative exp) 
     (if (= (length exp) 4) 
         (caddr exp) 
         'false))

;......