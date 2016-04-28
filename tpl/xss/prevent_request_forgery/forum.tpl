<div class="row"><div class="col-xs-12">
    <h3>Forum</h3>
	<div class="media">
		<a class="pull-left" href="#">
			<img class="media-object" src="http://placehold.it/64x64" alt="">
		</a>
		<div class="media-body">
			<h4 class="media-heading">Captain America
				<small>August 25, 2014 at 9:30 PM</small>
			</h4>
			Captain Captain Captain Captain Captain Captain Captain Captain
		</div>
	</div>
	<div class="media">
		<a class="pull-left" href="#">
			<img class="media-object" src="http://placehold.it/64x64" alt="">
		</a>
		<div class="media-body">
			<h4 class="media-heading">Ironman
				<small>August 25, 2014 at 9:30 PM</small>
			</h4>
			Ironman Ironman Ironman Ironman Ironman Ironman
		</div>
	</div>
	<div class="media">
		<a class="pull-left" href="#">
			<img class="media-object" src="http://placehold.it/64x64" alt="">
		</a>
		<div class="media-body">
			<h4 class="media-heading">Which side you are ?
				<small>August 25, 2014 at 9:30 PM</small>
			</h4>
			Let's vote...
		</div>
	</div>

	{% for cm in comments %}
	<div class="media">
		<a class="pull-left" href="#">
			<img class="media-object" src="http://placehold.it/64x64" alt="">
		</a>
		<div class="media-body">
			<h4 class="media-heading">Your Post
				<small>August 25, 2014 at 9:30 PM</small>
			</h4>
            {% autoescape off %}{{ cm }}{% endautoescape %}
		</div>
	</div>
	{% endfor %}

	<div class="well">
		<h4>Leave a Comment:</h4>
		<form role="form" method="POST">
			<div class="form-group">
				<textarea class="form-control" name="comment" rows="3"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div></div>
