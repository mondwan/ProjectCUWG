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
                <h1>Welcome to Project CUWG</h1>

                <p>
                    CUWG means Web Goat in
                    <strong>The Chinese University of Hong Kong</strong>
                    We are going to a build a simliar application as
                    <a href="https://github.com/WebGoat/WebGoat">WebGoat</a>
                    does.
                </p>

                <p>
                    Comparing to the original one, we are focusing on 3 topics:
                    Authentication, Transaction, Cross Site Scripting
                </p>
			</div>

			<div class="col-xs-4">
			    <strong>Challenges: Authentication</strong>
				<div class="list-group">
                    <a href="/authentication/password" class="list-group-item">Password - Brute Force</a>
                    <a href="/authentication/hiddenPassword" class="list-group-item">Password - Hidden Password</a>
                    <a href="/authentication/rainbowTable" class="list-group-item">Password - Rainbow Table</a>
				</div>
            </div>
			<div class="col-xs-4">
			    <strong>Challenges: Transaction</strong>
				<div class="list-group">
                    <a href="/transaction/cookies" class="list-group-item">Cookies - Insecure Session Id</a>
                    <a href="/transaction/sessionHijack" class="list-group-item">Session - Session Hijack</a>
                    <a href="#" class="list-group-item">Topic 3</a>
				</div>
            </div>
			<div class="col-xs-4">
			    <strong>Challenges: Cross site scripting</strong>
                <div class="list-group">
                    <a href="/xss/sanitization" class="list-group-item">XSS - Sanitizing Input</a>
                    <a href="#" class="list-group-item">Topic 2</a>
                    <a href="#" class="list-group-item">Topic 3</a>
                </div>
            </div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
