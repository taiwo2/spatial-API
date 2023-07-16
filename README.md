# Spatial Layer API Endpoint Documentation

The Spatial Layer API provides endpoints to store geospatial layers and retrieve values for a given point using latitude and longitude. The API is implemented in a Ruby on Rails application with SQLite3 as the database. The API uses the Geocoder gem to enable geocoding functionality.

# Base URL
The base URL for the API is http://127.0.0.1:3000 when running the application locally.

# Create a Spatial Layer
This endpoint allows users to create a new spatial layer by sending a POST request with the required parameters.

# Endpoint

```
POST /api/v1/spatial_layers

```

| Parameter | 	Type	|	Description|
| --------- | ------- |  -----------------------------|
| name      | String  | The name of the spatial layer |
| latitude  | Float	  | The latitude for the point    |
| longitude | Float   | The longitude for the point   |
| value     | String  | The value of the spatial layer|

# Example Request
```
POST /api/v1/spatial_layers
Content-Type: application/json

{
  "name": "Example Layer",
  "latitude": 37.7749,
  "longitude": -122.4194,
  "value": "Sample Value"
}

```
# Example Response (Success)

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "message": "Spatial layer created successfully"
}
```
# Example Response (Error)
```
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json

{
  "error": ["Name can't be blank"]
}

```

# Retrieve Spatial Layer Data for a Point

This endpoint allows users to retrieve spatial layer data for a specific point by sending a GET <br/>request with the latitude and longitude.


# Endpoint

```
GET /api/v1/spatial_layers

```

# Request Parameters
| Parameter | 	Type	|	Description|
| --------- | ------- |  -----------------------------|
| latitude  | Float	  | The latitude for the point    |
| longitude | Float   | The longitude for the point   |

# Example Request
``` 
GET /api/v1/spatial_layers?latitude=37.7749&longitude=-122.4194

```

# Example Response (Success)
```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "name": "Example Layer",
  "value": "Sample Value"
}

```

# Example Response (Error)

```
HTTP/1.1 404 Not Found
Content-Type: application/json

{
  "error": "Spatial layer not found"
}

```
# View Spatial Layer on Map
The map endpoint allows users to view the spatial layer on a map. The map displays a marker representing the spatial layer's location with a popup containing the name and value of the layer.

# Endpoint

```
GET /api/v1/spatial_layers/map

```

# Example Request

```
GET /api/v1/spatial_layers/map

```
# Example Response (Map Page)
[map](./map.png)

# Note
* The API accepts and returns data in JSON format.
* The API supports basic error handling, responding with appropriate error codes and messages when necessary.
* When creating a new spatial layer, ensure all required parameters are provided. Otherwise, the API will return an error response.
* When retrieving spatial layer data for a point, ensure valid latitude and longitude values are provided. If no spatial layer is found for the given point, the API will return an error response.
* The map endpoint displays the spatial layer marker on a Leaflet.js map. The marker shows a popup with the name and value of the spatial layer.
* Please feel free to test the API using tools like cURL or Postman to create and retrieve spatial layer data. Additionally, access the map endpoint in your web browser to view the spatial layer on the map and interact with it by zooming in and out.

