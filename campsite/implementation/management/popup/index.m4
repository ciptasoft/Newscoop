B_HTML
INCLUDE_PHP_LIB(<*..*>)
B_DATABASE

CHECK_BASIC_ACCESS

B_HEAD
	X_EXPIRES
	X_TITLE(<*Quick Menu*>)
E_HEAD

<?php  if ($access) { ?>dnl
B_STYLE
E_STYLE

<FRAMESET ROWS="70, *" BORDER="0">
    <FRAME SRC="lang.php" NAME="flang" FRAMEBORDER="0" MARGINHEIGHT="0" NORESIZE SCROLLING="NO">
    <FRAME SRC="empty.php?bg=0" NAME="f1" FRAMEBORDER="0" MARGINHEIGHT="0" NORESIZE SCROLLING="NO">
</FRAMESET>

<?php  } ?>dnl

E_DATABASE
E_HTML
