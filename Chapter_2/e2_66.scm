#lang sicp

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= (given-key) (key (car set-of-records))) true)
        ((< (given-key) (key (car set-of-records)))
         (lookup given-key (left-branch (car set-of-records))))
        ((> (given-key) (key (car set-of-records)))
         (lookup given-key (right-branch (car set-of-records))))))
