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
    const energy = document.getElementById("kwh");
    energy.innerText = kWh.toFixed(4);
    const money = document.getElementById("money");
    money.innerText = (kWh * costs.money).toFixed(2);    
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
    const appliance = document.getElementById("appliance").value;
    const duration = document.getElementById("duration").value;
    const consumption = document.getElementById("consumption").value;
    kWh = consumption / 1000 * duration / 60;
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
    .then(response => response.json())
    .then(output => {
        const messageContainer = document.getElementById("message-container")
        messageContainer.innerText = ""
        message = document.createElement('div');
        message.id = "system-message";
        message.innerText = output.motivator;
        // const addText = `if you can do this once every ${frequency} for ${period}, you will avoid ${impactQuantity} ${impactQuality}, and this planet will be grateful to you.`;
        // const addText2 = `you will also have an extra ${moneySaved} ${moneyUnit} in you pocket to spend on whatever you like.`
        messageContainer.append(message);

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
