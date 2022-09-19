<?php
include 'config.php';
$id = $_REQUEST[ 'id' ];
$dbconn = @mysqli_connect( $dbhost, $dbuser, $dbpass );

if ( !( $dbconn ) ) {
    exit( 'Error connecting to database.' );
}
mysqli_select_db( $dbconn, $db );

$query = "DELETE FROM employee WHERE pid=$id";

$result = mysqli_query( $dbconn, $query );
header( 'Location: med_admin_screen.php' );

?>