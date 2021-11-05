;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; extract>1 : inventory -> inventory
;; to create an inventory from an-inv for all
;; those items that cost more than $1
(check-expect (extract>1 (cons (make-ir 'dagger .95)
                              (cons (make-ir 'Barbie 17.95)
                                    (cons (make-ir 'key-chain .55)
                                          (cons (make-ir 'robot 22.05)
                                                empty)))))
              (cons (make-ir 'Barbie 17.95)
                    (cons (make-ir 'robot 22.05)
                          empty)))

(define (extract>1 an-inv)
  (cond [(empty? an-inv) empty]
        [(> (ir-price (first an-inv)) 1.00) (cons (first an-inv) (extract>1 (rest an-inv)))]
        [else (extract>1 (rest an-inv))]))