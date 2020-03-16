#lang sicp

;;raise scheme number
(put('raise 'scheme-number
           (lambda (x) (make-rational x 1))))

;;raise rational
(put ('raise 'rational
             (lambda (x) (make-real (/ (numer x)
                                       (denom x))))))

;;raise real
(put ('raise 'real
             (lambda (x) (make-from-real-imag x 0))))
