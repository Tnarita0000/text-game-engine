(defparameter *nodes* '((living-room (you are in the living-room.
                                          a wizard is snoring loudly on the couch.))
                        (garden (you are in a beautiful garden.
                                     there is a well in front of you.))
                        (attic (you are in the attic.
                                    there is a giant welding torch in the corner.))))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))
; ex> (describe-location 'living-room *nodes*)

(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a , (caddr edge) going, (cadr edge) from here.))
; ex> (describe-path '(garden west door))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
; ex> (describe-paths 'living-room *edges*)