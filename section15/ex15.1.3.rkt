;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.1.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; count-descendants : parent -> number
;; produce the number of descendants, including the parent
(check-expect (count-descendants Gustav) 1)
(check-expect (count-descendants Adam) 1)
(check-expect (count-descendants Dave) 1)
(check-expect (count-descendants Eva) 2)
(check-expect (count-descendants Fred) 2)
(check-expect (count-descendants Carl) 5)
(check-expect (count-descendants Bettina) 5)

(define (count-descendants a-parent)
  (+ 1 (count-loc (parent-children a-parent))))

(define (count-loc loc)
  (cond ((empty? loc) 0)
        (else (+ (count-descendants (first loc)) (count-loc (rest loc))))))

;; count-proper-descendants : parent -> number
;; produce the number of proper descendants (not counting the parent)
(check-expect (count-proper-descendants Gustav) 0)
(check-expect (count-proper-descendants Adam) 0)
(check-expect (count-proper-descendants Dave) 0)
(check-expect (count-proper-descendants Eva) 1)
(check-expect (count-proper-descendants Fred) 1)
(check-expect (count-proper-descendants Carl) 4)
(check-expect (count-proper-descendants Bettina) 4)

(define (count-proper-descendants a-parent)
  (- (count-descendants a-parent) 1))