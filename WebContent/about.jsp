<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>About | Visionario</title>
    <!-- style -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/footer.css">
    <link rel="stylesheet" href="assets/css/title.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- title -->
    <%@include file="component/favicon.jsp"%>
</head>

<body>
<!-- title -->
<%@include file="component/title.jsp"%>

<!-- navbar -->
<%@include file="component/navbar.jsp"%>

    <div class="container">
        <div class="row">
        <div class="col m-5">
            <h4>About</h4>
            <p>
                Visionario è lo store online di lifestyle leader nel mondo: moda, design e arte.
                Grazie a consolidate relazioni dirette con designer, produttori e dealer autorizzati, Visionario offre una selezione infinita di prodotti: un’ampia scelta di capi d’abbigliamento e accessori difficili da trovare dei più importanti designer al mondo; 
                capsule collection esclusive; proposte di moda eco-friendly; un assortimento unico di oggetti di design; rari capi vintage e originali libri; una ricercata collezione di accattivanti opere d’arte provenienti dai più importanti musei e gallerie a livello mondiale, selezionate da curatori e critici internazionali.
                Fare shopping su Visionario è una continua scoperta, un viaggio divertente ed eclettico oltre le stagioni della moda, che dà la possibilità a uomini e donne di esprimere la propria individualità attraverso uno stile creativo e senza tempo.
                Visionario è “Powered by Aymen Andrea Christian”, che con uffici e centri tecno-logistici in Europa, Stati Uniti, Giappone, Cina, Hong Kong ed Emirati Arabi Uniti, garantisce un eccellente servizio al cliente: consegna rapida e sicura in più di 100 paesi nel mondo; reso semplice e veloce e customer care di alto livello.
            </p>
            <a class="d-block d-md-none btn btn-sm btn-primary px-0" href="<%=request.getContextPath()%>/">Return To home page</a>
        </div>
        </div>
    </div>

<!-- Footer -->
<%@include file="component/footer.jsp"%>
    <!-- script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>