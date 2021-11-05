;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex12.4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A word is either
;; 1. empty, or
;; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word

;; A list-of-words is either
;; 1. empty, or
;; 2. (cons w low), where w is a word and low is a list-of-words
