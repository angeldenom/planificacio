(define (domain domini)
    (:requirements :adl :typing)
    (:types exercici dia nivell)

    (:functions
        (ordre-dia ?D - dia) ;; L'ordre del dia D
        (ordre-nivell ?N - nivell) ;; L'ordre del nivell N
        (nivell-actual ?E - exercici) ;; El nivell de l'exercici E
        (objectiu ?E - exercici) ;; L'objectiu de l'exercici E
        (exercicis-dia ?D - dia) ;; Els exercicis fets el dia D
        (dia-actual) ;; El dia actual
    )

    (:predicates
        (fet ?E - exercici ?D - dia) ;; E s'ha fet el dia D
        (preparador ?X - exercici ?Y - exercici) ;; X és preparador de Y
        (predecesor ?X - exercici ?Y - exercici) ;; X és predecesor de Y
        (ultim ?D - dia ?E - exercici) ;; Últim exercici fet en aquell dia
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
			) ;; Condició preparador
            (or
                (not (exists (?P - exercici) (predecesor ?P ?E)))
                (exists (?P - exercici) (and
                    (predecesor ?P ?E)
                    (ultim ?D ?P)
                ))
            ) ;; Condició predecesor
            (not (fet ?E ?D)) ;; Un exercici només es pot fer un cop al dia
            (= (ordre-dia ?D) (dia-actual)) ;; No es pot fer un exercici abans del dia actual
            (or 
                (= (ordre-nivell ?N) (nivell-actual ?E))
                (= (ordre-nivell ?N) (+ (nivell-actual ?E) 1))
            ) ;; Un exercici es pot fer amb el mateix nivell o amb el nivell incrementat en 1
            (<= (exercicis-dia ?D) 6) ;; Com a molt 6 exercicis per dia
		)
        :effect (and
			(fet ?E ?D)
			(assign (nivell-actual ?E) (ordre-nivell ?N))
            (forall (?E_prev - exercici) 
                (when (ultim ?D ?E_prev) 
                    (not (ultim ?D ?E_prev))
                )
            ) ;; Eliminar ultim exercici
            (ultim ?D ?E) ;; Actualitzar ultim exercici
            (increase (exercicis-dia ?D) 1) ;; Augmentar el nombre d'exercicis fets en el dia
        )
    )

    (:action seguent-dia
        :parameters ()
        :effect (increase (dia-actual) 1)
    )
)