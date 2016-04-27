<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Rainbow Table</h1>

        <h3>Goal</h3>
       			<p>This site stores user name and password in unencrypted text file. It will load the unecrypted text file and compare the user's input while user login.</p>
                <p>Try to login as Mary (user name: mary)</p>

        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#guideline" aria-controls="guideline" role="tab" data-toggle="tab">Guideline</a>
            </li>
            <li role="presentation">
                <a href="#solution" aria-controls="solution" role="tab" data-toggle="tab">Solution</a>
            </li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="guideline">
                <ul class="list-group">
                    <li class="list-group-item">
                        Look into html source code
                    </li>
                    <li class="list-group-item">
                        Find the hidden field
                    </li>
                    <li class="list-group-item">
                        Try to access the unencrypted password file with rainbow table
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Read the source code through browser's developer tool
                    </li>
                    <li class="list-group-item">
                        Find out an hidden input field with password in
                        plaintext format
                    </li>
                    <li class="list-group-item">
                        After looking at the hidden value, you know the
                        password is helloworld
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
