<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    {{template "include/css.tpl"}}
</head>


<body>
    <div class="container-fluid" style="padding-bottom: 30px;padding-top: 30px;text-shadow: 0px 0px;">
        <div class="card" style="text-align:center; border-top-color: #81c784;border-right-style: none;border-bottom-color: #81c784;border-left-style: none;">
            <div class="card-body d-flex flex-column align-items-center intro" style=" border-style: none;border-bottom-color: #81c784;border-left-style: none;">
                <h2 style="color: #009432; width: 100%; ">Fragil'Indice</h2>
                <h4 style="color: #81c784; font-size: 2.5em;">Calculez rapidement votre indice de fragilité numérique !</h4>
                <p style="margin: 30px;">
                    Cet indice permet d’identifier les zones les plus touchées par une exclusion numérique et par l’illectronisme (contraction d’illettrisme et d’électronique). <br>
                    La construction de l’indice repose sur de nombreuses études qualitatives et quantitatives. Le labo inclusion numérique de l’ANSA identifie 4 conditions liées à la probabilité d’avoir accès aux services dont au moins une partie du processus nécessite un usage numérique :     
                </p>
                <p>

                </p>
                
                <ul class="flex-row mx-auto justify-content-center list-group row" style="list-style-type: none; margin-bottom: 50px; width: 100%;">
                    <li class="list-group-item" style="background-color: #5f9ea0; color:white;width: 380px;">
                        L’accès à l’information sur le web </li>
                    <li class="list-group-item" style="background-color: #ef5b25; color: white;width: 380px"> L’ accès aux
                        interfaces numériques </li>
                    <li class="list-group-item" style="background-color: #006266; color: white;width: 380px"> Les capacités d’usage
                        des interfaces numériques</li>
                    <li class="list-group-item" style="background-color: #f79f1f; color: white;width: 380px"> Les compétences
                        administratives</li>
                </ul>
                <p>
                    Ces 4 conditions correspondent aux 4 axes du modèle statistique. <br>
                    Ensuite, chacun des 4 axes de l’analyse prend en compte différentes variables ou hypothèses, qui désignent des caractéristiques susceptibles d’expliquer la fragilité numérique. <br>
                    Vous pouvez rechercher ci-dessous le score global d’une commune ainsi que d’autres informations en saisissant d’abord votre code postal, puis en choisissant la commune associée. 
                
                </p>      
                <div class="row" style="width: 95%; margin-top:40px; margin-bottom: 5px;">
                    <div class="col-12 col-lg-5" style=" padding-right: 0px;padding-left: 0px;">
                    <h4>1. Saisissez votre code postal</h4> 
                    </div>
                    <div class="col-12 col-lg-5" style="padding-right: 0px;padding-left: 0px;">
                        <h4>2. Choisissez votre commune</h4>
                    </div>

                </div>   
                
                <div class="row" style="width: 95%;">
                    <div class="col-12 col-lg-5 " style="padding-right: 0px;padding-left: 0px;">
                        <input id="txt_code_postal" type="text" style="height: 100%;width: 100%;text-align: center;background: #dedede;padding: 18px;border-style: none;border-left-style: solid;" placeholder="CODE POSTAL">
                    </div>
                    <div class="col-12 col-lg-5" style="padding: 0px;padding-left: 0px;">
                        <select id="communes" class="js-example-placeholder-single js-states form-control"
                            style="width: 100%;text-align: center;background: #dedede;border-style: none;border-left-style: solid;padding: 18px;">
                            <option></option>

                        </select>
                    </div>
                    <div class="col-12 col-lg-2" style="padding: 0px;"><button id='btn_search'
                            class="btn btn-primary "
                            type="button"
                            style="height: 100%;width: 100%;padding: 18px;text-align: center;background: #009432;border-style: none;">RECHERCHER !</button>
                    </div>
                    <div class="col-12">
                        <h3 id='error' style="padding:5px; color: #e61611;text-align: center;">  </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="shadow highlight-phone align-items-center" style="margin-right: 35px;margin-left: 35px;">
        <div class="container" >
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="intro align-items-center" style="max-width: 700px;">
                        <h3 id='idNomCommune'></h3>
                        <p>Le score globale correspond à la moyenne des scores des 4 axes (dont vous pouvez voir le détail ci-dessous).</p>
                        <p id="idScoreMax"></p>
                        <p>Globalement, plus ce score est élevé, plus la fragilité numérique de la commune recherché est forte.</p>
                        <p>Concernant le classement, celui-ci recense toutes les communes présentes dans la base de données et calcule le rang de la commune recherché par rapport à son score global. <br> 
                            Plus le rang est petit, plus la fragilité numérique observée est basse.</p>
                    </div>
                </div>
                <div class="col-12 col-lg-4" >
                    <div class="card rang">
                        <div class="card-header" style="background: #009432;">
                            <h5 class="mb-0" style="color: #ffffff;text-align: center;font-size: 29px;">VOTRE SCORE</h5>
                        </div>
                        <div class="card-body">
                            <p id='idGlobalScore' class="card-text" style="text-align: center;font-size: 25px;"></p>
                            <p  class="card-text" style="font-size: 50px;">
                                <span style="font-size: 25px;">Classement : </br></span>
                                <span id='idGlobalRang'></span> 
                                <span id='idDenominateur' style="text-align: center;font-size:18px;"></span>
                            </p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="shadow-none highlight-phone"
        style="background: #81c78400; margin-top: 35px">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-3 "></div>
                <div class="col-12 col-lg-3 ">
                    <div class="card text-center" style="border-style: none;">
                        <div class="card-body">
                            <h5 class="text-muted">Score régional</h5>
                            <h6 id='idNomRegion' class="card-text text-muted ">--</h6>
                            <p id='idRegionalScore' class="card-text" style="font-size: 90px;"></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3">
                    <div class="card text-center" style="border-style: none;">
                        <div class="card-body">
                            <h5 class="text-muted">Score départemental</h5>
                            <h6 id='idNomDepartement' class="text-muted"></h6>
                            <p id='idDepartementalScore' class="card-text" style="font-size: 90px;"></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 "></div>
            </div>


            <div class="row">
                <div class="col-12 col-lg-6" style="margin-top: 50px;">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h5 class="text-muted">Critères d'accès</h5>
                        </div>

                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6">
                                    <div class="card border shadow-lg" style="width: 100%;height: 217px;border-color: #92d36f;">
                                        <div class="card-body">
                                            <h6 class=" card-subtitle mb-2" style="text-align: center; color: cadetblue;">Accès à
                                                l'information</h6>
                                            <p id='idAccesInformationScore' class="card-text" style="font-size: 90px;text-align: center;color: cadetblue;">68</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            
                                <div class="col-12 col-lg-6">
                                    <div class="card border shadow-lg" style="width: 100%;height: 217px;border-color: #92d36f;">
                                        <div class="card-body" style="color: #e61611;">
                                            <h6 class=" card-subtitle mb-2" style="text-align: center;color: #EE5A24;">Accès aux interfaces numériques</h6>
                                            <p id='idAccesInferfaceNumeriqueScore' class="card-text" style="font-size: 90px;text-align: center;color: #EE5A24;">35</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-lg-6" style="margin-top: 50px;">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h5 class="text-muted">Critères de compétences</h5>
                        </div>

                        <div class="col-12">
                            <div class="row align-items-center">
                                <div class="col-12 col-lg-6 ">
                                    <div class="card  border  shadow-lg" style="width: 100%;height: 217px;">
                                        <div class="card-body">
                                            <h6 class=" card-subtitle mb-2" style="text-align: center; color:#006266;">Capacité d'usage des interfaces numériques&nbsp;</h6>
                                            <p id='idCompetencesNumeriqueScore' class="card-text"
                                                style="font-size: 90px;text-align: center;color: #006266;">54</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            
                                <div class="col-12 col-lg-6">
                                    <div class="card  border  shadow-lg" style="width: 100%;height: 217px;">
                                        <div class="card-body">
                                            <h6 class=" card-subtitle mb-2" style="text-align: center; color: #F79F1F;">Compétences
                                                administrative</h6>
                                            <p id='idCompetencesAdministrativeScore' class="card-text"
                                                style="font-size: 90px;text-align: center;color: #F79F1F;">80</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id='idMainContainer'  style="position: absolute; bottom:-200%; top:0%; left: 0%; width: 100%; height: 240%; background-color: #2b26268f;">
        <div class="card d-flex justify-content-center" style="justify-content: center; align-items: center;height: 200px;">
            <p class=" ">En poursuivant votre navigation, vous acceptez l’utilisation de cookies destinés à améliorer la performance du site internet et la qualité de nos services.</p>
            <div>
                <button id='idAccept'class="btn btn-dark btn-lg">J'accepte</button>
                <button id='idRefuse' class=" btn btn-danger btn-lg">Je refuse</button>
            </div>

        </div>

    </div>
    <div class="row justify-content-center align-items-center">
        <a href="#" id="btn_download" role="button" aria-pressed="true" class="btn btn-info btn-lg">
            <i class="fa fa-download"></i> Télécharger au format PDF
        </a>
    </div>
    <div class="footer-basic">
        <footer>
            <div class="social">
                <a ><i class="icon ion-social-instagram"></i></a>
                <a ><i class="icon ion-social-snapchat"></i></a>
                <a ><i class="icon ion-social-twitter"></i></a>
                <a ><i class="icon ion-social-facebook"></i></a>
            </div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">À propos</a></li>
                <li class="list-inline-item"><a href="mailto:turbosecolos@gmail.com">Contact</a></li>
                <li class="list-inline-item"><a href="#">CGU</a></li>
                <li class="list-inline-item"><a href="https://twitter.com/EcolosTurbos">Twitter</a></li>
                <li class="list-inline-item"><a href="https://twitter.com/Design4Green">Design 4 Green</a></li>
            </ul>
            <p class="copyright"><a href="#"><strong>Fragil'Indice</strong></a>&nbsp;© 2020</p>
            <p class="copyright"><strong>Site web réalisé dans le cadre du challenge <a href="https://design4green.org/">Design 4 Green</a> édition 2020</strong></p>
        </footer>
    </div>
    {{template "include/js.tpl"}}
    {{template "include/myjs.tpl"}}

</body>

</html>
