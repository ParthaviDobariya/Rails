$('document').ready(function(){
	$('#date').datepicker({
  	format: "dd/mm/yyyy",
  	todayHighlight: true,
  	orientation: 'bottom'
	}).on('changeDate', function(e){
  	$(this).datepicker('hide');
	}); 

	$('.dependent-dropdown').click(function(){
	  var element_id = $(this).attr('data-target');
    if ($("#" + element_id)){
      $("#" + element_id).empty();
    }
    if($(this).val() != ""){
      var url = $(this).attr('data-url') + $(this).val();
      $.get(url, function(datas){
        if(datas){
        	console.log(datas);
          $.each(datas, function(index, value){
          	option_val = value['id'] ? value['id'] : '';
            $("#" + element_id).append(
              "<option value ='" + option_val + "'>" +
                value['name'] +
              "</option>"
            );
          });
        }
      });
    }
	});

  $(".autocomplete").each(function() {
    $(this).autocomplete({
      source: $(this).attr("data-url")
    })
  });
});