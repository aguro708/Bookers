$(document).on(function(){
	function buildHTML(book){
		var html='<tr><td></td><td>${book.name}</td><td>${book.body}</td></tr>'
		return html;
	}
	$('.form').on('submit',function(e){
		e.preventDefault();
		var formdata=new FormData(this);
		$.ajax({
			url: "/books/",
			type: "POST",
			data: formdata,
			dataType: 'json',
			processData: false,
			contentType: false
		})
		.done(function(data){
			var html=buildHTML(data);
			$('.book_item').append(html)
			$('.b').val('')
		})
		.fail(function(){
			alert('投稿できませんでした')
		})
		.always(function(){
			$(".c").removeAttr("disabled")
		})
	})
});