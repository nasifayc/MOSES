;---------------------- Map Method 1 ---------------------
(: map (-> (-> $t $t) Expression Expression))
(= (map $f $xs)
    (if (== $xs ()) ()
        (let* (($head (car-atom $xs))
                ($tail (cdr-atom $xs))
                ($new_head ($f $head))
                ($new_tail (map $f $tail))
            )  
            (cons-atom $new_head $new_tail)
        )
    )
)

(: square (-> $t $t))
(= (square $x) (* $x $x))

(: negate (-> Expression Expression))
(= (negate $x) (not $x))

(map  square (2 3 4 5 ))
(map  not (False False True True ))

;------------------------ Map Method 2 --------------------------
(: map_method_two (-> (-> $t $t) Expression Expression))
(= (map_method_two $f $xs)
    (collapse ($f (superpose $xs)))
)

(map_method_two  square (2 3 4 5))
(map_method_two negate  (False False True True ))

;----------------------------- Filter ------------------
(: filter (-> (-> $t $t) Expression Expression))
(= (filter $f $xs)
    (collapse ($f (superpose $xs)))
)

(: gr_ten (-> Number Number))
(= (gr_ten $xs) 
    (if (> $xs 10) $xs (empty))
)

(: true_only (-> Bool Bool))
(= (true_only $xs) 
    (if (== $xs True) $xs (empty))
)

!(filter gr_ten ( 1 23 4 -200 56 78))
!(filter true_only ( False False True True))


