// Setting up scrolling view
let counter = 0;
const quantity = 20;

// Number of saving records in database
let numberSavings = 0;

document.addEventListener('DOMContentLoaded', retrieveNext());

// Event listener for scrolling
window.onscroll = () => {

    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
        setTimeout(() => retrieveNext(), 1000);
    }
};

document.addEventListener('click', event => {
    const element = event.target;
    if (element.className === 'delete') {
        const remove = element.parentElement.parentElement
        remove.style.animationPlayState = 'running';
        remove.addEventListener('animationend', () =>  {
            remove.remove();
            deleteSaving(event.target);                
        })};
    });

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
    saving.classList.add('saving');
    const appliance = document.createElement('td');
    appliance.classList.add('appliance-column');
    appliance.innerHTML = contents.appliance;
    const kwh = document.createElement('td');
    kwh.classList.add('kwh-column')
    kwh.innerHTML = displayNumber(contents.energySaved);
    const date = document.createElement('td');
    date.classList.add('date-column');
    date.innerHTML = displayDate(new Date(contents.timestamp));
    const buttonCell = document.createElement('td');
    buttonCell.classList.add('delete-column');
    deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.title = 'delete';
    deleteButton.id = contents.id;
    deleteButton.innerHTML = String.fromCodePoint(0x1F5D1);
    buttonCell.append(deleteButton);
    saving.append(appliance, kwh, date, buttonCell)
    document.querySelector('#savings-table').append(saving);
};


function deleteSaving(target) {
    
    fetch('delete/' + target.id, {
        method: 'PUT',
    })
    .then(response => response.json())
    .then(response  => {
        const saved = document.getElementById('total-saving');
        totalSaving = response.total_saving;
        saved.innerText = displayNumber(totalSaving);
        const rank = document.getElementById('rank');
        rank.innerText = response.rank;         
        const message = document.getElementById('message-container');
        const undo = document.createElement('a');
        undo.href = '/undo/' + target.id;
        undo.innerText = 'Undo';
        message.innerText = "Saving deleted. ";
        message.append(undo);
        window.scrollTo(0,0);        
    })
}