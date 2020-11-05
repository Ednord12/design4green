<script>

    /** var declaration **/



    var duree = 1.5; // Durée en seconde pendant laquel le compteur ira de 0 à 15


    let select = $("#communes")

    let txtSeach = document.getElementById('txt_code_postal')
    let txtError = document.getElementById('error')
    let btnSeach = document.getElementById('btn_search')
    let accesInferfaceNumeriqueScore = document.getElementById('idAccesInferfaceNumeriqueScore')
    let accesInformationScore = document.getElementById('idAccesInformationScore')
    let competencesAdministrativeScore = document.getElementById('idCompetencesAdministrativeScore')
    let competencesNumeriqueScore = document.getElementById('idCompetencesNumeriqueScore')
    let departementalScore = document.getElementById('idDepartementalScore')
    let regionalScore = document.getElementById('idRegionalScore')
    let globalScore = document.getElementById('idGlobalScore')
    let nomCommune = document.getElementById('idNomCommune')
    let nomRegion = document.getElementById('idNomRegion')
    let rangGlobal = document.getElementById('idGlobalRang')
    let nomDepartement = document.getElementById('idNomDepartement')
    let denominateur = document.getElementById('idDenominateur')


    /*******************************************************************/

    /** function definition  ***/
    const bindCodePostalListener = () => {

        txtSeach.addEventListener('input', (event) => {
            if (event.currentTarget.value.length === 5) {
                console.log(event.currentTarget.value)
                select.prop("disabled", false) 
                removeSelectOptions()
                makeAjaxCall('GET', '/api/codepostal/' + event.currentTarget.value, fillCommuneList)

            }

            else if (event.currentTarget.value.length < 5) {
                select.prop("disabled", true) 
                removeSelectOptions()
                resetAllScore()
            }

        })
    }


    btnSeach.addEventListener('click', (event) => {
        selectedIndex = select.select2('data')[0]['id']
        if (txtSeach.empty || selectedIndex != -1) {
            makeAjaxCall('GET', '/api/commune/' + selectedIndex, setGlobalIndicators)
            resetAllScore()
        }
        else {
            resetAllScore()
            txtError.textContent = "Données non valides"
        }



    })



    /*** rempli le select  des communes  ***/
    const fillCommuneList = (data) => {
        let mydata = JSON.parse(data)
        //  console.log(mydata)
        var firstOpt = new Option("", "", false, false);
        select.append(firstOpt).trigger('change');
        for (elm of mydata) {
            var data = {
                id: elm.id,
                text: elm.nom_commune
            };
            if (elm.nom_iris) data.text += ' - ' + elm.nom_iris

            var newOption = new Option(data.text, data.id, false, false);
            select.append(newOption).trigger('change');
        }
    }

    /* vider le select */

    const removeSelectOptions = () => {
        select.html("");
    }


    const setGlobalIndicators = (data) => {

        console.log(data)
        let dataJson = JSON.parse(data)
        fillScoreFiled(dataJson)
    }

    const fillScoreFiled = (data) => {

        setCounter(data.score_acces_intnum, accesInferfaceNumeriqueScore)
        setCounter(data.score_acces_info, accesInformationScore)
        setCounter(data.score_comp_admin, competencesAdministrativeScore)
        setCounter(data.score_comp_numsco, competencesNumeriqueScore)
        setCounter(data.departement.score_global, departementalScore)
        setCounter(data.region.score_global, regionalScore)
        setCounter(data.rang, rangGlobal)

        nomDepartement.textContent = data.departement.nom
        nomRegion.textContent = data.region.nom
        nomRegion.textContent = data.region.nom
        nomCommune.textContent = data.nom_commune
        globalScore.textContent = "Score global : " + data.score_global

        denominateur.textContent = ' / ' + data.nb_communes


    }

    const resetAllScore = () => {

        let zero = '--'
        let empty = ''
        accesInferfaceNumeriqueScore.textContent = zero
        accesInformationScore.textContent = zero
        competencesAdministrativeScore.textContent = zero
        competencesNumeriqueScore.textContent = zero
        departementalScore.textContent = zero
        regionalScore.textContent = zero
        globalScore.textContent = zero
        nomCommune.textContent = empty
        nomDepartement.textContent = empty
        nomRegion.textContent = empty
        txtError.textContent = empty
        denominateur.textContent = empty
        rangGlobal.textContent = empty
       

    }


    /**compteur **/


    const setCounter = (value, node) => {
       // console.log(value);

        if (value >= 0 && value < 600) {
            var delta = (duree / value); // On calcule l'intervalle de temps entre chaque rafraîchissement du compteur (durée mise en milliseconde)
            var cpt = 0; // Initialisation du compteur

            let timer = setInterval(() => {
              //  console.log(delta)
                node.innerHTML = cpt;
                if (cpt == value) clearInterval(timer)
                cpt += 1;
            }, delta);
        } else node.innerHTML = value;


    }


    /*  faire un appel AJAX **/
    const makeAjaxCall = (methode, url, callback) => {
        console.log(url)
        let ajax = new XMLHttpRequest()

        ajax.onreadystatechange = () => {
            if (ajax.readyState == 4 && ajax.status == 200) {
                callback(ajax.response)
            }

        }
        console.log('request sent')
        ajax.open(methode, url);
        ajax.send()
    }




    /*******************************************************************/

    $(document).ready(function () {
        select.select2({
            placeholder: 'Sélectionnez une commune',
        });



    })

    $("#txt_code_postal").keypress(function () {
        if (this.value.length == 5) {
            return false;
        }
    })
    // function call


    bindCodePostalListener();
    resetAllScore()



</script>