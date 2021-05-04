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
    document.querySelectorAll(".variables").forEach(element => {
        element.addEventListener('input', recalculate);
        element.addEventListener('keyup', key => {
            if (key.keyCode === 13) element.blur()
        })
    })    
}

function recalculate() {
    // read consumption and duration - calculate energy consumed
    const watts = document.getElementById("consumption").value;
    const timemin = document.getElementById("duration").value;
    const timehr  = timemin / 60;
    const kWh = (watts * timehr) / 1000;
    const money = document.getElementById("cents");
    money.innerHTML = displayCurrency(kWh * costs.money);
    const co2e = document.getElementById("co2e");
    co2e.innerHTML = displayNumber(kWh * costs.co2e);
    const trees = document.getElementById("trees");
    trees.innerHTML = displayNumber(kWh * costs.trees);
    
    const moneyPerMonth = document.getElementById("cents-per-month");
    moneyPerMonth.innerHTML = displayCurrency(kWh * costs.money * 30);
    const co2ePerMonth = document.getElementById("co2e-per-month");
    co2ePerMonth.innerHTML = displayNumber(kWh * costs.co2e * 30);
    const treesPerMonth = document.getElementById("trees-per-month");
    treesPerMonth.innerHTML = displayNumber(kWh * costs.trees * 30);
    
    const moneyPerYear = document.getElementById("cents-per-year");
    moneyPerYear.innerHTML = displayCurrency(kWh * costs.money * 365);
    const co2ePerYear = document.getElementById("co2e-per-year");
    co2ePerYear.innerHTML = displayNumber(kWh * costs.co2e * 365);
    const treesPerYear = document.getElementById("trees-per-year");
    treesPerYear.innerHTML = displayNumber(kWh * costs.trees * 365);
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
    document.getElementById("consumption").value = parseFloat(appliances.find(appliance => appliance.id == id).watts).toPrecision();
    document.getElementById("duration").value = parseFloat(appliances.find(appliance => appliance.id == id).typicalDuration).toPrecision();
}