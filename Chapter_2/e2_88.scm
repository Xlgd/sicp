#lang sicp

;;scheme number
(put 'negate 'scheme-number
     (lambda (x) (tag (-n))))

;;rational number
(put 'negate 'rational
     (lambda (x) (make-rational (- (numer x)
                                   (denom x)))))

;;complex
(put 'negate 'complex
     (lambda (x) (make-from-real-imag (- (real-part x))
                                      (- (imag-part x)))))
                                        

(define (negate-terms termlist)
  (if (empty-termlist?)
      the-empty-termlist
      (let (t (first-term termlist))
        (adjoin-term (make-term (order t)
                                (negate (coeff t)))
                     (negate-terms (rest-terms termlist))))))

(put 'negate 'polynomial
     (lambda (x) (make-polynomial(variable x)
                                 (negate-terms (terms-list x)))))

(put 'sub '(polynomial polynomial)
     (lambda (x y) (tag (add-poly x (negate y)))))

