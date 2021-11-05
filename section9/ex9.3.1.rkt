;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.3.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; contains-doll? : list-of-symbols -> boolean
;; to determine whether the symbol 'doll occurs on a-list-of-symbols
(define (contains-doll? a-list-of-symbols)
  (cond [(empty? a-list-of-symbols) false]
        [else (cond
                [(symbol=? (first a-list-of-symbols) 'doll) true]
                [else (contains-doll? (rest a-list-of-symbols))])]))
