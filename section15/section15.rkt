;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; blue-eyed-descendant? : parent -> boolean
;; to determine whether a-parent or any of its descendants (children,
;; grandchildren, and so on) have 'blue in the eyes field
(check-expect (blue-eyed-descendant? Gustav) false)
(check-expect (blue-eyed-descendant? Eva) true)
(check-expect (blue-eyed-descendant? Bettina) true)

(define (blue-eyed-descendant? a-parent)
  (cond ((symbol=? (parent-eyes a-parent) 'blue) true)
        (else (blue-eyed-children? (parent-children a-parent)))))

;; blue-eyed-children? : list-of-children -> boolean
;; to determine whether any of the structures on aloc is blue-eyed
;; or has any blue-eyed descendant
(check-expect (blue-eyed-children? (list Gustav)) false)
(check-expect (blue-eyed-children? (list Adam Dave Eva)) true)

(define (blue-eyed-children? aloc)
  (cond ((empty? aloc) false)
        (else (or (blue-eyed-descendant? (first aloc))
                  (blue-eyed-children? (rest aloc))))))