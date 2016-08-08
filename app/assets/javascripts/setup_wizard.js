
function scrollTo(id) {
    $('html, body').animate({
        scrollTop: $("#" + id).offset().top
    }, 1000);
}

function showBlogConf() {
    $("#blog").removeClass("hidden")

    scrollTo('blog')
}

function clearFields() {
    $('input').val(null)
}

$(() => {

    // (Continue) Buttons

    // Clone Button
    $('#clone-url').on('click', () => {
        $('#github-username').addClass('hidden')
        $('#github-repos').addClass('hidden')
        $('#account').addClass('hidden')
        $('#clone').removeClass('hidden')
        $('#blog').addClass('hidden')
        clearFields()
        scrollTo('clone')
    })
    
    // Clone Button Click
    $("#clone .continue-button").on('click', () => {
        showBlogConf()
    })
    // Github Button
    $('#github').on('click', () => {
        $('#clone').addClass('hidden')
        $('#github-repos').addClass('hidden')
        $('#account').addClass('hidden')
        $('#github-username').removeClass('hidden')
        $('#blog').addClass('hidden')
        clearFields()
        scrollTo('github-username')
    })
    
    // List Repos Button
    $('#github-username .continue-button').on('click', () => {
        var uname = $('input[name="github-uname"]').val()
        $.getJSON('https://api.github.com/users/' + uname + '/repos', (data) => {
    
            $('.repos').empty()
            $('#github-repos').removeClass('hidden')
    
            scrollTo('github-repos')
    
            data.forEach((repo) => {
            $('<div>').text(repo.name).addClass("repo").data("github-url", repo.clone_url).appendTo($(".repos")).on('click', (event) => {
                $('input[name="github-url"]').val($(event.target).data("github-url"))
                $('.repos .repo').removeClass('highlight')
                $(event.target).addClass('highlight')
                showBlogConf()
            })
        })
    
        }).fail(() => {
    
            $("<div>").text("Nonexistant User (click to close)").addClass("error").appendTo('#github-username .modal').on('click', (event) => {
                $(event.target).remove()
            })
        })
    })
    
    $('#blog .continue-button').on('click', () => {
        $('#account').removeClass('hidden')
    
        scrollTo('account')
    })
    
    $('#account .continue-button').on('click', () => {
        $('form').submit();
    })
})
