<div class="row">
    <div id="site" class="col-xs-12">
        <h3>Sign Up</h3>
        <form id="signUpF" onsubmit="return validateForm();">
               <label for="name"> User Name </label>
               <input type="text" name="name" id="name" required/> <br>
               <label for="pw"> Password </label>
               <input type="text" name="pw" id="pw" required/> (must be integer within 0-10) <br>
               <label for="email"> Email </label>
               <input type="text" name="email" id="email" required/>  <br>
               <input type="button" value="Sign Up" onclick="validateForm()">
        </form>
    </div>
</div>
