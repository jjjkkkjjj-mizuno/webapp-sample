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
        $("#follow").on("click", function(){
            $.ajax({
                url: $(this).attr("action"),
                type: "get"
            }).done(function(json){
                if(json.follow == "follow"){
                    $("#follow").text("Following");
                    $("#follower").text(`Follower number:${json.follower}`);
                    json.follower.forEach(function(follower){
                        $("#follower").append(`
                            <a href="${follower.link}">${follower.name}</a>
                        `);
                    })
                }else{
                    $("#follow").text("Follow");
                    $("#follower").text(`Follower number:${json.follower}`);
                    json.follower.forEach(function(follower){
                        $("#follower").append(`
                            <a href="${follower.link}">${follower.name}</a>
                        `);
                    })
                }
            })
        })
    })
})
