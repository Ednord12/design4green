<script>

    // var declaration
    let txtSeach = document.getElementById('txt_code_postal')
    let btnSeach=  document.getElementById('btn_search')

    /*******************************************************************/

    // function definition
    const bindCodePostalListener = () => {
  
        txtSeach.addEventListener('input', (event) => {
                if(event.currentTarget.value.length===5){

                    console.log(event.currentTarget.value)
                    makeAjaxCall('GET','127.0.0.1/api/codepostal/:'+ event.currentTarget.value,fillCommuneList)

                }
               
            })
    }


    btnSeach.addEventListener('click', (event) => {
                console.log(event.currentTarget.value)
                console.log('ok')
            })
   


    // rempli le select  des communes
    const fillCommuneList=(data)=>{
        console.log(data)

    }


     //  faire un appelle AJAX
     const makeAjaxCall =(methode,url,callback)=>{
         console.log(url)
        let ajax= new XMLHttpRequest()

        ajax.onreadystatechange= ()=>{
            if (ajax.readyState==4 && ajax.status==200){
                callback(ajax.response)
            }
            
        }
        console.log('request sent')
        ajax.open(methode,url);
        ajax.send()
    }




    /*******************************************************************/

    $(document).ready(function(){
        $("#communes").select2({
            placeholder: 'Sélectionnez une commune',
            allowClear: true
        });


     
    })
       // function call
        
       bindCodePostalListener();


   
</script>
