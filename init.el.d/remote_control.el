
; lirc {{{

(defun tv-volume-up ()
  (interactive)
  (shell-command "irsend --device /var/run/lirc/lircd send_start westinghouse key_volumeup; sleep 2.5; irsend --device /var/run/lirc/lircd send_stop westinghouse key_volumeup")
)

(defun tv-volume-down ()
  (interactive)
  (shell-command "irsend --device /var/run/lirc/lircd send_start westinghouse key_volumedown; sleep 3; irsend --device /var/run/lirc/lircd send_stop westinghouse key_volumedown")
)

(defun tv-on-off ()
  (interactive)
  (shell-command "irsend --device /var/run/lirc/lircd send_once westinghouse KEY_POWER")
)

; }}}

