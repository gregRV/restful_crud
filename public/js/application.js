$(document).ready(function() {
	$('#delete_button').on('click', function(e){
		e.preventDefault();
		var confirmation = window.confirm("Are you sure you want to Delete?");
		var note_id = $(this).attr('name');
		if (confirmation == true)
		{
			$.ajax({
				url: "/notes/"+note_id+"/delete",
				type: 'delete'
			}).done(response){
				//window.location = "/"; 
			}
		}
	});
});



