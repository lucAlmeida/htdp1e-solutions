;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.3.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; occurs1 : WP Symbol -> number
;; produce number of times symbol occurs in Web page. (ignore nested WPs)
(check-expect (occurs1 WP1 'and) 3)
(check-expect (occurs1 WP1 'as) 2)
(check-expect (occurs1 WP2 'for) 0)
(check-expect (occurs1 WP2 'you) 1)

(define (occurs1 a-wp s)
  (cond ((empty? a-wp) 0)
        ((and (symbol? (first a-wp))
              (symbol=? (first a-wp) s))
         (+ 1 (occurs1 (rest a-wp) s)))
        (else (occurs1 (rest a-wp) s))))

;; occurs2 : WP Symbol -> number
;; produce number of times symbol occurs in Web page. (including nested WPs)
(check-expect (occurs2 WP1 'and) 3)
(check-expect (occurs2 WP1 'as) 2)
(check-expect (occurs2 WP2 'for) 3)
(check-expect (occurs2 WP2 'you) 1)

(define (occurs2 a-wp s)
  (cond ((empty? a-wp) 0)
        ((and (symbol? (first a-wp))
              (symbol=? (first a-wp) s))
         (+ 1 (occurs2 (rest a-wp) s)))
        ((symbol? (first a-wp)) (occurs2 (rest a-wp) s))
        (else (+ (occurs2 (first a-wp) s) (occurs2 (rest a-wp) s)))))