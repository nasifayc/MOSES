(: List type)
(: Leaf List)
(: Cons (-> Number List List List))

(= (inOrder Leaf) ())
(= (preOrder Leaf) ())
(= (postOrder Leaf) ())

(= (inOrder (Cons $x $left $right))
    (let* (
        (() (inOrder $left))
        (() (println! $x))
        (() (inOrder $right))
    )
    ())
)


(= (insert $x Leaf) (Cons $x Leaf Leaf))
(= (insert $x (Cons $y $left $right))
    (
        if (< $x $y)
            (Cons $y (insert $x $left) $right)
            (
                if (> $x $y)
                 (Cons $y $right (insert $x $right))
                 (Cons $y $left $right)
            )
    )
)

!(insert 6 (Cons 10
        (Cons 8 (Cons 7 Leaf Leaf) (Cons 9 Leaf Leaf))
        (Cons 12 (Cons 11 Leaf Leaf) (Cons 13 Leaf Leaf))))


;------------------ This ignores duplicate item --------------------
 (insert 10 (Cons 10
       (Cons 8 (Cons 7 Leaf Leaf) (Cons 9 Leaf Leaf))
       (Cons 12 (Cons 11 Leaf Leaf) (Cons 13 Leaf Leaf))))



; --------------- a helper function to get max-value, given a tree -----------
(= (max-node (Cons $x $_ Leaf)) $x)
(= (max-node (Cons $x $_ $right))
    (if (== $right Leaf) (empty) (max-node $right))
)

(max-node (Cons 10
        (Cons 8 (Cons 7 Leaf Leaf) (Cons 9 Leaf Leaf))
        (Cons 12 (Cons 11 Leaf Leaf) (Cons 13 Leaf Leaf))))



(= (delete $x Leaf) Leaf)
(= (delete $x (Cons $y $left $right))
    (if (< $x $y)
        (Cons $y (delete $x $left) $right)
        (if (> $x $y) 
            (Cons $y $left (delete $x $right))
            (case ($left $right)
                (
                    ((Leaf, Leaf) Leaf)
                    (($_, Leaf) $left)
                    ((Leaf, $_) $right)
                    ($_ 
                        (let $max  (max-node $left) 
                            (Cons $max (delete $max $left) $right))
                    )
                )
            )
        )
    )
)

; --------- if the target node have to non-leaf children, it will replaced by the max value from left child
(delete 10 (Cons 10
        (Cons 8 (Cons 7 Leaf Leaf) (Cons 9 Leaf Leaf))
        (Cons 12 (Cons 11 Leaf Leaf) (Cons 13 Leaf Leaf)))) ;9 will become the root