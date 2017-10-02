; the procedure reverse takes a list as argument and returns
; a list of the same elements in reverse order

(define (reverse items)
  (iter items '()))

(define (iter remained-items result)
  (if (null? remained-items)
	result
	(iter (cdr remained-items)
		  (cons (car remained-items) result))))
