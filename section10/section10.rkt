;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; hours->wages : list-of-numbers -> list-of-numbers
;; to create a list of weekly wages from a list of weekly hours (alon)
(define (hours->wages alon)
  (cond [(empty? alon) empty]
        [else (cons (wage (first alon)) (hours->wages (rest alon)))]))

;; wage : number -> number
;; to compute the total wage (at $12 per hour)
;; of someone who worked for h hours
(define (wage h)
  (* 12 h))

;; ===============================

(define-struct ir (name price))
;; An inventory-record is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number

;; An inventory is either:
;; 1. empty or
;; 2. (cons ir inv)
;;    where ir is an inventory record and inv is an inventory

;; sum : inventory -> number
;; to compute the sum of prices on an-inv

(define (sum an-inv)
  (cond
    [(empty? an-inv) 0]
    [else (+ (ir-price (first an-inv)) (sum (rest an-inv)))]))

;; ==================================

;; extract1 : inventory -> inventory
;; to create an inventory from an-inv for all
;; those items that cost less than $1
(check-expect (extract1 (cons (make-ir 'dagger .95)
                              (cons (make-ir 'Barbie 17.95)
                                    (cons (make-ir 'key-chain .55)
                                          (cons (make-ir 'robot 22.05)
                                                empty)))))
              (cons (make-ir 'dagger .95)
                    (cons (make-ir 'key-chain .55)
                          empty)))

(define (extract1 an-inv)
  (cond [(empty? an-inv) empty]
        [(<= (ir-price (first an-inv)) 1.00) (cons (first an-inv) (extract1 (rest an-inv)))]
        [else (extract1 (rest an-inv))]))
