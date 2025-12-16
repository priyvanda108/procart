/**
 * 
 */
let index =0;
const slides = document.querySelectorAll(".slide");

function showSlide(){
    slides.forEach(s => s.classList.remove("active"));
    slides[index].classList.add("active");
	slides[index].classList.add("active"); 
    index++;
    if(index===slides.length){
        index =0;
    }
}
showSlide();
setInterval(showSlide,3000);

