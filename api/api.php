<?php
require_once("Rest.inc.php");

class API extends REST 
{
    public $data = "";
    const DB_SERVER = "localhost";
    const DB_USER = "root";
    const DB_PASSWORD = "";
    const DB = "monPetitBouqin";

    private $db;

    public function __construct()
    {
        parent::__construct(); //Init parent contructor
        $this->dbConnect(); //Initiate Database connection
    }

    //Database connection
    private function dbconnect()
    {
        $this->db = mysqsl_connect(self::DB_SERVER,self::DB_USER,self::DB_PASSWORD);
        if($this->db)
        {
            mysql_select_db(self::DB,$this->db);
        }
    }

    //Public method for access api.
    //This method dynmically call the method based on the query string
    public function processApi()
    {
        $func = strtolower(trim(str_replace("/","",$_REQUEST['rquest'])));
        if((int)method_exists($this,$func) > 0)
        {
            $this->$func();
        }
        else
        {
            $this->response('',404);
        } 
    // If the method not exist with in this class, response would be "Page not found".
    }

    private function book()
    {
        if($this->get_request_method() != "GET")
        {
            $this->response('',406); //Not Acceptable
        }

        $sql = mysql_query("SELECT B.ISBN, B.Title,A.Name,A.Firstname FROM AUTHOR A, BOOK B, BOOK_AUTHOR BA WHERE B.ISBN = BA.IdBook AND A.Id = BA.IdAuthor ", $this->db);
        if(mysql_num_rows($sql) > 0)
        {
            $result = array();
            while($rlt = mysql_fetch_array($sql,MYSQL_ASSOC))
            {
                $result[] = $rlt;
            }
            // If success everythig is good send header as "OK" and return list of users in JSON format
            $this->response($this->json($result), 200);
        }
        $this->response('',204); // If no records "No Content" status
    }

    // Initiate Library
    $api = new API;
    $api->processApi
}
?>
