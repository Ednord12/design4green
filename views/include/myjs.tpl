<script>
    let txtSeach = document.getElementById('txt_code_postal')
    console.log("ok")
    const bindListener = () => {
            txtSeach.addEventListener('input', (event) => {
                console.log(event.currentTarget.value)
                event.currentTarget.value

            })
    }
    bindListener();
</script>
