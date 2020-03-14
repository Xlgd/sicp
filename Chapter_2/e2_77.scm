#lang sicp

;以下为执行过程：

;(magnitude z)

;(apply-generic 'magnitude z)

;(map type-tag (list z))         ; => '(complex)

;(get 'magnitude '(complex))     ; => #f

;(error ...)

;可以看出,apply-generic函数寻找complex类型的magnitude函数,
;但是该函数并不存在,所以它返回 #f ,并引发一个错误。

;加入新的put语句后的执行过程：

;(magnitude z)                                                   ; 这个 magnitude 是最外层的通用操作

;(apply-generic 'magnitude z)

;(map type-tag (list z))                                         ; => '(complex)

;(get 'magnitude '(complex))                                     ; => magnitude  ; 这个 magnitude 是定义于 complex 包中的 magnitude

;(apply magnitude (map contents (list z)))                       ; =>  (apply magnitude '((rectangular 3 . 4)))

;(magnitude '(rectangular 3 . 4))

;(apply-generic 'magnitude '(rectangular 3 . 4))

;(map type-tag (list '(rectangular 3 . 4)))                      ; => '(rectangular)

;(get 'magnitude '(rectangular))                                 ; => magnitude  ; 这个 magnitude 是定义于 rectangular 包中的 magnitude

;(apply magnitude (map contents (list '(rectangular 3 . 4))))    ; => (apply magnitude '((3 . 4)))

;(magnitude '(3 . 4))

;(sqrt (+ (square (real-part '(3 . 4)))
;         (square (imag-part '(3 . 4)))))

;5

;apply-generic函数被调用了两次，
;第一次调用它去掉数据上的complex标志,
;并调用(install-rectangular-package)包中的 magnitude 函数
;第二次调用它去掉数据上的rectangular标志,
;并调用(install-rectangular-package)包中的 magnitude 函数。