<script>

    /** var declaration **/



    var duree = 3; // Durée en seconde pendant laquel le compteur ira de 0 à 15


    let txtSeach = document.getElementById('txt_code_postal')
    let btnSeach = document.getElementById('btn_search')
    let select = document.getElementById('communes')
    let accesInferfaceNumeriqueScore = document.getElementById('idAccesInferfaceNumeriqueScore')
    let accesInformationScore = document.getElementById('idAccesInformationScore')
    let competencesAdministrativeScore = document.getElementById('idCompetencesAdministrativeScore')
    let competencesNumeriqueScore = document.getElementById('idCompetencesNumeriqueScore')
    let departementalScore = document.getElementById('idDepartementalScore')
    let regionalScore = document.getElementById('idRegionalScore')
    let globalScore = document.getElementById('idGlobalScore')
    let nomCommune = document.getElementById('idNomCommune')
    let nomRegion = document.getElementById('idNomRegion')
    let nomDepartement = document.getElementById('idNomDepartement')




    /*******************************************************************/

    /** function definition  ***/
    const bindCodePostalListener = () => {

        txtSeach.addEventListener('input', (event) => {
            if (event.currentTarget.value.length === 5) {

                console.log(event.currentTarget.value)
                removeSelectOptions()
                makeAjaxCall('GET', '/api/codepostal/' + event.currentTarget.value, fillCommuneList)

            }

        })
    }


    btnSeach.addEventListener('click', (event) => {
        console.log(event.currentTarget.value)
        console.log('ok')
        resetAllScore()
        makeAjaxCall('GET', '/api/commune/' + select.options[select.selectedIndex].id, setGlobalIndicators)

    })



    /*** rempli le select  des communes  ***/
    const fillCommuneList = (data) => {
        let mydata = JSON.parse(data)
        console.log(mydata)
        for (elm of mydata) {
            let option = document.createElement('option')
            option.text = elm.nom_commune
            if (elm.nom_iris) option.text += ' - ' + elm.nom_iris
            option.id = elm.id
            select.add(option)
        }
    }

    /* vider le select */

    const removeSelectOptions = () => {
        var length = select.options.length;
        for (i = length - 1; i >= 0; i--) {
            select.options[i] = null;
        }
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
        setCounter(data.score_global, globalScore)

        nomDepartement.textContent=data.departement.nom
        nomRegion.textContent=data.region.nom
        nomRegion.textContent=data.region.nom
        nomCommune.textContent=data.nom_commune


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


    }


    /**compteur **/


    const setCounter = (value, node) => {

        var delta = Math.ceil((duree * 1000) / value); // On calcule l'intervalle de temps entre chaque rafraîchissement du compteur (durée mise en milliseconde)
        var cpt = 0; // Initialisation du compteur

        let timer = setInterval(() => {
            //console.log(delta, cpt)
            node.innerHTML = cpt;
            cpt += 1;
            if (cpt == value) clearInterval(timer)
        }, delta);
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
        $("#communes").select2({
            placeholder: 'Sélectionnez une commune',
            allowClear: true
        });



    })
    // function call


    bindCodePostalListener();
    resetAllScore()



</script>