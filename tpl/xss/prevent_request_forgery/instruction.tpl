<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: XSS - Prevent Request Forgery</h1>

        <h3>Goal</h3>
        <p>
            You know what could happen if you do not sanitizing input from
            users properly from Lesson Sanitizing input. This is a lesson
            variated from that. In this lesson, we show your website is
            vulnerable if you does not aware attack named as forged request.
        </p>
        <p>
            Although your website is free from XSS attack by sanitizing input
            perfectly this time, other websites do not. Malicious hackers can
            attack those websites and create a forged request aims on you via
            XSS on those website!
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
                        Bank account shows victim's current balance. What you
                        need to do is transfering them to your account
                    </li>
                    <li class="list-group-item">
                        There is a forum below the bank account. They are 2
                        different websites.
                    </li>
                    <li class="list-group-item">
                        Although there is no way to do XSS on bank section,
                        you can do that on the victim's faviours forum so that
                        you can transfer the money to your account. That's
                        what CSRF does.
                    </li>
                    <li class="list-group-item">
                        Given that you know sending a GET request to following
                        url <code>/xss/preventRequestForgery/transfer</code>
                        with query string <code>amount</code> can transfer
                        money, can you create a comment such that it can
                        transfer all the money on refresh?
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Enter <code>&lt;img src=&quot;/xss/preventRequestForgery/transfer?amount=1000&quot; /&gt;</code>
                        in the comment box and submit
                    </li>
                    <li class="list-group-item">
                        Click back button after submitting a comment
                    </li>
                    <li class="list-group-item">
                        You will see current balance in the bank account have been zeroed.
                        If not, please refresh the page
                    </li>
                    <li class="list-group-item">
                        The trick is that IMG tag will fire a GET request toward
                        URL we set on page reload. The most horrible thing is
                        this request carries COOKIES! Therefore, bank system will treat
                        this as a valid transfer action.
                    </li>
                    <li class="list-group-item">
                        Checkout common practice to avoid such kind of attack by
                        clicking link below
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
