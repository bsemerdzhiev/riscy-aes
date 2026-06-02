#include <stdint.h>
#include <stdio.h>
#include <string.h>

// AES-128 ECB encryption (no padding)
void aes128_ecb_encrypt(uint8_t *plaintext, size_t len, uint8_t *key,
                        uint8_t *ciphertext) {
  if (len % 16 != 0) {
    // printf("Error: Input length must be a multiple of 16 bytes (no
    // padding).\n");
    return;
  }

  // load the state col
  __asm__ volatile("aes.load x0, 0(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x1, 4(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x2, 8(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x3, 12(%0)" : : "r"(plaintext));

  // load the key col
  __asm__ volatile("aes.load x4, 0(%0)" : : "r"(key));
  __asm__ volatile("aes.load x5, 4(%0)" : : "r"(key));
  __asm__ volatile("aes.load x6, 8(%0)" : : "r"(key));
  __asm__ volatile("aes.load x7, 12(%0)" : : "r"(key));

  // perform the encryption
  __asm__ volatile("aes.encrypt");

  // store the state col
  __asm__ volatile("aes.store x0, 0(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x1, 4(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x2, 8(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x3, 12(%0)" : : "r"(ciphertext));
}

void write_to_address(uintptr_t addr, uint32_t value) {
  *(volatile uint32_t *)addr = value;
}

void write_v_to_address(uintptr_t addr, uint8_t vector[16]) {
  uint32_t *vector_word = (uint32_t *)vector;
  for (int i = 0; i < 4; i++) {
    write_to_address(addr + i * 0x4, vector_word[i]);
  }
}

int main() {
  // Plaintext: "Hello, World!000" (16 bytes, 1 block)
  uint8_t plaintext[16] = {'H', 'e', 'l', 'l', 'o', ',', ' ', 'W',
                           'o', 'r', 'l', 'd', '!', '0', '0', '0'};
  // Key: "cese4040password" (16 bytes)
  uint8_t key[16] = {'c', 'e', 's', 'e', '4', '0', '4', '0',
                     'p', 'a', 's', 's', 'w', 'o', 'r', 'd'};
  uint8_t expected_output[16] = {0x14, 0x09, 0xA5, 0xFB, 0x1F, 0xF4,
                                 0x4B, 0x71, 0xBE, 0xAA, 0x25, 0x2E,
                                 0x0F, 0x08, 0xF9, 0xAA};
  uint8_t ciphertext[16];
  size_t len = 16; // Single block

  uintptr_t addr;
  uint32_t value;

  aes128_ecb_encrypt(plaintext, len, key, ciphertext);

  addr = 0x0100000 + 0x2000 + 0x30;
  write_v_to_address(addr, expected_output);

  addr = 0x0100000 + 0x2000 + 0x40;
  write_v_to_address(addr, ciphertext);

  // Check if calculated and expected match:
  addr = 0x0100000 + 0x2000 +
         0x04;        // Some memory-mapped register or memory location
  value = 0xCAFEBABE; // Assume arrays match initially
  for (int i = 0; i < 16; i++) {
    if (ciphertext[i] != expected_output[i]) {
      value = 0xBAAAAAAD; // Set to false value if there's a mismatch
      break;
    }
  }
  write_to_address(addr, value);

  // END OF TEST WRITE (used to identify when the execution of the C code
  // finished): DO NOT REMOVE!
  addr = 0x0100000 + 0x2000; // SRAM base address is 0x0100000.
  value = 0xDEADBEEF;
  write_to_address(addr, value);

  return 0;
}
