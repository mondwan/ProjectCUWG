<div class="row">
    <div id="site" class="col-xs-12">
        <h3>Sign Up</h3>
        <form id="signUpF" onsubmit="return validateForm();">
            <div class="form-group">
                <label
                    class="col-xs-2 control-label"
                    for="name"> User Name </label>
                <div class="col-xs-10">
                    <input
                        class="form-control"
                        type="text" name="name" id="name" required/> <br>
                </div>
            </div>
            <div class="form-group">
                <label
                 for="pw"
                 class="col-xs-2 control-label"> Password </label>
                <div class="col-xs-10">
                    <input
                        class="form-control"
                        type="text" name="pw" id="pw" required/>
                    <span class="help-block">
                        (Must be an integer within 0-10)
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label
                 class="col-xs-2 control-label"
                 for="email"> Email </label>
                <div class="col-xs-10">
                    <input
                        class="form-control"
                        type="text" name="email" id="email" required/>  <br>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-offset-2 col-xs-10">
                   <input
                    class="btn btn-default"
                    type="button"
                    value="Sign Up"
                    onclick="validateForm()"/>
                </div>
            </div>
        </form>
    </div>
</div>
