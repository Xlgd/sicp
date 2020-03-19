#lang sicp

(define (or-gate a1 a2 output)
  (let ((o1 (make-wire)) (o2 (make-wire)) (o3 (make-wire)))
    (inverter a1 o1)
    (inverter a2 o2)
    (and-gate o1 o2 o3)
    (inverter o3 output)
    'ok))

;;or-gate-delay = 3 * inverter-delay + and-gate-delay
                        