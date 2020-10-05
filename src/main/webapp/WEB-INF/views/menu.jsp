<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>



<!-- Start header -->
<header class="top-header">
    <nav class="navbar header-nav navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="image" style="height:40px;"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" 
            	aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                <ul class="navbar-nav">
                    <li><a class="nav-link active" href="/">Home</a></li>
                    <li><a class="nav-link" href="/review/list">Review</a></li>
                    <li><a class="nav-link" href="/party/list">Party</a></li>
					<li><a class="nav-link" href="/review/ranking">Rank</a></li>
					<li><a class="nav-link" href="/shop/list">Shop</a></li>
					<li><a class="nav-link" href="/aboutus/content">Aboutus</a></li>
					<security:authorize access="!isAuthenticated()">
                    	<li><a class="nav-link active" style="background:#f2184f;color:#fff;" href="/member/login">Login</a></li>
                    	<li><a class="nav-link active" style="background:#f2184f;color:#fff;" href="/member/join">join</a></li>
                    </security:authorize>
                    <security:authorize access="isAuthenticated()">
						<li><a class="nav-link active" style="background:#f2184f;color:#fff;" href="/member/logout">logout</a></li>
						<li><a class="nav-link active" style="background:#f2184f;color:#fff;" href="/member/edit">edit info</a></li>
					</security:authorize>
					<security:authorize access="hasAuthority('ADMIN')">
			   			<li><a class="nav-link active" style="background:#f2184f;color:#fff;" href="/admin/home">admin</a></li>
					</security:authorize>
                    
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->