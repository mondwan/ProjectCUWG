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
            <li class="list-group-item">
                If possible, do not transmit password in a plaintext format.
                Try to encode them with SHA or MD5. If not possible, at least
                make sure you are running in HTTPS protocol. No one can read
                your password by simply sniffing packets easily as a result.
            </li>
        </ul>
    </div>
</div>
