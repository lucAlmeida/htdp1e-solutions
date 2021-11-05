;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct ir (name price))
;; An inventory-record is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number

;; An inventory is either:
;; 1. empty or
;; 2. (cons ir inv)
;;    where ir is an inventory record and inv is an inventory

;; recall : symbol inventory -> inventory
;; produces inventory with all toys except the chosen one
(check-expect (recall 'Barbie (cons (make-ir 'dagger .95)
                                    (cons (make-ir 'Barbie 17.95)
                                          (cons (make-ir 'key-chain .55)
                                                (cons (make-ir 'robot 22.05)
                                                      empty)))))
              (cons (make-ir 'dagger .95)
                    (cons (make-ir 'key-chain .55)
                          (cons (make-ir 'robot 22.05)
                                empty))))
              
(define (recall ty lon)
  (cond [(empty? lon) empty]
        [(symbol=? (ir-name (first lon)) ty) (recall ty (rest lon))]
        [else (cons (first lon) (recall ty (rest lon)))]))