<div class="row">
    <div class="col-xs-12">
        <h4 class="text-success">Success!</h4>
        <p>Common practice</p>
        <ul class="list-group">
            <li class="list-group-item">
                To defense against Rainbow Table:<br>
                Rainbow table is ineffective against one-way hashes with large salts.<br>
                Key stretching helps preventing this kind of attacks. By <code>saltedhash(password) = hash(salt + password)</code><br> and store both 'salt' and hash(password) in secured file.
                Salt can be generated at randon and stored with password hash. <br> If the salt is so large, attacker needs to pre-compute the table for each salt which will significantly increased the cost of attack.
            </li>
            <li class="list-group-item">
            Alternatively, Key strengthening ( securely delete the salt )can also forces both attacker and legitimate users to perform a brute-force search for the salt value.
            </li>
        </ul>
        <a href="/" class="btn btn-success">Back to home</a>
    </div>
</div>
