<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Main wrapper -->

    <!-- Header -->
    <header id="wn__header" class="header__area header__absolute sticky__header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <div class="logo">
                        <a href="<c:url value="/home"/>">
                            <img src="<c:url value="/resources/images/logo/logo.png"/>" alt="logo images">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8 d-none d-lg-block">
                    <nav class="mainmenu__nav">
                        <ul class="meninmenu d-flex justify-content-start">
                            <li class="drop with--one--item"><a href="<c:url value="/home"/>">Home</a></li>

                            <li class="drop"><a href="<c:url value="list-book"/>">Books</a>
                                <div class="megamenu mega02">
                                    <ul class="item item02">
                                        <li class="title">Categories</li>
                                        <li><a href="<c:url value="/searchBook?searchWord=novel"/>">Novel</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord=business"/>">Business & Management</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord=children"/>">Children's Books</a></li>
                                        <li><a href="<c:url value="/list-book"/>">Science & References </a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Foreign Languages</a></li>
                                    </ul>
                                    <ul class="item item02">
                                        <li class="title">Customer Favorite</li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Mystery</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Religion & Inspiration</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Romance</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Fiction/Fantasy</a></li>
                                        <li><a href="<c:url value="/searchBook?searchWord="/>">Sleeveless</a></li>
                                    </ul>
                                </div>
                            </li>

                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                        <li class="shop_search"><a class="search__active" href="#"></a></li>
                        <li class="wishlist"><a href="#"></a></li>
                        <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun">
                                    <c:if test="${order eq null}">0</c:if>
                                    <c:if test="${order ne null}">${quantityItems}</c:if>
                                    </span></a>
                                <!-- Start Shopping Cart -->
                                <div class="block-minicart minicart__active">
                                    <div class="minicart-content-wrapper">
                                        <div class="micart__close">
                                            <span>close</span>
                                        </div>
                                        <div class="items-total d-flex justify-content-between">
                                            <span><c:if test="${order eq null}">0</c:if>
                                            <c:if test="${order ne null}">${quantityItems}</c:if> items</span>
                                            <span>Cart Subtotal</span>
                                        </div>
                                        <div class="total_amount text-right">
                                            <span><fmt:formatNumber pattern="###, ###" value="${order.totalAmount - order.totalDiscountAmount}"/></span>
                                    </div>
                                    <div class="mini_action checkout">
                                        <a class="checkout__btn" href="<c:url value="/checkOut"/>">Go to Checkout</a>
                                    </div>

                                    <div class="single__items">
                                        <div class="miniproduct">
                                            <c:forEach var="detail" items="${order.orderDetails}">
                                                <div class="item01 d-flex mt--20">
                                                    <c:forEach items="${detail.book.images}" varStatus="count" var="image">
                                                        <c:if test="${count.index==0}">
                                                            <div class="thumb">
                                                                <a href="#"><img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product images"></a>
                                                            </div>   
                                                        </c:if>
                                                    </c:forEach>

                                                    <div class="content">
                                                        <h6><a href="#">${detail.book.name}</a></h6>
                                                        <span class="prize"><fmt:formatNumber pattern="###, ###" value="${detail.book.price}"/></span>
                                                        <span class="prize">Discount : <fmt:formatNumber pattern="###, ###" value="${detail.book.promotion.discount*100}"/>%</span>
                                                        <div class="product_prize d-flex justify-content-between">
                                                            <span class="qun">${detail.quantity}</span>
                                                            <ul class="d-flex justify-content-end">
                                                                <li><a href="<c:url value="/order-detail"/>"><i class="zmdi zmdi-settings"></i></a></li>
                                                                <li><a href="<c:url value="/removeDetail/${detail.book.id}"/>"><i class="zmdi zmdi-delete"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>   
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <div class="mini_action cart">
                                        <a class="cart__btn" href="<c:url value="/order-detail"/>">View and edit cart</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Shopping Cart -->
                        </li>
                        <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                            <div class="searchbar__content setting__block">
                                <div class="content-inner">
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Currency</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">USD - US Dollar</span>
                                                <ul class="switcher-dropdown">
                                                    <li>GBP - British Pound Sterling</li>
                                                    <li>EUR - Euro</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Language</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">English01</span>
                                                <ul class="switcher-dropdown">
                                                    <li>English02</li>
                                                    <li>English03</li>
                                                    <li>English04</li>
                                                    <li>English05</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Select Store</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">Fashion Store</span>
                                                <ul class="switcher-dropdown">
                                                    <li>Furniture</li>
                                                    <li>Shoes</li>
                                                    <li>Speaker Store</li>
                                                    <li>Furniture</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>My Account</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <div class="setting__menu">
                                                    <span><a href="#">Compare Product</a></span>
                                                    <span><a href="#">My Account</a></span>
                                                    <span><a href="#">My Wishlist</a></span>
                                                    <span><a href="#">Sign In</a></span>
                                                    <span><a href="#">Create An Account</a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Start Mobile Menu -->
            <div class="row d-none">
                <div class="col-lg-12 d-none">
                    <nav class="mobilemenu__nav">
                        <ul class="meninmenu">
                            <li><a href="<c:url value="home"/>">Home</a></li>
                            <li><a href="#">Books</a>
                                <ul>
                                    <li><a href="<c:url value="/searchBook?searchWord="/>">Categories</a></li>
                                    <li><a href="<c:url value="/searchBook?searchWord="/>">Favorite</a></li>
                                    <li><a href="<c:url value="/searchBook?searchWord="/>">All Books</a></li>
                                </ul>
                            </li>
                            <li><a href="<c:url value="/about"/>">About Us</a></li>
                            <li><a href="<c:url value="/contact"/>">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- End Mobile Menu -->
            <div class="mobile-menu d-block d-lg-none">
            </div>
            <!-- Mobile Menu -->	
        </div>		
    </header>
<!-- //Header -->