
// Setting up scrolling view
let counter = 0;
const quantity = 10;

// Number of saving records in database
let numberSavings = 0;

// Event listener for scrolling
window.onscroll = () => {

    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
        setTimeout(() => retrieveNext(), 1000);
    }
};

retrieveNext();

function retrieveNext() {
    if (counter > numberSavings) {
        return;
    };
    const start = counter;
    const end = start + quantity - 1;    
    counter = end + 1;
    fetch (`/savings?start=${start}&end=${end}`)
    .then (response => response.json())
    .then(data => {
        numberSavings = data.numberSavings;
        data.savings.forEach(addSaving);
    })
};

function addSaving(contents) {
    const saving = document.createElement('tr');
    const appliance = document.createElement('td');
    appliance.innerHTML = contents.appliance;
    const kwh = document.createElement('td');
    kwh.innerHTML = displayNumber(contents.energySaved);
    const date = document.createElement('td');
    date.innerHTML = displayDate(new Date(contents.timestamp));
    const buttonCell = document.createElement('td')
    deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.id = contents.id;
    deleteButton.innerHTML = "Delete";
    deleteButton.addEventListener('click', event => deleteSaving(event.target));
    buttonCell.append(deleteButton);
    saving.append(appliance, kwh, date, buttonCell)
    document.querySelector('#savings-table').append(saving);
};


function deleteSaving(target) {
    
    fetch('delete/' + target.id, {
        method: 'DELETE',
    })
    .then(target.parentElement.parentElement.remove())
}

