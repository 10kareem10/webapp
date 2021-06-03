<!DOCTYPE html>
<?php
session_start();
$con = mysqli_connect("localhost", "root", "12345678", "project");

$sender_id = $_SESSION['user_id'];
$sender_type = $_SESSION['user_type'];

$receiver_name = $_SESSION['receiver_name'];
$receiver_id = $_SESSION['receiver_id'];
$receiver_type = $_SESSION['receiver_type'];

displayOldMessages($con);

if (isset($_POST['send_btn'])) {
    addMessage($con);
    $URL = "http://localhost/project/chat.php";
    echo "<script type='text/javascript'>document.location.href='{$URL}';</script>";
    echo '<META HTTP-EQUIV="refresh" content="0;URL=' . $URL . '">';
    displayOldMessages($con);
}




?>



<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
</head>

<body>

    <form method="POST">
        <input type="text" name="sent_message">
        <input type="submit" value="Send" name="send_btn">
    </form>

    <?php
    // Function tag

    function addMessage($con)
    {
        $sender_id = $_SESSION['user_id'];
        $sender_type = $_SESSION['user_type'];
        $receiver_id = $_SESSION['receiver_id'];
        $receiver_type = $_SESSION['receiver_type'];

        $message_text = $_POST['sent_message'];

        $query = "INSERT INTO messages (text,sender_id,receiver_id,sender_type,receiver_type)
         VALUES ('$message_text',$sender_id,$receiver_id,'$sender_type','$receiver_type');";

        mysqli_query($con, $query);
    }


    function displayOldMessages($con)
    {

        $sender_id = $_SESSION['user_id'];
        $sender_type = $_SESSION['user_type'];
        $receiver_id = $_SESSION['receiver_id'];
        $receiver_type = $_SESSION['receiver_type'];
        $query = "SELECT * FROM messages WHERE (sender_id = $sender_id or sender_id = $receiver_id) and (sender_type = '$sender_type' or sender_type = '$receiver_type') and (receiver_id = $receiver_id or receiver_id = $sender_id) and (receiver_type = '$receiver_type' or receiver_type = '$sender_type')";
        $result = mysqli_query($con, $query);
        while ($row = mysqli_fetch_array($result)) {
            $current_message = $row['text'];
            if ($row['sender_id'] == $sender_id) {
                // echo $row['text']."<br>";
                echo "<p style='color:red'>$current_message</p>";
            } else {
                echo "<p style='color:blue'>$current_message</p>";
            }
        }
    }
    ?>



</body>

</html>