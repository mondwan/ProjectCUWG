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
                <h1>Challenge: Password - Unecrypted password</h1>

                <h3>Goal</h3>
                <p>This site stores user name and password in unencrypted text file. It will load the unecrypted text file and compare the user's input while user login.</p>
                <p>Try to login as Mary (user name: mary)</p>

                <h3>Guideline</h3>
                <ul class="list-group">
                    <li class="list-group-item">Look into html source code</li>
                    <li class="list-group-item">Find the hidden field</li>
                    <li class="list-group-item">Try to access the unencrypted password file</li>
                </ul>

                <div id="site">
                {% if not isSignUp  %}
                    {% if isLogin  %}
                        <h3>Login</h3>
                        <form
                            id="loginF"
                            action="/authentication/hidden/login"
                            method="POST"
                            class="form-horizontal">
                            
                            <input type="hidden" name="file" value="hidden/passwordFile">
                            
                            <div class="form-group">
                                <label
                                    for="name"
                                    class="col-xs-2 control-label">User Name</label>
                                <div class="col-xs-10">
                                    <input
                                        type="text"
                                        name="name"
                                        class="form-control"
                                        id="name"
                                        placeholder="Username"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label
                                    for="pw"
                                    class="col-xs-2 control-label">Password</label>
                                <div class="col-xs-10">
                                    <input
                                        type="password"
                                        name="pw"
                                        class="form-control"
                                        id="pw"
                                        placeholder="Password"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-offset-2 col-xs-10">
                                    <button
                                        type="submit"
                                        class="btn btn-default">Sign in</button>
                                </div>
                            </div>
                        </form>
                        
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
