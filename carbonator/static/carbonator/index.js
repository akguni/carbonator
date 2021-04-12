document.addEventListener('DOMContentLoaded', () => {
    // Not using let or const, so that these variables are recognized outside the function
    costs = JSON.parse(document.getElementById('costs').textContent);
    appliances = JSON.parse(document.getElementById('appliances').textContent);
    populateAppliances();
    events();
    recalculate();
})

function events() {
    document.querySelectorAll("select").forEach(element => {
        element.addEventListener('change', () => recalculate());
    });
}

function recalculate() {
    const appliance = document.getElementById("appliance");
    const duration = document.getElementById("duration");
    const id = appliance.options[appliance.selectedIndex].value;
    const watts = appliances.find(appliance => appliance.id == id).watts;
    const timemin = parseInt(duration.options[duration.selectedIndex].text);
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