
// Setting up scrolling view starting from 1 and 20 records at a time
let counter = 1;
const quantity = 20;

// Event listener for scrolling
window.onscroll = () => {
    

    if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
        retrieveNext();
    }
};

function retrieveNext() {
    const start = counter;
    const end = start + quantity - 1;
    counter = end + 1;
    fetch (`/savings?start=${start}&end=${end}`)
    .then (response => response.json())
    .then(data => {
        data.savings.forEach(addSaving);
    })
};

function addSaving(contents) {
    const saving = document.createElement('div');
    saving.className = 'saving';
    const date = displayDate(new Date(contents.timestamp));
    const energySaved = displayNumber(contents.energySaved);
    saving.innerHTML = `${contents.appliance} ${date} ${energySaved} `;
    deleteButton = document.createElement('button');
    deleteButton.className = 'delete';
    deleteButton.id = contents.id;
    deleteButton.innerHTML = "Delete";
    deleteButton.addEventListener('click', event => deleteSaving(event.target));
    saving.append(deleteButton);
    document.querySelector('#savings').append(saving);
};

function deleteSaving(target) {
    
    fetch('delete/' + target.id, {
        method: 'DELETE',
    })
    .then(target.parentElement.remove())
}

