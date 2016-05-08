<div class="row">
    <div class="col-xs-12">
        <h1>Challenge: Password - Rainbow Table</h1>

        <h3>Goal</h3>
                <p>Rainbow table is a pre-computation technique for cracking password hashes.</p>
       			<p>This site stores user names and hashes of user password in unencrypted text file. Try to recover Mary's'plaintext password more efficently by using Rainbow table</p>
                <p>After the challenge, you will get a taste of the basic concpet and steps of rainbow table and how to defend this attack.</p>
                <p>Try further explorer more on the principle together after these tasks! =]</p>

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
                        Try to pre-compute the rainbow table using the Simplified Hash function and Reduction functions provided.</br>
                        **Hints can be found on the hidden field**
                    </li>
                    <li class="list-group-item">
                        Find the hidden field and Try to access the unencrypted Security Account Manager (SAM) file which contain user name and password hashes.
                    </li>
                    <li class="list-group-item">
                        Find out the Hash chain of corresponding hash under Mary using the Rainblow table you have pre-computed.
                    </li>
                    <li class="list-group-item">
                        Try to log-in with your cracked plain text password.
                    </li>
                    <p hidden> For admin use: unencrypted text file is stored under /authentication/rainbowTable/passwordFile </p>
                    <p hidden> Hints: Try to computer the plaintext passsword starting from 900615 </p>
                </ul>
            </div>
            <div role="tabpanel" class="tab-pane" id="solution">
                <ul class="list-group">
                    <li class="list-group-item">
                        As we know that the plaint text password is limited from 100000 to 999999, we can pre-compute the hashes chains with the Hash and reduction functions.<br>
                        Using sequence of related reduction functions R(k) instead of same ordinary reduction function is to minimize collision with ordinary hash chain ( False Alarm ).
                    </li>
                    <li class="list-group-item">
                    For pre-computing the table, to speed up the process, starting from "900615" and compute the hash and reduced plaintext using the tools provided with the sequence below:</br>
                    Plaintext -> H( ) -> R1( ) -> H( ) -> R2( ) -> H( ) -> R3( ) -> Output </br>
                    900615,9037,437037,4365,465633,4601,401066</br>
                    900616,9040,430040,4320,460233,4601,401066</br>
                    900617,9051,431051,4353,463533,4665,405666</br>
                    900618,9062,432062,4386,466833,4631,401366</br>
                    Sotred only the 1st and 7th column to form your Rainbow Table.
                    </li>
                    <li class="list-group-item">
                        You can find out the hidden filed on HTML code and access the SAM file at /authentication/rainbowTable/passwordFile.
                    </li>
                    <li class="list-group-item">
                        To crake the password with rainbow table , <br>
                        Step 1 : Starting from the hash ("4353") obtained from SAM file, try to computes the last reduction (R3) used in the table and checks whether the password exits in the last column on your table.
                    </li>
                    <li class="list-group-item">
                        Step2 : If the test fail ( 4353 -R3( )-> 403533 where matches do not exist in the last column ) , try to compute a chain starting from the 2nd last reduction , R2( ).
                    </li>
                    <li class="list-group-item">
                    	Step3 : If the test is positive ( 4353 -R2( )-> 463533 -H( )-> 4665 -R3( )->405666 where you can find the corresponding output at the end of the chain ).
                    </li>
                    <li class="list-group-item">
                        Step4 : Generate a chain ( 900617,9051,431051,4353,463533,4665,405666 ) and compares at each iteration the hash with the target hash. Then, you have got the password ( 1st column : 900617 ) that produced the whole chain and the attack is successful.
                    </li>
                    <li class="list-group-item">
                        <code> The corresponding chain to crack Mary's password:  900617->9051->431051->4353->463533->4665->405666</code>
                    </li>
                    <li class="list-group-item">
                    You may notice that plainttext password 900615 and 900616 produce the same hash after 3rd H( ) , if we use the same ordinary reduction function / reverse function , may of Flase Alarm will be produced and affect the attack's efficiency. With sequence of related Rk(), by comparing every iteration of the rainbow chain, we can eliminate the hash collision (False Alarm).
                    </li>
                    <li class="list-group-item">
                        Comparing with Brute-force attack , Rainbow table is a practical example of a space/time trade-off ,which sacrifice storage in producing a look-up table but shorten the processing time.
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
