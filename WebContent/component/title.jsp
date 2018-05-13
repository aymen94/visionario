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
        margin-bottom: 0.5rem;
        margin-top: 4.7rem;
    }

    .title h1 {
        /*@handymenny: I put animation/background/backgroud-clip there to be compatible with Edge*/
        background: url("<%=request.getContextPath()%>/assets/img/background-logo.jpg");
        animation: background-move 10s infinite;
        /* @handymenny: webkit doesn't recognise standard backgroud-clip */
        -webkit-background-clip: text;
        background-clip: text; /*@handymenny Warning text value is experimental */
        text-transform: uppercase;
        font-size: 1.2vw;
    }

    .title h1 a {
        color: green; /* Fallback for older browsers */
        /* @handymenny: Remember -webkit-text-fill-color is not standard! Use color instead */
        color: rgba(0, 0, 0, 0);
    }

    @media (max-width: 2160px)
    {
        .title h1 {
            font-size: 4vw;
        }
    }

    @media (max-width: 1400px)
    {
        .title h1 {
            font-size: 6vw;
        }
    }
    @media ( max-width : 900px) {
        .title h1 {
            font-size: 8vw;
        }
    }

    @media ( max-width : 720px) {
        .title h1 {
            font-size: 10vw;
        }
    }

    @media ( max-width : 480px) {
        .title h1 {
            font-size: 12vw;
        }
    }
</style>
<div class="title">
    <h1><a href="<%=request.getContextPath()%>">Visionario</a></h1>
</div>
