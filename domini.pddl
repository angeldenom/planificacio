(define (domain domini)
	(:requirements :adl :typing)
	(:types exercici)

	(:predicates
		(preparador ?X - exercici ?Y - exercici) ;; X és preparador de Y
		(fet ?E - exercici)
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
		:effect (fet ?E)
	)
)
