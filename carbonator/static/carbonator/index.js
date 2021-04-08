document.addEventListener('DOMContentLoaded', () => {
    // by using no let or const, costs is declared as a global variable
    costs = JSON.parse(document.getElementById('costs').textContent);
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
    const watts = parseFloat(appliance.options[appliance.selectedIndex].value);
    const time = parseInt(duration.options[duration.selectedIndex].text);
    const kWh = (watts * time) / 1000;
    
    const cents = document.getElementById("cents");
    cents.innerHTML = kWh * costs.cents;
    const co2e = document.getElementById("co2e");
    co2e.innerHTML = kWh * costs.co2e;
    const trees = document.getElementById("trees");
    trees.innerHTML = kWh * costs.trees;
}