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
                <h1>XSS</h1>

                <div class="col-xs-12">
                    <strong>Challenges: Cross site scripting</strong>
                    <div class="list-group">
                        <a href="/xss/sanitization" class="list-group-item">XSS - Sanitizing Input</a>
                        <a href="/xss/javascript" class="list-group-item">XSS - Client Side XSS</a>
                        <a href="/xss/preventRequestForgery" class="list-group-item">CSRF - Prevent Request Forgery</a>
                    </div>
                </div>
            </div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
