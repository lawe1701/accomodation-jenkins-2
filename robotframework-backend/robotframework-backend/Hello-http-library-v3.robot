*** Settings ***
Library                        HttpLibrary.HTTP
Library                        String

Resource                       client-operations-control.robot

*** Test cases ***
Test case 1 - Request data from a client with ID 1
    Request information of a specific clients and check status code          1

Test case 2 - Request data from all clients
    Request information of all clients and check status code
    
Test case 3 - Create new client
    Create a new client with a post request