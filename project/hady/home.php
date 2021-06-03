<?php
session_start();
$user_id = $_SESSION['user_id'];
$con = mysqli_connect("localhost", "root", "12345678", "project");
$query = "SELECT * FROM jobseeker where id=$user_id";
$result = mysqli_query($con, $query);
$row = mysqli_fetch_array($result);

$name = $row['name'];
$job_title = $row['job_title'];
$bio = $row['bio'];


$image_src = 'uploads/' . $row['photo'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
            <link rel="stylesheet" href="stylee.css">
    <script src="https://kit.fontawesome.com/04f955b3c6.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="script.js"></script> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 



</head>


<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
  
    <a class="navbar-brand" style="color:teal;" href="home.php">JobSeeker</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav  ms-auto ">
        <li class="nav-item">
          <a class="nav-link active mr-auto" aria-current="page" href="home.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mr-auto" href="#">Message</a>
        </li>
        <li class="nav-item">
          
          <?php
    session_start();

    if(!isset($_SESSION['user_id'])){
        header("Location: login.php");
    }

    if ($_SESSION['user_type'] == "Job Seeker")

        echo "<a class='nav-link mr-auto' href='profile_jobseeker.php'>Profile</a>";
    else if ($_SESSION['user_type'] == "Company")
        echo "<a class='nav-link mr-auto' href='profile_company.php'>Profile</a>";
    else
        echo "Something went wrong fe esm el user type";

    ?>
        </li>
       
        <li class="nav-item">
          <a class="nav-link mr-auto"  href="logout.php">Logout</a>
        </li>
   
      </ul>
      
    </div>
  
</div>
</nav>


<div class="container">
    <div class="d-none d-lg-block col-2 mt-4 info">
    <div >
      <div class="row">
        <img class="mt-3 avatar" src="<?php echo $image_src; ?>" >
      </div>
      
      <div class="row"> 
        <h6 id="name"> <?php echo $name ?> </h6>
      </div>
      
      <h6 id="job"> <?php echo $job_title ?> </h6>
      <hr>

      <div class="row"> 
        <p id="bio"> <?php echo $bio?> </p>
      </div>
    
    </div>
    </div>
      
      <div class=" d-flex flex-column-reverse">

    

<?php
        //Function tag
        function displayPosts($con)
        {
          // Data we need for each post
          // js/comp.username - js/comp.img - post.text - post.likes

          $query1 = "SELECT post.id,post.text,post.num_likes,
          (CASE 
          WHEN post.jobseeker_id IS NULL THEN company.name
          ELSE jobseeker.name
          END) as name,
          (CASE 
          WHEN post.jobseeker_id IS NULL THEN company.photo
          ELSE jobseeker.photo
          END) as photo
          FROM post
          LEFT OUTER JOIN jobseeker ON jobseeker.id = post.jobseeker_id 
          LEFT OUTER JOIN company ON company.id = post.company_id
          WHERE jobseeker.id = post.jobseeker_id OR company.id = post.company_id
          GROUP BY post.id
          ORDER BY post.id DESC;";




          $query2 =
            "SELECT comments.post_id,comments.text,
          (CASE 
          WHEN comments.jobseeker_id IS NULL THEN company.name
          ELSE jobseeker.name
          END) as name,
          (CASE 
          WHEN comments.jobseeker_id IS NULL THEN company.photo
          ELSE jobseeker.photo
          END) as photo
          FROM comments
          LEFT OUTER JOIN jobseeker ON jobseeker.id = comments.jobseeker_id 
          LEFT OUTER JOIN company ON company.id = comments.company_id
          WHERE jobseeker.id = comments.jobseeker_id OR company.id = comments.company_id
          GROUP BY comments.id";




          $query3 = "SELECT post_likes.post_id as post_id,
          (CASE 
          WHEN post_likes.jobseeker_id IS NULL THEN company.name
          ELSE jobseeker.name
          END) as name
          FROM post_likes
          LEFT OUTER JOIN jobseeker ON jobseeker.id = post_likes.jobseeker_id 
          LEFT OUTER JOIN company ON company.id = post_likes.company_id
          WHERE jobseeker.id = post_likes.jobseeker_id OR company.id = post_likes.company_id;
          ";

          $result_posts = mysqli_query($con, $query1);
          $result_comments = mysqli_query($con, $query2);
          $result_likes = mysqli_query($con, $query3);

          while ($post_row = mysqli_fetch_array($result_posts)) {

            $post_id = $post_row['id'];
            $post_text = $post_row['text'];
            $post_num_likes = $post_row['num_likes'];
            $poster_name = $post_row['name'];
            $poster_photo = $post_row['photo'];
            echo"<div class='col-9 post'>";
            
            echo "<img src='<?php echo $poster_photo; ?>'> <h6 >$poster_name </h6>";
            //echo "<h6 id='postName'>$poster_name </h6>";
            echo"<p id='postContent'>$post_text </p>";

            echo "<hr class='divider' />
        
        <form method='POST'>
      <i class='fas fa-thumbs-up' id='Tag'></i>
     <input class='likebtn' type='submit' name='like' value='like'>
     </form>
    
    <form method='POST'>
    <i class='fas fa-comment' id='commentTag'></i>
      <button class='commentbtn' class='btn btn-primary' type='button' data-toggle='collapse' data-target='#collapseExample' aria-expanded='false' aria-controls='collapseExample'>
    comment
  </button>
  </form>
  
  
  <div class='collapse' id='collapseExample'>
  <div class='card card-body'>
    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
  </div>
</div>";
            
            while ($comment_row = mysqli_fetch_array($result_comments)) {
              $comment_post_id = $comment_row['post_id'];
              $comment_text = $comment_row['text'];
              $commenter_name = $comment_row['name'];
              $commenter_photo = $comment_row['photo'];
              if ($comment_post_id == $post_id){
               // echo"<div class='commentDiv'> $comment_text</div> ";
                //echo"$comment_text";
                //echo"</div>";  //close comment div
              }
            }

            echo"</div>";  //close bigDiv
            mysqli_data_seek($result_comments, 0);
          }
        }

$con = mysqli_connect("localhost", "root", "12345678", "project");
displayPosts($con);



        ?>
     <div class="col-9 rightUp">
        <div id="writeApost">
        <form method="POST">
        <br>
      <input id="input" placeholder="Write a post" name="write_post" class="form-control">
    

       <label class="custom-file-upload">
         <input type="file"/>
          <i id="uploadPic" class="material-icons">add_a_photo</i>
      
      </label>

      <input type="submit" class="btn btn-success mt-3 col-3" name="post_btn" id="post_btn" value="Post">
    </form>
        </div>
</div>

</div>




<div id="clear"></div>
</div>
  
</div>
        





</body>

</html>