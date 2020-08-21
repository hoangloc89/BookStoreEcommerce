<%-- 
    Document   : order-detail
    Created on : Jul 10, 2020, 4:34:22 PM
    Author     : DIENMAYXANH
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shopping Cart | Bookshop Responsive Bootstrap4 Template</title>
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
                                <h2 class="bradcaump-title">Thank you for Order</h2>
                                <nav class="bradcaump-content">
                                    <a class="breadcrumb_item" href="#">Home Page</a>
                                    <span class="brd-separetor">/</span>
                                    <span class="breadcrumb_item active">Your Order Details</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Bradcaump area -->
            <!-- cart-main-area start -->
            <div class="cart-main-area section-padding--lg bg--white">
                <div class="container">
                    <div class="row">
                        <h4 style="color: blue">Order info</h4>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12 col-sm-12 ol-lg-12">

                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-subtotal">Discount</th>
                                            <th class="product-subtotal">Quantity</th>
                                            <th class="product-quantity">Unit Price</th>      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="detail" items="${orderDetails}">
                                            <tr>
                                                <c:forEach items="${detail.book.images}" varStatus="count" var="image">
                                                    <c:if test="${count.index==0}"> 
                                                        <td class="product-thumbnail">
                                                            <img src="<c:url value="/resources/images/books/${image.name}.jpg"/>" alt="product images"></td>       
                                                        </c:if>
                                                    </c:forEach>
                                                <td class="product-name"><a href="#">${detail.book.name}</a></td>
                                                <td class="product-price"><span class="amount"><fmt:formatNumber pattern="###, ###" value="${detail.book.price}"/>&nbsp;VNĐ</span></td>
                                                <td class="product-subtotal"><fmt:formatNumber pattern="###, ###" value="${detail.book.promotion.discount*100}"/>&nbsp;%</td>
                                                <td class="product-quantity">${detail.quantity}</td>
                                                <td class="product-subtotal"><fmt:formatNumber pattern="###, ###" value="${detail.amount-detail.discountAmount}"/>&nbsp;VNĐ</td> 
                                            </tr>  
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <h4 style="color: blue">Customer info</h4>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12 col-sm-12 ol-lg-12">

                            <div class="table-content wnro__table table-responsive">
                                <table>
                                    <thead>
                                        <tr class="title-top">
                                            <th class="product-thumbnail">Customer Name</th>
                                            <th class="product-name">Email</th>
                                            <th class="product-price">Address Shipping</th>
                                            <th class="product-subtotal">Phone number</th>
                                            <th class="product-subtotal">Order Date</th>   
                                        </tr>
                                    </thead>
                                    <tbody>             
                                            <tr>
                                                <td class="product-name"><a href="#">${orders.name}</a></td>
                                                <td class="product-name"><a href="#">${orders.email}</a></td>
                                                <td class="product-name"><a href="#">${orders.address}</a></td>
                                                <td class="product-name"><a href="#">${orders.phoneNumber}</a></td>
                                                <td class="product-name"><a href="#"><fmt:formatDate pattern="dd-MM-yyyy" value="${orders.orderDate}"/></a></td>  
                                            </tr>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-6 offset-lg-6">
                            <div class="cartbox__total__area">
                                <div class="cartbox-total d-flex justify-content-between">
                                    <ul class="cart__total__list">
                                        <li>Cart total</li>
                                        <li>Discount Amount</li>
                                    </ul>
                                    <ul class="cart__total__tk">
                                        <li><fmt:formatNumber pattern="###, ###" value="${orders.totalAmount}"/>&nbsp;VNĐ</li>
                                        <li><fmt:formatNumber pattern="###, ###" value="${orders.totalDiscountAmount}"/>&nbsp;VNĐ</li>
                                    </ul>
                                </div>
                                <div class="cart__total__amount">
                                    <span>Grand Total</span>
                                    <span><fmt:formatNumber pattern="###, ###" value="${orders.totalAmount - orders.totalDiscountAmount}"/>&nbsp;VNĐ</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
            <!-- cart-main-area end -->
            <!-- Footer Area -->
            <jsp:include page="include/footer.jsp"/>
            <!-- //Footer Area -->

        </div>
        <!-- //Main wrapper -->

        <!-- JS Files -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
