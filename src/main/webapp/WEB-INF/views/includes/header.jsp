<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>title</title>
   
   <!-- Bootstrap core CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
   
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
   
   <!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
   
   <!-- Bootstrap core JS -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
   
   <meta name="theme-color" content="#7952b3">
   
   <style>
      .wine-header .bd-placeholder-img {
         font-size: 1.125rem;
         text-anchor: middle;
         -webkit-user-select: none;
         -moz-user-select: none;
         user-select: none;
      }
      
      @media (min-width: 768px) {
         .wine-header .bd-placeholder-img-lg {
            font-size: 3.5rem;
         }
      }
      
      .wine-header .b-example-divider {
         height: 3rem;
         background-color: rgba(0, 0, 0, .1);
         border: solid rgba(0, 0, 0, .15);
         border-width: 1px 0;
         box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }
      
      .wine-header .form-control-dark {
         color: #fff;
         background-color: var(--bs-dark);
         border-color: var(--bs-gray);
      }
      
      .wine-header .form-control-dark:focus {
         color: #fff;
         background-color: var(--bs-dark);
         border-color: #fff;
         box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);
      }
      
      .wine-header .bi {
         vertical-align: -.125em;
         fill: currentColor;
         font-size: 24px;
      }
      
      .wine-header .text-small {
         font-size: 85%;
      }
      
      .wine-header .dropdown-toggle {
         outline: 0;
      }
   </style>
</head>


   <header class="wine-header">
     <div class="px-3 py-2 bg-dark text-white">
       <div class="container">
         <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
           <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  			<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
		   </svg>
             너와, IN
           </a>
   
           <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
             <li>
               <a href="#" class="nav-link text-secondary">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
                <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
              </svg>
                 Home
               </a>
             </li>
             
             <li>
               <a href="#" class="nav-link text-white">
                 <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
                <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
              </svg>
                 Orders
               </a>
             </li>
             <li>
               <a href="#" class="nav-link text-white">
                 <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
                <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
              </svg>
                 Products
               </a>
             </li>
             <li>
               <a href="#" class="nav-link text-white">
                 <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
              </svg>
                 Customers
               </a>
             </li>
           </ul>
         </div>
       </div>
     </div>
     
     
     <div class="px-3 py-2 border-bottom mb-3">
       <div class="container d-flex flex-wrap justify-content-center">
       	<div class="container d-flex flex-wrap">
      		<ul class="nav">
			  
			  <li class="nav-item">
			    <a class="nav-link text-secondary" aria-current="page" href="#">Wines</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link text-secondary" href="#">Pairings</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link text-secondary" href="#">Grapes</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link text-secondary" href="#">Regions</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link text-secondary" href="#">Awards</a>
			  </li>
			  
			</ul>
         	
         <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
          <input type="search" class="form-control" placeholder="Search any wine" aria-label="Search">
         </form>
       	</div>
       	
       	<script>
     	 	
       	 	$(".wine-header a.nav-link").click(function () {
         		$(".wine-header li a.text-secondary").removeClass("text-secondary").addClass("text-white");
         			$(this).removeClass("text-white").addClass("text-secondary");
      		});
       	 	
   		</script>
   		
   	         
       </div>
     </div>
   </header>