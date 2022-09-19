<?php
session_start();
if ( !isset( $_SESSION[ 'admin' ] ) )
 {
    header( 'Location: index.html' );
    exit();
}

if ( isset( $_POST[ 'submit' ] ) ) {
    include 'config.php';

    $name = stripslashes( $_POST[ 'name' ] );
    $email = stripslashes( $_POST[ 'email' ] );
    $address = stripslashes( $_POST[ 'address' ] );
    $phone = stripslashes( $_POST[ 'phone' ] );
    $salary = stripslashes( $_POST[ 'salary' ] );
    $dbconn = @mysqli_connect( $dbhost, $dbuser, $dbpass );

    if ( !( $dbconn ) ) {
        exit( 'Error connecting to database.' );
    }
    mysqli_select_db( $dbconn, $db );

    $sql = "INSERT INTO employee (name, email, address, phone, salary)
VALUES ('".$name."','".$email."','".$address."','".$phone."','".$salary."')";

    if ( mysqli_query( $dbconn, $sql ) ) {
        echo '***************RECORDS UPDATED SUCCESSFULLY**************<br /><br />';
        header( 'refresh:5;url=med_admin_screen.php' );

    } else {
        echo 'Error: ' . $sql . '<br>' . mysqli_error( $dbconn );
    }
}

