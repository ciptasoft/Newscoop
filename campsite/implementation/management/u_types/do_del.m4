B_HTML
INCLUDE_PHP_LIB(<*..*>)
B_DATABASE

CHECK_BASIC_ACCESS
CHECK_ACCESS(<*ManageUserTypes*>)

B_HEAD
	X_EXPIRES
	X_TITLE(<*Deleting user type*>)
<?php  if ($access == 0) { ?>dnl
	X_AD(<*You do not have the right to delete user types.*>)
<?php  } ?>dnl
E_HEAD

<?php  if ($access) { ?>dnl
B_STYLE
E_STYLE

B_BODY

B_HEADER(<*Deleting user type*>)
B_HEADER_BUTTONS
X_HBUTTON(<*User Types*>, <*u_types/*>)
X_HBUTTON(<*Home*>, <*home.php*>)
X_HBUTTON(<*Logout*>, <*logout.php*>)
E_HEADER_BUTTONS
E_HEADER

<P>
<?php  query ("DELETE FROM UserTypes WHERE Name='$UType'"); ?>dnl
B_MSGBOX(<*Deleting user type*>)
<?php  if ($AFFECTED_ROWS > 0) { ?>
	X_MSGBOX_TEXT(<*<LI><?php  putGS('The user type has been deleted.'); ?></LI>*>)
X_AUDIT(<*122*>, <*getGS('User type $1 deleted',encHTML($UType))*>)
<?php  } else { ?>
	X_MSGBOX_TEXT(<*<LI><?php  putGS('The user type could not be deleted.'); ?></LI>*>)
<?php  } ?>
	B_MSGBOX_BUTTONS
<?php  if ($AFFECTED_ROWS > 0) { ?>
		REDIRECT(<*Done*>, <*Done*>, <*X_ROOT/u_types/*>)
<?php  } else { ?>
		REDIRECT(<*OK*>, <*OK*>, <*X_ROOT/u_types/*>)
<?php  } ?>
	E_MSGBOX_BUTTONS
E_MSGBOX
<P>

X_HR
X_COPYRIGHT
E_BODY
<?php  } ?>dnl

E_DATABASE
E_HTML

