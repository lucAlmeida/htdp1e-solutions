;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; A Web-page (short: WP) is either
;; 1. empty;
;; 2. (cons s wp)
;;    where s is a symbol and wp is a Web page; or
;; 3. (cons ewp wp)
;;    where both ewp and wp are Web pages.

(define WP1
  '(The TeachScheme! Project aims to improve the
    problem-solving and organization skills of high
    school students. It provides software and lecture
    notes as well as exercises and solutions for teachers.))
(define WP2
  '(The TeachScheme Web Page
    Here you can find:
    (LectureNotes for Teachers)
    (Guidance for (DrScheme: a Scheme programming environment))
    (Exercise Sets)
    (Solutions for Exercises)
    For further information: write to scheme@cs))

;; size : WP -> number
;; to count the number of symbols that occur in a-wp
(check-expect (size empty) 0)
(check-expect (size (cons 'One empty)) 1)
(check-expect (size (cons (cons 'One empty) empty)) 1)

(define (size a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (+ 1 (size (rest a-wp)))]
    [else (+ (size (first a-wp)) (size (rest a-wp)))]))
