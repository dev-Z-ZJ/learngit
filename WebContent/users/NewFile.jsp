<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CSS3 星星打分</title>
<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>
</head>

<style>
body {
  text-align: center;
  background-color: #34495e;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

h1 {
  color: #FFF;
  font-weight: 500;
  padding: 30px;
  text-shadow: 0 3px 3px #2b3c4e;
}

input {
  display: none;
}

label {
  cursor: pointer;
  font-size: 40px;
  color: yellow;
  display: block;
  width: 50px;
  height: 50px;
  line-height: 60px;
  text-align: center;
  float: left;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
  text-shadow: 0 3px 3px #2b3c4e;
}
label:hover {
  font-size: 50px;
  color: #FFF;
  text-shadow: 0 0 5px #b9c9d8;
}
label:before {
  display: inline;
  width: auto;
  height: auto;
  line-height: normal;
  vertical-align: baseline;
  margin-top: 0;
  font-family: FontAwesome;
  font-weight: normal;
  font-style: normal;
  text-decoration: inherit;
  -webkit-font-smoothing: antialiased;
  content: "\f005";
}

input:checked + label ~ label:before {
  content: "\f006";
}

#wrapper {
  display: inline-block;
}
#wrapper:hover label:before {
  content: "\f005";
}
#wrapper:hover label:hover ~ label:before {
  content: "\f006";
}
</style>
<body>
<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css">

<h1>Flat pure CSS3 rating system</h1>
 
<div id="wrapper">
	<input type="radio" id="star1" name="star" />
	<label for="star1" onclick="s1()"></label>
	<input type="radio" id="star2" name="star" />
	<label for="star2" onclick="s2()"></label>
	<input type="radio" id="star3" name="star" checked="checked"/>
	<label for="star3" onclick="s3()"></label>
	<input type="radio" id="star4" name="star" />
	<label for="star4" onclick="s4()"></label>
	<input type="radio" id="star5" name="star" />
	<label for="star5" onclick="s5()"></label>
</div>
<script type="text/javascript">
var starnum = 5;
function s1() {
	starnum = 1;
	console.log(starnum);
}
function s2() {
	starnum = 2;
	console.log(starnum);
}
function s3() {
	starnum = 3;
	console.log(starnum);
}
function s4() {
	starnum = 4;
	console.log(starnum);
}
function s5() {
	starnum = 5;
	console.log(starnum);
}
</script>
</body>
</html>