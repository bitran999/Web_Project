const change = document.querySelector("#ChangePass");
const boxChange = document.querySelector("#box-changePass");

change.addEventListener("click", () => {
    boxChange.classList.toggle("show");
});
