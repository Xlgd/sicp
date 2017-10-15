(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (if (null? items)
      '()
      (append (deep-reverse (cdr items))
              (if (pair? (car items))
                  (list (reverse (car items)))
                  (list (car items))))))

;another methods

(define (deep-reversetwo tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) tree)
        (else
         (reverse (list (deep-reversetwo (car tree))
                        (deep-reversetwo (cadr tree)))))))

;another methods

(define (deep-reversethree tree)
  (cond ((empty-tree? tree) '())
        ((leaf? tree) tree)
        (else
         (reverse (make-tree (deep-reversethree (left-branch tree))
                             (deep-reversethree (right-branch tree)))))))


(define (empty-tree? tree)
  (null? tree))

(define (leaf? tree)
  (not (pair? tree)))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (make-tree left-tree right-tree)
  (list left-tree right-tree))

