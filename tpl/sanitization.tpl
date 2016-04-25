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
                        {% include './xss/sanitization/instruction.tpl' %}
                        
                        {% if sid %}
                            {% include './xss/sanitization/reviewForm.tpl' %}
                        {% else %}  
                            {% include './xss/sanitization/loginForm.tpl' %}

                            {% if passwordIncorrect %}
                                <b>Login Fail, Please try again</b>
                            {% endif %}
                           
                        {% endif %}
                    {% endif %}
                    
                    {% if userError %}
                        <p class="text-warning"><b>
                            Incorrect: Should leave comment as mary. Please try
                            again.
                        </b></p>
                    {% endif %}
                </div>
            </div>
        </div>
        {% include 'commonJSLib.tpl' %}
        
        <script
          type="text/javascript"
          src="/js/xss/sanitization.js">
        </script>
    </body>
</html>
{% endautoescape %}
