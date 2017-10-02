; List operations

; the procedure list-ref takes as arguments a list and a number n and 
; return the nth item of the list.It is customary to number the elements
; of the list beginning with 0.

(define (list-ref items n)
  (if (= n 0)
	(car items)
	(list-ref (cdr items) (- n 1))))

; the procedure length returns the number of items in a list

(define (length items)
  (if (null? items)
	0
	(+ 1 (length (cdr items)))))

; compute length in an iterative style

(define (length items)
  (define (length-iter a count)
	(if (null? a)
	  count
	  (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

; the procedure append takes two lists as arguments and combines their
; elements to make a new list

(define (append list1 list2)
  (if (null? list1)
	list2
	(cons (car list1) (append (cdr list1) list2))))

