;map takes as arguments a procedure of one argument and a list, 
;and returns a list of the results produced byapplying the procedure
;to each element in the list

(define (map proc items)
  (if (null? items)
	()
	(cons (proc (car items))
		  (map proc (cdr items)))))

;the scale-list scales each number in a list by a given factor 
; (scale-list (list 1 2 3) 10) --> (10 20 30)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
	   items))

;here are two different definitions of square-list

(define (square-list items)
  (map (lambda (x) (* x x))
	   items))

(define (square-list items)
  (if (null? items)
	()
	(cons (square (car items))
		  (square-list (cdr items)))))

