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
    <spring:url value="/resources/css/font-awesome.min.css" var="font_awesome_icons"/>
    <spring:url value="/resources/js/jquery-2.1.4.min.js" var="jquery"/>
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrap_js"/>
    <spring:url value="/resources/js/jquery.mCustomScrollbar.concat.min.js" var="custom_scrollbar_js"/>
    <spring:url value="/resources/js/template.js" var="template_js"/>
    <spring:url value="/resources/js/stikr.min.js" var="stikr_js"/>

    <!-- CSS -->
    <link href="${bootstrap}" rel="stylesheet"/>
    <link href="${custom_scrollbar_css}" rel="stylesheet"/>
    <link href="${font_awesome_icons}" rel="stylesheet"/>
    <link href="${template_style}" rel="stylesheet"/>

    <!-- JS -->
    <script src="${jquery}" type="text/javascript"></script>
    <script src="${bootstrap_js}"></script>
    <script src="${custom_scrollbar_js}"></script>
    <script src="${stikr_js}"></script>
    <script src="${template_js}"></script>

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
                        code="main.layout.navbar.item.contacts"/>&nbsp;<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <spring:url value="#" var="to_mail"/>
                    <li>
                        <a data-toggle="modal" data-target="#sendMessageModal" href="${to_mail}">
                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>
                            <spring:message code="main.layout.navbar.item.send.message"/>
                        </a>
                    </li>
                    <spring:url value="#" var="fb"/>
                    <li>
                        <a href="${fb}" target="_blank"><i class="fa fa-facebook-square" aria-hidden="true"></i>&nbsp;Facebook</a>
                    </li>
                    <spring:url value="https://www.linkedin.com/in/yaroslav-churinov-426261103" var="li"/>
                    <li><a href="${li}" target="_blank"><i class="fa fa-linkedin-square" aria-hidden="true"></i>&nbsp;LinedIn</a>
                    </li>
                    <spring:url value="https://new.vk.com/id5639118" var="vk"/>
                    <li><a href="${vk}" target="_blank"><i class="fa fa-vk" aria-hidden="true"></i>&nbsp;ВКонтакте</a>
                    </li>
                </ul>
            </li>

            <!-- Export CV -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message
                        code="main.layout.navbar.item.export.CV"/>&nbsp;<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a data-toggle="modal" data-target="#sendByMailModal">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <spring:message code="main.layout.navbar.item.send.by.mail"/>
                        </a>
                    </li>
                    <li>
                        <spring:url value="/resources/pdf/1.pdf" var="pdf_file"/>
                        <a href="${pdf_file}" target="_blank"><i class="fa fa-file-pdf-o" aria-hidden="true"></i>&nbsp;PDF</a>
                    </li>
                    <li>
                        <spring:url value="#" var="doc"/>
                        <a href="#" target="_blank"><i class="fa fa-file-word-o" aria-hidden="true"></i>&nbsp;MS Word .doc</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="https://github.com/DarkstarBSD" target="_blank"><i class="fa fa-github" aria-hidden="true"></i>&nbsp;GitHub</a>
            </li>
        </ul>
    </div>
</nav>


<!-- MAIN AREA -->
<main class="scrollbar-container">
    <div class="container">
        <jsp:doBody/>
    </div>
</main>

<!-- FOOTER -->
<footer class="navbar navbar-inverse navbar-fixed-bottom navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-footer-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
            &lt;/<b><span class="color-purple">java:</span><span class="color-orange">ychurinov</span></b>&gt;
        </a>
    </div>
    <!-- localization -->
    <div class="collapse navbar-collapse" id="bs-footer-collapse">
        <ul id="local" class="nav navbar-nav navbar-right margin-right-0">
            <li id="local-en"><a href="<%=request.getContextPath()%>?language=en">EN</a></li>
            <li id="local-ru"><a href="<%=request.getContextPath()%>?language=ru">RU</a></li>
            <li id="local-ukr"><a href="<%=request.getContextPath()%>?language=uk">UKR</a></li>
        </ul>
    </div>
</footer>

<!-- MODALS -->

<!--send CV on email-->
<div class="modal fade" id="sendByMailModal" role="dialog">
    <div class="modal-dialog">
        <!-- content -->
        <div class="modal-content">
            <form id="sendByMailForm" action="<%=request.getContextPath()%>/email" role="form" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><spring:message code="main.layout.navbar.item.send.by.mail"/></h4>
                </div>
                <div class="modal-body">
                    <div id="sbmEmailContainer" class="form-group has-feedback">
                        <input id="sbmEmail" type="email" name="sendTo" placeholder="E-mail" class="form-control">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div id="sbmFormatContainer" class="checkbox has-feedback">
                        <label><input id="sbmPdf" name="pdf" checked type="checkbox"> pdf</label>
                        <label><input id="sbmDoc" name="doc" type="checkbox"> doc</label>
                    </div>
                    <div id="sbmFormatAlert" class="alert alert-danger" style="display: none">
                        <strong>
                            <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                            <spring:message code="main.layout.modal.send.by.mail.format.alert"/>
                        </strong>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="sbmSubmit" type="button" class="btn btn-primary" disabled>
                        <spring:message code="main.layout.modal.send.by.mail.primary.button"/>
                    </button>
                    <button type="button" class="btn btn-link" data-dismiss="modal">
                        <spring:message code="main.layout.modal.send.by.mail.close.button"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!--send message-->
<div class="modal fade" id="sendMessageModal" role="dialog">
    <div class="modal-dialog">
        <!-- content -->
        <div class="modal-content">
            <form id="sendMessageForm" action="<%=request.getContextPath()%>/messageMe" role="form" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><spring:message code="main.layout.navbar.item.send.message"/></h4>
                </div>
                <div class="modal-body">
                    <div id="smNameContainer" class="form-group has-feedback">
                        <input id="smName" type="text" name="name" placeholder="Your name (Company)" class="form-control">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div id="smMessageContainer" class="form-group has-feedback">
                        <textarea id="smMessage" name="message" placeholder="Your message" rows="5" class="form-control"></textarea>
                        <span class="glyphicon glyphicon-pencil form-control-feedback"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="smSubmit" type="button" class="btn btn-primary" disabled>
                        <spring:message code="main.layout.modal.send.by.mail.primary.button"/>
                    </button>
                    <button type="button" class="btn btn-link" data-dismiss="modal">
                        <spring:message code="main.layout.modal.send.by.mail.close.button"/>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>