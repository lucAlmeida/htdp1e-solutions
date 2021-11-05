;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; convert-euro : list-of-number -> list-of-number
;; converts a list of US dollars into a list of euro amounts
(check-expect (convert-euro '(1 10)) '(1.22 12.2))

(define (convert-euro lon)
  (cond [(empty? lon) empty]
        [else (cons (dollar->euro (first lon) 1.22) (convert-euro (rest lon)))]))

;; convert-euro-1 : list-of-number number -> list-of-number
;; converts a list of US dollars into a list of euro amounts given exchange rate
(check-expect (convert-euro-1 '(1 10) 2) '(2 20))

(define (convert-euro-1 lon rate)
  (cond [(empty? lon) empty]
        [else (cons (dollar->euro (first lon) rate) (convert-euro-1 (rest lon) rate))]))

;; dollar->euro : number -> number
;; converts a US dollar into a euro amount assuming given exchange rate
(check-expect (dollar->euro 1 1.22) 1.22)
(check-expect (dollar->euro 10 1.22) 12.2)

(define (dollar->euro dollar rate)
  (* rate dollar))