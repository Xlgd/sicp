(define (make-segment start end)
  (cons start end))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

;构建矩形
(define (make-rec one-point two-point)
  (make-segment one-point two-point))

;计算矩形长度
(define (length r)
  (abs (- (x-point (start-segment r))
          (x-point (end-segment r)))))
;计算矩形宽度
(define (width r)
  (abs (- (y-point (start-segment r))
          (y-point (end-segment r)))))

;计算矩形周长
(define (calculate-per r)
  (* 2 (+ (length r) (width r))))


;计算矩形面积
(define (calculate-area r)
  (* (length r) (width r)))


