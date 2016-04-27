<div class="row">
    <div id="site" class="col-xs-12">
        <h3>Login</h3>
                        <form
                            id="loginF"
                            action="/authentication/hidden/login"
                            method="POST"
                            class="form-horizontal">

                            <input type="hidden" name="file" value="hidden/passwordFile">

                            <div class="form-group">
                                <label
                                    for="name"
                                    class="col-xs-2 control-label">User Name</label>
                                <div class="col-xs-10">
                                    <input
                                        type="text"
                                        name="name"
                                        class="form-control"
                                        id="name"
                                        placeholder="Username"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label
                                    for="pw"
                                    class="col-xs-2 control-label">Password</label>
                                <div class="col-xs-10">
                                    <input
                                        type="password"
                                        name="pw"
                                        class="form-control"
                                        id="pw"
                                        placeholder="Password"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-offset-2 col-xs-10">
                                    <button
                                        type="submit"
                                        class="btn btn-default">Sign in</button>
                                </div>
                            </div>
                        </form>
    </div>
</div>
