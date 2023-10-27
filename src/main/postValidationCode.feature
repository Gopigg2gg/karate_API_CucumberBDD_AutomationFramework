Feature: POST Validation code API

Background: 
	* url baseUrl
	* def requestPayload = read('file:src/test/resources/data/json/postValidationCode.json')

Scenario: Post Validation code API

Given path '/stage/otp-code' 
And request requestPayload
And header x-api-key = xAPIKey
When method post
Then status  200
And match $.data.request_id == '#present'