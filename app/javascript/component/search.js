
const expotHideButton = ()=>{
  const button = document.getElementById('search-btn');
  const input = document.getElementById('input');
  const icon = document.getElementById('submit-icon');

console.log(button)
 if (button){
  button.addEventListener('click',() =>{
  button.classList.add('hidden')
 });
};
};

export{expotHideButton}
