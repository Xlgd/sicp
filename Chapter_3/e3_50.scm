#lang sicp

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
      '()
      (cons-stream
        (apply proc (map (lambda (s) (stream-car s)) argstreams))
        (apply stream-map
               (cons proc (map (lambda (s) (stream-cdr s)) argstreams))))))

