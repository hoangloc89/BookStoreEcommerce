<%-- 
    Document   : home-template
    Created on : Jun 20, 2020, 7:13:07 PM
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">       
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="include/css-page.jsp"/>  
    </head>
    <body>      
        <!-- Main wrapper -->
        <div class="wrapper" id="wrapper">
            <jsp:include page="include/header.jsp"/>
            <jsp:include page="include/search-popup.jsp"/>
            <!-- Start Slider area -->
            <div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
                <!-- Start Single Slide -->
                <div class="slide animation__style10 bg-image--1 fullscreen align__center--left">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="slider__content">
                                    <div class="contentbox">
                                        <h2>Buy <span>your </span></h2>
                                        <h2>favorite <span>Book </span></h2>
                                        <h2>from <span>Here </span></h2>
                                        <a class="shopbtn" href="<c:url value="/searchBook?searchWord="/>">shop now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single Slide -->
                <!-- Start Single Slide -->
                <div class="slide animation__style10 bg-image--7 fullscreen align__center--left">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="slider__content">
                                    <div class="contentbox">
                                        <h2>Buy <span>your </span></h2>
                                        <h2>favorite <span>Book </span></h2>
                                        <h2>from <span>Here </span></h2>
                                        <a class="shopbtn" href="<c:url value="searchBook?searchWord="/>">shop now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single Slide -->
            </div>
            <!-- End Slider area -->
            <!-- Start BEst Seller Area -->
            <section class="wn__product__area brown--color pt--80  pb--30">
                <div class="container">
                    <c:if test="${message ne null}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__title text-center" style="background-color: #ccffcc">
                                    <h2 style="color: #0056b3">${status}</h2>
                                    <p style="color: #0069d9">${message}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${message eq null}">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section__title text-center">
                                    <h2 class="title__be--2">New <span class="color--theme">Books</span></h2>
                                    <p>The reading of all good books is like a conversation with the finest minds of past centuries....&nbsp;&nbsp;&nbsp;<b><q>-Rene Descartes-</q></b></p>
                                </div>
                            </div>
                        </div>    
                    </c:if>

                    <!-- Start Single Tab Content -->
                    <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
                        <!-- Start Single Product -->
                        <c:forEach items="${books}" var="book">
                            <div class="product product__style--3">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <c:forEach var="image" items="${book.images}" varStatus="count">
                                            <c:if test="${count.index==0}">
                                                <a class="first__img" href="<c:url value="detail/${book.id}"/>"><img src=" <c:url value="/resources/images/books/${image.name}.jpg"/>" alt="book image"></a>   
                                                </c:if>    
                                                <c:if test="${count.index==1}">    
                                                <a class="second__img animation1" href="<c:url value="detail/${book.id}"/>"><img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>
                                                </c:if>    
                                            </c:forEach>                
                                        <div class="hot__box">
                                            <span class="hot-label">SALE <fmt:formatNumber pattern="###" value="${book.promotion.discount*100}"/>%</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="<c:url value="detail/${book.id}"/>">${book.name}</a></h4>
                                        <ul class="prize d-flex">
                                            <li> <fmt:formatNumber pattern="###, ###" value="${book.price - book.promotion.discount*book.price}"/></li>
                                            <li class="old_prize">
                                                <fmt:formatNumber value="${book.price}" pattern="###,###"/></li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart" href="<c:url value="addCart/${book.id}"/>"><i class="bi bi-shopping-cart-full"></i></a></li>
                                                    <li><a class="wishlist" href="add-favorite/${book.id}"><i class="bi bi-heart-beat"></i></a></li>
                                                    <li><a class="compare" href="<c:url value="detail/${book.id}"/>"><i class="bi bi-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

            </section>
            <!-- Start NEwsletter Area -->
            <section class="wn__newsletter__area bg-image--2">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 offset-lg-5 col-md-12 col-12 ptb--150">
                            <div class="section__title text-center">
                                <h2>Stay With Us</h2>
                            </div>
                            <div class="newsletter__block text-center">
                                <form action="#">
                                    <div class="newsletter__box">
                                        <input type="email" placeholder="Enter your e-mail">
                                        <button>Subscribe</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End NEwsletter Area -->
            <!-- Start Best Seller Area -->
            <section class="wn__bestseller__area bg--white pt--80  pb--30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center">
                                <h2 class="title__be--2">All <span class="color--theme">Books</span></h2>
                                <p>Let us tenderly and kindly cherish, therefore, the means of knowledge. Let us dare to read, think, speak, and write.&nbsp;&nbsp;&nbsp;<b><q>-John Adams-</q></b></p>
                            </div>
                        </div>
                    </div>
                    <div class="row mt--50">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="product__nav nav justify-content-center" role="tablist">
                                <a class="nav-item nav-link active" data-toggle="tab" href="<c:url value="/searchBook?searchWord="/>" role="tab">ALL</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="<c:url value="/searchBook?searchWord=novel"/>" role="tab">NOVEL</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="<c:url value="/searchBook?searchWord=business"/>" role="tab">BUSINESS</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="<c:url value="/searchBook?searchWord=children"/>" role="tab">CHILDREN</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="<c:url value="/searchBook?searchWord="/>" role="tab">SCIENCE</a>
                            </div>
                        </div>
                    </div>
                    <div class="tab__container mt--60">
                        <!-- Start Single Tab Content -->

                        <div class="row single__tab tab-pane fade show active" id="nav-all" role="tabpanel">
                            <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                                <c:forEach items="${books}" var="book">
                                    <div class="single__product">
                                        <!-- Start Single Product -->
                                        <div class="product product__style--3">                                                    
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                                <div class="product__thumb">
                                                    <c:forEach var="image" items="${book.images}" varStatus="count">
                                                        <c:if test="${count.index==0}">
                                                            <a class="first__img" href="<c:url value="detail/${book.id}"/>"><img src=" <c:url value="/resources/images/books/${image.name}.jpg"/>" alt="book image"></a>   
                                                            </c:if>    
                                                            <c:if test="${count.index==1}">    
                                                            <a class="second__img animation1" href="<c:url value="detail/${book.id}"/>"><img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>
                                                            </c:if>    
                                                        </c:forEach>                
                                                    <div class="hot__box">
                                                        <span class="hot-label">BEST SALLER</span>
                                                    </div>
                                                </div>
                                                <div class="product__content content--center">
                                                    <h4><a href="<c:url value="detail/${book.id}"/>">${book.name}</a></h4>
                                                    <ul class="prize d-flex">
                                                        <li> <fmt:formatNumber pattern="###, ###" value="${book.price - book.promotion.discount*book.price}"/></li>
                                                        <li class="old_prize">
                                                            <fmt:formatNumber value="${book.price}" pattern="###,###"/></li>
                                                    </ul>
                                                    <div class="action">
                                                        <div class="actions_inner">
                                                            <ul class="add_to_links">
                                                                <li><a class="cart" href="<c:url value="addCart/${book.id}"/>"><i class="bi bi-shopping-cart-full"></i></a></li>
                                                                <li><a class="wishlist" href="<c:url value="add-favorite/${book.id}"/>"><i class="bi bi-heart-beat"></i></a></li>
                                                                <li><a class="compare" href="<c:url value="detail/${book.id}"/>"><i class="bi bi-search"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product__hover--content">
                                                        <ul class="rating d-flex">
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                            <li><i class="fa fa-star-o"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                        <!-- End Single Product -->
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- Best Sale Area -->
            <section class="best-seel-area pt--80 pb--60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__title text-center pb--50">
                                <h2 class="title__be--2">Best <span class="color--theme">Seller </span></h2>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered lebmid alteration in some ledmid form</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slider center">
                    <!-- Single product start -->
                    <c:forEach items="${books}" var="book" end="7">
                        <div class="product product__style--3">
                            <c:forEach var="image" items="${book.images}" varStatus="count">
                                <c:if test="${count.index==0}">
                                    <div class="product__thumb">
                                        <a class="first__img" href="#"> <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>
                                    </div>
                                </c:if>  
                            </c:forEach>

                            <div class="product__content content--center">
                                <div class="action">
                                    <div class="actions_inner">
                                        <ul class="add_to_links">
                                            <li><a class="cart" href="<c:url value="addCart/${book.id}"/>"><i class="bi bi-shopping-bag4"></i></a></li>
                                            <li><a class="wishlist" href="#"><i class="bi bi-shopping-cart-full"></i></a></li>
                                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link" href="#"><i class="bi bi-search"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product__hover--content">
                                    <ul class="rating d-flex">
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li class="on"><i class="fa fa-star-o"></i></li>
                                        <li><i class="fa fa-star-o"></i></li>
                                        <li><i class="fa fa-star-o"></i></li>
                                    </ul>
                                </div>
                            </div>
                        </div>   
                    </c:forEach>

                </div>
            </section>
            <!-- Single product end -->
            <!-- Best Sale Area Area -->

            <jsp:include page="include/footer.jsp"/>
        </div>
        <!-- //Main wrapper -->

        <!-- js file-->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
