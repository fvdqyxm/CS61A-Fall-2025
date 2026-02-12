(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 13
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 13
    (if (null? s)
      '()
      (cons (list 0 (car s))
            (map (lambda (i) (list (+ 1 (car i)) (cadr i))))
            (else enumerate (cdr s))
      )
    ) 
  ; END PROBLEM 13
  )


;; Problem 14

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 14
  (if (null? dict)
    #f
    
    (if (equal? (caar dict) key)
      (cadar dict)
      (get (cdr dict) key))
    ) 
     )
;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 14
  (if (null? dict)
    (list (list key val))
    (if (equal? (caar dict) key)
        (cons (list key val) (cdr dict))
    (cons (car dict) (set (cdr dict) key val))))
  ; END PROBLEM 14
  )

;; Problem 15

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 15
  (if (equal? problem '_____)
    solution
    (if (pair? problem)
      (map (lambda (i) (solution-code i solution)) problem)
      ; problem
        problem
    )
  ; END PROBLEM 15
  )
  )
