#lang sicp

;过程参数中的l大写为L，注意不要与数字1混淆
(define (RLC r l c dt)
  (define (proc vc0 il0)
    (define vc (integral (delay dvc) vc0 dt))
    (define il (integral (delay dil) il0 dt))
    (define dvc (scale-stream il (/ -1 c)))
    (define dil (add-streams (scale-stream vc (/ 1 l))
                             (scale-stream il (/ r l))))
    (stream-map cons vc il))
  proc)

((RLC 1 1 0.2 0.1) 10 0)
