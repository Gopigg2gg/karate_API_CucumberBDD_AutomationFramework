#Author:  Gopinath Angusamy

Feature: Post Leads API

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
    * def requestPayloadReq = read(props.postLeadsReq)
    * def signIn = call read(props.bearerFeature)
    * def authToken = signIn.authToken
    * def getRandomNum =
      """
      function(max){ return Math.floor(Math.random() * max) }
      """


  Scenario: Create record with new parent and patient data
  
    Given url baseUrl
    * def randomNum = getRandomNum(9999)
    * def patientEmail = requestPayloadReq.patients[0].patient.patient_email = props.usernameEmail+randomNum+props.domainEmail
    * def parentEmail = requestPayloadReq.patients[0].emergencyContact.ecEmail = patientEmail
    And path props.leadsPath
    And request requestPayloadReq
    And header Authorization = props.bearerName + authToken
    When method post
    Then status 200
    And match response.code == 200



  Scenario:   Create record with existing parent and patient data

    Given url baseUrl
    And path props.leadsPath
    And request requestPayloadReq
    And header Authorization = props.bearerName + authToken
    When method post
    Then status 400
    And match response.code == 400

  Scenario:   Create record with incorrect parent and patient data

    Given url baseUrl
    * def randomNum = getRandomNum(9999)
    * def patientEmail = requestPayloadReq.patients[0].patient.patient_email = props.domainEmail
    * def parentEmail = requestPayloadReq.patients[0].emergencyContact.ecEmail = patientEmail
    And path props.leadsPath
    And request requestPayloadReq
    And header Authorization = props.bearerName + authToken
    When method post
    Then status 400
    And match response.code == 400


  Scenario:   Create record with incorrect method for parent and patient data

    Given url baseUrl
    And path props.leadsPath
    And request requestPayloadReq
    And header Authorization = props.bearerName + authToken
    When method get
    Then status 403
    #And match response.code == 403

  Scenario: Create record with parent and patient data with other provider

    Given url baseUrl
    * def patientEmail = requestPayloadReq.patients[0].patient.patient_email = props.userEmailWithOtherProvider
    * def parentEmail = requestPayloadReq.patients[0].emergencyContact.ecEmail = patientEmail
    And path props.leadsPath
    And request requestPayloadReq
    And header Authorization = props.bearerName + authToken
    When method post
    Then status 400
    And match response.code == 400