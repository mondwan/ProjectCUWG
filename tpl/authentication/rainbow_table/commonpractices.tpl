<div class="row">
    <div class="col-xs-12">
        <h4 class="text-success">Success!</h4>
        <p>Common practice</p>
        <ul class="list-group">
            <li class="list-group-item">
               To defense against Rainbow Table
            </li>
            <li class="list-group-item">
                Rainbow table is ineffective against onepway hashes with large salts.
                <code>saltedhash(password) = hash(hash(password) + salt)</code>
                https://en.wikipedia.org/wiki/Salt_(cryptography)
            </li>
            <li class="code-item">
                Alternative approach - Key Strengthening by extending the key with a random salt.

            </li>
        </ul>
        <a href="/" class="btn btn-success">Back to home</a>
    </div>
</div>
