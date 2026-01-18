from app import app


def test_home_page_loads():
    client = app.test_client()
    response = client.get("/")

    assert response.status_code == 200


def test_prediction_route():
    client = app.test_client()

    form_data = {
        "sepal_length": "5.1",
        "sepal_width": "3.5",
        "petal_length": "1.4",
        "petal_width": "0.2"
    }

    response = client.post("/predict", data=form_data)

    assert response.status_code == 200