<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Project.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Recommender</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="CSS/style.css" type="text/css" media="all" />
	<script type="text/javascript" src="JavaScript/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="JavaScript/jquery-func.js"></script>



</head>
<body>
    <form id="form1" runat="server">
   <div>

       <!-- Shell -->
<div id="shell">;
	<!-- Header -->
	<div id="header">
		<h1 id="logo"><a href="#">Movie Recommender</a></h1>
		<!-- Navigation -->
		<div id="navigation">
			<ul>
			    <li><a  href="#">Sign up</a></li>
			    <li><a href="#">Login</a></li>
			</ul>
		</div>
		<!-- end Navigation -->
		
		<!-- Sub-menu -->
		<div id="sub-navigation">
			<ul>
			    <li><a href="index.aspx">RECOMMENDED</a></li>
			    <li><a href="#">TOP RATED</a></li>
			    <li><a href="#">MOST COMMENTED</a></li>
			</ul>
			<div id="search">
				<form action="home_submit" method="get" accept-charset="utf-8">
					<label for="search-field">SEARCH</label>					
					<input type="text" name="search field" value="Enter search here" id="search-field" title="Enter search here" class="blink search-field"  />
					<input type="submit" value="GO!" class="search-button" />
				</form>
			</div>
		</div>
		<!-- end Sub-Menu -->
		
	</div>
	<!-- end Header -->
	
	<!-- Main -->
	<div id="main">
		<!-- Content -->
		<div id="content">

			<!-- Box -->
			<div class="box">
				<div class="head">
					<h2>LATEST TRAILERS</h2>
					<p class="text-right"><a href="#">See all</a></p>
				</div>

				<!-- Movie -->
				<div class="movie">
					
					<div class="movie-image">
						
						<a href="#"><span class="play"><span class="name">X-MAN</span></span><img src="img/movie1.jpg" alt="movie" /></a>
					</div>
						
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<a href="#"><span class="play"><span class="name">SPIDER MAN 2</span></span><img src="img/movie2.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<a href="#"><span class="play"><span class="name">SPIDER MAN 3</span></span><img src="img/movie3.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<a href="#"><span class="play"><span class="name">VALKYRIE</span></span><img src="img/movie4.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<a href="#"><span class="play"><span class="name">GLADIATOR</span></span><img src="img/movie5.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie last">
					<div class="movie-image">
						<a href="#"><span class="play"><span class="name">ICE AGE</span></span><img src="img/movie6.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->




            </div>
        </div>
    </div>



    
    </div>
    </form>
</body>
</html>
