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

                <p>Testing</p>
			</div>
        </div>
      </div>

      {% include 'commonJSLib.tpl' %}
    </body>
</html>
{% endautoescape %}
