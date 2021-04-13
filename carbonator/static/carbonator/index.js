document.addEventListener('DOMContentLoaded', () => {
    // Not using let or const, so that these variables are recognized outside the function
    costs = JSON.parse(document.getElementById('costs').textContent);
    appliances = JSON.parse(document.getElementById('appliances').textContent);
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
    document.querySelectorAll(".variables").forEach(element => element.addEventListener('change', recalculate));
    
}

function recalculate() {
    // read consumption and duration - calculate energy consumed
    const watts = document.getElementById("consumption").value;
    const timemin = document.getElementById("duration").value;
    const timehr  = timemin / 60;
    const kWh = (watts * timehr) / 1000;
    const cents = document.getElementById("cents");
    cents.innerHTML = (kWh * costs.cents).toFixed(2);
    const co2e = document.getElementById("co2e");
    co2e.innerHTML = (kWh * costs.co2e).toFixed(2);
    const trees = document.getElementById("trees");
    trees.innerHTML = (kWh * costs.trees).toFixed(2);
}

function populateAppliances() {
    const applianceList = document.getElementById("appliance");
    applianceList.innerHTML = "";
    appliances.forEach(appliance => {
        const option = document.createElement('option');
        option.value = appliance.id;
        option.innerHTML = appliance.name;
        applianceList.append(option)        
    })
}

function initializeConsumption() {
    const appliance = document.getElementById("appliance");
    const id = appliance.options[appliance.selectedIndex].value;
    document.getElementById("consumption").value = parseFloat(appliances.find(appliance => appliance.id == id).watts).toPrecision();    
}