(define (domain domini) ;; Falta: Que els exercicis preparadors no puguin tindre preparadors. Que cada exercici tingui com a molt un preparador. Que es pugui fer un exercici amb el mateix nivell que amb l'últim dia (ara sempre augmenta el nivell respecte l'últim dia) (Lo seu seria que 'fer' tingués 'nivell' com a paràmetre).
    (:requirements :adl :typing)
    (:types exercici dia)

    (:functions
        (nivell ?E - exercici) ;; El nivell de l'exercici E
        (objectiu ?E - exercici) ;; L'objectiu de l'exercici E
        (ultim-dia ?E - exercici) ;; L'últim dia que l'exercici E es va fer
        (dia-actual) ;; El dia actual
    )

    (:predicates
        (preparador ?X - exercici ?Y - exercici) ;; X és preparador de Y
        (fet ?E) ;; E s'ha fet avui
    )

    (:action fer
        :parameters (?E - exercici)
        :precondition(and
            (or
                (not (exists (?P - exercici) (preparador ?P ?E)))
			(exists (?P - exercici) (and 
                    (preparador ?P ?E)
                    (fet ?P)
                ))
			)
            (> (dia-actual) (ultim-dia ?E)) ;; Un exercici només es pot fer un cop al dia
		)
        :effect (and
			(fet ?E)
			(increase (nivell ?E) 1)
			(assign (ultim-dia ?E) (dia-actual))
        )
    )

    (:action passar-dia
        :parameters ()
        :effect (and
			(increase (dia-actual) 1)
			(forall (?E - exercici)
				(not (fet ?E))
			)
		)
    )
)