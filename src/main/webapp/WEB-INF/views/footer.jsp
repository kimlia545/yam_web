<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


    <!-- Start Footer -->
    <footer class="footer-box">
        <div class="container">
            <div class="row" style="width:100%;">
                <div class="col-md-12 margin-bottom_30">
				   <img src="${pageContext.request.contextPath}/resources/img/f_logo.png" alt="#" style="height:45px;"/>
				</div>
               <div class="col-xl-6 white_fonts">
                    <div class="row">
					<div class="col-md-12 white_fonts margin-bottom_30">
					   <h3>Contact Us</h3>
					</div>
                        <div class="col-md-4">
                            <div class="full icon">
                                <img src="${pageContext.request.contextPath}/resources/images/social1.png">
                            </div>
                            <div class="full white_fonts">
                                <p>Busan<br>Republic of Korea</p>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="full icon">
                                <img src="${pageContext.request.contextPath}/resources/images/social2.png">
                            </div>
                            <div class="full white_fonts">
                                <p>busan20_yam@gmail.com</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="full icon">
                                <img src="${pageContext.request.contextPath}/resources/images/social3.png">
                            </div>
                            <div class="full white_fonts">
                                <p>+821011112222</p>
                            </div>
                        </div>
						<div class="col-md-12">
						   <ul class="full social_icon margin-top_20">
                                <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
						</div>
                    </div>
                </div>
				
				 <div class="col-xl-6 white_fonts">
				    <div class="row">
					   <div class="col-md-6">
					     <div class="footer_blog footer_menu">
						    <h3>Menu</h3>
						    <ul> 
							  <li><a href="/">Home</a></li>
							  <li><a href="/review/list">Review</a></li>
							  <li><a href="/shop/list">Shop</a></li>
							  <li><a href="/party/list">Party</a></li>
							  <li><a href="/review/ranking">Rank</a></li>
							</ul>
						 </div>
						 <div class="footer_blog recent_post_footer">
						   <h3>Recent Post</h3>
						    <ul> 
							  <li>Recent1</li>
							  <li>Recent2</li>
							  <li>Recent3</li>
							  <li>Recent4</li>
							  <li>Recent5</li>
							</ul>
						   
						   <!--  
						   <ul>
						   <c:forEach var="tmp" items="${list}">
							<li style="text-align:left; vertical-align:middle; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
							
							</li>
							</c:forEach>
							</ul>
							-->
							
						 </div>
					   </div>
					   <div class="col-md-6">
					     <div class="footer_blog full">
						     <h3>Newsletter</h3>
							 <div class="newsletter_form">
							    <form action="index.html">
								   <input type="email" placeholder="Your Email" name="#" required />
								   <button>Submit</button>
								</form>
							 </div>
						 </div>
					   </div>
					</div>
				 </div>

            </div>
            
        </div>
    </footer>
    <!-- End Footer -->

    <div class="footer_bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <p class="crp">© Copyright 2020 YAM - All Rights Reserved</p>
                    <ul class="bottom_menu">
                        <li><a href="#">Term of Service</a></li>
                        <li><a href="#">Privacy</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>