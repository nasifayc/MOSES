(car-atom ((A B) 20 30 True)) ; [(A B)]
(cdr-atom ((A B) 20 30 True)) ; [(20 30 True)]

(cons-atom A (B C D)) ; [(A B C D)]

!(let* (
        ($x (car-atom (1 2 3 4)))
        ($y (cdr-atom (1 2 3 4)))
    )
    (cons-atom $x $y)
) ; [(1 2 3 4)]