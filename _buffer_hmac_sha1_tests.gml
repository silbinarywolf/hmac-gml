/// @function _buffer_hmac_sha1_tests
/// @description Runs tests to ensure the correctness of buffer_hmac_sha1()

var reportString = "HMAC SHA1 Test Report:\n\n"
var testCount = 0
var passCount = 0
var failCount = 0

#region Test "A" string with "secret_key" as key
var test_name = "\"A\" string with \"secret_key\" as key"
var str = "A"
var secret_key = "secret_key"
var hmac_result = ""
var expected_value = "bd5ad25d7ea1214a8143522f0eeef19f1c1c0d8e"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_sha1(buffer, 0, buffer_tell(buffer), secret_key))
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
var expected_value = "7f1dc17c1b06d515c10beedf1d5adae00ca6ed28"
#region internal function
	var buffer = buffer_create(string_byte_length(str)+1, buffer_grow, 1)
	buffer_write(buffer, buffer_string, str)
	var hmac_result = string(buffer_hmac_sha1(buffer, 0, buffer_tell(buffer), secret_key))
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
var expected_value = "c0838ff8d9925e1df1b100a271b872887b49de51"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_sha1(buffer, 0, buffer_tell(buffer), secret_key))
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
var expected_value = "0471fbe63c5beaf19d96f56e28f269371e6bcb84"
#region internal function
	var buffer = buffer_create(string_byte_length(str), buffer_grow, 1)
	buffer_write(buffer, buffer_text, str)
	var hmac_result = string(buffer_hmac_sha1(buffer, 0, buffer_tell(buffer), secret_key))
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
var expected_value = "bd6b4cad061e894e6cd31e2fdb1f0b9e51371ad8"
#region internal function
	var buffer = buffer_create(string_byte_length(str)+1, buffer_grow, 1)
	buffer_write(buffer, buffer_string, str)
	var hmac_result = string(buffer_hmac_sha1(buffer, 0, buffer_tell(buffer), secret_key))
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
