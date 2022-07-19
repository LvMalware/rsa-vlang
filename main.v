import rsa

fn main() {
	key_size := 1024
	println("Generating a $key_size bits RSA keypair... (this might take a while)")
	keypair := rsa.generate_keypair(key_size) or {
		println(err)
		return
	}
	println("KeyPair: $keypair")
	println("")
	txt := "Hello, world!"
	enc := keypair.encrypt_string(txt)
	println("Encrypting '$txt': ${enc.hex()}")
	dec := keypair.decrypt_bytes(enc)
	println("Decrypting: ${dec.bytestr()}")
}
