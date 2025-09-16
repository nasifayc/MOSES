(Male Chandler)
(Male John)
(Male Adam)
(Male Bob)
(Male Tim)
(Male Joey)
(Female Monica)
(Female Pam)
(Female Jane)
(Female Kim)
(Female Eve)


(Parent Chandler John)
(Parent Chandler Pam)
(Parent Chandler Adam)
(Parent Chandler Jane)
(Parent Monica John)
(Parent Monica Pam)
(Parent Monica Adam)
(Parent Monica Jane)
(Parent John Bob)
(Parent Pam Tim)
(Parent Pam Kim)
(Parent Adam Eve)
(Parent Jane Joey)


(= (get-parent $x)
    (match &self (Parent $y $x) $y))


(= (get-mother $x)
    (let $parent (get-parent $x)
    (match &self (Female $parent) $parent)
    )
)

(= (different $x $z) 
    (if (== $x $z) (empty) $z))

(= (get-sibilings $x) 
    (match &self (,
                (Parent $y $x)
                (Male $y)
                (Parent $y $z))
                (different $x $z)))

(= (get-uncle $x)
    (let $p_sibilings (get-sibilings (get-parent $x))
    (match &self (Male $p_sibilings) $p_sibilings)
    )
)

(= (get-nephew $x)
    (let $sibilings (get-sibilings $x)
    (match &self (,
                (Parent $sibilings $c)
                (Male $c))
                $c)))

(= (get-all-predecessors $x) (get-parent $x))
(= (get-all-predecessors $x) (get-all-predecessors (get-parent $x)))

; Get the Parents of John
!(get-parent John)

; Get the mother of Pam 
!(get-mother Pam)

; Get the sibilings of Pam
!(get-sibilings Pam) 

; Get the Uncle of Tim
!(get-uncle Tim)

; Get the nephew of John
!(get-nephew John)

; Get all predecessors of Bob
! (get-all-predecessors Bob)


