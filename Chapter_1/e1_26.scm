#lang sicp

;原本的expmod在每次exp为偶数时可以将计算量减少一半

(remainder (square (expmod base (/ exp 2) m)) m)

;但是题目中的expmod重复计算了两次(expmod base (/ exp 2) m)

(remainder (* (expmod base (/ exp 2) m)
              (expmod base (/ exp 2) m))
           m)
