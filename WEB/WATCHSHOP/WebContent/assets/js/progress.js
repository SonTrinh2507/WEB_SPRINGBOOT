const one = document.querySelector(".one");
const two = document.querySelector(".two");
const three = document.querySelector(".three");
const four = document.querySelector(".four");
const five = document.querySelector(".five");
const li_huy = document.querySelectorAll(".li");

one.onclick = function(){
    one.classList.add("active");
    two.classList.remove("active");
    three.classList.remove("active");
    four.classList.remove("active");

}
two.onclick = function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.remove("active");
    four.classList.remove("active");

}
three.onclick = function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.remove("active");

}
four.onclick = function(){
    one.classList.add("active");
    two.classList.add("active");
    three.classList.add("active");
    four.classList.add("active");
}
five.onclick = function(){
    one.classList.add("active");
    five.classList.add("active");
    li_huy.forEach(element => {
        element.classList.add("huy");
    });
}