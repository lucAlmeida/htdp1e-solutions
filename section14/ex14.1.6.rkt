;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.1.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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
(check-expect (blue-eyed-ancestor? Eva) true)
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

;; proper-blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree has a blue-eyed ancestor
(check-expect (proper-blue-eyed-ancestor? Eva) false)

(define (proper-blue-eyed-ancestor? a-ftree)
  (or (blue-eyed-ancestor? (child-father a-ftree))
      (blue-eyed-ancestor? (child-mother a-ftree))))