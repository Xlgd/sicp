#lang sicp

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

;;过程会陷入死循环，因为(pairs (stream-cdr s) (stream-cdr t)中没有
;;delay，所以会一直调用

;;如果用这个过程取求值(pairs integers integers)，那么会缺少一些值