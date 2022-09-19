<?php
	session_start();
	if(!isset($_SESSION['admin']))
	{
		header("Location: index.html");
		exit();
	}
	include 'config.php';
	
?>
<html>
	<head>
		<link href='http://fonts.googleapis.com/css?family=Graduate' rel='stylesheet' type='text/css'>
		<!-- <![if !IE]> -->
		<link href='./css/style.css' rel='stylesheet' type='text/css'>
		<!-- <![endif]> -->
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<!-- <script>
			function ajaxForQuery()
			{
				$.ajax({type:'POST', url: 'runsqlq.php', data:$('#medadmin').serialize(), success: function(response)
				{
					$('#medadmin').find('.outputsqlq').html(response);
				}
				});
				return false;
			}
		</script> -->

		<title>Medical Store Management</title>

		<style>
			.emp-add {
			visibility: hidden;
			position: absolute;
		}

		.emp-add-show{
			visibility: visible;
		}

		.headings{
			display: flex;
			width: 100%;
			justify-content: space-around;
		}

		.headings p{
			width: 20px;
			font-size: 20px;
		}
		
		.results{
			display: flex;
			width: 100%;
			justify-content: space-around;
		}

		.results p{
			width: 20px;
			font-size: 15px;
		}

		.emp-details {
			width: inherit;
			visibility: hidden;
			position: absolute;
		}

		.emp-details-show{
			visibility: visible;
		}
		</style>
	</head>

	<body>

		<form method="POST" id="medadmin" style="height:680px;" action="./employee.php">
			<center>
				<h1>Medical Store Management - ADMIN</h1>
				<hr />
			</center>

			<div style="display: flex; width: 100%; justify-content: end; margin-bottom: 50px;">
				<button onclick="employeeAdd();" style="background-color: #B1BDC5; font-weight: bold; margin-right: 10px; cursor: pointer;">Employee Add</button>
				<button onclick="employeeDetails();" style="background-color: #B1BDC5; font-weight: bold; cursor: pointer;">Employee Details</button>
			</div>

			<div id="emp-add" class="emp-add">
				<label for="sqlq" style="font-size:25px;">Employee Details</label>
				<br /><br />
	
				<label for="sqlq" style="margin-right: 23px;">Name:</label>
				<input type="text" name="name" style="width:820px;" required/>
				<br />
	
				<label for="sqlq" style="margin-right: 22px;">Email:</label>
				<input type="email" name="email" style="width:820px;" required/>
				<br />
	
				<label for="sqlq">Address:</label>
				<input type="text" name="address" style="width:820px;" required/>
				<br />
	
				<label for="sqlq" style="margin-right: 16px;">Phone:</label>
				<input type="tel" name="phone" style="width:820px;" required/>
				<br />

				<label for="sqlq" style="margin-right: 12px;">Salary:</label>
				<input type="text" name="salary" style="width:820px;" required/>
				<br />
	
				<input type="submit" name="submit" value="Submit" class="submit" id="runsqlq" style="margin-left: 400px;"/>
			</div>

			<div id="emp-details" class="emp-details">
				<div class="headings">
					<p>Name</p>
				<p>Email</p>
				<p>Address</p>
				<p>Phone</p>
				<p>Salary</p>
				</div>

				<?php
					if(!($dbconn = @mysqli_connect($dbhost, $dbuser, $dbpass))) exit('Error connecting to database.');
					mysqli_select_db($dbconn, $db);

					$result = mysqli_query($dbconn,"SELECT * FROM employee");

					while($row = mysqli_fetch_array($result)){
				?>

				<div class="results">
					<p><?=$row['name'];?></p>
					<p><?=$row['email'];?></p>
					<p><?=$row['address'];?></p>
					<p><?=$row['phone'];?></p>
					<p><?=$row['salary'];?></p>
					<p><a href="employee_edit.php?id=<?php echo $row["pid"]; ?>">Edit</a></p>
					<p><a href="employee_delete.php?id=<?php echo $row["pid"]; ?>">Delete</a></p>
				</div>

				<?php
					}			
				?>
			</div>
		</form>
		
		<script type="text/javascript">
			function employeeAdd(){

				var employeeAdd = document.getElementById('emp-add')
	
				employeeAdd.classList.toggle('emp-add-show')
			}

			function employeeDetails(){

				var employeeDetails = document.getElementById('emp-details')
	
				employeeDetails.classList.toggle('emp-details-show')
			}
		</script>

	</body>
</html>
