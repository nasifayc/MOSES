(: NodeNum type)
(: LeafNum NodeNum)
(: BinNum (-> Number NodeNum NodeNum NodeNum))

(= (inOrder LeafNum) ())
(= (preOrder LeafNum) ())
(= (postOrder LeafNum) ())

(= (inOrder (BinNum $v $left $right))(
     let* (
        (() (inOrder $left))
        (() ( println! $v))
        (() ( inOrder $right))
     )
     ()
    )
)

!(trace! (This is Inorder traversal) 
    (inOrder (BinNum 10
        (BinNum 5 (BinNum 2 LeafNum LeafNum) LeafNum)
        (BinNum 15 LeafNum LeafNum))))



(= (preOrder (BinNum $v $left $right))(
     let* (
        (() ( println! $v))
        (() (preOrder $left))
        (() ( preOrder $right))
     )
     ()
    )
)
!(trace! (This is PreOrder traversal) 
    (preOrder (BinNum 10
        (BinNum 5 (BinNum 2 LeafNum LeafNum) LeafNum)
        (BinNum 15 LeafNum LeafNum))))



(= (postOrder (BinNum $v $left $right))(
     let* (
        (() (postOrder $left))
        (() ( postOrder $right))
        (() ( println! $v))
     )
     ()
    )
)
!(trace! (This is PostOrder traversal) 
    (postOrder (BinNum 10
        (BinNum 5 (BinNum 2 LeafNum LeafNum) LeafNum)
        (BinNum 15 LeafNum LeafNum))))
