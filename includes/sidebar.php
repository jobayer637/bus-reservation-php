            <div class="col-md-4">

                <!-- Blog Search Well -->
               


                <!-- Login -->
                <?php

                    if (!isset($_SESSION['s_username'])) {
                        ?>
                            <div class="well">
                                <h4>Login</h4>
                                <form action="includes/login.php" method="post">

                                    
                                        <input name="username" type="text" class="form-control" placeholder="Username">
                                        <input name="password" type="password" class="form-control" placeholder="Password" style="margin-top: 10px;">

                                        <button class="btn btn-primary" name="login" style="margin-left: 130px; margin-top: 10px;">Login</button>
                                    
                                </form>
                                <!-- /.input-group -->
                            </div>
                        
                <?php } ?>

                



                <!-- Blog Categories Well -->
                <div class="well">


                    <?php 

                        $query = "SELECT *  FROM  categories";
                        $select_categories_sidebar = mysqli_query($connection,$query);

                     ?>




                    <h4>Bus Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">

                                <?php  
                                    while($row = mysqli_fetch_assoc($select_categories_sidebar)) {
                                        $cat_title = $row['cat_title'];
                                        $cat_id = $row['cat_id'];
                                         echo "<li> <a href='category.php?category=$cat_id'> $cat_title </a></li>";
                                    }

                                ?>
                                
                            </ul>
                        </div>

                    </div>
                    <!-- /.row -->
                </div>


                <!-- Side Widget Well -->
                <?php include "widget.php"; ?>

            </div>