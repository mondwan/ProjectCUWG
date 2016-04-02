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
                <h1>Challenge: Cookies - Insecure Session Id</h1>

                <h3>Goal</h3>
                <p>Try to imitate other user by guessing their session ID </p>

                <h3>Guideline</h3>
                <ul class="list-group">
                    <li class="list-group-item">Login with your account and find out your session id from somewhere </li>
                    <li class="list-group-item">Try to imitate other user by chaning the session id</li>
                </ul>

                <div id="site">
                {% if not isSignUp  %}
                    {% if isLogin  %}
                        <h3>Login</h3>
                        <form
                            id="loginF"
                            action="/transaction/cookies/sid%2019900615"
                            method="POST"
                            class="form-horizontal">
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
