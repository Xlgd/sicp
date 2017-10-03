(define (same-parity x . items)
  (if (even? x)
	(cons x (filter even? items))
	(cons x (filter odd? items))))
