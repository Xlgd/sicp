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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                     (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set))
      (car set)
      (successive-merge (adjoin-set (make-code-tree
                                     (car set) (cadr set))
                                    (cddr set)))))

(define pairs '((a 2)(na 16)(boom 1)(Sha 3)
                     (Get 2)(yip 9)(job 2)(Wah 1)))

(define tree (generate-huffman-tree pairs))

(define message '(Get a job
                      Sha na na na na na na na na
                      Get a job
                      Sha na na na na na na na na
                      Wah yip yip yip yip yip yip yip yip yip
                      Sha boom))
(define result (encode message tree))

;需要84个二进制位