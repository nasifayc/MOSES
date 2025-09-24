(: List type)
(: Leaf List)
(: Cons (-> Number List List List))

(= (inOrder Leaf) ())
(= (preOrder Leaf) ())
(= (postOrder Leaf) ())

(= (inOrder (Cons $x $left $right))(
     let* (
        (() (inOrder $left))
        (() ( println! $x))
        (() ( inOrder $right))
     )
     ()
    )
)

(trace! (This is Inorder traversal) 
    (inOrder (Cons 10
        (Cons 5 (Cons 2 Leaf Leaf) Leaf)
        (Cons 15 Leaf Leaf))))



(= (preOrder (Cons $v $left $right))(
     let* (
        (() ( println! $v))
        (() (preOrder $left))
        (() ( preOrder $right))
     )
     ()
    )
)
(trace! (This is PreOrder traversal) 
    (preOrder (Cons 10
        (Cons 5 (Cons 2 Leaf Leaf) Leaf)
        (Cons 15 Leaf Leaf))))



(= (postOrder (Cons $v $left $right))(
     let* (
        (() (postOrder $left))
        (() ( postOrder $right))
        (() ( println! $v))
     )
     ()
    )
)

(trace! (This is PostOrder traversal) 
    (postOrder (Cons 10
        (Cons 5 (Cons 2 Leaf Leaf) Leaf)
        (Cons 15 Leaf Leaf))))


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

; --------------- a helper function to get max-value -----------
(= (max-node (Cons $x $_ Leaf)) $x)
(= (max-node (Cons $x $_ $right))
    (if (== $right Leaf) (empty) (max-node $right))
)

! (max-node (Cons 10
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

; --------- if the target node have non-leaf children, it will replaced by the max value from left sub-tree
!(delete 10 (Cons 10
        (Cons 8 (Cons 7 Leaf Leaf) (Cons 9 Leaf Leaf))
        (Cons 12 (Cons 11 Leaf Leaf) (Cons 13 Leaf Leaf)))) 
