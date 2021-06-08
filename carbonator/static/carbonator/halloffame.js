document.addEventListener('DOMContentLoaded', retrieveNext());

function retrieveNext() {
    fetch (`/halloffame`)
    .then (response => response.json())
    .then(data => {
        numberUsers = data.numberUsers;
        data.users.forEach(addUser);
    })
};

function addSaving(contents) {

    const rank = document.createElement('div');
    rank.classList.add('rank');
    rank.innerText = contents.rank;

    const user = document.createElement('div');
    user.classList.add('user');

    const kwh = document.createElement('div');
    kwh.classList.add('kwh-column')
    kwh.innerHTML = (contents.energySaved).toFixed(0);
    saving.append(rank, appliance, kwh);
    document.querySelector('#savings-table').append(saving);
};