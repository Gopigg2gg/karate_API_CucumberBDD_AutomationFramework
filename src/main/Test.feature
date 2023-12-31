Feature: Demo POST API

Background: 
	* url 'https://provider-portal-dev.auth.us-east-1.amazoncognito.com'
	* def requestPayload = read('file:src/test/resources/data/json/Auth.json')

Scenario: Test Post API

Given path '/oauth2/token' 
And form field grant_type = "refresh_token"
And form field client_secret = "s5cli5fi2p4us02j3tvv1f998j076r7k0m71ebl7fj66qolqtgh"
And form field client_id = "6ji8vbofef21ga6e1oep9ifedm"
And form field redirect_uri = "https://goodparents.co/"
And form field refresh_token = "eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiUlNBLU9BRVAifQ.t4J5wY4aIWBUTTxWp9tjvgd4D_k7i_5pZ5T6jU2jHZ2nq-n53L5zzZeN7HaN5xw2FPigy_5eHxmnPQ9WJupNDkFEDN6WSz4JaBLxPKsDRMbyc_6cg0itqmTZmlLY_I3kzcpUlPTtudm9PoAT0zE2NvSqLA_vFiFA-r9L678oi2CnIwnbYVmKceYMhtH6LmZgdkDLoN7xPI-h9lYW0iEmnY2dW-ZA6mubcNX5Q6WiF5wmO--LzcG1IS0C11ISS8TYX1wEhva86UyfrBRgtRc-AIPHdj-RGlHEU_6adgQkXwNud37BRxFjFdSoHn3RRLMfl84zDeAYYPO79CEpSnZJXw.kahcr4UUsOpMhp8y.nv6cmXtWpLsORgpRwzVks3mDZiyCKWjX_Ml4O5X1o3elzzLGc5N5yXEje5Xgm-KVcB9ULbcekb3iP_1dUPqjLSzJ9FlcLnMsYWq5qfEwLzdObByItg4Kt8qDkMBXn9nc-SF4CTzx9oKqxFmcylJS8b96eyrTuYf0DuiDT5DymxDCA1u0UH2wj3jBwugGAgb0iZab-WrVwSH7nVaWqxCQ3pC6RZXk_IXVj7QYUX1lWTBvSVPiicE_UCG4SLw8tR9svvMYD35u816qZg9a7uyh80hsXSi_vWwDbvXPlXUiDqu9_Cv3TeWh03pZjMPIUnF01BjU7mWxsJLUgE6T8V_fNNP9qY55DObcXm2GyMDZ7i5bppFXqmxG0wwCdQq_mU1KszA6RH_Dpe3arR_OWRxt2Fy36kEsKG_g3ldg0RqpsWahTCExzm4vOQc2sFpMj7lg6miqhyuwR6Xpe8wyfKJ73C2ri1LLRXIfGBpdiuYpxqHZ0ohgjmqd3f8H9G0BmgkHWIYm4Q0_SYXxI4AhwToyIPzbSJJrkSgOX5-btsMtLqhEa4y-2NHhqivX5HnFHfmOwS1_sX-52ib9AMgyhtXw9RrbQ-og0ZUiB5FljRTfUbMphlDxhSAoNnD8nWkbJ92UABPgjx-J0p54-GyYuzUbvVzWbaVQf2-DvB87sCNGAo_-kagws4ySgZ8EOcuGmN_LMkt8g-wa6RZQJ8We6lQeFGwX2z0YlbN4iCvosRI6ppMzXMZesTZGC4JV3-KIvUH0-t_0EMCkM86cBt0X3CLVKJk6Xwa0U0E8OgynlctHeXO2sGMMPga9nQr2oeh91ooFp-JSMRLfyqbxcnOWpx0t6AX8LL_mM0puXH495myMKmUqmBlFoEqqciicSlrInCp-f5lL1C9IoBCmJioh0YkbwTFTUwkvU83wl4quGLFCMUVz5TF0eGcM_prO6KnDZ4jjECsdXqcNRKa9glIQKskyb3JLqsLiNBijG61ApTqmA5vHKBAEFfM-6RxiSj0ZNkeb6WjPF6XqKl82q9uFIWyLHUO42pQOtWdw_MwBi6ZeebOPe2er8FA5wbm3MJP1UevyoiyaIl60CasU6l6rYLRskhGyHhKzQTo34RILfZHzsYQX8gVoZYRBtWSMANa5lOYgIw5gAqpT1ik_MU5zG35GPEioAARvTSRs25MNj5uiGDo2QaFsv3OaSGn1l2sU1XN16s99_nU3Rp0u-lSurJnKge2bsmR5sqLAADsMnX69FMrgggkWf80mrkEAdNYaMaDrv0xaWsQUmlnxIU64zWSfnurILHtFM0T5BcZiE0kE5svbWe3Ez7CawZj3kgjm.dGNEt-cU99F62xgukgWbEA"

When method post
Then status  200
* print response
And def authToken = response.id_token
* print authToken
