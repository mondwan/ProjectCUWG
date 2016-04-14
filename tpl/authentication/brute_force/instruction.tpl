<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Brute Force</h1>

        <h3>Goal</h3>
        <p>Try to login as Mary by guessing her credentials (user name: mary)</p>

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
                        Checkout requirement by creating an account
                    </li>
                    <li class="list-group-item">
                        Guess Mary's password by brute force
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Get possible choices for a password by reading password field
                        in signup form
                    </li>
                    <li class="list-group-item">
                        We know password must be in range from 0 to 9
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
