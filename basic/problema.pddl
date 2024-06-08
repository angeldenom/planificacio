(define (problem problema1)
    (:domain domini)
    (:objects
        e1 e2 e3 - exercici
    )
    (:init
        (preparador e1 e2)
        (preparador e2 e3)
        (fet e1)
    )
    (:goal
        (and
            (fet e1)
            (fet e2)
            (fet e3)
        )
    )
)
