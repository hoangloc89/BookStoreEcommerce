<%-- 
    Document   : book-detail
    Created on : Jul 10, 2020, 9:55:17 AM
    Author     : DIENMAYXANH
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book-Detail | Book shop Online</title>
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
            <div class="ht__bradcaump__area bg-image--4">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="bradcaump__inner text-center">
                                <h2 class="bradcaump-title">Book Detail</h2>
                                <nav class="bradcaump-content">
                                    <a class="breadcrumb_item" href="<c:url value="/home"/>">Home</a>
                                    <span class="brd-separetor">/</span>
                                    <span class="breadcrumb_item active">Book Detail</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- End Bradcaump area -->
            <!-- Start main Content -->
            <div class="maincontent bg--white pt--80 pb--55">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-12">
                            <div class="wn__single__product">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="wn__fotorama__wrapper">
                                            <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                                <c:forEach var="image" items="${book.images}">
                                                    <a href="#"><img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt=""></a>   
                                                    </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="product__info__main">
                                            <h1>${book.name}</h1>
                                            <div class="product-reviews-summary d-flex">
                                                <ul class="rating-summary d-flex">
                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                                </ul>
                                            </div>
                                            <div class="price-box">
                                                <span><fmt:formatNumber pattern="###,###" value="${book.price}"/> </span>
                                            </div>
                                            <div class="product__overview">
                                                <p>Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.</p>
                                                <p><b>Author : ${book.author}</b></p>
                                                <p><b>Number of page : ${book.numberOfPage}</b></p>
                                                <p><b>Publish Date : <fmt:formatDate pattern="dd-MM-yyyy" value="${book.publishDate}"/></b></p>
                                            </div>
                                            <div class="box-tocart d-flex">
                                                <span>Qty</span>
                                                <input id="qty" class="input-text qty" name="qty" min="1" value="1" title="Qty">
                                                <div class="addtocart__actions">
                                                    <button class="tocart" type="submit" title="Add to Cart" onclick="location.href = '<c:url value="/addCart/${book.id}"/>'">Add to Cart</button>
                                                </div>
                                                <div class="product-addto-links clearfix">
                                                    <a class="wishlist" href="#"></a>
                                                    <a class="compare" href="#"></a>
                                                </div>
                                            </div>
                                            <div class="product_meta">
                                                <span class="posted_in">Categories: 
                                                    <a href="<c:url value="/searchBook?searchWord=${book.category.name}"/>">${book.category.name}</a>
                                                </span>
                                            </div>
                                            <div class="product-share">
                                                <ul>
                                                    <li class="categories-title">Share :</li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="icon-social-twitter icons"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="icon-social-tumblr icons"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="icon-social-facebook icons"></i>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <i class="icon-social-linkedin icons"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product__info__detailed">
                                <div class="pro_details_nav nav justify-content-start" role="tablist">
                                    <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details" role="tab">Details</a>
                                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-review" role="tab">Reviews</a>
                                </div>
                                <div class="tab__container">
                                    <!-- Start Single Tab Content -->
                                    <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                                        <div class="description__attribute">
                                            <p>Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.</p>
                                            <ul>
                                                <li>• Author : ${book.author}</li>
                                                <li>• ISBN : ${book.isbn}</li>
                                                <li>• Publishing Company : ${book.publishCompany} </li>
                                                <li>• Number of page : ${book.numberOfPage}</li>
                                                <li>• Size : ${book.size}</li>
                                                <li>• Weight : ${book.weight}</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Single Tab Content -->
                                    <!-- Start Single Tab Content -->
                                    <div class="pro__tab_label tab-pane fade" id="nav-review" role="tabpanel">
                                        <div class="review__attribute">
                                            <h1>Customer Reviews</h1>
                                            <h2>Hastech</h2>
                                            <div class="review__ratings__type d-flex">
                                                <div class="review-ratings">
                                                    <div class="rating-summary d-flex">
                                                        <span>Quality</span>
                                                        <ul class="rating d-flex">
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>

                                                    <div class="rating-summary d-flex">
                                                        <span>Price</span>
                                                        <ul class="rating d-flex">
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>
                                                    <div class="rating-summary d-flex">
                                                        <span>value</span>
                                                        <ul class="rating d-flex">
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="review-content">
                                                    <p>Hastech</p>
                                                    <p>Review by Hastech</p>
                                                    <p>Posted on 11/6/2018</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-fieldset">
                                            <h2>You're reviewing:</h2>
                                            <h3>${book.name}</h3>
                                            <div class="review-field-ratings">
                                                <div class="product-review-table">
                                                    <div class="review-field-rating d-flex">
                                                        <span>Quality</span>
                                                        <ul class="rating d-flex">
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>
                                                    <div class="review-field-rating d-flex">
                                                        <span>Price</span>
                                                        <ul class="rating d-flex">
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>
                                                    <div class="review-field-rating d-flex">
                                                        <span>Value</span>
                                                        <ul class="rating d-flex">
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                            <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="review_form_field">
                                                <div class="input__box">
                                                    <span>Nickname</span>
                                                    <input id="nickname_field" type="text" name="nickname">
                                                </div>
                                                <div class="input__box">
                                                    <span>Summary</span>
                                                    <input id="summery_field" type="text" name="summery">
                                                </div>
                                                <div class="input__box">
                                                    <span>Review</span>
                                                    <textarea name="review"></textarea>
                                                </div>
                                                <div class="review-form-actions">
                                                    <button>Submit Review</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Single Tab Content -->
                                </div>
                            </div>
                            <div class="wn__related__product pt--80 pb--50">
                                <div class="section__title text-center">
                                    <h2 class="title__be--2">Related Products</h2>
                                </div>
                                <div class="row mt--60">
                                    <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                        <c:forEach items="${bookRelated}" var="reBook">
                                            <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                <div class="product__thumb">
                                                    <c:forEach items="${reBook.images}" var="image" varStatus="count">
                                                        <c:if test="${count.index==0}">
                                                            <a class="first__img" href="<c:url value="detail/${reBook.id}"/>">
                                                                <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>    
                                                            </c:if>
                                                            <c:if test="${count.index==1}">
                                                            <a class="second__img animation1" href="<c:url value="detail/${reBook.id}"/>">
                                                                <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>   
                                                            </c:if>
                                                        </c:forEach>
                                                    <div class="hot__box">
                                                        <span class="hot-label">BEST SALLER</span>
                                                    </div>
                                                </div>    
                                                <div class="product__content content--center">
                                                    <h4><a href="<c:url value="detail/${reBook.id}"/>">${reBook.name}</a></h4>
                                                    <ul class="prize d-flex">
                                                        <li>$35.00</li>
                                                        <li class="old_prize"><fmt:formatNumber pattern="###, ###" value="${reBook.price}"/></li>
                                                    </ul>
                                                    <div class="action">
                                                        <div class="actions_inner">
                                                            <ul class="add_to_links">
                                                                <li><a class="cart" href="<c:url value="addCart/${reBook.id}"/>"><i class="bi bi-shopping-cart-full"></i></a></li>
                                                                <li><a class="wishlist" href="add-favorite/${reBook.id}"><i class="bi bi-heart-beat"></i></a></li>
                                                                <li><a class="compare" href="<c:url value="detail/${reBook.id}"/>"><i class="bi bi-search"></i></a></li>
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
                                                <!-- End Single Product -->
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>

                            <div class="wn__related__product">
                                <div class="section__title text-center">
                                    <h2 class="title__be--2">upsell products</h2>
                                </div>
                                <div class="row mt--60">
                                        <!-- Start Single Product -->
                                        <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                            <c:forEach items="${bookRelated}" var="reBook">
                                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                                    <div class="product__thumb">
                                                        <c:forEach items="${reBook.images}" var="image" varStatus="count">
                                                            <c:if test="${count.index==0}">
                                                                <a class="first__img" href="<c:url value="detail/${reBook.id}"/>">
                                                                    <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>    
                                                                </c:if>
                                                                <c:if test="${count.index==1}">
                                                                <a class="second__img animation1" href="<c:url value="detail/${reBook.id}"/>">
                                                                    <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product image"></a>   
                                                                </c:if>
                                                            </c:forEach>
                                                        <div class="hot__box">
                                                            <span class="hot-label">BEST SALLER</span>
                                                        </div>
                                                    </div>    
                                                    <div class="product__content content--center">
                                                        <h4><a href="<c:url value="detail/${reBook.id}"/>">${reBook.name}</a></h4>
                                                        <ul class="prize d-flex">
                                                            <li>$35.00</li>
                                                            <li class="old_prize"><fmt:formatNumber pattern="###, ###" value="${reBook.price}"/></li>
                                                        </ul>
                                                        <div class="action">
                                                            <div class="actions_inner">
                                                                <ul class="add_to_links">
                                                                    <li><a class="cart" href="<c:url value="addCart/${reBook.id}"/>"><i class="bi bi-shopping-cart-full"></i></a></li>
                                                                    <li><a class="wishlist" href="add-favorite/${reBook.id}"><i class="bi bi-heart-beat"></i></a></li>
                                                                    <li><a class="compare" href="<c:url value="detail/${reBook.id}"/>"><i class="bi bi-search"></i></a></li>
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
                                                    <!-- End Single Product -->
                                                </div>
                                            </c:forEach>     
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                                <div class="shop__sidebar">
                                    <aside class="wedget__categories poroduct--cat">
                                        <h3 class="wedget__title">Book Categories</h3>
                                        <ul>
                                            <c:forEach var="category" items="${category}">
                                                <li><a href="#">${category.name}<span>(3)</span></a></li>    
                                                </c:forEach>    
                                        </ul>
                                    </aside>

                                    <aside class="wedget__categories poroduct--tag">
                                        <h3 class="wedget__title">Product Tags</h3>
                                        <ul>
                                            <c:forEach var="category" items="${category}">
                                                <li><a href="#">${category.name}<span>(3)</span></a></li>    
                                                </c:forEach>  
                                        </ul>
                                    </aside>
                                    <aside class="wedget__categories sidebar--banner">
                                        <img src="<c:url value="/resources/images/others/banner_left.jpg"/>" alt="banner images">
                                        <div class="text">
                                            <h2>new products</h2>
                                            <h6>save up to <br> <strong>40%</strong>off</h6>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End main Content -->
                <!-- Start Search Popup -->
                <jsp:include page="include/search-popup.jsp"/>
                <!-- End Search Popup -->
                <!-- Footer Area -->
                <jsp:include page="include/footer.jsp"/>
                <!-- //Footer Area -->
                <!-- QUICKVIEW PRODUCT -->
                <div id="quickview-wrapper">
                    <!-- Modal -->
                    <div class="modal fade" id="productmodal" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal__container" role="document">
                            <div class="modal-content">
                                <div class="modal-header modal__header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="modal-product">
                                        <!-- Start product images -->
                                        <div class="product-images">
                                            <div class="main-image images">
                                                <img alt="big images" src="images/product/big-img/1.jpg">
                                            </div>
                                        </div>
                                        <!-- end product images -->
                                        <div class="product-info">
                                            <h1>Simple Fabric Bags</h1>
                                            <div class="rating__and__review">
                                                <ul class="rating">
                                                    <li><span class="ti-star"></span></li>
                                                    <li><span class="ti-star"></span></li>
                                                    <li><span class="ti-star"></span></li>
                                                    <li><span class="ti-star"></span></li>
                                                    <li><span class="ti-star"></span></li>
                                                </ul>
                                                <div class="review">
                                                    <a href="#">4 customer reviews</a>
                                                </div>
                                            </div>
                                            <div class="price-box-3">
                                                <div class="s-price-box">
                                                    <span class="new-price">$17.20</span>
                                                    <span class="old-price">$45.00</span>
                                                </div>
                                            </div>
                                            <div class="quick-desc">
                                                Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.
                                            </div>
                                            <div class="select__color">
                                                <h2>Select color</h2>
                                                <ul class="color__list">
                                                    <li class="red"><a title="Red" href="#">Red</a></li>
                                                    <li class="gold"><a title="Gold" href="#">Gold</a></li>
                                                    <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                                    <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                                </ul>
                                            </div>
                                            <div class="select__size">
                                                <h2>Select size</h2>
                                                <ul class="color__list">
                                                    <li class="l__size"><a title="L" href="#">L</a></li>
                                                    <li class="m__size"><a title="M" href="#">M</a></li>
                                                    <li class="s__size"><a title="S" href="#">S</a></li>
                                                    <li class="xl__size"><a title="XL" href="#">XL</a></li>
                                                    <li class="xxl__size"><a title="XXL" href="#">XXL</a></li>
                                                </ul>
                                            </div>
                                            <div class="social-sharing">
                                                <div class="widget widget_socialsharing_widget">
                                                    <h3 class="widget-title-modal">Share this product</h3>
                                                    <ul class="social__net social__net--2 d-flex justify-content-start">
                                                        <li class="facebook"><a href="#" class="rss social-icon"><i class="zmdi zmdi-rss"></i></a></li>
                                                        <li class="linkedin"><a href="#" class="linkedin social-icon"><i class="zmdi zmdi-linkedin"></i></a></li>
                                                        <li class="pinterest"><a href="#" class="pinterest social-icon"><i class="zmdi zmdi-pinterest"></i></a></li>
                                                        <li class="tumblr"><a href="#" class="tumblr social-icon"><i class="zmdi zmdi-tumblr"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="addtocart-btn">
                                                <a href="#">Add to cart</a>
                                            </div>
                                        </div><!-- .product-info -->
                                    </div><!-- .modal-product -->
                                </div><!-- .modal-body -->
                            </div><!-- .modal-content -->
                        </div><!-- .modal-dialog -->
                    </div>
                    <!-- END Modal -->
                </div>
                <!-- END QUICKVIEW PRODUCT -->

            </div>
            <!-- //Main wrapper -->



            <!-- JS Files -->
            <jsp:include page="include/js-page.jsp"/>

    </body>
</html>
