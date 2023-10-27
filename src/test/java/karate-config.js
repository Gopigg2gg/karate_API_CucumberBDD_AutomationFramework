function fn() {
	var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
	if (!env) {
		env = 'staging';
	}

	var config = {
		env: env,
		baseUrl: 'https://opcwb9o4ik.execute-api.us-east-1.amazonaws.com',
		xAPIKey : '4u62oUJEiREEYI8uV42v2mNPMcXeyYW6b0DydgJi'
	}

	if (env == 'staging') {
		config.baseUrl='https://opcwb9o4ik.execute-api.us-east-1.amazonaws.com';
		config.xAPIKey = '4u62oUJEiREEYI8uV42v2mNPMcXeyYW6b0DydgJi';
		config.tokenID = '';
	} else if (env == 'e2e') {
		// customize 
	}
	return config;
}