;(define (count-leaves x)
;  (cond ((null? x) 0)
;        ((not (pair? x)) 1)
;        (else (+ (count-leaves (car x))
;                 (count-leaves (cdr x))))))

(define x (list 1 3 (list 5 7) 9))

(car (cdaddr x))

(define y (list (list 7)))

(caar y)

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(cadadr (cadadr (cadadr z)))
