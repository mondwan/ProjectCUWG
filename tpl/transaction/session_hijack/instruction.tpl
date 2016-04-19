<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Session -Session Hijack</h1>

        <h3>Goal</h3>
        <p>
            Given that Mary, a VIP from a bank, has been login to the system.
            We are going to hijack her session and do things on behalf of her.
        </p>

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
                        We have a dummy account where name and password are
                        both "john".
                    </li>
                    <li class="list-group-item">
                        For each successful login, bank system will given us
                        an example of session ID.
                    </li>
                    <li class="list-group-item">
                        Cookies of this page is editable through browser's
                        console.
                    </li>
                    <li class="list-group-item">
                        Invalid cookie guess will deactivate current session
                        ID.
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Get serveral session IDs pattern by loging in and out
                        with dummy account and check it on browser's console.
                    </li>
                    <li class="list-group-item">
                        After studying those session IDs, we know that session
                        ID is in format of "USERNAME:RANDOM_NUMBER".
                        RANDOM_NUMBER seems fall in a range of 1 to 10
                    </li>
                    <li class="list-group-item">
                        Brute force the session ID by typing follow command in
                        the brower's console.
                        <code>document.cookie = "SID=mary:GUESS"</code>.
                        Replace GUESS with digit from 1 to 10 and click
                        "Transfer money on behalf of Mary" button to verify.
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
