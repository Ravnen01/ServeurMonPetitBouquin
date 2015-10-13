<?php
require 'vendor/autoload.php';	

$app= new \Slim\Slim();

//var_dump($app);
//die;


const DB_SERVER = "192.168.0.98";
const DB_USER = "root";
const DB_PASSWORD = "";
const DB = "monPetitBouquin";


//echo $mysqli->host_info . "\n";
//var_dump($mysqli);
$app->get('/book', function () {
	$mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB);
if ($mysqli->connect_errno) {
    echo "Echec lors de la connexion à MySQL : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
    $sql = $mysqli->query("SELECT B.ISBN, B.Title,A.Name,A.Firstname FROM AUTHOR A, BOOK B, BOOK_AUTHOR BA WHERE B.ISBN = BA.IdBook AND A.Id = BA.IdAuthor");
    //var_dump($sql);
    //die;
        
            //$result = array();
            while($rlt = $sql->fetch_array(MYSQLI_ASSOC))
            {
            	$result[] = $rlt;
            }
            // If success everythig is good send header as "OK" and return list of users in JSON format
        $return = json_encode($result);
        var_dump($return);
        die;

});


$app->run();


?>
