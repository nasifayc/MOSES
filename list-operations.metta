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

(= (append $element Nil) (Cons $element Nil))
(= (append $element (Cons $x $xs))
    (Cons $x (append $element $xs))
)

(= (max-value Nil $num) $num)
(= (max-value (Cons $x $xs) $num)
   (if (> $x $num) (max-value $xs $x) (max-value $xs $num))
)

(= (min-value Nil $num) $num)
(= (min-value (Cons $x $xs) $num)
   (if (< $x $num) (min-value $xs $x) (min-value $xs $num))
)

(= (push $x Nil) (Cons $x Nil))
(= (push $element (Cons $x $xs))
    (Cons $element (push $x $xs))
)

(= (pop  Nil) Nil)
(= (pop (Cons $x $xs)) 
    (if (== $xs Nil) $x (pop $xs))
)

(= (remove-element $e Nil $res) (reverse $res Nil))
(= (remove-element $e (Cons $x $xs ) $res)
    (if (== $x $e) 
        (remove-element $e $xs $res) 
        (remove-element $e $xs (Cons $x $res)))
)

(= (remove-duplicate Nil $res) (reverse $res Nil))
(= (remove-duplicate (Cons $x $xs) $res)
    (if (isMember $x $xs) 
        (remove-duplicate $xs $res) 
        (remove-duplicate $xs (Cons $x $res)))
)

(= (square $x) (* $x $x))

(= (map Nil $f $res) (reverse $res Nil))
(= (map (Cons $x $xs) $f $res)
    (let $r ($f $x) (map $xs $f (Cons $r $res)))
)

(= (gr-than-ten $x)
    (if (> $x 10) True False)
)

(= (filter Nil $f $res) (reverse $res Nil))
(= (filter (Cons $x $xs) $f $res)
    (if ($f $x) 
        (filter $xs $f (Cons $x $res))
        (filter $xs $f $res)
    )
)

(= (reverse Nil $res) $res)
(= (reverse (Cons $x $xs) $res) 
    (reverse $xs (Cons $x $res))
)
; --------------------- Length -------------------------------------------- 
;!(length (Cons 1 (Cons 2 (Cons 3 Nil)))) ; [3]
;!(length (Cons True (Cons False (Cons True (Cons True (Cons False Nil)))))) ; [5]


; -------------------- Is Member ---------------------------------------
; !(isMember 5 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; False
; !(isMember "Nasi" (Cons "Abebe" (Cons "Kebede" (Cons "Nasi" Nil)))) ; True

;--------------------- Max Value ---------------------------------------
; !(max-value (Cons 1 (Cons 2 (Cons 3 Nil))) -100) ; 3


;--------------------- Min Value ---------------------------------------
;!(min-value (Cons 1 (Cons 2 (Cons 3 (Cons -43 Nil)))) 100) ; -43


;--------------------- Append ---------------------------------------
; !(append 10 (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) 

;--------------------- Push ---------------------------------------
; !(push 10 (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) 



;--------------------- Pop ---------------------------------------
;!(pop (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) ; -5

;--------------------- Remove Element ---------------------------------------
;!(remove-element 2 (Cons 1 (Cons 2 (Cons 3 (Cons -5 (Cons 2 Nil))))) Nil) 


;--------------------- Remove Duplicate ---------------------------------------
;!(remove-duplicate (Cons 1 (Cons 2 (Cons 3 (Cons -5 (Cons 2 (Cons 3 Nil)))))) Nil) 


; --------------------- Map -------------------------------------------- 
;!(map (Cons 1 (Cons 2 (Cons 3 (Cons -10 Nil)))) square Nil) 

; --------------------- Filter -------------------------------------------- 
;!(filter (Cons 12 (Cons 20 (Cons 3 (Cons -10 Nil)))) gr-than-ten Nil) 


;--------------------- Reverse ---------------------------------------
;!(reverse (Cons 1 (Cons 2 (Cons 3 Nil))) Nil) 