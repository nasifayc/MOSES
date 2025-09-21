(: Nil (List $t))
(: Cons (-> $t (List $t) (List $t)))


; --------------------- Length -------------------------------------------- 
(= (length Nil) 0)
(= (length (Cons $x $xs)) 
    (+ 1 (length $xs))
)

!(length (Cons 1 (Cons 2 (Cons 3 Nil)))) ; [3]
!(length (Cons True (Cons False (Cons True (Cons True (Cons False Nil)))))) ; [5]

; -------------------- Is Member ---------------------------------------
(= (isMember $x Nil) False)
(= (isMember $x (Cons $y $ys))
    (if (== $x $y) True (isMember $x $ys))
)

!(isMember 5 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; False
!(isMember "Nasi" (Cons "Abebe" (Cons "Kebede" (Cons "Nasi" Nil)))) ; True


;--------------------- Append ---------------------------------------
(= (append $element Nil) (Cons $element Nil))
(= (append $element (Cons $x $xs))
    (Cons $x (append $element $xs))
)

!(append 10 (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) 


;--------------------- Max Value ---------------------------------------
(= (max-value Nil $num) $num)
(= (max-value (Cons $x $xs) $num)
   (if (> $x $num) (max-value $xs $x) (max-value $xs $num))
)

!(max-value (Cons 1 (Cons 2 (Cons 3 Nil))) -100) ; 3


;--------------------- Min Value ---------------------------------------
(= (min-value Nil $num) $num)
(= (min-value (Cons $x $xs) $num)
   (if (< $x $num) (min-value $xs $x) (min-value $xs $num))
)

!(min-value (Cons 1 (Cons 2 (Cons 3 (Cons -43 Nil)))) 100) ; -43


;--------------------- Push ---------------------------------------
(= (push $x Nil) (Cons $x Nil))
(= (push $element (Cons $x $xs))
    (Cons $element (push $x $xs))
)

!(push 10 (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) 


;--------------------- Pop ---------------------------------------
(= (pop  Nil) Nil)
(= (pop (Cons $x $xs)) 
    (if (== $xs Nil) $x (pop $xs))
)

!(pop (Cons 1 (Cons 2 (Cons 3 (Cons -5 Nil))))) ; -5

;--------------------- Reverse ---------------------------------------
(= (reverse Nil $res) $res)
(= (reverse (Cons $x $xs) $res) 
    (reverse $xs (Cons $x $res))
)

!(reverse (Cons 1 (Cons 2 (Cons 3 Nil))) Nil) 

;--------------------- Remove Element ---------------------------------------
(= (remove-element $e Nil $res) (reverse $res Nil))
(= (remove-element $e (Cons $x $xs ) $res)
    (if (== $x $e) 
        (remove-element $e $xs $res) 
        (remove-element $e $xs (Cons $x $res)))
)

!(remove-element 2 (Cons 1 (Cons 2 (Cons 3 (Cons -5 (Cons 2 Nil))))) Nil) 

;--------------------- Remove Duplicate ---------------------------------------
(= (remove-duplicate Nil $res) (reverse $res Nil))
(= (remove-duplicate (Cons $x $xs) $res)
    (if (isMember $x $xs) 
        (remove-duplicate $xs $res) 
        (remove-duplicate $xs (Cons $x $res)))
)

!(remove-duplicate (Cons 1 (Cons 2 (Cons 3 (Cons -5 (Cons 2 (Cons 3 Nil)))))) Nil) 


; --------------------- Map -------------------------------------------- 
(= (square $x) (* $x $x))

(= (map Nil $f $res) (reverse $res Nil))
(= (map (Cons $x $xs) $f $res)
    (let $r ($f $x) (map $xs $f (Cons $r $res)))
)

!(map (Cons 1 (Cons 2 (Cons 3 (Cons -10 Nil)))) square Nil) 


; --------------------- Filter -------------------------------------------- 
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

!(filter (Cons 12 (Cons 20 (Cons 3 (Cons -10 Nil)))) gr-than-ten Nil) 


; --------------------- Fold Left --------------------------------------------
(= (add $x $y) (+ $x $y))
(= (mul $x $y) (* $x $y))

(= (foldl Nil $f $res) $res)
(= (foldl (Cons $x $xs) $f $res) 
    (foldl $xs $f ($f $x $res))
)
 
!(foldl (Cons 12 (Cons -11 (Cons 5 Nil))) add 0) ; [6]
!(foldl (Cons 12 (Cons -11 (Cons 5 Nil))) mul 1) ; [-660]


;--------------------- Insertion Sort ---------------------------------------
(= (sort Nil $sorted) $sorted)
(= (sort (Cons $x $xs) $sorted)
    (insert $x (sort $xs $sorted))
)

(= (insert $x Nil) (Cons $x Nil))
(= (insert $x (Cons $y $ys))
    (
        if (< $x $y)
            (Cons $x (Cons $y $ys))
            (Cons $y (insert $x $ys))
    )
)

!(sort (Cons 3 (Cons 6 (Cons 5 (Cons -5 Nil)))) Nil) 