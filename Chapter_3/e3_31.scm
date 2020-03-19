#lang sicp

(define (accept-action-procedure! proc)
  (set! action-procedures (cons proc action-procdures)))

;;最后让新加入的过程立即运行，可以使得将此动作加入到模拟器的待处理列表中
;;当调用(propagate)时就可以执行这个动作

;;如果取消(proc)这一行的话，那么就会导致在待处理列表中没有此动作
;;无法执行相应的动作