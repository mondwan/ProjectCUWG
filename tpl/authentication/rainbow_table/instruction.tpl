<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Rainbow Table</h1>

        <h3>Goal</h3>
       			<p>This site stores user name and hashes of user password in unencrypted text file. With the provide Rainbow table, try to recover the plaintext password </p>
                <p>Try to login as Mary (user name: mary)</p>

        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#guideline" aria-controls="guideline" role="tab" data-toggle="tab">Guideline</a>
            </li>
            <li role="presentation">
                <a href="#solution" aria-controls="solution" role="tab" data-toggle="tab">Solution</a>
            </li>
            <li role="presentation">
                <a href="#rainbowtable" aria-controls="rainbowtable" role="tab" data-toggle="tab">Rainbow Table</a>
            </li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="guideline">
                <ul class="list-group">
                    <li class="list-group-item">
                        Look into html source code
                    </li>
                    <li class="list-group-item">
                        Find the hidden field and Try to access the unencrypted Security Account MAnager (SAM) file which contain user name and password hashes
                    </li>
                    <li class="list-group-item">
                        Find out the Hash chain of corresponding hash under Mary with the pre-computed rainbow table proiveded.
                    </li>
                    <li class="list-group-item">
                        Try to log-in with your cracked plain text password
                    </li>
                    <li> <img src='./authentication/rainbow_table/test_rainbow.png'> </li>
                    <h5>Reference : https://en.wikipedia.org/wiki/Rainbow_table</h5>
                    <p hidden> For admin use: unencrypted text file is stored under /authentication/rainbowTable/passwordFile </p>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        Read the source code through browser's developer tool
                    </li>
                    <li class="list-group-item">
                        Find out an hidden input field with password in
                        plaintext format
                    </li>
                    <li class="list-group-item">
                        After looking at the hidden value, you know the
                        password is helloworld
                    </li>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="rainbowtable">
                <ul class="list-group">
                    <li class="list-group-item">
<<<<<<< HEAD
                        Hash function ( H ) : <input type="number" id="hashfunc" min="0" max="100">
                        <button
                        type="submit"
                        id="hashfuncbtn"
                        class="btn btn-default">Compute</button> 
                        <input id="Hash_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R1) : <input type="text" id="redfunc1">
                        <button
                        type="submit"
                        id="redfuncbtn1"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc1_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R2) : <input type="text" id="redfunc2">
                        <button
                        type="submit"
                        id="redfuncbtn2"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc2_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R3) : <input type="text" id="redfunc3">
                        <button
                        type="submit"
                        id="redfuncbtn3"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc3_result" type="text" ><br>
                    </li>                                                           
                </ul>
            </div>
        </div>
    </div>
</div>
