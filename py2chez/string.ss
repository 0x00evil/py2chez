(library (py2chez string)
  (export string-startswith? string-endswith?)
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
            #f))))))

