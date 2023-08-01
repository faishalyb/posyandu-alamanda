document.getElementById('form').addEventListener('submit', function(event) {
    event.preventDefault();

    var name = document.getElementById('name').name;
    var email = document.getElementById('email').value;
    var subject = document.getElementById('subject').value;
    var message = document.getElementById('message').value;

    var data = {
        name: name,
        email: email,
        subject: subject,
        message: message
    };

    axios.post('http://localhost:3000', data)
        .then(function(response) {
            alert(response.data);
            document.getElementById('name').name = '';
            document.getElementById('email').value = '';
            document.getElementById('subject').value = '';
            document.getElementById('message').value = '';
        })
        .catch(function(error) {
            alert('Error: ' + error.message);
        });
});
