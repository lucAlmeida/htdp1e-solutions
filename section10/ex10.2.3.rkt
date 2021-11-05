;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct ir (name price))
;; An inventory-record is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number

;; An inventory is either:
;; 1. empty or
;; 2. (cons ir inv)
;;    where ir is an inventory record and inv is an inventory

;; price-of : symbol inventory -> number
;; returns the price of the given toy in the inventory
(check-expect (price-of 'doll (cons (make-ir 'robot 22.05)
                                    (cons (make-ir 'doll 17.95)
                                          empty))) 17.95)
(check-expect (price-of 'robot (cons (make-ir 'robot 22.05)
                                     (cons (make-ir 'doll 17.95)
                                           empty))) 22.05)
(check-expect (price-of 'car (cons (make-ir 'robot 22.05)
                                   (cons (make-ir 'doll 17.95)
                                         empty))) 'not-found)

(define (price-of name inventory)
  (cond [(empty? inventory) 'not-found]
        [(symbol=? name (ir-name (first inventory))) (ir-price (first inventory))]
        [else (price-of name (rest inventory))]))