;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct ir (name price))
;; An inventory-record is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number

;; An inventory is either:
;; 1. empty or
;; 2. (cons ir inv)
;;    where ir is an inventory record and inv is an inventory

;; contains-doll? : inventory -> boolean
;; to determine whether an-inv contains a record for 'doll
(check-expect (contains-doll? (cons (make-ir 'robot 22.05)
                                    (cons (make-ir 'doll 17.95)
                                          empty))) true)
(check-expect (contains-doll? (cons (make-ir 'robot 22.05) empty)) false)

(define (contains-doll? an-inv)
  (cond [(empty? an-inv) false]
        [(symbol=? (ir-name (first an-inv)) 'doll) true]
        [else (contains-doll? (rest an-inv))]))

;; contains? : symbol inventory -> boolean
;; to determine whether inventory contains a record for asymbol
(check-expect (contains? 'robot (cons (make-ir 'robot 22.05)
                                    (cons (make-ir 'doll 17.95)
                                          empty))) true)
(check-expect (contains? 'robot (cons (make-ir 'doll 17.95) empty)) false)

(define (contains? asymbol an-inv)
  (cond [(empty? an-inv) false]
        [(symbol=? (ir-name (first an-inv)) asymbol) true]
        [else (contains? asymbol (rest an-inv))]))
