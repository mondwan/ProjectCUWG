<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Rainbow Table</h1>

        <h3>Goal</h3>
       			<p>This site stores user name and hashes of user password in unencrypted text file. Try to recover the plaintext password more efficently by using Rainbow table</p>
                <p>Understand the basic concpet of pre-computed rainbow table and how to defense this attack.</p>

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
                        Try to pre-compute the rainbow table using the Simplified Hash function and Reduction functions provided and store only the 1st and last columns.
                    </li>
                    <li class="list-group-item">
                        <code> False alarm ( collision with ordinary hash chain )is avoided by replacing the single reduction function with sequence of related reduction functions R(k).</code>
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
                    <li> <img src='./authentication/rainbow_table/test_rainbow.png'> </li>
                    <h5>Reference : https://en.wikipedia.org/wiki/Rainbow_table</h5>
                    <p hidden> For admin use: unencrypted text file is stored under /authentication/rainbowTable/passwordFile </p>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        As we know that the plaint text password is ranged from 100000 to 999999, we can pre-compute the hashes chains with the known Hash and reduction functions.
                    </li>
                    <li class="list-group-item">
                        Find out the hidden filed on HTML code and access the SAM file at /authentication/rainbowTable/passwordFile.
                    </li>
                    <li class="list-group-item">
                        To crake the password with rainbow table , step 1 : Starting from the hash ("282882") obtained from SAM file, one computes the last reduction used in the table and checks whether the password exits in the last column on your table.
                    </li>
                    <li class="list-group-item">
                        Step2 : If the test fail which means you cannot find a result from step 1 , try to compute a chain with the 2nd last reduction ( R2 ).
                    </li>
                    <li class="list-group-item">
                    	Step3 : If the test is positive which means that you can find the corresponding reduced hashes at the end of the chain and in the table, the password is retrieved at the beginning of the chain that produces the last results.
                    </li>
                    <li class="list-group-item">
                    	Step4 : Generate a chain and compares at each iteration the hash with the target hash. You have got the password that produced the whole chain and the attack is successful.
                    </li>
                    <li class="list-group-item">
                    <code> Such that : 900617->990000->930009->990333->930309->990333->930363</code>    
                    </li>         
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="rainbowtable">
                <ul class="list-group">
                    <li class="list-group-item">
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
                    <li class="list-group-item"> eg. 123456 -H-> 113222 -R1-> 143221 -H-> 113444 -R2-> 146421 -H-> 116444 -R3-> 146424 </li>
                </ul>
            </div>
        </div>
    </div>
</div>
