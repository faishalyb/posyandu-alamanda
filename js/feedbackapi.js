document.getElementById('feedback-form').addEventListener('submit', function(event) {
    event.preventDefault();

    var email = document.getElementById('email').value;
    var subject = document.getElementById('subject').value;
    var message = document.getElementById('message').value;

    var data = {
        email: email,
        subject: subject,
        message: message
    };

    axios.post('https://posyandu-alamanda-mx6yqdqjsa-et.a.run.app/feedback', data)
        .then(function(response) {
            alert(response.data);
            document.getElementById('email').value = '';
            document.getElementById('subject').value = '';
            document.getElementById('message').value = '';
        })
        .catch(function(error) {
            alert('Error: ' + error.message);
        });
});
