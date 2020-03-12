#lang sicp

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(A D A B B C A))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol char tree)
  (define (encode-iter char tree)
    (cond ((leaf? tree) '())
          ((element-of-branch? char (symbols(left-branch tree)))
           (cons 0 (encode-iter char (left-branch tree))))
          ((element-of-branch? char (symbols(right-branch tree)))
           (cons 1 (encode-iter char (right-branch tree))))
          (else (error "not found the symbol --ENCODE-SYMBOL" char))))
  (encode-iter char tree))

(define (element-of-branch? char branch)
  (cond ((null? branch) false)
        ((equal? char (car branch)) true)
        (else (element-of-branch? char (cdr branch)))))
