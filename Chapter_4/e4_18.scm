#lang sicp

(lambda <vars>
  (let ((u '*unassigned*)
        (v '*unassigned*))
    (let ((a <e1>)
          (b <e2>))
      (set! u a)
      (set! v b))
    <e3))

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

;如果采用本练习中的定义，则不能工作，这是因为在计算e2时，y还未被定义
;如果采用本文中的定义，则可以工作