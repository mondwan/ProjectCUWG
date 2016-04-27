<div class="row">
    <div id="site" class="col-xs-12">
        <h3>Product Preview</h3>
            <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" >
                            <h4 class="text-center"><span class="label label-info">Samsung</span></h4>
                            <img src="http://placehold.it/650x450&text=Galaxy S5" class="img-responsive">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-md-6 col-xs-6">
                                        <h3>Galaxy S5</h3>
                                    </div>
                                    <div class="col-md-6 col-xs-6 price">
                                        <h3>
                                        <label>$649.99</label></h3>
                                    </div>
                                </div>
                                <p>32GB, 2GB Ram, 1080HD, 5.1 inches, Android</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                    </div>
                                    <div class="col-md-6">
                                        <a href="#" class="btn btn-success btn-product" onclick="buy('id1');"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                </div>

                                <p> </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" >
                            <h4 class="text-center"><span class="label label-info">Apple</span></h4>
                            <img src="http://placehold.it/650x450&text=iPhone 7" class="img-responsive">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-md-6 col-xs-6">
                                        <h3>iPhone 7</h3>
                                    </div>
                                    <div class="col-md-6 col-xs-6 price">
                                        <h3>
                                        <label>$749.99</label></h3>
                                    </div>
                                </div>
                                <p>128GB, 64Bit, 1080HD, 4.7 inches, iOS 10</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                    </div>
                                    <div class="col-md-6">
                                        <a href="#" class="btn btn-default btn-product" id="preorder" onclick="cannotpreorder('id2');"><span class="glyphicon glyphicon-shopping-cart"></span> Pre-order</a></div>
                                </div>

                                <p> </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" >
                            <h4 class="text-center"><span class="label label-info">Nokia</span></h4>
                            <img src="http://placehold.it/650x450&text=Lumia 1520" class="img-responsive">
                            <div class="caption">
                                <div class="row">
                                    <div class="col-md-6 col-xs-6">
                                        <h3>Lumia 1520</h3>
                                    </div>
                                    <div class="col-md-6 col-xs-6 price">
                                        <h3>
                                        <label>$749.00</label></h3>
                                    </div>
                                </div>
                                <p>32GB, 4GB Ram, 1080HD, 6.3 inches, WP 8</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                    </div>
                                    <div class="col-md-6">
                                        <a href="#" class="btn btn-success btn-product" onclick="buy('id3');"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                    </div>

                                    <p> </p>
                                </div>
                            </div>
                        </div>
                        
                    </div> 

                </div>
            </div>
    </div>
</div>

<form
            action="/xss/javascript/product"
            method="POST"
            class="form-horizontal">
            <div class="form-group">
                <div class="col-xs-12">
                    <button
                        type="submit"
                        name="action"
                        value="logout"
                        class="btn btn-default">Logout</button>
                </div>
            </div>
        </form>

