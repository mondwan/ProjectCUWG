<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Rainbow Table</h1>

        <h3>Goal</h3>
       			<p>This site stores user name and hashes of user password in unencrypted text file. Try to recover the plaintext password more efficently by using Rainbow table</p>
                <p>Understand the basic concpet of pre-computed rainbow table and how to defend this attack.</p>

        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#guideline" aria-controls="guideline" role="tab" data-toggle="tab">Guideline</a>
            </li>
            <li role="presentation">
                <a href="#solution" aria-controls="solution" role="tab" data-toggle="tab">Solution</a>
            </li>
            <li role="presentation">
                <a href="#rainbowtable" aria-controls="rainbowtable" role="tab" data-toggle="tab">Rainbow Table Tools</a>
            </li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="guideline">
                <ul class="list-group">
                    <li class="list-group-item">
                        Try to pre-compute the rainbow table using the Simplified Hash function and Reduction functions provided and store only the 1st and last columns.
                    </li>
                    <li class="list-group-item">
                        R(n) are the simplifed reduction functions that consistently maps a hashed value into a valid plaintext value.
                    </li>                    
                    <li class="list-group-item">
                        Find the hidden field and Try to access the unencrypted Security Account Manager (SAM) file which contain user name and password hashes.
                    </li>
                    <li class="list-group-item">
                        Find out the Hash chain of corresponding hash under Mary with the Rainblow table you have computed.
                    </li>
                    <li class="list-group-item">
                        Try to log-in with your cracked plain text password.
                    </li>
                    <p hidden> For admin use: unencrypted text file is stored under /authentication/rainbowTable/passwordFile </p>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        As we know that the plaint text password is ranged from 100000 to 999999, we can pre-compute the hashes chains with the known Hash and reduction functions.<br>
                        ** Collision with ordinary hash chain ( False Alarm ) is avoided by using sequence of related reduction functions R(k)instead of same ordinary reduction function.
                    </li>
                    <li class="list-group-item">
                        You can find out the hidden filed on HTML code and access the SAM file at /authentication/rainbowTable/passwordFile.
                    </li>
                    <li class="list-group-item">
                        To crake the password with rainbow table , <br>
                        Step 1 : Starting from the hash ("4353") obtained from SAM file, try to computes the last reduction (R3) used in the table and checks whether the password exits in the last column on your table.
                    </li>
                    <li class="list-group-item">
                        Step2 : If the test fail ( 4353 -R3 -> 403533 where cannot find any matches from last column ) , try to compute a chain with the 2nd last reduction ( R2 ).
                    </li>
                    <li class="list-group-item">
                    	Step3 : If the test is positive ( 4353->463533->4665->405666 where you can find the corresponding reduced hashes at the end of the chain ), the password is retrieved at the beginning of the chain that produces the matched results in last column.
                    </li>
                    <li class="list-group-item">
                        Step4 : Generate a chain and compares at each iteration the hash with the target hash. Then, you have got the password ( 1st column : 900617 ) that produced the whole chain and the attack is successful.
                    </li>
                    <li class="list-group-item">
                        <code> The chain that should be obtained by you:  900617->9051->431051->4353->463533->4665->405666</code>
                    </li>         
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="rainbowtable">
                <ul class="list-group">
                    <li class="list-group-item">
                        Hash function ( H ) : <input type="number" id="hashfunc" min="100000" max="999999">
                        <button
                        type="submit"
                        id="hashfuncbtn"
                        class="btn btn-default">Compute</button> 
                        <input id="Hash_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R1) : <input type="number" id="redfunc1" min="1000" max="9999">
                        <button
                        type="submit"
                        id="redfuncbtn1"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc1_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R2) : <input type="number" id="redfunc2" min="1000" max="9999">
                        <button
                        type="submit"
                        id="redfuncbtn2"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc2_result" type="text" ><br>
                    </li>
                    <li class="list-group-item">
                        Reduction function (R3) : <input type="number" id="redfunc3" min="1000" max="9999">
                        <button
                        type="submit"
                        id="redfuncbtn3"
                        class="btn btn-default">Compute</button> 
                        <input id="redfunc3_result" type="text" ><br>
                    </li>
                    <li class="list-group-item"> For example : 123456 -H-> 1230 -R1-> 540230 -H-> 5456 -R2-> 516544 -H-> 5170 -R3-> 520711 </li>
                </ul>
            </div>
        </div>
    </div>
</div>
