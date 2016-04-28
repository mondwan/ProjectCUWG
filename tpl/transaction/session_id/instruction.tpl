<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Cookies - Insecure Session Id</h1>

        <h3>Goal</h3>
        <p>Try to imitate other user by guessing other user's session ID </p>

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
                    <li class="list-group-item">Login with your account ( mary:password7 ) and find out your session id from somewhere </li>
                    <li class="list-group-item">Try to imitate other user by modifying the session id and access their confidential information</li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Log-in with Mary's account and you can find your session id appended on the url
                    </li>
                    <li class="list-group-item">
                        Try to guess other's session id by accessing the modified url and view other's information by imitating Peter ( sid=2019900617 in this task )
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
