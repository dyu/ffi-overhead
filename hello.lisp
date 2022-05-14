#!/usr/bin/sbcl --script

(declaim (inline plusone))
(sb-alien:define-alien-routine plusone int (x int))
(sb-alien:define-alien-routine current_timestamp long-long)

(sb-alien:load-shared-object "newplus/libnewplus.so")

(defun run (count)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (let ((x 0)
        (start (current_timestamp)))
  (dotimes (i count)
    (setf x (plusone x)))
    (let ((end (current_timestamp)))
      (format t "~d~%" (- end start)))))


#+(or)
(run 500000000)


(let* ((args sb-ext:*posix-argv*)
       (count-arg (second args)))
  (unless count-arg
    (error "Argument is required"))
  (let ((count (parse-integer count-arg)))
    (if (and (plusp count)
               (<= count 2e9))
      (run count)
      (error "Count must be from 1 to 2G."))))
