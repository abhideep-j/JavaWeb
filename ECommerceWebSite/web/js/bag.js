let bagItemObjects;
onLoad();
function onLoad() {
    loadBagItemObjects();

    displayBagItems();
    displayBagSummary();

}

function loadBagItemObjects() {
    bagItemObjects = bagItems.map(itemID => {
        for (i = 0; i < items.length; i++) {
            if (itemID == items[i].id) {
                return items[i];
            }
        }

    });
    console.log(bagItemObjects)
}




function displayBagItems() {

    let containerElement = document.querySelector('.bag-items-container');
    let innerHTML = '';
    bagItemObjects.forEach(bagItem =>
    {
        innerHTML += generateItemHTML(bagItem);
    });
    containerElement.innerHTML = innerHTML;

//    containerElement.innerHTML = 
}

function removeFromBag(itemID) {
    bagItems = bagItems.filter(bagItemId => bagItemId != itemID);
    localStorage.setItem('bagItems', JSON.stringify(bagItems));
    loadBagItemObjects();
    displayBagItemCount();
    displayBagItems();
    displayBagSummary();

}


function generateItemHTML(item) {
    return `<div class="bag-item-container">
            <div class="item-left-part">
              <img class="bag-item-img" src="../${item.image}">
            </div>
            <div class="item-right-part">
              <div class="company">${item.company}</div>
              <div class="item-name">${item.item_name}</div>
              <div class="price-container">
                <span class="current-price">Rs ${item.current_price}</span>
                <span class="original-price">Rs ${item.original_price}</span>
                <span class="discount-percentage">(${item.discount_percentage}% OFF)</span>
              </div>
              <div class="return-period">
                <span class="return-period-days">14 days</span> return available
              </div>
              <div class="delivery-details">
                Delivery by
                <span class="delivery-details-days">10 Oct 2023</span>
              </div>
            </div>

            <div class="remove-from-cart" onClick="removeFromBag(${item.id})">X</div>
            
          </div>`;
}




function displayBagSummary() {
    let bagSummaryElement = document.querySelector('.bag-summary');
    let totalItems = bagItemObjects.length;
    let totalMRP = 0;
    let totalDiscount = 0;
    let finalPayment = 0;
    
    bagItemObjects.forEach(bagItem => {
        totalMRP += bagItem.original_price;
        totalDiscount += bagItem.original_price - bagItem.current_price;
    })
    
    finalPayment = totalMRP - totalDiscount + 99;
    
    bagSummaryElement.innerHTML = ` <div class="bag-details-container">
            <div class="price-header">PRICE DETAILS (${totalItems} Items) </div>
            <div class="price-item">
              <span class="price-item-tag">Total MRP</span>
              <span class="price-item-value">Rs${totalMRP} </span>
            </div>
            <div class="price-item">
              <span class="price-item-tag">Discount on MRP</span>
              <span class="price-item-value priceDetail-base-discount">-Rs ${totalDiscount} </span>
            </div>
            <div class="price-item">
              <span class="price-item-tag">Convenience Fee</span>
              <span class="price-item-value">Rs 99</span>
            </div>
            <hr>
            <div class="price-footer">
              <span class="price-item-tag">Total Amount</span>
              <span class="price-item-value">Rs ${finalPayment} </span>
            </div>
          </div>
                <button class="btn-place-order">
                      <a class="css-xjhrni">PLACE ORDER</a>
                       </button>`;

}
