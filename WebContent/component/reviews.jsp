<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="config.Config"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

    <div class="container-fluid mb-5 mt-3">
    <h3>Reviews</h3>
       <jsp:useBean id="model" class="model.ReviewModel"></jsp:useBean>
       <c:forEach items="${model.doRetrieveByProd(param.prod)}" var="review">
                <div class="card">
  <div class="card-header d-flex">${review.userName} <span class="ml-auto"><c:forEach begin="1" end="${review.score}">
<i class="fa fa-star-o" aria-hidden="true"></i></c:forEach></span>
</div>
  <div class="card-body">        ${review.comment}</div>
</div>
        
        

       
       </c:forEach>    
    </div>
