(define (ascending? s)
    (cond
        ((null? s) #t)
        ((null? (cdr s)) #t)
        (else (and (<= (car s) (car (cdr s))) (ascending? (cdr s))))
    )
)

(define (my-filter pred s)
    (if (null? s)
        nil
        (if (pred (car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
        )
    )
)

(define (interleave lst1 lst2)
    (cond
        ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (cons (car lst1) (interleave lst2 (cdr lst1))))
    )
)

(define (no-repeats s)
    (if (null? s)
        nil
        (begin
            (define lst (no-repeats (cdr s)))
            (if (null? (filter (lambda (x) (= x (car s))) lst))
                (cons (car s) lst)
                lst
            )
        )
    )
)
