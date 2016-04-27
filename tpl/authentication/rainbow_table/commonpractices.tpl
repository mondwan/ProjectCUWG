<div class="row">
    <div class="col-xs-12">
        <h4 class="text-success">Success!</h4>
        <p>Common practice</p>
        <ul class="list-group">
            <li class="list-group-item">
                Do not place any credentials in the front end since they can
                be viewed by anyone.
            </li>
            <li class="list-group-item">
                Password validation MUST always be placed on server side.
                Either by sending a post request through AJAX or form submit
                in POST is good enough.
            </li>
            <li class="code-item">
            <code>saltedhash(password) = hash(hash(password) + salt)</code>
            </li>
        </ul>
        <a href="/" class="btn btn-success">Back to home</a>
    </div>
</div>
