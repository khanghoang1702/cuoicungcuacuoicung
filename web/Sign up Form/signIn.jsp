<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/signIn.css" />
    <link rel="stylesheet" href="css/logo.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
    <div class="main">
      <form action="" class="form" id="form-signIn">
        <div class= "logo">
          <div class="image-Logo"></div>
          <div class="brand">
            <h1>7COLORS</h1>
            <h1>7COLORS</h1>
          </div>
        </div>
        
        <h1 class="heading">SIGN IN</h1>
        <div class="spacer"></div>
        <div class="form-group">
          <label for="nameId" class="lb-control">Name ID</label>
          <input
            type="text"
            name="nameId"
            id="nameId"
            placeholder="Input your name ID"
            class="form-input"
            rules="isRequired"
          />
          <span class="error-control"></span>
        </div>
        <div class="form-group">
          <label for="Password" class="lb-control">Password</label>
          <input
            type="password"
            name="Password"
            id="Password"
            placeholder="Input your password"
            class="form-input"
            rules="isRequired"
          />
          <span class="error-control"></span>
          <div class="remember">
            <input type="checkbox" name="" id="rememberPW">
            <label for="rememberPW">Remember Password</label>
          </div>
        </div>
       
        <button type="submit" class="btn-submit">SUBMIT</button>
        </button>
      </form>
    </div>
    <script src="js/Main.js"></script>
    <script>
      new Validator("#form-signIn");
    </script>
  </body>
</html>
