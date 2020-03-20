#lang sicp

(define x 10)
(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

;;假设P1为将x设置为x * x；P2为将x设置为x + 1，还会出现以下结果：

;;121：先执行P2，再执行P1，x最后为121
;;121：P1访问x，之后执行P2将x设置为11，最后执行P1，将x设置为121
;;101：先执行P1，再执行P2，x最后为101