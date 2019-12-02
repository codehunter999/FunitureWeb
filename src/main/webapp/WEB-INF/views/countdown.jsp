<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=cp %>/resources/assets/css/countdown.css">

<script type="text/javascript">

const second = 1000,minute = second * 60,hour = minute * 60,day = hour * 24;

let countDown = new Date('Dec 26, 2019 00:00:00').getTime(),x = setInterval(function() {

let now = new Date().getTime(), distance = countDown - now;

document.getElementById('days').innerText = Math.floor(distance / (day)),
document.getElementById('hours').innerText = Math.floor((distance % (day)) / (hour)),
document.getElementById('minutes').innerText = Math.floor((distance % (hour)) / (minute)),
document.getElementById('seconds').innerText = Math.floor((distance % (minute)) / second);

//do something later when date is reached
//if (distance < 0) {
//  clearInterval(x);
//  'IT'S MY BIRTHDAY!;
//}

}, second)

</script>


<title>KAALE KLINT</title>
</head>
<body>

	<div class="container">
		<h1 id="head">KAALE KLINT Open Day:</h1>
		<h6><a href="home.fu">KAALE KLINT</a></h6>
		<ul>
			<li><span id="days"></span>days</li>
			<li><span id="hours"></span>Hours</li>
			<li><span id="minutes"></span>Minutes</li>
			<li><span id="seconds"></span>Seconds</li>
		</ul>
	</div>
	
</body>
</html>