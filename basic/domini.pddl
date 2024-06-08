(define (domain domini)
	(:requirements :adl :typing)
	(:types exercici)

	(:functions
        (nivell ?E - exercici) ;; El nivell de l'exercici E
		(objectiu ?E - exercici) ;; L'objectiu de l'exercici E
    )

	(:predicates
		(preparador ?X - exercici ?Y - exercici) ;; X és preparador de Y
		(fet ?E - exercici) ;; E s'ha fet al nivell N
	)

	(:action fer
		:parameters (?E - exercici)
		:precondition (or
			(not (exists (?P - exercici) (preparador ?P ?E)))
			(exists (?P - exercici) (and 
				(preparador ?P ?E)
				(fet ?P))
			)
		)
		:effect (and
		(fet ?E)
		(increase (nivell ?E) 1)
		)
	)
)
