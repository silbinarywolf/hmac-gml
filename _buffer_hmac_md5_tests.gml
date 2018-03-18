/// @function _buffer_hmac_md5_tests
/// @description Runs tests to ensure the correctness of buffer_hmac_md5()

var reportString = "HMAC MD5 Test Report:\n\n"
var testCount = 0
var passCount = 0
var failCount = 0

#region Test "A" string with "secret_key" as key
var test_name = "\"A\" string with \"secret_key\" as key"
var str = "A"
var secret_key = "secret_key"
var hmac_result = ""
var expected_value = "ee133c384b21ea75f917d6840834b819"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_md5(buffer, 0, buffer_tell(buffer), secret_key))
	buffer_delete(buffer)
	
	if hmac_result == expected_value {
		passCount++
	} else {
		reportString += "- Failed test ("+test_name+") to be:\n" + expected_value +"\ninstead got:\n"+string(hmac_result)+"\n\n";
		failCount++
	}
	testCount++
#endregion
#endregion

#region Test "A" string (sero-byte terminated) with "secret_key" as key
var test_name = "\"A\" string (sero-byte terminated) with \"secret_key\" as key"
var str = "A"
var secret_key = "secret_key"
var hmac_result = ""
var expected_value = "099bf9b598496a45c2dd81fa8fa5942d"
#region internal function
	var buffer = buffer_create(string_byte_length(str)+1, buffer_grow, 1)
	buffer_write(buffer, buffer_string, str)
	var hmac_result = string(buffer_hmac_md5(buffer, 0, buffer_tell(buffer), secret_key))
	buffer_delete(buffer)
	
	if hmac_result == expected_value {
		passCount++
	} else {
		reportString += "- Failed test ("+test_name+") to be:\n" + expected_value +"\ninstead got:\n"+string(hmac_result)+"\n\n";
		failCount++
	}
	testCount++
#endregion
#endregion

#region Test "A" string with "ff772e31410ae7f31b93c2109f496006ff772e31410ae7f31b93c2109f496006" as key
var test_name = "\"A\" string with \"ff772e31410ae7f31b93c2109f496006ff772e31410ae7f31b93c2109f496006\" as key"
var str = "A"
var secret_key = "ff772e31410ae7f31b93c2109f496006ff772e31410ae7f31b93c2109f496006"
var hmac_result = ""
var expected_value = "2efd7338eeb40b0ef11d89baa7a41d7a"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_md5(buffer, 0, buffer_tell(buffer), secret_key))
	buffer_delete(buffer)
	
	if hmac_result == expected_value {
		passCount++
	} else {
		reportString += "- Failed test ("+test_name+") to be:\n" + expected_value +"\ninstead got:\n"+string(hmac_result)+"\n\n";
		failCount++
	}
	testCount++
#endregion
#endregion

#region Test "A" string with "key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size" as key
var test_name = "\"A\" string with \"key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size\" as key"
var str = "A"
var secret_key = "key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size"
var hmac_result = ""
var expected_value = "ccef2ac45f8348e41ee6e361caf0a3e5"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_md5(buffer, 0, buffer_tell(buffer), secret_key))
	buffer_delete(buffer)
	
	if hmac_result == expected_value {
		passCount++
	} else {
		reportString += "- Failed test ("+test_name+") to be:\n" + expected_value +"\ninstead got:\n"+string(hmac_result)+"\n\n";
		failCount++
	}
	testCount++
#endregion
#endregion

#region Test "A" string (sero-byte terminated) with "key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size" as key
var test_name = "\"A\" string with \"key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size\" as key"
var str = "A"
var secret_key = "key_that_is_larger_than_hash_block_size____key_that_is_larger_than_hash_block_size"
var hmac_result = ""
var expected_value = "94c218781266730fbb06326ccb13be11"
#region internal function
	var buffer = buffer_create(string_byte_length(str)+1, buffer_grow, 1)
	buffer_write(buffer, buffer_string, str)
	var hmac_result = string(buffer_hmac_md5(buffer, 0, buffer_tell(buffer), secret_key))
	buffer_delete(buffer)
	
	if hmac_result == expected_value {
		passCount++
	} else {
		reportString += "- Failed test ("+test_name+") to be:\n" + expected_value +"\ninstead got:\n"+string(hmac_result)+"\n\n";
		failCount++
	}
	testCount++
#endregion
#endregion

// End process. 
// Tests should be executed to test behaviour and not used in actual game code.
reportString += string(testCount)+" tests, "+string(passCount)+" passed and "+string(failCount)+" failed.\n";
show_debug_message(reportString)
show_message(reportString)
game_end()
