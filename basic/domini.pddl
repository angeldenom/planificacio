(define (domain domini) ;; Falta: Que els exercicis preparadors no puguin tindre preparadors. Que cada exercici tingui com a molt un preparador. Que es pugui fer un exercici amb el mateix nivell que amb l'últim dia (ara sempre augmenta el nivell respecte l'últim dia) (Lo seu seria que 'fer' tingués 'nivell' com a paràmetre).
    (:requirements :adl :typing)
    (:types exercici dia nivell)

    (:functions
        (ordre-dia ?D - dia) ;; L'ordre del dia D
        (ordre-nivell ?N - nivell) ;; L'ordre del nivell N
        (nivell-actual ?E - exercici) ;; El nivell de l'exercici E
        (objectiu ?E - exercici) ;; L'objectiu de l'exercici E
        (dia-actual) ;; El dia actual
    )

    (:predicates
        (preparador ?X - exercici ?Y - exercici) ;; X és preparador de Y
        (fet ?E - exercici ?D - dia) ;; E s'ha fet el dia D
    )

    (:action fer
        :parameters (?D - dia ?E - exercici ?N - nivell)
        :precondition(and
            (or
                (not (exists (?P - exercici) (preparador ?P ?E)))
			(exists (?P - exercici) (and 
                    (preparador ?P ?E)
                    (fet ?P ?D)
                ))
			)
            (not (fet ?E ?D)) ;; Un exercici només es pot fer un cop al dia
            (= (ordre-dia ?D) (dia-actual)) ;; No es pot fer un exercici abans del dia actual
            (or 
                (= (ordre-nivell ?N) (nivell-actual ?E))
                (= (ordre-nivell ?N) (+ (nivell-actual ?E) 1))
            ) ;; Un exercici es pot fer amb el mateix nivell o amb el nivell incrementat en 1
		)
        :effect (and
			(fet ?E ?D)
			(assign (nivell-actual ?E) (ordre-nivell ?N))
        )
    )

    (:action seguent-dia
        :parameters ()
        :effect (increase (dia-actual) 1)
    )
)