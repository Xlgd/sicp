#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (car-n seqs)
  (map car seqs))

(define (cdr-n seqs)
  (map cdr seqs))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))

(define m (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))
(define v (list 1 1 1 1))

(define n (list (list 1)
                (list 1)
                (list 1)
                (list 1)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (col) (dot-product v col)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))



