from flask import Flask, request, make_response
import smtplib
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return """
        Response Successful!
    """


@app.route('/feedback', methods=['POST', 'OPTIONS'])
def feedback():
    if request.method == 'OPTIONS':
        # Tangani permintaan OPTIONS dengan mengizinkan sumber daya lintas domain
        response = make_response()
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')
        return response

    email = request.json.get('email')
    subject = request.json.get('subject')
    message = request.json.get('message')

    feedback_data = {
        'email': email,
        'subject': subject,
        'message': message
    }

    send_email(feedback_data)

    return 'Terima kasih atas umpan balik Anda!'


def send_email(feedback_data):
    smtp_server = 'smtp.gmail.com'
    smtp_port = 587
    smtp_username = 'faishalyb12@gmail.com'
    smtp_password = 'eezseagzkjzffmlb'
    sender_email = 'faishalyb12@gmail.com'
    receiver_email = 'faishalyusuf@gmail.com'
    subject = 'Feedback'
    message = f"Email: {feedback_data['email']}\n\nSubject: {feedback_data['subject']}\n\nMessage: {feedback_data['message']}"

    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(smtp_username, smtp_password)
        server.sendmail(sender_email, receiver_email, f"Subject: {subject}\n\n{message}")



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
