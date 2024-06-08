(define (problem problema1)
    (:domain domini)
    (:objects
        e1 - exercici
        e2 - exercici
        e3 - exercici
    )
    (:init
        (= (nivell e1) 1)
        (= (nivell e2) 1)
        (= (nivell e3) 1)
        (= (objectiu e1) 5)
        (= (objectiu e2) 3)
        (= (objectiu e3) 0)
        (= (ultim-dia e1) 0)
        (= (ultim-dia e2) 0)
        (= (ultim-dia e3) 0)
        (= (dia-actual) 1)
        (preparador e3 e1)
    )
    (:goal
        (forall (?E - exercici)
            (>= (nivell ?E) (objectiu ?E))
        )
    )
)