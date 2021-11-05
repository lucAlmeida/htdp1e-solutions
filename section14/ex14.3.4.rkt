;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.3.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A Web-page (short: WP) is either
;; 1. empty;
;; 2. (cons s wp)
;;    where s is a symbol and wp is a Web page; or
;; 3. (cons ewp wp)
;;    where both ewp and wp are Web pages.

(define WP1
  '(The TeachScheme! Project aims to improve the
    problem-solving and organization skills of high
    school students. It provides software and lecture
    notes as well as exercises and solutions for teachers.))
(define WP2
  '(The TeachScheme Web Page
    Here you can find:
    (LectureNotes for Teachers)
    (Guidance for (DrScheme: a Scheme programming environment))
    (Exercise Sets)
    (Solutions for Exercises)
    For further information: write to scheme@cs))

;; depth : WP -> number
;; consumes a WP and returns its depth
(check-expect (depth WP1) 0)
(check-expect (depth WP2) 2)

(define (calc-depth a-wp)
  (cond ((empty? a-wp) (cons 0 empty))
        ((symbol? (first a-wp)) (cons 0 (calc-depth (rest a-wp))))
        (else (cons (+ 1 (apply max (calc-depth (first a-wp)))) (calc-depth (rest a-wp))))))

(define (depth a-wp)
  (apply max (calc-depth a-wp)))
