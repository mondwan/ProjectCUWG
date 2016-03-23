{% autoescape on %}
<html>
    <head>
        {% include 'commonHeader.tpl' %}
    </head>
    <body>

      <div class="container">
        <div class="row">
            <div class="col-xs-12">
				{% include 'breadcrumb.tpl' %}
                <h1>Challenge: Password</h1>

                <h3>Guideline</h3>
                <p>Create account -> know the password requirement -> brute force</p>
                <p>Try to hack Mary's account (user name: mary)</p>

             
                <div id="site">
                {% if not isSignUp  %}
                    {% if isLogin  %}
                        <h3>Login</h3>
                        <form id="loginF" action="/authentication/password/login" method="POST">
                           <label for="name"> User Name </label>
                           <input type="text" name="name" id="name" required/> <br>
                           <label for="pw"> Password </label>
                           <input type="text" name="pw" id="pw" required/> <br>
                           <input type="submit" value="Login">
                        </form>
                        <a href="/authentication/password/signUp">Sign Up</a>    
                        
                        
                        {% if isStarted  %}
                            {% if not isSucceeded  %}
                            <b>Login Fail, Please try again</b>
                            {% endif %}
                        {% endif %}
                    {% endif %}
                    
                    {% if isSucceeded  %}
                            <b>Success!</b>
                            <p>Common practice</p>
                    {% endif %}
                {% endif %}
                
                {% if isSignUp  %}
                    <h3>Sign Up</h3>
                    <form id="signUpF" onsubmit="return validateForm();">
                           <label for="name"> User Name </label>
                           <input type="text" name="name" id="name" required/> <br>
                           <label for="pw"> Password </label>
                           <input type="text" name="pw" id="pw" required/> (must be integer within 0-10) <br>
                           <label for="email"> Email </label>
                           <input type="text" name="email" id="email" required/>  <br>
                           <input type="button" value="Sign Up" onclick="validateForm()">
                    </form>
                {% endif %}
                
                </div>
			</div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
      <script
        type="text/javascript"
        src="/js/authentication/password.js">
      </script>
    </body>
</html>
{% endautoescape %}
