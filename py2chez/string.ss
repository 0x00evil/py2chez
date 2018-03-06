(library (py2chez string)
  (export string-startswith? string-endswith? string-contains?)
  (import (chezscheme))

  (define string-startswith?
    (lambda (str pattern)
      (let ([str-len (string-length str)]
            [pattern-len (string-length pattern)])
        (if (< str-len pattern-len)
          #f
          (if (string=? pattern (substring str 0 pattern-len))
            #t
            #f)))))

  (define string-endswith?
    (lambda (str pattern)
      (let ([str-len (string-length str)]
            [pattern-len (string-length pattern)])
        (if (< str-len pattern-len)
          #f
          (if (string=? pattern (substring str (- str-len pattern-len) str-len))
            #t
            #f)))))

  (define string-contains?
    (lambda (str pattern)
      (let ([str-len (string-length str)]
            [pattern-len (string-length pattern)])
        (let iter-str ([i 0])
            (if (<= i (- str-len pattern-len))
              (let iter-pattern ([j 0])
                (if (= j pattern-len)
                  #t
                  (let ([i-char (string-ref str (+ i j))]
                         [j-char (string-ref pattern j)])
                    (if (not (char=? i-char j-char))
                      (iter-str (+ i 1))
                      (iter-pattern (+ j 1))))))
               #f))))))

