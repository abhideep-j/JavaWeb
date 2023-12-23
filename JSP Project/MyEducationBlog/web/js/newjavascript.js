//$(document).ready(function (){
//    alert("ready")
//})


function doLike(pid,uid){
    console.log(pid+","+uid)
    
    const data={
        uid:uid,
        pid:pid,
        operation:'like'
    }
    
    $.ajax({
        url: "LikeServlet",
        data: data,
        success: function (data, textStatus, jqXHR) {
            console.log(data)
            if(data.trim() == 'true'){
                let c = $('.like-counter').html();
                c++;
                $('.like-counter').html(c);
            }
            
        },error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
    
}