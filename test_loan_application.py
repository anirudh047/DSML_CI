import pytest
from loan_application import app

# docs for Pytest fixtures -> https://docs.pytest.org/en/7.1.x/how-to/fixtures.html#how-to-fixtures
# testing flask app docs -> https://flask.palletsprojects.com/en/2.0.x/testing/

@pytest.fixture
def client():
    return app.test_client()

# test_client() makes a request to the application without running a server
# client() method will help us in sending the get and post request

def test_ping(client):
    resp=client.get("/ping")
    assert resp.status_code == 200
    assert resp.json == {"Pinging the model successful" : "Hurray"}

def test_predict(client):
    test_json = {
                "Gender":"Male",
                "Married": "Unmarried",
                "ApplicantIncome": 50000,
                "Credit_History": "Cleared Debts",
                "LoanAmount": 500000
                }
    
    resp = client.post("/predict",json=test_json)
    assert resp.status_code == 200
    assert resp.json == {"loan_approval_status: ": "Rejected"}