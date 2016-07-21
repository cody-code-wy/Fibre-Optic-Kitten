function ready() {

  $(".toggle").each(function( index ) {
    if ($(this).parent().find(".subtopics").children().length == 0 && $(this).parent().find(".posts").find("ul").children().length == 0 ){
      return
    }
    if ($(this).parent().hasClass('hidden')) {
      $(this).addClass("arrow-right")
    } else {
      $(this).addClass("arrow-down")
    }
  })

  $(".toggle").on('click',(event) => {
    console.log("HELP")
    console.log(event.target)
    if ( $(event.target).hasClass('arrow-right')) {
      $(event.target).removeClass('arrow-right').addClass('arrow-down').parent().removeClass('hidden')
    } else {
      $(event.target).addClass('arrow-right').removeClass('arrow-down').parent().addClass('hidden')
    }
  })
}

// $(document).ready(ready)
$(document).on('turbolinks:load', ready)
