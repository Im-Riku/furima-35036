window.addEventListener('keyup', function(){
  let textbox = document.getElementById("item-price");
  
  let inputValue = textbox.value;

  let tax = Math.ceil(inputValue * 0.1);
  document.getElementById('add-tax-price').textContent = tax;

  let profit = Math.floor(inputValue * 0.9);
  document.getElementById('profit').textContent = profit;

})