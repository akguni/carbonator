document.addEventListener('DOMContentLoaded', () => {
    // Not using let or const, so that these variables are recognized outside the function
    costs = JSON.parse(document.getElementById('costs').textContent);
    appliances = JSON.parse(document.getElementById('appliances').textContent);
    username = JSON.parse(document.getElementById('username').textContent);
    populateAppliances();
    initializeConsumption();
    events();
    recalculate();
})

function events() {
    document.getElementById("appliance").addEventListener('change', () => {
        initializeConsumption();
        recalculate();
    })
    document.querySelectorAll(".variables").forEach(element => {
        element.addEventListener('input', recalculate);
        element.addEventListener('keyup', key => {
            if (key.keyCode === 13) element.blur()
        })
    })
    document.querySelector("#lighting-form").addEventListener('submit', bank);
}

function recalculate() {
    // read consumption and duration - calculate energy consumed
    const watts = document.getElementById("consumption").value;
    const timemin = document.getElementById("duration").value;
    const timehr  = timemin / 60;
    const kWh = (watts * timehr) / 1000;
    const money = document.getElementById("cents");
    money.innerHTML = (kWh * costs.money).toFixed(2);
    const co2e = document.getElementById("co2e");
    co2e.innerHTML = (kWh * costs.co2e).toFixed();
    const trees = document.getElementById("trees");
    trees.innerHTML = (kWh * costs.trees).toFixed();
    
    // const moneyPerMonth = document.getElementById("cents-per-month");
    // moneyPerMonth.innerHTML = kWh * costs.money * 30;
    // const co2ePerMonth = document.getElementById("co2e-per-month");
    // co2ePerMonth.innerHTML = kWh * costs.co2e * 30;
    // const treesPerMonth = document.getElementById("trees-per-month");
    // treesPerMonth.innerHTML = kWh * costs.trees * 30;
    
    // const moneyPerYear = document.getElementById("cents-per-year");
    // moneyPerYear.innerHTML = kWh * costs.money * 365;
    // const co2ePerYear = document.getElementById("co2e-per-year");
    // co2ePerYear.innerHTML = kWh * costs.co2e * 365;
    // const treesPerYear = document.getElementById("trees-per-year");
    // treesPerYear.innerHTML = kWh * costs.trees * 365;
}

function populateAppliances() {
    const applianceList = document.getElementById("appliance");
    applianceList.innerHTML = "";
    appliances.forEach(appliance => {
        const option = document.createElement('option');
        option.value = appliance.id;
        option.innerHTML = appliance.name;
        applianceList.append(option);
    })
}

function initializeConsumption() {
    const appliance = document.getElementById("appliance");
    const id = appliance.options[appliance.selectedIndex].value;
    document.getElementById("consumption").value = parseInt(appliances.find(appliance => appliance.id == id).watts);
    document.getElementById("duration").value = parseInt(appliances.find(appliance => appliance.id == id).typicalDuration);
}

function bank(event) {

    event.preventDefault();
    const appliance = document.getElementById("appliance").value
    const kWh = document.getElementById("consumption").value
    const csrftoken = getCookie('csrftoken');
    const request = new Request(
        '/bank',
        {headers: {'X-CSRFToken': csrftoken}}
    );

    fetch(request, {
        method: 'POST',
        mode: 'same-origin', 
        body: JSON.stringify({
            appliance: appliance,
            kWh: kWh,            
        })
    })
    .then(() => {
        message = document.getElementById("system-message");
        message.textContent = `Thank you  ${username}. You have saved ${kWh} kWh.`;
    })
}


// Generate CSRF token to be able to use in fetch
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
