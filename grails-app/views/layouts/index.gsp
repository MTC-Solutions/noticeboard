<!--Template Name: vacayhome
File Name: home.html
Author Name: ThemeVault
Author URI: http://www.themevault.net/
License URI: http://www.themevault.net/license/-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/icons/favicon.png"/>
    <title>Noticeboard</title>

    <!-- Font Awesome -->
    <asset:stylesheet src = "font-awesome/css/font-awesome.min.css"/>

    <asset:stylesheet src = "vacay/bootstrap.min.css"/>
    <!-- Custom styles for this template -->
    <asset:stylesheet src = "vacay/style.css"/>
    <asset:stylesheet src = "vacay/lightbox.min.css"/>
    <asset:stylesheet src = "vacay/responsive.css"/>
    <asset:stylesheet src = "fonts/antonio-exotic/stylesheet.css"/>

</head>
<body>
<div id="page">
    <!---header top---->
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!--<a href="#"> </a>
                        <div class="info-block"><i class="fa fa-map"></i>701 Old York Drive Richmond USA.</div>-->
                </div>
                <div class="col-md-6">
                    <div class="social-grid">
                        <ul class="list-unstyled text-right">
                            <li><a><i class="fa fa-facebook"></i></a></li>
                            <li><a><i class="fa fa-twitter"></i></a></li>
                            <li><a><i class="fa fa-linkedin"></i></a></li>
                            <li><a><i class="fa fa-instagram"></i></a></li>
                            <li>
                                <g:link class="btn btn-danger btn-sm" controller="login">
                                    <i class="fa fa-user"></i> Login</a>
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--header--->
    <header class="header-container">
        <div class="container">
            <div class="top-row">
                <div class="row">
                    <div class="col-md-2 col-sm-6 col-xs-6">
                        <div id="logo">
                            <a href="index.html"><img src="images/logo.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12 remove-padd">
                        <nav class="navbar navbar-default">
                            <div class="navbar-header page-scroll">
                                <button data-target=".navbar-ex1-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>

                            </div>
                            <div class="collapse navigation navbar-collapse navbar-ex1-collapse remove-space">
                                <ul class="list-unstyled nav1 cl-effect-10">
                                    <li><a  data-hover="Home" class="active"><span>Home</span></a></li>
                                    <li><a data-hover="About"  href="about.html"><span>About</span></a></li>
                                    <li><a data-hover="News" href="news.html"><span>News</span></a></li>
                                    <li><a data-hover="Contact Us" href="contact.html"><span>contact Us</span></a></li>
                                </ul>

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <!--end-->
    <div id="myCarousel1" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->

        <ol class="carousel-indicators">
            <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel1" data-slide-to="1"></li>
            <li data-target="#myCarousel1" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active"><asset:image class="img img-responsive" src="carousel/first.jpg"/>
                <div class="carousel-caption">
                    <h1>Noticeboard<br> Simplifying communication</h1>
                </div>
            </div>
            <div class="item">
                <div class="carousel-caption">
                    <h1>vacayhome<br> spa & Resort</h1><asset:image style="width:100%; height: 500px" src="images/noticeboard/banner2.png"/>
                </div>
            </div>
            <div class="item"> <img src="images/banner3.png" style="width:100%; height: 500px" alt="Third slide">
                <div class="carousel-caption">
                    <h1>vacayhome<br> spa & Resort</h1>
                </div>
            </div>

        </div>
        <a class="left carousel-control" href="#myCarousel1" data-slide="prev">
            <img src="images/icons/left-arrow.png" onmouseover="this.src = 'images/icons/left-arrow-hover.png'" onmouseout="this.src = 'images/icons/left-arrow.png'" alt="left">
        </a>
        <a class="right carousel-control" href="#myCarousel1" data-slide="next">
            <img src="images/icons/right-arrow.png" onmouseover="this.src = 'images/icons/right-arrow-hover.png'" onmouseout="this.src = 'images/icons/right-arrow.png'" alt="left">
        </a>

    </div>
    <div class="clearfix"></div>

    <g:layoutBody/>


    <!---footer--->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12 width-set-50">
                    <div class="footer-details">
                        <h4>Get in touch</h4>
                        <ul class="list-unstyled footer-contact-list">
                            <li>
                                <i class="fa fa-map-marker fa-lg"></i>
                                <p>701 Old York Drive Richmond USA.</p>
                            </li>
                            <li>
                                <i class="fa fa-phone fa-lg"></i>
                                <p><a href="tel:+1-202-555-0100"> +1-202-555-0100</a></p>
                            </li>
                            <li>
                                <i class="fa fa-envelope-o fa-lg"></i>
                                <p><a href="mailto:demo@info.com"> demo@info.com</a></p>
                            </li>
                        </ul>
                        <div class="footer-social-icon">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                        <div class="input-group" id="subscribe">
                            <input type="text" class="form-control subscribe-box" value="" name="subscribe" placeholder="EMAIL ID">
                            <span class="input-group-btn">
                                <button type="button" class="btn subscribe-button"><i class="fa fa-paper-plane fa-lg"></i></button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 width-50 width-set-50">
                    <div class="footer-details">
                        <h4>explore</h4>
                        <ul class="list-unstyled footer-links">
                            <li class="active"><a>Home</a></li>
                            <li><a href="about.html">About</a></li>
                            <li><a href="rooms.html">Rooms</a></li>
                            <li><a href="gallery.html">Gallery</a></li>
                            <li><a href="#">Dinning</a></li>
                            <li> <a href="news.html">News</a></li>
                            <li> <a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="footer-details">
                        <h4>Now On Instagram</h4>
                        <div class="row">
                            <div class="instagram-images">
                                <div id="instafeed"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="copyright">
                &copy; 2017 All right reserved. Designed by <a href="http://www.themevault.net/" target="_blank">ThemeVault.</a>
            </div>

        </div>
    </footer>

    <!--back to top--->
    <a style="display: none;" href="javascript:void(0);" class="scrollTop back-to-top" id="back-to-top">
        <span><i aria-hidden="true" class="fa fa-angle-up fa-lg"></i></span>
        <span>Top</span>
    </a>

</div>
    <asset:javascript src = "jquery/jquery.min.js"/>
    <!-- Bootstrap 4 -->
    <asset:javascript src = "bootstrap/js/bootstrap.bundle.min.js"/>
    <asset:javascript src = "vacay/lightbox-plus-jquery.min.js"/>
    <asset:javascript src = "vacay/instafeed.min.js"/>
    <asset:javascript src = "vacay/custom.js"/>
</body>
</html>
