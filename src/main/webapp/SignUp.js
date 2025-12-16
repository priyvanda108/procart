/**
 * 
 */
   
const username = document.getElementById("inputname");
const email = document.getElementById("inputemail");
const password = document.getElementById("inputpassword");
const confirmpassword = document.getElementById("confirmpassword");

const emailpattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const usernamePattern= /^[A-Za-z_ ]+$/; 
const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,15}$/;


  
    username.addEventListener('input',()=>{
         if(!usernamePattern.test(username.value)){
            username.setCustomValidity("Only letters , space and underscore allowed!")
       }
         else{
            username.setCustomValidity("");
         }
    })

     email.addEventListener('input',  ()=> {
        if (!emailpattern.test(email.value)) {
            email.setCustomValidity("Please enter a valid email like example@gmail.com");
        } else {
            email.setCustomValidity("");
        }
    });

     password.addEventListener('input',()=>{
        if(!passwordPattern.test(password.value)){
            password.setCustomValidity("Password must be 6-15 characters includes uppercase,lowercase,numbers,symbols")
        } else 
            password.setCustomValidity("");

         if(confirmpassword.value!=="" && confirmpassword.value!==password.value){
          confirmpassword.setCustomValidity("Passwords do not match!")
        }    
        else{
           confirmpassword.setCustomValidity("")
        }
    });
    
    confirmpassword.addEventListener('input', ()=> {
        if (confirmpassword.value !== password.value) {
            confirmpassword.setCustomValidity("Passwords do not match!");
        } else {
            confirmpassword.setCustomValidity("");
        }
    });
