<!DOCTYPE html>

<html>
<head>
  <title>Beego</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  {{template "include/css.tpl"}}
</head>

<body>

  {{.LayoutContent}}
  
  <header>
  </header>

  <div class="container">
    <h1>Welcome to Beego</h1>
    Beego is a simple & powerful Go web framework which is inspired by tornado and sinatra.
  </div>
  <footer>
  </footer>
  
  {{template "include/js.tpl"}}
</body>
</html>
