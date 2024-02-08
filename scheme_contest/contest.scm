;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (repeat n f)
  (if (zero? n)
    nil
    (begin (f) (repeat (- n 1) f))
  )
)

(define (work n front left right)
  (if (> n 0)
    (begin
      (right)
      (work (- n 1) front right left)
      (left) (front)
      (work (- n 1) front left right)
      (right) (front) (left)
      (work (- n 1) front left right)
      (right) (right) (front) (right)
      (work (- n 1) front right left)
      (right)
    )
    nil
  )
)

(define (draw)
  (bgcolor "black")
  (color "white")
  (work 6
    (lambda () (fd 10))
    (lambda () (lt 90))
    (lambda () (rt 90))
  )
  (exitonclick)
)

; Please leave this last line alone. You may add additional procedures above
; this line.
(draw)