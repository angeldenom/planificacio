(define (problem problema1)
    (:domain domini)
    (:objects
        e1 - exercici
        e2 - exercici
        e3 - exercici
    )
    (:init
        (preparador e1 e2)
        (preparador e2 e3)
        (= (nivell e1) 1)
        (= (nivell e2) 2)
        (= (nivell e3) 3)
        (fet e1)
        (= (objectiu e1) 1)
        (= (objectiu e2) 3)
        (= (objectiu e3) 5)
    )
    (:goal
        (forall (?E - exercici)
            (and
                (>= (nivell ?E) (objectiu ?E))
                (fet ?E)
            )
        )
    )
)