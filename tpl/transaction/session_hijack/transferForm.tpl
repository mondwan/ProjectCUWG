<div class="row">
    <div id="site" class="col-xs-12">
        <h3>Transfer money form</h3>
        <form
            action="/transaction/sessionHijack/transferForm"
            method="POST"
            class="form-horizontal">
            <div class="form-group">
                <div class="col-xs-12">
                    <button
                        type="submit"
                        name="action"
                        value="transfer"
                        class="btn btn-default">Transfer</button>
                    <button
                        type="submit"
                        name="action"
                        value="logout"
                        class="btn btn-default">Logout</button>
                </div>
            </div>
        </form>
    </div>
</div>
