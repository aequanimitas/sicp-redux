(define (peso-coin-denomination denom-key)
  (cond ((= denom-key 1) 1)
        ((= denom-key 2) 5)
        ((= denom-key 3) 10)
        ((= denom-key 4) 25)))

(peso-coin-denomination 3)
