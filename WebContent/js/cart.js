function updateQty(dishName, quantity) {
	if (quantity > 0) {
		window.location = 'action.jsp?operator=update&dish=' + dishName + '&qty=' + quantity;
	}
}

function remove(dishName, quantity) {
	window.location = 'action.jsp?operator=remove&dish=' + dishName;
}

function removeAll() {
	window.location = 'action.jsp?operator=removeAll';
}