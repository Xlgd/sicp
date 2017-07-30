(define (>= a b)
  (or (> a b) (= a b)))

(define (max-of-twolarge a b c)
  (cond ((and (>= a b) (>= c b)) (+ a c))
        ((and (>= a c) (>= b c)) (+ a b))
        ((and (>= b a) (>= c a)) (+ b c))))


