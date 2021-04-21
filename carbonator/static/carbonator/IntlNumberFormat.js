function displayCurrency(number) {
    return new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(number);
}

function displayNumber(number) {
    return new Intl.NumberFormat('de-DE', { maximumFractionDigits: 2}).format(number);
}

function displayDate(date) {
    return new Intl.DateTimeFormat('de-DE').format(date);
}
