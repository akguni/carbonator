function displayCurrency(number) {
    return new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR' }).format(number);
}

function displayNumber(number) {
    return new Intl.NumberFormat('en-GB', { maximumFractionDigits: 2}).format(number);
}

function displayDate(date) {
    return new Intl.DateTimeFormat('de-DE', { day: '2-digit', month: '2-digit', year: '2-digit' }).format(date);
}
