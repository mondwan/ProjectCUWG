<div class="row">
    <div class="col-xs-12">
        <h4 class="text-success">Success!</h4>
        <p>Common practice</p>
        <ul class="list-group">
            <li class="list-group-item">
                Use Sanitization Library to filter HTML tags input. For example, OWASP AntiSamy for Java, HTMLPurifier for PHP.
            </li>
            <li class="list-group-item">
                Server side should sanitize data before saving to database or sanitize data before using it.
            </li>
            <li class="list-group-item">
                In order to protect the cookies, it should set as HttpOnly. So that it can only be read / write on the server side.
            </li>
            <li class="list-group-item">
                Server side should not do sensitive operaiton on simple GET request.
            </li>
            <li class="list-group-item">
                Beside validting cookies, server side is suggested to implement
                a CSRF token for runtime validation. Malicious users even can
                still forged a request with cookies, however, they cannot
                provide value in the CSRF token. Server side knows this is an
                attack as a result
            </li>
        </ul>
        <a href="/" class="btn btn-success">Back to home</a>
    </div>
</div>
