;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.2.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A binary-tree (short: BT) is either:
;; 1. false; or
;; 2. (make-node soc pn lft rgt)
;;    where soc is a number, pn is a symbol, and lft and rgt are BTs.
(define-struct node (ssn name left right))

(define BT1 (make-node 15 'd false (make-node 24 'i false false)))
(define BT2 (make-node 15 'd (make-node 87 'h false false) false))

;; fun-for-bt : bt -> ???
#;
(define (fun-for-bt a-bt)
  (cond
    [(false? a-bt) ...]
    [else
     ... (node-ssn a-bt) ...
     ... (node-name a-bt) ...
     ... (fun-for-bt (node-left a-bt)) ...
     ... (fun-for-bt (node-right a-bt)) ...]))

;; inorder : bt -> list-of-number
;; produce a list of the ssn's in the given bt
(check-expect (inorder BT1) (list 15 24))
(check-expect (inorder BT2) (list 15 87))

(define (inorder a-bt)
  (cond [(false? a-bt) '()]
        [else (append (cons (node-ssn a-bt) empty)
                      (inorder (node-left a-bt))
                      (inorder (node-right a-bt)))]))