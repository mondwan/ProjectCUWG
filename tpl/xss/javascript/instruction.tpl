<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: XSS - Client Side XSS</h1>

        <h3>Goal</h3>
        <p>Only premium user can pre-order new product. Try to pre-order item without premium membership</p>

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
                        Let to look at javascript code, and find out some hints
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Use developer mode in browser, and look at javascript code (javascript.js)
                    </li>
                    <li class="list-group-item">
                        In the javscript, you will see that processPerOrder(id) is used to place order to server.
                    </li>
                    <li class="list-group-item">
                        However, this function will check whether the user is premium from the state in cookies.
                        Change the state in cookies by typing the following in browser's console.
                        <code>
                            document.cookie = "ispremium=True; path=/xss/javascript/product"
                        </code>
                    </li>
                    <li class="list-group-item">
                        After that, you can call processPerOrder(id) directly from the browser.
                        i.e. Enter <code> javascript:preorder('id2'); </code> to browser address bar.
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
