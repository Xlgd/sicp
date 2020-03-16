#lang sicp

(define (install-dense-term-list-package)
  (define (first-term term-list)
    (make-term (- (length term-list) 1)
               (car term-list)))
  (define (adjoin-term term term-list)
    (cond ((=zero? term) term-list)
          ((=equ? (order term) (length term-list))
           (cons term term-list))
          (else (adjoin-term term (cons 0 term-list)))))
  (define (rest-term term-list) (cdr term-list))

  ;;interface
  (define (tag p) (attach-tag 'dense-polynomial p))
  (put 'first-term 'dense-polynomial
       (lambda (term-list) (tag (first-term term-list))))
  (put 'adjoin-term 'dense-polynomial
       (lambda (term term-list) (tag (adjoin-term term
                                             term-list))))
  (put 'rest-term 'dense-polynomial
       (lambda (term-list) (tag (rest-term term-list))))
  'done)

(define (install-sparse-term-list-package)
  (define (first-term term-list) (car term-list))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (rest-term term-list) (cdr term-list))

  ;;interface
  (define (tag p) (attach-tag 'sparse-polynomial p))
  (put 'first-term 'sparse-polynomial
       (lambda (term-list) (tag (first-term term-list))))
  (put 'adjoin-term 'sparse-polynomial
       (lambda (term term-list) (tag (adjoin-term term
                                                 term-list))))
  (put 'rest-term 'sparse-polynomial
       (lambda (term-list) (tag (rest-term term-list))))
  'done)


(define (adjoin-term term term-list)
  ((get 'adjoin-term (type-tag term-list)) term term-list))

(define (first-term term-list)
  (apply-generic 'first-term term-list))

(define (rest-term term-list)
  (apply-generic 'rest-term term-list))