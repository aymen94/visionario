<%--
  Created by IntelliJ IDEA.
  User: aymen
  Date: 08/05/2018
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<style>
    .title {
        text-align: center;
        margin-left: 1rem;
        margin-right: 1rem;
        margin-bottom: 0rem;
        margin-top: 0.65rem;
    }

    .title h1 {
        /*@handymenny: I put animation/background/backgroud-clip there to be compatible with Edge*/
        background: url("<%=request.getContextPath()%>/assets/img/background-logo.jpg");
        animation: background-move 10s infinite;
        /* @handymenny: webkit doesn't recognise standard backgroud-clip */
        -webkit-background-clip: text;
        background-clip: text; /*@handymenny Warning text value is experimental */
        text-transform: uppercase;
        font-size: 12vw;
    }

    .title h1 a {
        color: green; /* Fallback for older browsers */
        /* @handymenny: Remember -webkit-text-fill-color is not standard! Use color instead */
        color: rgba(0, 0, 0, 0);
    }

/*     Extra small devices (portrait phones, less than 576px) */
@media ( max-width : 575.98px) {
    .title h1 {
        font-size: 12vw;
    }
}

/*     Small devices (landscape phones, 576px and up) */
@media ( min-width : 576px) {
    .title h1 {
        font-size: 10vw;
    }
}

/* Medium devices (tablets, 768px and up) */
@media ( min-width : 768px) {
    .title h1 {
        font-size: 8vw;
    }
}

/* Large devices (desktops, 992px and up) */
@media ( min-width : 992px) {
    .title h1 {
        font-size: 7vw;
    }
}

/* Extra large devices (large desktops, 1200px and up) */
@media ( min-width : 1200px) {
    .title h1 {
        font-size: 6vw;
    }
</style>
<div class="title">
    <h1><a href="<%=request.getContextPath()%>">Visionario</a></h1>
</div>
