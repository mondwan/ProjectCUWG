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

                    {% include './authentication/brute_force/instruction.tpl' %}

                    {% if not isSignUp %}
                        {% if isShowForm %}
                            {% include './authentication/brute_force/loginForm.tpl' %}
                        {% endif %}

                        {% if isShowStatus  %}
                            {% if isSucceeded  %}
                                <b>Success!</b>
                                <p>Common practice</p>
                            {% else %}
                                <b>Login Fail, Please try again</b>
                            {% endif %}
                        {% endif %}
                    {% else %}
                        {% include './authentication/brute_force/signupForm.tpl' %}
                    {% endif %}
                </div>
            </div>
        </div>

        {% include 'commonJSLib.tpl' %}
        <script
          type="text/javascript"
          src="/js/authentication/brute_force.js">
        </script>
    </body>
</html>
{% endautoescape %}
