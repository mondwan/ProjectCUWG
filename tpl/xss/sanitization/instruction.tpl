<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: XSS - Sanitizing Input</h1>

        <h3>Goal</h3>
        <p>Try to use user name "mary" to leave a review with a link getting user cookies</p>

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
                        We have a dummy account where name and password are both "john".
                    </li>
                    <li class="list-group-item">
                        After login as john, leave a review as "mary"
                    </li>
                    <li class="list-group-item">
                        The review should have a link which will get user's cookies after clicked.
                    </li>
                    <li class="list-group-item">
                        The link should append the cookies to /xss/sanitization/cookies .
                    </li>
                    <li class="list-group-item">
                        After left the review, click on the link you created.
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Find the hidden field after login and change the value to "mary"
                    </li>
                    <li class="list-group-item">
                        In the review textbox, type <code>
                            &lt;a
                                href=&quot;javascript:document.location='/xss/sanitization/cookies?'+document.cookie;&quot;
                            &gt;Click here to get discount!&lt;/a&gt;
                        </code>
                    </li>
                    <li class="list-group-item">
                        Try and error until we get 7 and success. Therefore 7 is the
                        password of Mary
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
