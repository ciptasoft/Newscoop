B_HTML
INCLUDE_PHP_LIB(<*../..*>)
B_DATABASE

CHECK_BASIC_ACCESS
CHECK_ACCESS(<*ManageIssue*>)

B_HEAD
	X_EXPIRES
	X_TITLE(<*Updating issue*>)
<?php  if ($access == 0) { ?>dnl
	X_AD(<*You do not have the right to add issues.*>)
<?php  } ?>dnl
E_HEAD

<?php  if ($access) { ?>dnl
B_STYLE
E_STYLE

B_BODY

<?php 
    todef('cName');
    todefnum('cLang');
    todefnum('cPublicationDate');
    todefnum('Pub');
    todefnum('Issue');
    todefnum('Language');
?>dnl

B_HEADER(<*Changing issue's details*>)
B_HEADER_BUTTONS
X_HBUTTON(<*Issues*>, <*pub/issues/?Pub=<?php  pencURL($cPub); ?>*>)
X_HBUTTON(<*Publications*>, <*pub/*>)
X_HBUTTON(<*Home*>, <*home.php*>)
X_HBUTTON(<*Logout*>, <*logout.php*>)
E_HEADER_BUTTONS
E_HEADER

<?php 
    query ("SELECT * FROM Issues WHERE IdPublication=$Pub AND Number=$Issue AND IdLanguage=$Language", 'publ');
    if ($NUM_ROWS) {
	query ("SELECT * FROM Publications WHERE Id=$Pub", 'q_pub');
	if ($NUM_ROWS) {
	    query ("SELECT Id, Name FROM Languages WHERE Id=$Language", 'q_lang');
	    fetchRow($publ);
	    fetchRow($q_pub);
	    fetchRow($q_lang);
?>dnl

B_CURRENT
X_CURRENT(<*Publication*>, <*<B><?php  pgetHVar($q_pub,'Name'); ?></B>*>)
X_CURRENT(<*Issue*>, <*<B><?php  pgetHVar($publ,'Number'); ?>. <?php  pgetHVar($publ,'Name'); ?> (<?php  pgetHVar($q_lang,'Name'); ?>)</B>*>)
E_CURRENT   

<?php 
    $correct= 1;
    $created= 0;
?>dnl
<P>
B_MSGBOX(<*Changing issue's details*>)
	X_MSGBOX_TEXT(<*

<?php 
    $cName=trim($cName);
	///!sql query "SELECT TRIM('?cName')" q_x
    
    if ($cLang == 0) {
	$correct= 0; ?>dnl
		<LI><?php  putGS('You must select a language.'); ?></LI>
    <?php  }
    
    if ($cName == "" || $cName == " ") {
	$correct= 0; ?>dnl
		<LI><?php  putGS('You must complete the $1 field.','<B>'.getGS('Name').'</B>'); ?></LI>
    <?php  }
    
    if ($correct) {
	
	query("UPDATE Issues SET Name='$cName', IdLanguage=$cLang, PublicationDate='$cPublicationDate' WHERE IdPublication=$Pub AND Number=$Issue AND IdLanguage=$cLang");
	$created= ($AFFECTED_ROWS > 0);
    }
    
    if ($created) { ?>dnl
		<LI><?php  putGS('The issue $1 has been successfuly changed.','<B>'.encHTML(decS($cName)).'</B>'); ?></LI>
X_AUDIT(<*11*>, <*getGS('Issue $1 updated in publication $2',$cName,getVar($publ,'Name'))*>)
<?php  } else {
    
    if ($correct != 0) { ?>dnl
		<LI><?php  putGS('The issue could not be changed.'); ?></LI>
<!--LI>Please check if another issue with the same number/language does not already exist.</LI-->
<?php  }
}
?>dnl
		*>)
<?php  if ($correct && $created) { ?>dnl
	B_MSGBOX_BUTTONS
		REDIRECT(<*Done*>, <*Done*>, <*X_ROOT/pub/issues/?Pub=<?php  pencURL($Pub); ?>*>)
	E_MSGBOX_BUTTONS
<?php  } else { ?>dnl
	B_MSGBOX_BUTTONS
		REDIRECT(<*OK*>, <*OK*>, <*X_ROOT/pub/issues/edit.php?Pub=<?php  pencURL($Pub); ?>&Issue=<?php  pencURL($Issue); ?>&Language=<?php  pencURL($Language); ?>*>)
	E_MSGBOX_BUTTONS
<?php  } ?>dnl
E_MSGBOX
<P>

<?php  } else { ?>dnl
<BLOCKQUOTE>
	<LI><?php  putGS('No such publication.'); ?></LI>
</BLOCKQUOTE>
<?php  } ?>dnl

<?php  } else { ?>dnl
<BLOCKQUOTE>
        <LI><?php  putGS('No such issue.'); ?></LI>
</BLOCKQUOTE>
<?php  } ?>dnl   

X_HR
X_COPYRIGHT
E_BODY
<?php  } ?>dnl

E_DATABASE
E_HTML
