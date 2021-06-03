const button = document.getElementById('search-btn');
const input = document.getElementById('input');
const icon = document.getElementById('submit-icon');

console.log(button)


export function toggleSearch() {

    button.classList.add('hidden')

}
if (button) {
 button.addEventListener('click',() =>{
  toggleSearch();
 });
}



 // This two function will listen submit on the search either enter or click
if (input){
  input.addEventListener('keypress',(event)=>{
  if (event.key === 'Enter'){

    let id = 1
    window.location.pathname = "/spots/" + id // This is to redirect to other page
  };
});
}

if (icon){
icon.addEventListener('click',() => {

    let id = 1
    window.location.pathname = "/spots/" + id //This is to redirect to other page
});
}
