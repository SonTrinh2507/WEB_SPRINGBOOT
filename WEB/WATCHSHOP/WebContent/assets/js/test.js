
    const listAddress= document.getElementById("select");
    const add__form = document.getElementById("add");
    const btn_add = document.getElementById("btn-add");

    
    function openFomr(){
            listAddress.style.display="none";
            add__form.style.display="block";
        }
    if (document.readyState == 'loading'){
        document.addEventListener('DOMContentLoaded', ready)
    }else{
        ready();
    }
    function ready(){
        var btn_remove = document.getElementsByClassName("btn__xoa");
        for (var i = 0; i < btn_remove.length; i++){
            var btn = btn_remove[i];
            btn.addEventListener("click", removeAddress);
        }

        var radioClick = document.getElementsByClassName("radio");
        for (var i = 0; i < radioClick.length; i++){
            var btn = radioClick[i];
            btn.addEventListener("click", updateAddress);
        }
    }
    let countCheck = 0;
    function removeAddress(event){
        var btnClick = event.target;
        btnClick.parentElement.remove();
        countCheck = countCheck - 1;
    }
    function updateAddress(event){
        var radioClicked = event.target;
        if (radioClicked.checked){
            var item = radioClicked.parentElement;
            var name = item. getElementsByClassName('name')[0].innerText;
            var phone = item.getElementsByClassName('phone')[0].innerText;
            var address = item.getElementsByClassName('address')[0].innerText;
            var address1 = item.getElementsByClassName('address1')[0].innerText;
            choiceAddress(name, phone, address,address1);
        }
    }

    function choiceAddress(name, phone, addder,address1){
        var name_value = document.getElementsByClassName('name-tt')[0];
        var phone_value = document.getElementsByClassName('phone-tt')[0];
        var address_value = document.getElementsByClassName('address-tt')[0];
        var btn_xn = document.getElementById('btn-acp');
        btn_xn.addEventListener('click', function(){
            name_value.innerText = name;
            phone_value.innerText= phone,
            address_value.innerText = addder + ',' +address1;
            closeDlAddress();
        })
    }
    function addAddress(){
        var name = document.getElementById('input__name').value;
        var phone = document.getElementById('input__phone').value;
        var address = document.getElementById('input__address').value;
        var addressDetail = document.getElementById('input__addresDetail').value;
        listAddress.style.display="block";
        add__form.style.display="none";
        var newAdd = document.createElement('article');
        newAdd.classList.add('item');
        var list = document.getElementById('list-info');
        var newAddContent = `<input type="radio" name="choice" class = "radio">
                            <div>
                                <h4 class="name">${name}</h4>
                                <p class="phone">${phone}</p>
                                <p class="address">${addressDetail}</p>
                                <p class="address1">${address}</p>
                            </div>
                            <i class='bx bxs-trash btn__xoa'></i>`
        newAdd.innerHTML = newAddContent;
        countCheck = countCheck + 1;
        list.append(newAdd);
        newAdd.getElementsByClassName('btn__xoa')[0].addEventListener('click', removeAddress);
        newAdd.getElementsByClassName('radio')[0].addEventListener('click', updateAddress);
        // $('input[type="radio"]').unbind('click');
    }
    //  OPEN DETAIL ADDRESS
    var div_dl = document.getElementById("detail");
    function openDlAddress() {
        div_dl.style.display = "block";
    }
      // When the user clicks on <span> (x), close the modal
    function closeDlAddress() {
        div_dl.style.display = "none";
    }
    function back(){
        add__form.style.display = "none";
        listAddress.style.display = "block";
    }
    

