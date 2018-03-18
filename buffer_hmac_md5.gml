/// @function buffer_hmac_md5
/// @param {integer} buffer The index of the buffer to use.
/// @param {integer} offset The data offset value.
/// @param {integer} size The size of the buffer.
/// @param {string} key The secret key to encode with
/// @description Implementation of the HMAC algorithm using the MD5 hash function. 

var buffer = argument0;
var buffer_offset = argument1
var buffer_size = argument2
var key_string = argument3
var hash_block_size = 64 // MD5 and SHA1 are 512 bits, ie. 64 bytes
var hex_lookup = "0123456789abcdef"

var key_buffer = buffer_create(hash_block_size, buffer_fixed, 1)
if string_byte_length(key_string) > hash_block_size {
    // If the key is longer than hash block size, we hash the key and use that instead.
    var hash = md5_string_utf8(key_string);

	// Convert from hex string to byte form as GML provides no way to get a raw byte buffer from hash calls.
	var hash_size = string_byte_length(hash)
	for (var i = 1; i <= hash_size; i += 2) {
		var byte_to_write = string_pos(string_char_at(hash, i+1), hex_lookup) + 
							(string_pos(string_char_at(hash, i), hex_lookup) * 16) - 17 
		buffer_write(key_buffer, buffer_u8, byte_to_write);
	}
} else {
    buffer_write(key_buffer, buffer_text, key_string);
}

// NOTE(Jake): 2018-03-17
//
// Implementation on wiki notes you need to pad the end of the buffer with zero bytes:
// https://en.wikipedia.org/wiki/HMAC
//
// This is done implicitly by creating a buffer of hash_block_size as the final bytes
// that aren't written over will remain at zero byte values.
//
var i_key_pad_buffer = buffer_create(hash_block_size + buffer_size, buffer_fixed, 1)
var o_key_pad_buffer = buffer_create(hash_block_size + hash_block_size, buffer_fixed, 1)
for (var i = 0; i < hash_block_size; i++) {
    var byte = buffer_peek(key_buffer, i, buffer_u8);
	// i_key_pad = key xor [0x36 * blockSize]
    buffer_write(i_key_pad_buffer, buffer_u8, byte ^ 0x36);
	// o_key_pad = key xor [0x5c * blockSize]
    buffer_write(o_key_pad_buffer, buffer_u8, byte ^ 0x5C);
}

// Concat ipad + buffer
// - return hash(opad_buffer + hash(ipad_buffer + buffer))
//                             ^^^^^^^^^^^^^^^^^^^^^^^^^^
buffer_copy(buffer, buffer_offset, buffer_size, i_key_pad_buffer, buffer_tell(i_key_pad_buffer));
buffer_seek(i_key_pad_buffer, buffer_seek_relative, buffer_size)
var hash = buffer_md5(i_key_pad_buffer, 0, buffer_tell(i_key_pad_buffer));

// Concat (hash of ipad_buffer) to opad
var hash_size = string_byte_length(hash)
for (var i = 1; i <= hash_size; i += 2) {
	var byte_to_write = string_pos(string_char_at(hash, i+1), hex_lookup) + 
						(string_pos(string_char_at(hash, i), hex_lookup) * 16) - 17 
	buffer_write(o_key_pad_buffer, buffer_u8, byte_to_write);
}
var result = buffer_md5(o_key_pad_buffer, 0, buffer_tell(o_key_pad_buffer));

// Cleanup
buffer_delete(key_buffer)
buffer_delete(i_key_pad_buffer)
buffer_delete(o_key_pad_buffer)

return result
