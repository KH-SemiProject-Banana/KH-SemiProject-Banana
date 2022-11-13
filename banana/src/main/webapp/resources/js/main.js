let slide = document.getElementsByClassName("slide");


for(let i = 0; i < slide.length; i++){

    setTimeout(function(){

        slide[i].addEventListener("change", function(){
            if(slide.checked){
                
                slide.checked = false;
                
                slide[i+1].checked = true;
            }
        
        });
    
        if(i == slide.length-1){i = 0}

    }, 5000);

    

}

