<%-- 
    Document   : search-popup
    Created on : Jul 9, 2020, 9:35:50 AM
    Author     : DIENMAYXANH
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <!-- Start Search Popup -->
    <div class="brown--color box-search-content search_active block-bg close__top">
        <form id="search_mini_form" class="minisearch" action="searchBook" method="get">
            <div class="field__search">
                <input name="searchWord" type="text" placeholder="Search for (name, author, isbn, category...)">
                <div class="action">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </div>
        </form>

        <div class="close__wrap">
            <span>close</span>
        </div>
    </div>
    <!-- End Search Popup -->
</html>
