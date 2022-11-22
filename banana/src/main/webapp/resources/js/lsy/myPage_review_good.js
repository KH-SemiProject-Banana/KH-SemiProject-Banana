

//document.getElementById("mainGood").style.display = 'none';
document.getElementById("mainBad").style.display = 'none';

document.getElementById("side2").addEventListener("click",function(){

    document.getElementById("mainGood").style.display = 'none';
    document.getElementById("mainBad").style.display = 'block';

})

document.getElementById("side1").addEventListener("click",function(){

    document.getElementById("mainBad").style.display = 'none';
    document.getElementById("mainGood").style.display = 'block';
    document.getElementById("lightbulb_inner").style.display = 'none';


})


const inner = document.getElementById("lightbulb_inner");
inner.style.display = 'none';
document.getElementById("lightbulb").addEventListener("click",function(){
    if(inner.style.display == 'none'){
        inner.style.display = 'block';
    } else {
        inner.style.display = 'none';
    }

})

// 화면 어디를 클릭하든
document.addEventListener("click",function(e){

    
    if(e.target.classList.contains("fa-lightbulb")){
        return;
    }

    document.getElementById("lightbulb_inner").style.display='none';

})


document.getElementById("back").addEventListener("click",function(){
    alert("안녕");
    window.history.back();
})

