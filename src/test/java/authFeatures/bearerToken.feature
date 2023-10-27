#Author:  Gopinath Angusamy

Feature: Get bearer Token for Provider Portal

  Background: 
  
    * def readProps =
      """
      function(path) {
        var stream = karate.readAsStream(path);
        var props = new java.util.Properties();
        props.load(stream);
        return props;
      }
      """
    * def props = readProps('file:src/test/resources/utils/karate.properties')

  Scenario: Oauth2 Token API
  
    Given url props.bearerReqUrl
    And path props.bearerPath
    And form field grant_type = props.grantType
    And form field client_secret = props.clientSecret
    And form field client_id = props.clientId
    And form field redirect_uri = props.redirectUri
    And form field refresh_token = props.refreshToken
    When method post
    Then status  200
    And def authToken = response.id_token
    * print authToken