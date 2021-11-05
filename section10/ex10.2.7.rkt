;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; raise-prices : inventory -> inventory
;; to create an inventory from an-inv
;; with the prices raised by 5%
(check-expect (raise-prices (cons (make-ir 'car 10.00)
                                  (cons (make-ir 'doll 2.00)
                                        empty)))
              (cons (make-ir 'car 10.50)
                    (cons (make-ir 'doll 2.10)
                          empty)))

(define (raise-prices an-inv)
  (cond [(empty? an-inv) empty]
        [else (cons (make-ir (ir-name (first an-inv))
                             (* (ir-price (first an-inv)) 1.05))
                    (raise-prices (rest an-inv)))]))