<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 10/05/2018
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="config.Config"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<c:if test="${products.size()>0}">
    <div class="container-fluid d-none d-sm-block">
        <h3>Similar Products</h3>
        <div id="myCarousel2" class="carousel slide " data-ride="carousel"
            data-interval="2000">
            <div class="carousel-inner row w-100 mx-auto" role="listbox"
                id="carousel2">
                <c:forEach items="${products}" var="prod" varStatus="i">
                    <div
                        class="carousel-item col-sm-3 card card-body flex-column carousel2 <c:if test="${i.index==1}">active</c:if> ">
                        <div class="panel panel-default">

                            <div class="panel-thumbnail">
                                <a href="./product_detail?prod=${prod.id}"
                                    title="${prod.title}" class="thumb"> <img
                                    class="img-fluid mx-auto d-block"
                                    src="<%=request.getContextPath()+Config.pathImg%>${prod.defaultImage}"
                                    alt="${prod.title}">
                                </a>
                                <div class="panel-heading text-center">
                                    <a
                                        href="<%=request.getContextPath()%>/product_detail?prod=${prod.id}">${prod.title}</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <a class="carousel-control-prev" href="#myCarousel2" role="button"
                data-slide="prev"> <span class="carousel-control-prev-icon"
                aria-hidden="true"></span> <span class="sr-only">Previous</span>
            </a> <a class="carousel-control-next text-faded" href="#myCarousel2"
                role="button" data-slide="next"> <span
                class="carousel-control-next-icon" aria-hidden="true"></span> <span
                class="sr-only">Next</span>
            </a>
        </div>
    </div>
</c:if>