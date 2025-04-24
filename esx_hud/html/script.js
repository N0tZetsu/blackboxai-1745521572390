window.addEventListener('message', function(event) {
    if (event.data.action === 'updateHud') {
        document.getElementById('job-name').textContent = event.data.job || 'N/A';
        document.getElementById('money').textContent = event.data.money || 0;
        document.getElementById('bank').textContent = event.data.bank || 0;
        document.getElementById('black-money').textContent = event.data.blackMoney || 0;
    }
});
