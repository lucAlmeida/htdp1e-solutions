;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.2.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct phone (name num))
;; A phone is a structure:
;; (make-phone name n)
;; where name is a symbol and n is a number

;; A phone-directory is either:
;; 1. empty or
;; 2. (cons p p-dir)
;;    where p is a phone record and p-dir is an inventory

(define P-DIR (cons (make-phone 'John 1234)
                    (cons (make-phone 'Mary 4321) empty)))

;; whose-number : phone-directory phone -> symbol
;; determine the name that goes with a given phone
(check-expect (whose-number P-DIR 1234) 'John)
(check-expect (whose-number P-DIR 4321) 'Mary)

(define (whose-number directory number)
  (cond [(empty? directory) empty]
        [(= (phone-num (first directory)) number) (phone-name (first directory))]
        [else (whose-number (rest directory) number)]))

;; phone-number : phone -> number
;; determine the number that goes with a given phone
(check-expect (phone-number P-DIR 'John) 1234)
(check-expect (phone-number P-DIR 'Mary) 4321)

(define (phone-number directory name)
  (cond [(empty? directory) empty]
        [(symbol=? (phone-name (first directory)) name) (phone-num (first directory))]
        [else (phone-number (rest directory) name)]))