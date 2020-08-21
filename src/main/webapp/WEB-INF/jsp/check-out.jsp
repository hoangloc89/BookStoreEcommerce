<%-- 
    Document   : check-out
    Created on : Jul 15, 2020, 10:13:42 PM
    Author     : DIENMAYXANH
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Checkout | Bookshop Online Website</title>
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
                                <h2 class="bradcaump-title">Checkout</h2>
                                <nav class="bradcaump-content">
                                    <a class="breadcrumb_item" href="<c:url value="home"/>">Home</a>
                                    <span class="brd-separetor">/</span>
                                    <span class="breadcrumb_item active">Checkout</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Bradcaump area -->

            <!-- Start Checkout Area -->
            <section class="wn__checkout__area section-padding--lg bg__white">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="wn_checkout_wrap">
                                <div class="checkout_info">
                                    <span>Returning customer ?</span>
                                    <a class="showlogin" href="#">Click here to login</a>
                                </div>
                                <div class="checkout_login">
                                    <form class="wn__checkout__form" action="#">
                                        <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer please proceed to the Customer information section.</p>

                                        <div class="input__box">
                                            <label>Username or email <span>*</span></label>
                                            <input type="text">
                                        </div>

                                        <div class="input__box">
                                            <label>password <span>*</span></label>
                                            <input type="password">
                                        </div>
                                        <div class="form__btn">
                                            <button>Login</button>
                                            <label class="label-for-checkbox">
                                                <input id="rememberme" name="rememberme" value="forever" type="checkbox">
                                                <span>Remember me</span>
                                            </label>
                                            <a href="#">Lost your password?</a>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <mvc:form action="do-checkOut" method="POST" modelAttribute="orderInfo">
                                <div class="customer_details">
                                    <h3>Customer information</h3>
                                    <div class="customar__field">                                        
                                        <div class="input_box">
                                            <label>Your Name <span>*</span></label>
                                            <input type="text" name="name" required>
                                        </div>                                                                                   
                                        <div class="input_box">
                                            <label>Company name</label>
                                            <input type="text">
                                        </div>        						
                                        <div class="input_box">
                                            <label>Address <span>*</span></label>
                                            <input type="text" name="address" placeholder="Your address" required>
                                        </div>
                                        <div class="margin_between">
                                            <div class="input_box space_between">
                                                <label>Phone <span>*</span></label>
                                                <input type="text" name="phoneNumber" required>
                                            </div>

                                            <div class="input_box space_between">
                                                <label>Email address <span>*</span></label>
                                                <input type="email" name="email" required>
                                            </div>
                                        </div>
                                        <div class="margin_between">
                                            <div class="input_box space_between">
                                                <label>Birth Date</label>
                                                <input type="date" name="birtDate">
                                            </div>

                                            <div class="input_box space_between">
                                                <label>Gender</label>
                                                <input type="text" name="gender">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="create__account">
                                        <div class="wn__accountbox">
                                            <input class="input-checkbox" name="createaccount" value="1" type="checkbox">
                                            <span>Create an account ?</span>
                                        </div>
                                        <div class="account__field">
                                            <form action="#">
                                                <label>Account password <span>*</span></label>
                                                <input type="text" placeholder="password" name="password">
                                            </form>
                                        </div>
                                    </div>
                                    <div class="cartbox__btn">
                                        <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                                            <li><a href="<c:url value="order-detail"/>">Back Cart</a></li>
                                            <li><button class="btn-lg btn-info" type="submit"> Submit Order</button></li>
                                        </ul>
                                    </div>
                                </div>       
                            </mvc:form>
                        </div>
                        <div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
                            <div class="wn__order__box">
                                <h3 class="onder__title">Your order</h3>
                                <ul class="order__total">
                                    <li>Product</li>
                                    <li>Total</li>
                                </ul>
                                <ul class="order_product">
                                    <c:forEach var="detail" items="${order.orderDetails}">
                                        <li>${detail.book.name} × ${detail.quantity}<span><fmt:formatNumber pattern="###, ###" value="${detail.amount}"/>(VNĐ)</span></li>  
                                        </c:forEach>	
                                </ul>
                                <ul class="shipping__method">
                                    <li>Subtotal <span><fmt:formatNumber pattern="###, ###" value="${order.totalAmount}"/>(VNĐ)</span></li>
                                    <li>Discount <span><fmt:formatNumber pattern="###, ###" value="${order.totalDiscountAmount}"/>(VNĐ)</span></li>	
                                </ul>
                                <ul class="total__amount">
                                    <li>Order Total <span><fmt:formatNumber pattern="###, ###" value="${order.totalAmount - order.totalDiscountAmount}"/>(VNĐ)</span></li>
                                </ul>                               
                            </div>
                            <div id="accordion" class="checkout_accordion mt--30" role="tablist">
                                <div class="payment">
                                    <div class="che__header" role="tab" id="headingOne">
                                        <a class="checkout__title" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <span>Direct Bank Transfer</span>
                                        </a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="payment-body">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</div>
                                    </div>
                                </div>
                                <div class="payment">
                                    <div class="che__header" role="tab" id="headingTwo">
                                        <a class="collapsed checkout__title" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <span>Cheque Payment</span>
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="payment-body">Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</div>
                                    </div>
                                </div>
                                <div class="payment">
                                    <div class="che__header" role="tab" id="headingThree">
                                        <a class="collapsed checkout__title" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <span>Cash on Delivery</span>
                                        </a>
                                    </div>
                                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="payment-body">Pay with cash upon delivery.</div>
                                    </div>
                                </div>
                                <div class="payment">
                                    <div class="che__header" role="tab" id="headingFour">
                                        <a class="collapsed checkout__title" data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            <span>PayPal <img src="<c:url value="/resources/images/icons/payment.png"/>" alt="payment images"> </span>
                                        </a>
                                    </div>
                                    <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
                                        <div class="payment-body">Pay with cash upon delivery.</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- End Checkout Area -->

            <!-- Footer Area -->
            <jsp:include page="include/footer.jsp"/>
            <!-- //Footer Area -->

        </div>
        <!-- //Main wrapper -->

        <!-- JS Files -->
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>