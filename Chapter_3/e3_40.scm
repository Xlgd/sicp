#lang sicp

(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))

;;假设P1为将x平方，P2为将x次方
;;可能得到的结果：

;;10^6：先执行P1，再执行P2（或先执行P2，再执行P1）
;;10^2：执行P1中取得x的值10，之后执行P2将x设置为10^3，最后再执行P1，将x设置为10^2
;;10^3：执行P2中取得x的值10，之后执行P1将x设置为10^2，最后再执行P2，将x设置为10^3
;;10^4：P2将x设置为10^3出现在P1两次访问x的值之间，最终P1将x设置为10^4
;;（或者P1将x设置为10^2出现在P2最后一次访问x的值之前，最终P2将x设置为10^4）
;;10^5：P1将x设置为10^2出现在P2第一次访问x的值之后，最终P2将x设置为10^5

;;改用串行化过程
(define x 10)
(define s (make-serializer))

(parallel-execute (s (lambda () (set! x (* x x))))
                  (s (lambda () (set! x (* x x x)))))

;;可能得到的结果：
;;10^6:先执行P1,再执行P2(或先执行P2,再执行P1)