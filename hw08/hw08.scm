(define (ascending? s) 
    (if (null? s)
        #t
        (begin
            (if (null? (cdr s))
                #t
                (if (<= (car s) (car (cdr s)))
                    (ascending? (cdr s))
                    #f
                )
            )
        )
    )
)

(define (my-filter pred s) 
    (if (null? s)
        ()
    ; (display (car s))
        (if (pred (car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
        )
    )
)

(define (interleave lst1 lst2) 
    (if (null? lst1)
        (begin
        (if (null? lst2)
            ()
            (interleave lst2 lst1)
        )
        )
        (cons (car lst1) (interleave lst2 (cdr lst1)))
    )



    
)

(define (no-repeats s) 
    (if (null? s)
        ()
        (begin
            (define elem (car s))
            ; (define x ())
            (define rest (no-repeats (cdr s)))
            
            (define filtered 
              (filter 
                (lambda (x) (not (equal? x elem))) rest))
            (cons elem filtered)
    
        )

    )
)
