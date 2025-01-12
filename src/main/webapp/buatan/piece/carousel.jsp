<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/carousel.css">
<script src="https://kit.fontawesome.com/bf360aee8d.js" async crossorigin="anonymous"></script>
<script src="./js/carousel.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<title>carousel</title>
</head>
<body onload="carousel();">
    <div class="slideshow">
        <div class="slideshow_slides">
            <a href="#"><img src="./image/slide-1.jpg" alt="space"></a>
            <a href="#"><img src="./image/slide-2.jpg" alt="mars"></a>
            <a href="#"><img src="./image/slide-3.jpg" alt="rocket"></a>
            <a href="#"><img src="./image/slide-4.jpg" alt="sunset"></a>
        </div>
        <div class="slideshow_nav">
            <a href="#" class="prev"><i class="fa-solid fa-circle-chevron-left"></i></a>
            <a href="#" class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
        </div>
        <div class="slideshow_indicator">
            <a href="#" class="active"><i class="fa-regular fa-circle-dot"></i></a>
            <a href="#"><i class="fa-regular fa-circle-dot"></i></a>
            <a href="#"><i class="fa-regular fa-circle-dot"></i></a>
            <a href="#"><i class="fa-regular fa-circle-dot"></i></a>
        </div>
    </div>
</body>
</html>