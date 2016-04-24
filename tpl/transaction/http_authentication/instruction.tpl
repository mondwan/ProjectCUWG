<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Session - Http Authentication</h1>

        <h3>Goal</h3>
        <p>
            Transaction with basic http authentication is vulnerable. Can you
            deduce username and password for system using basic http
            authentication by packets sniffing?
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
                        Below is one of HTTP packets captured by packets
                        sniffing.
                    </li>
                    <li class="list-group-item">
                        Try to deduce username and password from this packet
                    </li>
                    <li class="list-group-item">
                        Go to admin panel with deduced credentials
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        By reading field <code>
                        Authorization: Basic aGFoYToxMjM0
                        </code>, you know system is running Basic HTTP
                        authentication
                    </li>
                    <li class="list-group-item">
                        For any system with Basic HTTP authentication, they
                        encodes credentials with Base64
                    </li>
                    <li class="list-group-item">
                        Type code <code>atob('aGFoYToxMjM0')</code> in
                        browser's console. You will find <code>
                        haha:1234</code> where <code>haha</code> is username
                        while <code>1234</code> is password
                    </li>
                    <li class="list-group-item">
                        Click Go admin panel and enter credential above
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
