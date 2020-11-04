<script>

    // var declaration
    let txtSeach = document.getElementById('txt_code_postal')
    let btnSeach = document.getElementById('btn_search')
    let select = document.getElementById('communes')

    /*******************************************************************/

    // function definition
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
        makeAjaxCall('GET', '/api/commune/' + select.options[select.selectedIndex].id, setIndicators)
        
    })



    // rempli le select  des communes
    const fillCommuneList = (data) => {
        let mydata = JSON.parse(data)
            console.log(mydata)
        for (elm of mydata) {
            let option = document.createElement('option')
            option.text = elm.nom_commune
            option.id=elm.id
            select.add(option)
        }
    }

    // vider le select

    const removeSelectOptions=()=>{
        var length = select.options.length;
        for (i = length - 1; i >= 0; i--) {
            select.options[i] = null;
        }
    }
    const setIndicators= (data)=>{

        console.log(data)
    }


    //  faire un appel AJAX
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



</script>