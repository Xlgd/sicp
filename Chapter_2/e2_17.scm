; the procedure last-pair returns the list that contains only the last
; element of a given(nonempty) list

(define (length items)
  (if (null? items)
	0
	(+ 1 (length (cdr items)))))

(define (last-pair items)
  (cond ((= (length items) 1) (car items))
		((= (length items) 2) (cdr items))
		(else (last-pair (cdr items)))))	
