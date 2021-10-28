function buy(name) {
let cart = document.querySelector('#cart tbody')
let newItem = cart.insertRow()

let itemName = newItem.insertCell(0)
itemName.innerHTML = name

let elementID = '#' + name.replace(' ', '')

let itemPrice = newItem.insertCell(1)
itemPrice.innerHTML = document.querySelector(elementID + ' .price').innerHTML

let itemQuantity = newItem.insertCell(1)
itemQuantity.innerHTML = document.querySelector(elementID + ' td .quantity').value 

let subTotal = newItem.insertCell(3)
subTotal.innerHTML = "$" + document.querySelector(elementID + ' .price').innerHTML.replace('$','') * document.querySelector(elementID + ' td .quantity').value

let total = 0
document.querySelectorAll('#cart tbody tr').forEach(row => {
    total = total + parseInt(row.cells[3].innerHTML.replace('$', ''))
})
document.querySelector('#total').innerHTML = '$' + total

document.querySelector(elementID + ' td .quantity').value = ''
}
function checkout() {
    document.querySelectorAll('#cart tbody tr').forEach(row => row.remove())
    alert("Thank you for your purchase!")
}
