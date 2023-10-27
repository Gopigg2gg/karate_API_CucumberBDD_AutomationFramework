package runner;

import com.intuit.karate.junit5.Karate;

/**
*
* @author Gopinath Angusamy
*/

public class TestRunner {
	
	@Karate.Test
	Karate postAPITest() {
		return Karate.run("classpath:features/postLeads.feature").relativeTo(getClass());
	}

}
