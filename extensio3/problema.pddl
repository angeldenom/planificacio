(define (problem problema1)
    (:domain domini)
    (:objects
        e1 e2 e3 e4 e5 e6 e7 e8 - exercici
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - dia
        n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - nivell
    )
    (:init
        (= (ordre-dia d1) 1)
        (= (ordre-dia d2) 2)
        (= (ordre-dia d3) 3)
        (= (ordre-dia d4) 4)
        (= (ordre-dia d5) 5)
        (= (ordre-dia d6) 6)
        (= (ordre-dia d7) 7)
        (= (ordre-dia d8) 8)
        (= (ordre-dia d9) 9)
        (= (ordre-dia d10) 10)
        (= (ordre-dia d11) 11)
        (= (ordre-dia d12) 12)
        (= (ordre-dia d13) 13)
        (= (ordre-dia d14) 14)
        (= (ordre-dia d15) 15)

        (= (exercicis-dia d1) 0)
        (= (exercicis-dia d2) 0)
        (= (exercicis-dia d3) 0)
        (= (exercicis-dia d4) 0)
        (= (exercicis-dia d5) 0)
        (= (exercicis-dia d6) 0)
        (= (exercicis-dia d7) 0)
        (= (exercicis-dia d8) 0)
        (= (exercicis-dia d9) 0)
        (= (exercicis-dia d10) 0)
        (= (exercicis-dia d11) 0)
        (= (exercicis-dia d12) 0)
        (= (exercicis-dia d13) 0)
        (= (exercicis-dia d14) 0)
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
        (= (nivell-actual e6) 1)
        (= (nivell-actual e7) 1)
        (= (nivell-actual e8) 1)

        (= (objectiu e1) 5)
        (= (objectiu e2) 3)
        (= (objectiu e3) 0)
        (= (objectiu e4) 0)
        (= (objectiu e5) 7)
        (= (objectiu e6) 8)
        (= (objectiu e7) 0)
        (= (objectiu e8) 0)

        (preparador e3 e1)
        (predecesor e4 e2)
        (preparador e7 e5)
        (predecesor e8 e6)


        (= (dia-actual) 1)
    )
    (:goal
        (forall (?E - exercici)
            (>= (nivell-actual ?E) (objectiu ?E))
        )
    )
)