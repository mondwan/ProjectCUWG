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

                    {% if isSucceeded %}
                        {% include './authentication/rainbow_table/commonpractices.tpl' %}
                    {% else %}
                        {% include './authentication/rainbow_table/instruction.tpl' %}

                        {% include './authentication/rainbow_table/loginForm.tpl' %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
        <script
          type="text/javascript"
          src="/js/authentication/rainbow_table.js">
        </script>
    </body>
</html>
{% endautoescape %}
