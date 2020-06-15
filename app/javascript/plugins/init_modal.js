const initModal = () => {
  var modal = document.getElementById("myModal");

  // Get the image and insert it inside the modal - use its "alt" text as a caption
  var imgs = document.querySelectorAll(".small-pic");
  var modalImg = document.getElementById("img01");

  imgs.forEach(img => {
    img.onclick = function(){
      modal.style.display = "block";
      modalImg.src = this.src;
    }
  })

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // close the modal
  if (span) {
    span.onclick = function() {
      modal.style.display = "none";
    }
  }

  window.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
      modal.style.display = "none";
    }
  })
}

export { initModal };
