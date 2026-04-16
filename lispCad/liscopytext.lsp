(defun c:TXTCsv ( / ss i ent obj str file path)
  (vl-load-com)

  ;; chọn đối tượng TEXT + MTEXT
  (setq ss (ssget '((0 . "TEXT,MTEXT"))))

  (if ss
    (progn
      ;; chọn nơi lưu file
      (setq path (getfiled "Chọn file CSV để lưu" "text.csv" "csv" 1))
      
      (setq file (open path "w"))

      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (setq obj (vlax-ename->vla-object ent))
        
        ;; lấy nội dung text
        (setq str (vla-get-TextString obj))
        
        ;; ghi ra CSV
        (write-line str file)
        
        (setq i (1+ i))
      )

      (close file)
      (princ "\nĐã xuất CSV thành công!")
    )
    (princ "\nKhông chọn đối tượng nào!")
  )
  (princ)
)
