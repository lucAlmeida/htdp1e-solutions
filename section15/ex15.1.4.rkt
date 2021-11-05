;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.1.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct parent (children name date eyes))

;; A parent is a structure:
;; (make-parent loc n d e)
;; where loc is a list of children, n and e are symbols, and d is a number.

;; A list-of-children is either:
;; 1. empty or
;; 2. (cons p loc) where p is a parent and loc is a list of children.

;; Youngest Generation:
(define Gustav (make-parent empty 'Gustav 1988 'brown))

(define Fred&Eva (list Gustav))

;; Middle Generation:
(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))

;; Oldest Generation:
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

;; eye-colors : parent -> list-of-symbol
;; produce a list of eye colors in the tree
(check-expect (eye-colors Gustav) (list 'brown))
(check-expect (eye-colors Adam) (list 'yellow))
(check-expect (eye-colors Dave) (list 'black))
(check-expect (eye-colors Eva) (list 'blue 'brown))
(check-expect (eye-colors Fred) (list 'pink 'brown))
(check-expect (eye-colors Carl) (list 'green 'yellow 'black 'blue 'brown))
(check-expect (eye-colors Bettina) (list 'green 'yellow 'black 'blue 'brown))

(define (eye-colors a-parent)
  (cons (parent-eyes a-parent)
        (colors-loc (parent-children a-parent))))

(define (colors-loc loc)
  (cond ((empty? loc) empty)
        (else (append (eye-colors (first loc))
                      (colors-loc (rest loc))))))