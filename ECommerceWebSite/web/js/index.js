let bagItems = [];

onLoad();

function onLoad() {
    let bagItemsStr = localStorage.getItem('bagItems');
    bagItems = bagItemsStr ? JSON.parse(bagItemsStr) : [];
    DisplayItemOnHomePage();
    displayBagItemCount();
}


function addToBag(itemID) {
    bagItems.push(itemID);
    displayBagItemCount();
    localStorage.setItem('bagItems',JSON.stringify(bagItems));
    displayBagItemCount();
}
function displayBagItemCount() {
    let bagItemCountElement = document.querySelector('.bag-item-count');
    if (bagItems.length > 0) {
        bagItemCountElement.innerText = bagItems.length;
        bagItemCountElement.style.visibility = 'visible';

    } else {
        bagItemCountElement.style.visibility = 'hidden';
    }
}



function DisplayItemOnHomePage() {
    let itemContainerElement = document.querySelector('.items-container');
    if(!itemContainerElement){
        return;0
    }
    let innerHtml = '';
    items.forEach(item => {
        innerHtml += ` <div class="item-container">
                <img src="${item.image}" alt="Resource Not found" class="item-image">
                <div class="rating">
                    ${item.rating.stars}*| ${item.rating.count}K
                    
                </div>
                <div class="company-name">${item.company}</div>
                <div class="item-name">${item.item_name}</div>
                <div class="price">
                    <span class="current-price">Rs ${item.current_price}</span>
                    <span class="original-price">Rs ${item.original_price}</span>
                    <span class="discount">(${item.discount_percentage}% OFF)</span>
                </div>
                <button class="add-to-bag" onClick="addToBag(${item.id})">Add to Bag </button>
            
        </div>`

    })
    itemContainerElement.innerHTML = innerHtml;

}









