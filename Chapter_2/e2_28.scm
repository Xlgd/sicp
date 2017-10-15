(define (fringe items)
  (cond ((null? items) '())
        ((pair? (car items)) (append (fringe (car items))
                                     (fringe (cdr items))))
        (else (cons (car items) (fringe (cdr items))))))

;another methods

(define (fringetwo tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (fringetwo (car tree))
                      (fringetwo (cadr tree))))))

;another methods

(define (fringethree tree)
  (cond ((empty-tree? tree) '())
        ((leaf? tree) (list tree))
        (else
         (append (fringethree (left-branch tree))
                 (fringethree (right-branch tree))))))

(define (empty-tree? tree)
  (null? tree))

(define (leaf? tree)
  (not (pair? tree)))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))


