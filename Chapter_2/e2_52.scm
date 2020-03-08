#lang sicp

;a
(segments->painter (list
                         (make-segment (make-vect 0.4 1.0)      ; 头部左上
                                       (make-vect 0.35 0.85))
                         (make-segment (make-vect 0.35 0.85)    ; 头部左下
                                       (make-vect 0.4 0.64))
                         (make-segment (make-vect 0.4 0.65)     ; 左肩
                                       (make-vect 0.25 0.65))
                         (make-segment (make-vect 0.25 0.65)    ; 左手臂上部
                                       (make-vect 0.15 0.6))
                         (make-segment (make-vect 0.15 0.6)     ; 左手上部
                                       (make-vect 0.0 0.85))

                         (make-segment (make-vect 0.0 0.65)     ; 左手下部
                                       (make-vect 0.15 0.35))
                         (make-segment (make-vect 0.15 0.35)    ; 左手臂下部
                                       (make-vect 0.25 0.6))

                         (make-segment (make-vect 0.25 0.6)     ; 左边身体
                                       (make-vect 0.35 0.5))
                         (make-segment (make-vect 0.35 0.5)     ; 左腿外侧
                                       (make-vect 0.25 0.0))
                         (make-segment (make-vect 0.6 1.0)      ; 头部右上
                                       (make-vect 0.65 0.85))
                         (make-segment (make-vect 0.65 0.85)    ; 头部右下
                                       (make-vect 0.6 0.65))
                         (make-segment (make-vect 0.6 0.65)     ; 右肩
                                       (make-vect 0.75 0.65))
                         (make-segment (make-vect 0.75 0.65)    ; 右手上部
                                       (make-vect 1.0 0.3))

                         (make-segment (make-vect 1.0 0.15)     ; 右手下部
                                       (make-vect 0.6 0.5))
                         (make-segment (make-vect 0.6 0.5)      ; 右腿外侧
                                       (make-vect 0.75 0.0))

                         (make-segment (make-vect 0.4 0.0)      ; 左腿内侧
                                       (make-vect 0.5 0.3))
                         (make-segment (make-vect 0.6 0.0)      ; 右腿内侧
                                       (make-vect 0.5 0.3))
                         (make-segment (make-vect 0.0 0.0)
                                       (make-vect 1.0 1.0))))

;b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))
            (corner (corner-split painter (- n 1))))
        (beside (below painter up)
                (below right corner)))))

;c
(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
                                  flip-vert rotate180)))
    (combine4 (corner-split painter n))))
                                      
