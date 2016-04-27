'use strict';

function getCookie(c_name) {
    var c_value = " " + document.cookie;
    var c_start = c_value.indexOf(" " + c_name + "=");
    if (c_start == -1) {
        c_value = null;
    }
    else {
        c_start = c_value.indexOf("=", c_start) + 1;
        var c_end = c_value.indexOf(";", c_start);
        if (c_end == -1) {
            c_end = c_value.length;
        }
        c_value = unescape(c_value.substring(c_start,c_end));
    }
    c_start = c_value.indexOf(":", c_start) + 1;
    c_value = unescape(c_value.substring(c_start));
    
    return c_value;
}

function preorder(id) {
  //check is premium from db in order to update state in cookies
  updateState();
  
  if(isPremium())
  {
      processPerOrder(id);
      if(id == 'id2')
      {
          return alert('Successfully added to cart and reserved the item!');
      }
  }
  else
  {
      return alert('Only Premium user can pre-order product');
  }
  
}

function buy(id) {
  
    //send request to server
    return alert('Added to cart!' + id);
}

function isPremium(){
    var isPremium = getCookie('ispremium');

    if(isPremium === 'False')
    {
        return false;
    }
    else
    {
        return true;
    }
}

function processPerOrder(id)
{
    // this function should be called by premium user only, so check it one more time in function
    if(isPremium())
    {
        //update quantity on db and add to shopping cart
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "/xss/javascript/preorder");
       
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "id");
        hiddenField.setAttribute("value", id);

        form.appendChild(hiddenField);

        document.body.appendChild(form);
        form.submit();

    }
    
}

function updateState()
{
    var form = document.createElement("form");
    form.setAttribute("method", "POST");
    form.setAttribute("action", "/xss/javascript/updateState");
   
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");

    form.appendChild(hiddenField);

    document.body.appendChild(form);
    form.submit();

}

function cannotpreorder(id)
{
    return alert('Only Premium user can pre-order product');
}
