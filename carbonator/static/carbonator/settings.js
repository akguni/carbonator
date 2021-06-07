document.addEventListener('DOMContentLoaded', () => {
    settings = JSON.parse(document.getElementById('settings').textContent);
    document.getElementById("defaults").addEventListener('click', () => {
        document.getElementById("money-unit").value = settings.default.moneyUnit;
        document.getElementById("money").value = settings.default.money;
        document.getElementById("co2e").value = settings.default.co2e;
        document.getElementById("trees").value = settings.default.trees;
    })
})
