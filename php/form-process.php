<?php

$errorMSG = "";

// NAME
if (empty($_POST["name"])) {
    $errorMSG = "Name is required.";
} else {
    $name = $_POST["name"];
}

// EMAIL
if (empty($_POST["email"])) {
    $errorMSG .= "Email is required.";
} else {
    $email = $_POST["email"];
}

// MSG SUBJECT
if (empty($_POST["msg_subject"])) {
    $msg_subject = "New INCEPTS Form Submission";
} else {
    $msg_subject = $_POST["msg_subject"];
}

// MESSAGE
if (empty($_POST["message"])) {
    $errorMSG .= "Message is required.";
} else {
    $message = $_POST["message"];
}

$EmailTo = "mguttenb@andrew.cmu.edu, venkvis@cmu.edu";
$Subject = "New Message Received";

// PREPARE EMAIL BODY TEXT
$Body = "";
$Body .= "Name: ";
$Body .= $name;
$Body .= "\n";
$Body .= "Email: ";
$Body .= $email;
$Body .= "\n";
$Body .= "Subject: ";
$Body .= $msg_subject;
$Body .= "\n";
$Body .= "Message: ";
$Body .= $message;
$Body .= "\n";

// SEND EMAIL
$success = mail($EmailTo, $Subject, $Body, "From:".$email);

// REDIRECT
if ($success && $errorMSG == ""){
    echo "success";
} else {
    if ($errorMSG == ""){
        echo "Something went wrong";
    } else {
        echo $errorMSG;
    }
}

?>
