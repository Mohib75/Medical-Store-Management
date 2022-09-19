<?php
include 'config.php';
$id = $_REQUEST[ 'id' ];
$dbconn = @mysqli_connect( $dbhost, $dbuser, $dbpass );

if ( !( $dbconn ) ) {
    exit( 'Error connecting to database.' );
}
mysqli_select_db( $dbconn, $db );

$query = "SELECT * from employee where pid='".$id."'";

$result = mysqli_query( $dbconn, $query );
$row = mysqli_fetch_array( $result );
?>

<html>

<head>
<title>Medical Store Management</title>

<link href = 'http://fonts.googleapis.com/css?family=Graduate' rel = 'stylesheet' type = 'text/css'>
<![ if !IE ]>
<link href = 'css/style.css' rel = 'stylesheet' type = 'text/css'>
<![ endif ]>
</head>

<body>
<?php
$status = '';

if ( isset( $_POST[ 'new' ] ) && $_POST[ 'new' ] == 1 ) {
    $id = $_REQUEST[ 'id' ];
    $name = $_REQUEST[ 'name' ];
    $email = $_REQUEST[ 'email' ];
    $address = $_REQUEST[ 'address' ];
    $phone = $_REQUEST[ 'phone' ];
    $salary = $_REQUEST[ 'salary' ];
    $update = "UPDATE employee SET name='$name', email='$email', address='$address', phone='$phone', salary='$salary' WHERE pid=$id";

    mysqli_query( $dbconn, $update );
    $status = 'Record Updated Successfully.';
    echo $status;
} else {
    ?>

    <form action = '' method = 'POST' name = 'form'>
    <input type = 'hidden' name = 'new' value = '1' />
    <center>
    <h1>Medical Store Management</h1>

    <hr />

    <input name = 'id' type = 'hidden' value = "<?php echo $row['pid'];?>" />

    Name : <input type = 'text' name = 'name' size = '32' value = "<?php echo $row['name'];?>" required/><br />

    Email : <input type = 'email' name = 'email' size = '32' value = "<?php echo $row['email'];?>" required/><br />

    Address : <input type = 'text' name = 'address' size = '32' value = "<?php echo $row['address'];?>" required/><br />

    Phone : <input type = 'tel' name = 'phone' size = '32' value = "<?php echo $row['phone'];?>" required/><br />

    Salary : <input type = 'text' name = 'salary' size = '32' value = "<?php echo $row['salary'];?>" required/><br />

    <input type = 'submit' name = 'submit' value = 'Enter!' class = 'submit' />
    </center>
    </form>
    <?php }
    ?>

    </body>

    </html>
