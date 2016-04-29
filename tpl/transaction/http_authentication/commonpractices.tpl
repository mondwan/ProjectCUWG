<div class="row">
    <div class="col-xs-12">
        <h4 class="text-success">Success!</h4>
        <p>Common practice</p>
        <ul class="list-group">
            <li class="list-group-item">
                Replace HTTP with HTTPS. This avoids others reading header of
                HTTP easily.
            </li>
            <li class="list-group-item">
                Replace Basic HTTP authentication with Digest HTTP
                authentication which is more secure.
            </li>
            <li class="list-group-item">
                If possible, do not rely on browser's authentication. Handle it
                manually with famous library.
            </li>
        </ul>
        <a id="home" href="/" class="btn btn-success">Back to home</a>
        <script type="text/javascript" src="/js/jquery-2.2.0.min.js"></script>
        <script type="application/javascript">
            var $home = $('#home');

            $(document).ready(function () {
                // Unset Authorization header when clicking home button
                $home.click(function (e) {
                    var href = $(this).attr('href');
                    // Back to home manually
                    e.preventDefault();
                    e.stopPropagation();
                    $.ajax({
                        url: '/transaction/httpAuthentication',
                        method: 'POST',
                        username: 'logout',
                        password: 'logout',
                        headers: {
                            Authorization: 'Basic logout',
                        },
                    }).always(function () {
                        document.location = href;
                    });
                });
            });
        </script>
    </div>
</div>
