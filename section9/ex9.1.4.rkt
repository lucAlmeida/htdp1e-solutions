;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.1.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; contains-2-doll? : list-of-2-symbols -> boolean
;; produces whether one of the two given symbols is 'doll

(define (contains-2-doll? list-of-2-symbols)
  (or (symbol=? (first list-of-2-symbols) 'doll)
      (symbol=? (first (rest list-of-2-symbols)) 'doll)))