(define (fr n)
  (cond ((< n 3) n)
        (else (+ (fr (- n 1))
                 (* 2
                    (fr (- n 2)))
                 (* 3
                    (fr (- n 3)))))))

(define (fi n)
  (define (fi-internal a b c n)
    (cond ((= n 3) (+ c
                      (* 2 b)
                      (* 3 a)))
          (else (fi-internal b c (+ c
                                    (* 2 b)
                                    (* 3 a)) (- n 1)))))
  (cond ((< n 3) n)
        (else (fi-internal 0 1 2 n))))


