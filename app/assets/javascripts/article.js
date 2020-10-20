document.addEventListener("turbolinks:load", function(){
    $(function(){
        $(".like").on("click", function(){
            $.ajax({// get  
                url: $(this).attr("action"),
                type: "get"
            }).done(function(json){
                $(`#article${json.article}`).text(`Like!${json.like}`);
                if(json.liked == "like"){
                    $(`#article${json.article}`).addClass("active");
                }
                else{
                    $(`#article${json.article}`).removeClass("active");
                }
            })
        })
    })
})
