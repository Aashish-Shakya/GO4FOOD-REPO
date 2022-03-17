
<style>
* {
	margin: 0;
	padding: 0;
}

h3.msg {
    text-align: center;
    color: red;
}

li.user {
    margin-right: -10%;
    color: red;
}

.navBar {
	display: flex;
	align-items: center;
	justify-content: center;
	position: sticky;
	top: 0;
	cursor: pointer;
	background-color: black; /* color of nav bar*/
	z-index: 100;
}

.nav-list {
	width: 70%;
	display: flex;
	align-items: center;
}

.nav-list li {
	list-style: none;
	padding: 14px;
}

.left {
	color: white;
	display: flex;
	font-size: 26px;
	color: lightblue;
	transition-property: color;
	transition-duration: 2s;
	transition-timing-function: ease;
}

.left:hover {
	color: blue;
}

.logo {
	width: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 8px;
}

.logo img {
	width: 35px;
	height: 32px;
	border: 2px solid white;
	border-radius: 40px;
}

.nav-list li a {
	text-decoration: none;
	color: white;
	font-family: 'Source Sans Pro', sans-serif;;
	font-size: 20px;
	margin-left: 30px;
	width: 100%;
	transition-property: color;
	transition-duration: 0.2s;
	transition-timing-function: ease-in-out;
}

li a:hover {
	color: red;
}

.rightNav {
	width: 30%;
	text-align: right;
}

.background1 {
	background: rgba(0, 0, 0, 0.7) url(images/alter.jpg);
	background-size: cover;
	background-blend-mode: darken;
}

.firstSection {
	height: 100vh;
}

.box-main {
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: auto;
	max-width: 50%;
	height: 80%;
}

.firstHalf {
	width: 900px;
}

.secondHalf {
	width: 30%;
	margin-top: 5%;;
}

.secondHalf img {
	width: 60%;
	border: 4px solid white;
	border-radius: 150px;
	display: block;
	margin: auto;
}


.text-bigger {
	font-size: 70px;
	font-family: 'Shojumaru', cursive;
	text-align: center;
	align-items: center;
	color: #ffd400d1;
 
}

.text-big {
	font-size: 50px;
	font-family: 'Oleo Script', cursive;
}

.text-small {
	font-size: 40px;
	font-family: 'Corinthia', cursive;
}

.section {
	height: 700px;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	max-width: 80%;
	margin: auto;
}

.imgfluid {
	border-radius: 40px;
	border: 2px solid white;
	margin-right: -140px;
}
 
.footer {
	padding: 20px 333px;
	background-color: rgba(0, 0, 0, 0.897);
	text-align: center;
}

.footer .social a {
	font-size: 50px;
	color: blue;
	width: 6px;
	height: 10px;
	line-height: 40px;
	display: inline-block;
	transition-property: opacity;
	transition-duration: 1s;
	transition-timing-function: ease-in-out;
	margin: 30px 50px;
	opacity: 40%;
}

.footer .social a:hover {
	opacity: 100%;
}

.footer ul {
	margin-top: 33px;
	padding: 4px;
	list-style: none;
	font-size: 20px;
	line-height: 300%;
	margin-bottom: 18px;
	text-align: center;
}

.footer ul li a {
	color: white;
	text-decoration: none;
	opacity: 27;
	transition-property: opacity;
	transition-duration: 1s;
	transition-timing-function: ease-in-out;
}

.footer ul li {
	display: inline;
	padding: 0 28px;
}

.footer ul li a:hover {
	opacity: 0.2;
}

.footer .copyright {
	margin-top: 15px;
	text-align: center;
	font-size: 12px;
	color: white;
}

@media only screen and (max-width:750px) {
	.nav-list {
		flex-direction: column;
	}
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Holtwood+One+SC&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oleo+Script&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Shojumaru&display=swap"
	rel="stylesheet">

