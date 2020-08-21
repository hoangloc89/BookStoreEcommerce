<%-- 
    Document   : list-book
    Created on : Jul 18, 2020, 9:08:31 AM
    Author     : DIENMAYXANH
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shop-Grid | Bookshop Responsive Bootstrap4 Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="include/css-page.jsp"/>
    </head>
    <body>

        <!-- Main wrapper -->
        <div class="wrapper" id="wrapper">

            <!-- Header -->
            <jsp:include page="include/header.jsp"/>
            <!-- //Header -->
            <!-- Start Search Popup -->
            <jsp:include page="include/search-popup.jsp"/>
            <!-- End Search Popup -->
            <!-- Start Bradcaump area -->
            <div class="ht__bradcaump__area bg-image--3">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="bradcaump__inner text-center">
                                <h2 class="bradcaump-title">Book Store</h2>
                                <nav class="bradcaump-content">
                                    <a class="breadcrumb_item" href="<c:url value="home"/>">Home</a>
                                    <span class="brd-separetor">/</span>
                                    <span class="breadcrumb_item active">All Books</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Bradcaump area -->
            <!-- Start Shop Page -->
            <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
                            <div class="shop__sidebar">
                                <aside class="wedget__categories poroduct--cat">
                                    <h3 class="wedget__title">Book Categories</h3>
                                    <ul>
                                        <c:forEach var="category" items="${categories}">
                                            <li><a href="#">${category.name} <span>(4)</span></a></li>   
                                            </c:forEach>
                                    </ul>
                                </aside>

                                <aside class="wedget__categories poroduct--tag">
                                    <h3 class="wedget__title">Product Tags</h3>
                                    <ul>
                                        <c:forEach var="category" items="${categories}">
                                            <li><a href="#">${category.name}</a></li>   
                                            </c:forEach>
                                    </ul>
                                </aside>
                                <aside class="wedget__categories sidebar--banner">
                                    <img src="<c:url value="/resources/images/others/banner_left.jpg"/>" alt="banner images">
                                    <div class="text">
                                        <h2>new book</h2>
                                        <h6>save up to <br> <strong>50%</strong>off</h6>
                                    </div>
                                </aside>
                            </div>
                        </div>

                        <div class="col-lg-9 col-12 order-1 order-lg-2">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                        <div class="shop__list nav justify-content-center" role="tablist">
                                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-grid" role="tab"><i class="fa fa-th"></i></a>
                                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-list" role="tab"><i class="fa fa-list"></i></a>
                                        </div>
                                        <p>Showing your search results</p> 
                                    </div>
                                </div>
                            </div>
                            <div class="tab__container">
                                <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">
                                    <div class="row">
                                        <!-- Start Single Product -->
                                        <c:forEach items="${result}" var="book">
                                            <div class="product product__style--3 col-lg-3 col-md-4 col-sm-6 col-12">
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
                                                        <li><fmt:formatNumber value="${book.price-book.price*book.promotion.discount}" pattern="###,###"/></li></li>
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
                                        </c:forEach>
                                        <!-- End Single Product -->
                                        <div class="shop-grid tab-pane fade" id="nav-list" role="tabpanel">
                                            <div class="list__view__wrapper"> 
                                                <!-- Start Single Product -->
                                                <c:forEach items="${result}" var="book">
                                                        <div class="list__view">
                                                            <div class="thumb">
                                                                <c:forEach var="image" items="${book.images}" varStatus="count">
                                                                    <c:if test="${count.index==0}">
                                                                        <a class="first__img" href="<c:url value="detail/${book.id}"/>"><img src=" <c:url value="/resources/images/books/${image.name}.jpg"/>" alt="book image"></a>   
                                                                        </c:if>    
                                                                        <c:if test="${count.index==1}">    
                                                                        <a class="second__img animation1" href="<c:url value="detail/${book.id}"/>"><img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>
                                                                        </c:if>    
                                                                    </c:forEach>                
                                                            </div>
                                                            <div class="content">
                                                                <h2><a href="<c:url value="/detail/${book.id}"/>">${book.name}</a></h2>
                                                                <ul class="rating d-flex">
                                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                    <li><i class="fa fa-star-o"></i></li>
                                                                </ul>
                                                                <ul class="prize__box">
                                                                    <li><fmt:formatNumber pattern="###,###" value="${book.price - book.price*book.promotion.discount}"/></li>
                                                                    <li class="old__prize"><fmt:formatNumber pattern="###,###" value="${book.price}"/></li>
                                                                </ul>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla.</p>
                                                                <ul class="cart__action d-flex">
                                                                    <li class="cart"><a href="<c:url value="/addCart/${book.id}"/>">Add to cart</a></li>
                                                                    <li class="wishlist"><a href="#"></a></li>
                                                                    <li class="compare"><a href="<c:url value="/detail/${book.id}"/>"></a></li>
                                                                </ul>

                                                            </div>
                                                        </div>    
                                                </c:forEach>
                                                <!-- End Single Product -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End Shop Page -->
            <!-- Footer Area -->
            <jsp:include page="include/footer.jsp"/>
            <!-- //Footer Area -->

        </div>

        <!-- //Main wrapper -->

        <!-- JS Files -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>