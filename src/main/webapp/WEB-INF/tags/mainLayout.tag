<!DOCTYPE html>
<%@ tag description="Template Site Tag" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ attribute name="title" fragment="true" %>
<html lang="en">

<head>
    <title>
        <jsp:invoke fragment="title"/>
    </title>

    <spring:url value="/resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/template.css" var="template_style"/>
    <spring:url value="/resources/css/jquery.mCustomScrollbar.css" var="custom_scrollbar_css"/>
    <spring:url value="/resources/js/jquery-2.1.4.min.js" var="jquery"/>
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrap_js"/>
    <spring:url value="/resources/js/jquery.mCustomScrollbar.concat.min.js" var="custom_scrollbar_js"/>

    <!-- CSS -->
    <link href="${bootstrap}" rel="stylesheet"/>
    <link href="${custom_scrollbar_css}" rel="stylesheet"/>
    <link href="${template_style}" rel="stylesheet"/>

    <!-- JS -->
    <script src="${jquery}" type="text/javascript"></script>
    <script src="${bootstrap_js}"></script>
    <script src="${custom_scrollbar_js}"></script>

    <script>
        (function ($) {
            $(window).on("load", function () {
                $(".main-area").mCustomScrollbar({
                    callbacks: {
                        onScrollStart: function () {
                            $(".mCSB_dragger_bar").css("background", "#292b2d");
                        },
                        onScroll: function () {
                            $(".mCSB_dragger_bar").css("background", "#5a5a5a");
                        }
                    }
                });
                $(".mCSB_dragger").hover(
                        function () {
                            $(".mCSB_dragger_bar").css("background", "#292b2d");
                        },
                        function () {
                            $(".mCSB_dragger_bar").css("background", "#5a5a5a");
                        })
            });
        })(jQuery);
    </script>

</head>

<body>

<!-- NAVIGATION BAR HEADER -->
<nav class="navbar navbar-inverse navbar-fixed-top navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
            &lt;<b><span class="color-purple">java:</span><span class="color-orange">ychurinov</span></b>&gt;
        </a>
    </div>


    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
        <ul class="nav navbar-nav">

            <!-- Contacts -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="main.layout.navbar.item.contacts"/><b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <spring:url value="#" var="to_mail"/>
                    <li><a href="${to_mail}">Mail me</a></li>
                    <spring:url value="#" var="fb"/>
                    <li><a href="${fb}" target="_blank">Facebook</a></li>
                    <spring:url value="https://www.linkedin.com/in/yaroslav-churinov-426261103" var="li"/>
                    <li><a href="${li}" target="_blank">LinedIn</a></li>
                    <spring:url value="https://new.vk.com/id5639118" var="vk"/>
                    <li><a href="${vk}" target="_blank">ВКонтакте</a></li>
                </ul>
            </li>

            <!-- Export CV -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="main.layout.navbar.item.exportCV"/><b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <spring:url value="#" var="to_mail"/>
                    <li><a href="${to_mail}">Send by mail</a></li>
                    <spring:url value="#" var="pdf"/>
                    <li><a href="#">PDF</a></li>
                    <spring:url value="#" var="doc"/>
                    <li><a href="#">MS Word .doc</a></li>
                    <spring:url value="#" var="odt"/>
                    <li class="disabled"><a href="#">OpenOffice .odt</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>


<%--MAIN AREA--%>
<div class="main-area">
    <div class="container content">
        <jsp:doBody/>
    </div>
</div>

<%--FOOTER--%>
<footer class="navbar navbar-inverse navbar-fixed-bottom navbar-default">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">
            &lt;<b><span class="color-purple">/java:</span><span class="color-orange">ychurinov</span></b>&gt;
        </a>
    </div>
    <!-- localization -->
    <ul id="local" class="nav navbar-nav navbar-right margin-right-0">
        <li id="local-en"><a href="<%=request.getContextPath()%>?language=en">EN</a></li>
        <li id="local-ru"><a href="<%=request.getContextPath()%>?language=ru">RU</a></li>
        <li id="local-ukr"><a href="<%=request.getContextPath()%>?language=uk">UKR</a></li>
    </ul>
</footer>

</body>

</html>