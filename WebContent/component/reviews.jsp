<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="config.Config"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

    <jsp:useBean id="model" class="model.ReviewModel"></jsp:useBean>
    <c:set var="reviews" value="${model.doRetrieveByProd(param.prod)}"></c:set>
<div class="container-fluid mb-5 mt-5 px-0">
    <h3>Reviews</h3>
    <c:choose>
        <c:when test="${reviews.size()>0}">
    
    <c:forEach items="${reviews}" var="review">
        <div class="card mb-3">
            <div class="card-header d-flex">${review.userName}
                <span class="ml-auto"><c:forEach begin="1"
                        end="${review.score}">
                        <i class="fa fa-star-o" aria-hidden="true"></i>
                    </c:forEach></span>
            </div>
            <div class="card-body">${review.comment}</div>
        </div>
    </c:forEach>
    </c:when>
    <c:otherwise>
      <h6>There are no customer reviews yet.</h6>
    </c:otherwise>
    </c:choose>
</div>
