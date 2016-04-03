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
                    {% if identity = "PETER"  %}
                      <h4> Peter </h4>
                {% endif %}

                <div id="site">
                    {% if identity = "MARY"  %}
                      <h4> Mary </h4>
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
