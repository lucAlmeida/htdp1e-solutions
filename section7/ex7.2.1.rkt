;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex7.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Data Definition:
(define-struct spider (remaining-legs transport-space))
(define-struct elephant (transport-space))
(define-struct monkey (intelligence transport-space))

;; A ZooAnimal is one of:
;; 1. a structure: (make-spider l s)
;;    where l and s are numbers
;; 2. a structure: (make-elephant s)
;;    where s is a number
;; 3. a structure: (make-monkey i s)
;;    where i and s are numbers

;; Contract, Purpose, Header:
;; fits? : ZooAnimal number -> boolean
;; to determine whether the zoo animal fits the cage

;; Example: see tests

;; Template:
#;
(define (f a-zoo-animal)
  (cond [(spider? a-zoo-animal) ...]
        [(elephant? a-zoo-animal) ...]
        [(monkey? a-zoo-animal) ...]))

;; Definition:
(define (fits? a-zoo-animal cage-volume)
  (cond [(spider? a-zoo-animal) (<= (spider-transport-space a-zoo-animal) cage-volume)]
        [(elephant? a-zoo-animal) (<= (elephant-transport-space a-zoo-animal) cage-volume)]
        [(monkey? a-zoo-animal) (<= (monkey-transport-space a-zoo-animal) cage-volume)]))

(check-expect (fits? (make-spider 8 5) 7) true)
(check-expect (fits? (make-spider 8 5) 4) false)