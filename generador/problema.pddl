(define (problem problema1)
    (:domain domini)
    (:objects
        e1 - exercici
        e2 - exercici
        e3 - exercici
        e4 - exercici
        e5 - exercici
        d1 - dia
        d2 - dia
        d3 - dia
        d4 - dia
        d5 - dia
        d6 - dia
        d7 - dia
        d8 - dia
        d9 - dia
        d10 - dia
        d11 - dia
        d12 - dia
        d13 - dia
        d14 - dia
        d15 - dia
        n1 - nivell
        n2 - nivell
        n3 - nivell
        n4 - nivell
        n5 - nivell
        n6 - nivell
        n7 - nivell
        n8 - nivell
        n9 - nivell
        n10 - nivell
    )
    (:init
        (= (ordre-dia d1) 1)
        (= (exercicis-dia d1) 0)
        (= (ordre-dia d2) 2)
        (= (exercicis-dia d2) 0)
        (= (ordre-dia d3) 3)
        (= (exercicis-dia d3) 0)
        (= (ordre-dia d4) 4)
        (= (exercicis-dia d4) 0)
        (= (ordre-dia d5) 5)
        (= (exercicis-dia d5) 0)
        (= (ordre-dia d6) 6)
        (= (exercicis-dia d6) 0)
        (= (ordre-dia d7) 7)
        (= (exercicis-dia d7) 0)
        (= (ordre-dia d8) 8)
        (= (exercicis-dia d8) 0)
        (= (ordre-dia d9) 9)
        (= (exercicis-dia d9) 0)
        (= (ordre-dia d10) 10)
        (= (exercicis-dia d10) 0)
        (= (ordre-dia d11) 11)
        (= (exercicis-dia d11) 0)
        (= (ordre-dia d12) 12)
        (= (exercicis-dia d12) 0)
        (= (ordre-dia d13) 13)
        (= (exercicis-dia d13) 0)
        (= (ordre-dia d14) 14)
        (= (exercicis-dia d14) 0)
        (= (ordre-dia d15) 15)
        (= (exercicis-dia d15) 0)
        (= (ordre-nivell n1) 1)
        (= (ordre-nivell n2) 2)
        (= (ordre-nivell n3) 3)
        (= (ordre-nivell n4) 4)
        (= (ordre-nivell n5) 5)
        (= (ordre-nivell n6) 6)
        (= (ordre-nivell n7) 7)
        (= (ordre-nivell n8) 8)
        (= (ordre-nivell n9) 9)
        (= (ordre-nivell n10) 10)
        (= (nivell-actual e1) 1)
        (= (nivell-actual e2) 1)
        (= (nivell-actual e3) 1)
        (= (nivell-actual e4) 1)
        (= (nivell-actual e5) 1)
        (= (objectiu e1) 4)
        (= (objectiu e2) 1)
        (= (objectiu e3) 1)
        (= (objectiu e4) 9)
        (= (objectiu e5) 7)
        (preparador e3 e2)
        (preparador e4 e5)
        (predecesor e2 e1)
        (predecesor e3 e1)
        (predecesor e4 e2)
        (= (dia-actual) 1)
    )
    (:goal
        (forall (?E - exercici)
            (>= (nivell-actual ?E) (objectiu ?E))
        )
    )
)
