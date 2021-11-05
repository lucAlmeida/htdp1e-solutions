;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; replace : symbol symbol WP -> WP
;; produce structurally identical given WP, but occurences of old are replaced by new
(check-expect (replace 'AND 'and WP1)
  '(The TeachScheme! Project aims to improve the
    problem-solving AND organization skills of high
    school students. It provides software AND lecture
    notes as well as exercises AND solutions for teachers.))
(check-expect (replace 'FOR 'for WP2)
  '(The TeachScheme Web Page
    Here you can find:
    (LectureNotes FOR Teachers)
    (Guidance FOR (DrScheme: a Scheme programming environment))
    (Exercise Sets)
    (Solutions FOR Exercises)
    For further information: write to scheme@cs))

(define (replace new old a-wp)
  (cond ((empty? a-wp) empty)
        ((and (symbol? (first a-wp))
              (symbol=? (first a-wp) old))
         (cons new (replace new old (rest a-wp))))
        ((symbol? (first a-wp))
         (cons (first a-wp) (replace new old (rest a-wp))))
        (else (cons (replace new old (first a-wp))
                    (replace new old (rest a-wp))))))
