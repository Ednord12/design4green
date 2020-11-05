<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    {{template "include/css.tpl"}}
</head>


<body>
    <div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="padding-right: 30px;padding-left: 30px;margin: 0px;padding-bottom: 30px;padding-top: 30px;height: 97vh;width: 100%;text-shadow: 0px 0px;">
        <div class="card d-flex justify-content-center align-items-center" style="width: 100%;height: 100%;border-top-color: rgb(129,199,132);border-right-style: none;border-bottom-color: rgb(129,199,132);border-left-style: none;">
            <div class="card-body d-flex flex-column justify-content-center align-items-center" style="height: 500px;border-style: none;border-bottom-color: #81c784;border-left-style: none;">
                <h1 style="color: #81c784; font-size:8rem;">Fragil'Indice</h1>
                <h1 style="color: #81c784;">Calculez rapidement votre indice de fragilité numérique !</h1>
                <p style="margin: 46px;text-align: center;width: 70%;margin-left: 30px;margin-right: 30px;margin-top: 30px;margin-bottom: 30px;">
                    Cet indice permet d’identifier les zones les plus touchées par une exclusion numérique et par l’illectronisme (contraction d’illettrisme et d’électronique). <br>
                    La construction de l’indice repose sur de nombreuses études qualitatives et quantitatives. Le labo inclusion numérique de l’ANSA identifie 4 conditions liées à la probabilité d’avoir accès aux services dont au moins une partie du processus nécessite un usage numérique :     
                </p>
                <ul style="list-style-type: none;">
                        <li>- L’accès à l’information sur le web </li>
                        <li>- L’accès aux interfaces numériques </li>
                        <li>- Les capacités d’usage des interfaces numériques</li>
                        <li>- Les compétences administratives</li>
                </ul>
                <p style="text-align: center;width: 70%;">
                    Ces 4 conditions correspondent aux 4 axes du modèle statistique. <br>
                    Ensuite, chacun des 4 axes de l’analyse prend en compte différentes variables ou hypothèses, qui désignent des caractéristiques susceptibles d’expliquer la fragilité numérique. <br>
                    Vous pouvez rechercher ci-dessous le score global d’une commune ainsi que d’autres informations en saisissant d’abord votre code postal, puis en choisissant la commune associée. 
                
                </p>      
                <div class="row d-flex flex-grow-0" style="width: 95%;height: 85px;">
                    <div class="col-12 col-sm-12 col-lg-5 offset-0 d-flex justify-content-center align-items-center align-content-center" style="padding-right: 0px;padding-left: 0px;">
                    <h4>1. Saisissez votre code postal</h4> 
                    </div>
                    <div class="col-12 col-sm-12 col-lg-5 offset-0 d-flex justify-content-center align-items-center align-content-center" style="padding-right: 0px;padding-left: 0px;">
                        <h4>2. Choisissez votre commune</h4>
                    </div>

                </div>   
                
                   <div class="row d-flex flex-grow-0"
                    style="width: 95%;height: 85px;">
                    <div class="col-12 col-sm-12 col-lg-5 offset-0 d-flex justify-content-center align-items-center align-content-center" style="padding-right: 0px;padding-left: 0px;">
                        <input id="txt_code_postal" type="number" style="height: 100%;margin: 0px;width: 100%;text-align: center;background: rgb(222,222,222);padding: 18px;border-style: none;border-left-style: solid;" placeholder="CODE POSTAL"></div>
                    <div class="col-5 col-sm-12 col-lg-5" style="padding: 0px;padding-left: 0px;">
                        <select id="communes" disabled="true" class="js-example-placeholder-single js-states form-control"
                            style="height: 100%;width: 100%;margin: 0px;margin-top: 0px;margin-right: 0px;text-align: center;background: #dedede;border-style: none;border-left-style: solid;padding: 18px;">
                            <option></option>

                        </select>
                    </div>
                    <div class="col-sm-12 col-lg-2" style="padding: 0px;"><button id='btn_search'
                            class="btn btn-primary text-uppercase text-center d-flex justify-content-center align-items-center"
                            type="button"
                            style="height: 100%;width: 100%;padding: 18px;text-align: center;background: #81c784;border-style: none;">RECHERCHER!</button>
                    </div>
                    <p id='error' style="color: #e61611; text-align:end; display: block;">  </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container"></div>
    <div class="shadow highlight-phone" style="margin: 10px;margin-right: 35px;margin-bottom: 10px;margin-left: 35px;">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="intro">
                        <h2 id='idNomCommune'></h2>
                        <p style="margin-bottom: 4px;">Resultat de votre&nbsp; recherche&nbsp;</p>
                        <p>Rapport effectué le&nbsp; 04 /11/ 2020</p>
                        <p>La commune de la Rochelle possède un score de 78 sur 100, ce qui la&nbsp; classe 587/ 3824
                        </p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="d-none d-md-block phone-mockup">
                        <div class="screen"></div>
                        <div class="card">
                            <div class="card-header" style="background: #81c784;">
                                <h5 class="mb-0" style="color: #ffffff;text-align: center;font-size: 29px;">VOTRE RANG
                                </h5>
                            </div>
                            <div class="card-body">
                                <p  class="card-text" style="font-size: 50px;">
                                    <span id='idGlobalRang'> 78</span> 
                                    <span id='idDenominateur' style="text-align: center;font-size:18px;"> / 100</span>
                                </p>
                                
                                <p id='idGlobalScore' class="text-left card-text" style="text-align: center;font-size: 18px;">/100</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shadow-none highlight-phone"
        style="margin-top: 35px;margin-right: 35px;margin-left: 35px;margin-bottom: 35px;background: rgba(129,199,132,0);">
        <div class="container">
            <div class="row d-flex flex-row justify-content-center align-items-center"
                style="margin-top: 25px;margin-bottom: 30;padding: 0px;padding-bottom: 30px;">
                <div class="col-md-12 col-lg-3 d-flex justify-content-between align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card" style="width: 100%;height: 100%;border-style: none;">
                        <div class="card-body">
                            <h6 class="text-center text-muted card-subtitle mb-2">Score régional</h6>
                            <h6 id='idNomRegion' class="text-center text-muted card-subtitle mb-2"></h6>
                            <p id='idRegionalScore' class="card-text" style="font-size: 90px;text-align: center;">80</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3 d-flex justify-content-between align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card" style="width: 100%;height: 100%;border-style: none;">
                        <div class="card-body">
                            <h6 class="text-center text-muted card-subtitle mb-2" style="text-align: center;">Score
                                départemental</h6>
                            <h6 id='idNomDepartement' class="text-center text-muted card-subtitle mb-2"></h6>
                            <p id='idDepartementalScore' class="card-text" style="font-size: 90px;text-align: center;">
                                54</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-flex flex-row justify-content-between align-items-center" style="margin-top: 49px;">
                <div class="col-md-12 d-flex justify-content-around">
                    <h5 class="d-flex text-muted">Critères d'accès&nbsp;</h5>
                    <h5 class="d-flex text-muted">Critères de compétences</h5>
                </div>
                <div class="col-md-12 col-lg-3 d-flex justify-content-center align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card border-secondary border rounded-circle shadow-lg" style="padding: 10px;">
                        <div class="card-body" style="color: #e61611;">
                            <h6 class="text-secondary card-subtitle mb-2" style="text-align: center;color: #f4eb49;">Accès aux interfaces numériques</h6>
                            <p  id='idAccesInferfaceNumeriqueScore' class="card-text" style="text-align: center;font-size: 90px;color: #e61611;">35</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3 d-flex justify-content-center align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card border-success border rounded-circle shadow-lg"
                        style="width: 100%;height: 100%;padding: 20px;border-color: #92d36f;">
                        <div class="card-body">
                            <h6 class="text-success card-subtitle mb-2" style="text-align: center;">Accès à
                                l'information</h6>
                            <p id='idAccesInformationScore' class="card-text"
                                style="font-size: 90px;text-align: center;color: #92d36f;">68</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3 d-flex justify-content-between align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card border-success border rounded-circle shadow-lg"
                        style="width: 100%;height: 100%;margin: 0px;padding: 10px;">
                        <div class="card-body">
                            <h6 class="text-success card-subtitle mb-2" style="text-align: center;">Compétences
                                administrative</h6>
                            <p id='idCompetencesAdministrativeScore' class="card-text"
                                style="font-size: 90px;text-align: center;color: #92d36f;">80</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3 d-flex justify-content-between align-items-center"
                    style="box-shadow: 0px 0px;">
                    <div class="card border-warning border rounded-circle shadow-lg"
                        style="width: 100%;height: 100%;margin: 10px;padding: 10px;">
                        <div class="card-body">
                            <h6 class="text-warning card-subtitle mb-2" style="text-align: center;">Compétences
                                numériques/scolaire&nbsp;</h6>
                            <p id='idCompetencesNumeriqueScore' class="card-text"
                                style="font-size: 90px;text-align: center;color: #f4eb49;">54</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-center align-items-center">
        <button type="button" class="btn btn-info btn-lg">
            <i class="fa fa-download"></i> Télécharger au format PDF
            </button>
    </div>
    <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i
                        class="icon ion-social-snapchat"></i></a><a href="#"><i
                        class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a>
            </div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright"><a href="#"><strong>Fragil'Indice</strong></a>&nbsp;© 2020</p>
        </footer>
    </div>
    {{template "include/js.tpl"}}
    {{template "include/myjs.tpl"}}

</body>

</html>