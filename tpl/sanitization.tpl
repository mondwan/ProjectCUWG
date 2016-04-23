{% autoescape on %}
<html>
    <head>
        {% include 'commonHeader.tpl' %}
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    {% include 'breadcrumb.tpl' %}
                    {% if isSucceeded %}
                            {% include './xss/sanitization/commonpractices.tpl' %}
                    {% else %}
                        {% if sid %}
                        
                            {% include './xss/sanitization/reviewForm.tpl' %}

                        {% else %}
                            {% include './xss/sanitization/instruction.tpl' %}
                            {% include './xss/sanitization/loginForm.tpl' %}

                            {% if passwordIncorrect %}
                                <b>Login Fail, Please try again</b>
                            {% endif %}
                           
                        {% endif %}
                    {% endif %}
                    
                    
                </div>
            </div>
        </div>
        {% if userError %}
            <p><b>Incorrect: Should leave comment as mary, please try again</b></p>
        {% endif %}
        {% include 'commonJSLib.tpl' %}
        
        <script
          type="text/javascript"
          src="/js/xss/sanitization.js">
        </script>
    </body>
</html>
{% endautoescape %}
