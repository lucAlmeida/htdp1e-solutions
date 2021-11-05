;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex12.4.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A word is either
;; 1. empty, or
;; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word

;; A list-of-words is either
;; 1. (cons w empty), or
;; 2. (cons w low), where w is a word and low is a list-of-words

;; arrangements : word -> list-of-words
;; to create a list of all arrangements of the letters in a-word
(check-expect (arrangements empty) (cons empty empty))
(check-expect (arrangements (cons 'e (cons 'r empty)))
              (cons (cons 'e (cons 'r empty))
                    (cons (cons 'r (cons 'e empty))
                          empty)))

(define (arrangements a-word)
  (cond [(empty? a-word) (cons empty empty)]
        [else (insert-everywhere/in-all-words (first a-word)
                                              (arrangements (rest a-word)))]))

;; insert-everywhere/in-all-words : symbol list-of-words -> list-of-words
;; inserts the given symbol between letters and at beginning and end of each word
(check-expect (insert-everywhere/in-all-words 'd empty) '((d)))
(check-expect (insert-everywhere/in-all-words 'd '((e r) (r e)))
              '((d e r) (e d r) (e r d) (d r e) (r d e) (r e d)))

(define (insert-everywhere/in-all-words s alow)
  (cond [(empty? alow) (cons (cons s empty) empty)]
        [(empty? (rest alow)) (append (insert-everywhere s (first alow) empty) empty)]
        [else (append (insert-everywhere s (first alow) empty)
                      (insert-everywhere/in-all-words s (rest alow)))]))

;; insert-everywhere : symbol word -> list-of-words
;; inserts the given symbol between letters and at beginning and end of the word
(check-expect (insert-everywhere 'd empty empty) '((d)))
(check-expect (insert-everywhere 'd '(e r) empty) '((d e r) (e d r) (e r d)))
(check-expect (insert-everywhere 'd '(e r s) empty) '((d e r s) (e d r s) (e r d s) (e r s d)))

(define (insert-everywhere s w-to-process w-processed)
  (cond [(empty? w-to-process) (cons (append w-processed w-to-process (cons s empty)) empty)]
        [else (cons (append w-processed (cons s empty) w-to-process)
                    (insert-everywhere s (rest w-to-process) (append w-processed (cons (first w-to-process) empty))))]))