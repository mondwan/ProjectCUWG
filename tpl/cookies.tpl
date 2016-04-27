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
                        {% include './transaction/session_id/commonpractices.tpl' %}
                    {% else %}
                        {% include './transaction/session_id/instruction.tpl' %}

                        {% include './transaction/session_id/loginForm.tpl' %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
        <script
          type="text/javascript"
          src="/js/authentication/password2.js">
        </script>
    </body>
</html>
{% endautoescape %}
