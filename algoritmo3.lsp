(defun repeat (n list) (if (member (nth n list) (subseq list 0 n)) T NIL)     )
(setf midi '( 74 70 68 75 57 60 61 50 54 53 64 61 79 72 69 68 70 63 ))
(defun finder (m s i) (dotimes ( x (length m) -1)()(if (eq i (- (nth x m) (nth s m)))(if (> x s) (return (subseq m s (+ x 1))) ))))
(defun generator1 (m i list) (dotimes (y (- (length m) 1) (remove -1 (reverse list))) (setf list (cons (finder m y i) list)  ))) 
(defun intervals (m list) (dotimes (z (- (length m) 1) (reverse list)) (setf list (cons (- (nth (+ z 1) m ) (nth z m)     ) list)  ))) 
(defun sequence1 (m list) (dolist (w (intervals m '()) (reverse list))(setf list (cons (generator1 m w '()) list)     )       )) 
(defun sequencia (m) (sequence1 m '()) )
(defun correct1 (m l k) (remove (subseq m k (+ k 2)) (nth k l ) :test #'equal   ) )
(defun correct2 (m l u) (dotimes (x (- (length m) 1) (reverse u) )(setf u (cons (correct1 m l x ) u   ))))
(defun show1 (m) (correct2 m (sequencia m) '() ))
(defun show2 (m int list) (dotimes (x (length int) (reverse list)) (if (repeat x int)(setf list (cons '(ornamento) list))(setf list (cons (nth x (show1 m)) list)))))
(defun show (m) (show2 m (intervals m '()) '()))     
(defun trans1 (singlelist value) (dotimes (x (length singlelist) b)(setf b (mapcar #'(lambda (x) (+ x (- value (nth 0 singlelist)))) singlelist   ))                       ))
(defun trans2 (list value out) (dolist (w list (reverse out))(setf out (cons (trans1 w value) out)               )    ))
(defun trans3 (result mi out) (dotimes (w (- (length mi) 1) (reverse out))(setf out (cons  (trans2 (nth w result) (nth w mi) '() )  out)   ) ))  
(defun transposition (m) (trans3 (show1 m) m '()))

