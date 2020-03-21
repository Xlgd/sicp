#lang sicp

(define s (cons-stream 1 (add-streams s s)))

;;这个流产生2的幂次