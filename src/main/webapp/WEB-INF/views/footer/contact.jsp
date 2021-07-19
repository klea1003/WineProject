<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<body>
<div class="container">
  <section class="py-5">
     <div class="container px-5">
         <!-- Contact form-->
         <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
             <div class="text-center mb-5">
                 <div class="feature bg-danger bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                 <p class="lead fw-normal text-muted mb-0">너와, IN 가맹점주를 모십니다.</p>
             </div>
             
             <div class="row gx-5 justify-content-center">
                 <div class="col-lg-8 col-xl-6">
                     <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                         
                         <!-- Name input-->
                         <div class="form-floating mb-3">
                             <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                             <label for="name">성함</label>
                             <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                         </div>
                         
                         <!-- Email address input-->
                         <div class="form-floating mb-3">
                             <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                             <label for="email">이메일</label>
                             <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                             <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                         </div>
                         
                         <!-- Phone number input-->
                         <div class="form-floating mb-3">
                             <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                             <label for="phone">연락처</label>
                             <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                         </div>
                         
                         <!-- Message input-->
                         <div class="form-floating mb-5">
                             <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                             <label for="message">상담받고 싶은 내용</label>
                             <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                         </div>
                         <!-- Submit success message-->
                         
                         <!-- This is what your users will see when the form-->
                         <!-- has successfully submitted-->
                         <div class="d-none" id="submitSuccessMessage">
                             <div class="text-center mb-3">
                                 <div class="fw-bolder">Form submission successful!</div>
                                 To activate this form, sign up at
                                 <br />
                                 <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                             </div>
                         </div>
                         <!-- Submit error message-->
                        
                         <!-- This is what your users will see when there is-->
                         <!-- an error submitting the form-->
                         <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                         <!-- Submit Button-->
                         <div class="justify-content-center text-center">
                         <button class="btn btn-outline-danger" btn-lg disabled" id="submitButton" type="submit">제출하기</button>
                     	 </div>
                     </form>
                 </div>
             </div>
         </div>
               
        <!-- Contact cards-->
        <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
             <div class="justify-content-center text-center col">
                 <div class="feature bg-danger bg-gradient text-white rounded-3 mb-3"><i class="bi bi-chat-dots"></i></div>
                 <div class="h5 fw-bold">Chat with us</div>
                 <p class="text-dark mb-0">카카오톡 상담하기를 이용해주세요</p>
             </div>
             <div class="justify-content-center text-center col">
                 <div class="feature bg-danger bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                 <div class="h5 fw-bold">One Day Class</div>
                 <p class="text-dark mb-3">찾아가는 와인 시음회</p>
                 <p class="text-dark mb-0">쉽고 즐겁게 배우는 원데이 클래스를 제공합니다!</p>
             </div>
             <div class="justify-content-center text-center col">
                 <div class="feature bg-danger bg-gradient text-white rounded-3 mb-3"><i class="bi bi-question-circle"></i></div>
                 <div class="h5 fw-bold">Q&A</div>
                 <p class="text-dark mb-0">1:1 문의게시판을 이용해주세요</p>
             </div>
             <div class="justify-content-center text-center col">
                 <div class="feature bg-danger bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                 <div class="h5 fw-bold">CS</div>
                 <p class="text-dark mb-3">080-732-0101</p>
                 <p class="text-dark mb-0">평일 09:00–17:00</p>
                 <p class="text-dark mb-0">점심시간 12:00-13:00</p>
                 <p class="text-dark mb-0">주말 및 공휴일 휴무</p>
             </div>
        </div>
       </div>
     </section>
</div>

	
<%@ include file="../includes/footer.jsp"%>
</body>
</html>
