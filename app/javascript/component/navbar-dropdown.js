

const dropup = () => {
  const avatar = document.querySelector(".avatar-bordered")
  avatar.addEventListener("click", (events) => {
    console.log(document.querySelector(".dropup-details"))
    document.querySelector(".dropup-details").classList.toggle("d-none")
  });
}


export {dropup}
