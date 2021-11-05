;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.1.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A family-tree-node (short: ftn) is either
;; 1. empty; or
;; 2. (make-child f m na da ec)
;;    where f and m are ftns, na
;;    and ec are symbols, and da is a number
(define-struct child (father mother name date eyes))

;; fun-for-ftn : ftn -> ???
#;
(define (fun-for-ftn a-ftree)
  (cond
    [(empty? a-ftree) ...]
    [else
     ... (fun-for-ftn (child-father a-ftree)) ...
     ... (fun-for-ftn (child-mother a-ftree)) ...
     ... (child-name a-ftree) ...
     ... (child-date a-ftree) ...
     ... (child-eyes a-ftree) ...]))

;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))

;; Middle Generation:
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

;; Youngest Generation
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

;; blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree contains a child
;; structure with 'blue in the eyes field
(check-expect (blue-eyed-ancestor? Carl) false)
(check-expect (blue-eyed-ancestor? Gustav) true)
#;
(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (cond
            [(symbol=? (child-eyes a-ftree) 'blue) true]
            [(blue-eyed-ancestor? (child-father a-ftree)) true]
            [(blue-eyed-ancestor? (child-mother a-ftree)) true]
            [else false])]))

(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (symbol=? (child-eyes a-ftree) 'blue)
              (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))

;; count-persons : ftn -> number
;; count how many persons are in the given family tree
(check-expect (count-persons Carl) 1)
(check-expect (count-persons Bettina) 1)
(check-expect (count-persons Adam) 3)
(check-expect (count-persons Dave) 3)
(check-expect (count-persons Eva) 3)
(check-expect (count-persons Fred) 1)
(check-expect (count-persons Gustav) 5)
(define (count-persons a-ftree)
  (cond
    [(empty? a-ftree) 0]
    [else (+ 1
             (count-persons (child-father a-ftree))
             (count-persons (child-mother a-ftree)))]))

;; sum-age : ftn number -> number
;; computes the sum of students' ages for the given tree
(check-expect (sum-age Gustav 2020) 329)

(define (sum-age a-ftree curr-year)
  (cond
    [(empty? a-ftree) 0]
    [else (+ (- curr-year (child-date a-ftree))
             (sum-age (child-father a-ftree) 2020)
             (sum-age (child-mother a-ftree) 2020))]))

;; average-age : ftn number -> number
;; computes the average age for members of the given tree
(check-within (average-age Gustav 2020) 65.8 0.01)

(define (average-age a-ftree curr-year)
  (cond
    [(empty? a-ftree) 0]
    [else (/ (sum-age a-ftree curr-year)
             (count-persons a-ftree))]))