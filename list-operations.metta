(: Nil (List $t))
(: Cons (-> $t (List $t) (List $t)))

(= (length Nil) 0)
(= (length (Cons $x $xs)) 
    (+ 1 (length $xs))
)

(= (isMember $x Nil) False)
(= (isMember $x (Cons $y $ys))
    (if (== $x $y) True (isMember $x $ys))
)

(= (max-value Nil $num) $num)
(= (max-value (Cons $x $xs) $num)
   (if (> $x $num) (max-value $xs $x) (max-value $xs $num))
)

(= (min-value Nil $num) $num)
(= (min-value (Cons $x $xs) $num)
   (if (< $x $num) (min-value $xs $x) (min-value $xs $num))
)

; --------------------- Length -------------------------------------------- 
;!(length (Cons 1 (Cons 2 (Cons 3 Nil)))) ; [3]
;!(length (Cons True (Cons False (Cons True (Cons True (Cons False Nil)))))) ; [5]


; -------------------- Is Member ---------------------------------------
;!(isMember 5 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; False
;!(isMember "Nasi" (Cons "Abebe" (Cons "Kebede" (Cons "Nasi" Nil)))) ; True

;--------------------- Max Value ---------------------------------------
!(max-value (Cons 1 (Cons 2 (Cons 3 Nil))) -100) ; 3


;--------------------- Min Value ---------------------------------------
!(min-value (Cons 1 (Cons 2 (Cons 3 (Cons -43 Nil)))) 100) ; -43
