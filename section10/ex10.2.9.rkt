;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct ir (name price))
;; An inventory-record is a structure:
;; (make-ir s n)
;; where s is a symbol and n is a (positive) number

;; An inventory is either:
;; 1. empty or
;; 2. (cons ir inv)
;;    where ir is an inventory record and inv is an inventory

;; name-robot : inventory -> inventory
;; replaces all occurrences of 'robot with 'r2d2
(check-expect (name-robot (cons (make-ir 'dagger .95)
                                (cons (make-ir 'Barbie 17.95)
                                      (cons (make-ir 'key-chain .55)
                                            (cons (make-ir 'robot 22.05)
                                                  empty)))))
              (cons (make-ir 'dagger .95)
                    (cons (make-ir 'Barbie 17.95)
                          (cons (make-ir 'key-chain .55)
                                (cons (make-ir 'r2d2 22.05)
                                      empty)))))

(define (name-robot an-inv)
  (cond [(empty? an-inv) empty]
        [(symbol=? (ir-name (first an-inv)) 'robot)
         (cons (make-ir 'r2d2 (ir-price (first an-inv))) (name-robot (rest an-inv)))]
        [else
         (cons (first an-inv) (name-robot (rest an-inv)))]))

;; substitute : inventory -> inventory
;; replaces all occurrences of old with new
(check-expect (substitute 'doll 'Barbie (cons (make-ir 'dagger .95)
                                              (cons (make-ir 'Barbie 17.95)
                                                    (cons (make-ir 'key-chain .55)
                                                          (cons (make-ir 'robot 22.05)
                                                                empty)))))
              (cons (make-ir 'dagger .95)
                    (cons (make-ir 'doll 17.95)
                          (cons (make-ir 'key-chain .55)
                                (cons (make-ir 'robot 22.05)
                                      empty)))))

(define (substitute new old an-inv)
  (cond [(empty? an-inv) empty]
        [(symbol=? (ir-name (first an-inv)) old) (cons (make-ir new (ir-price (first an-inv)))
                                                       (substitute new old (rest an-inv)))]
        [else (cons (first an-inv) (substitute new old (rest an-inv)))]))
