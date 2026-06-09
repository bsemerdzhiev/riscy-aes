#include <stdint.h>

static void aes128_ecb_encrypt(uint8_t *plaintext, uint8_t *key,
                               uint8_t *ciphertext) {
  __asm__ volatile("aes.load x0, 0(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x1, 4(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x2, 8(%0)" : : "r"(plaintext));
  __asm__ volatile("aes.load x3, 12(%0)" : : "r"(plaintext));

  __asm__ volatile("aes.load x4, 0(%0)" : : "r"(key));
  __asm__ volatile("aes.load x5, 4(%0)" : : "r"(key));
  __asm__ volatile("aes.load x6, 8(%0)" : : "r"(key));
  __asm__ volatile("aes.load x7, 12(%0)" : : "r"(key));

  __asm__ volatile("aes.encrypt");

  __asm__ volatile("aes.store x0, 0(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x1, 4(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x2, 8(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.store x3, 12(%0)" : : "r"(ciphertext));
}

static void aes128_ecb_decrypt_inplace(uint8_t *recovered) {
  __asm__ volatile("aes.decrypt");

  __asm__ volatile("aes.store x0, 0(%0)" : : "r"(recovered));
  __asm__ volatile("aes.store x1, 4(%0)" : : "r"(recovered));
  __asm__ volatile("aes.store x2, 8(%0)" : : "r"(recovered));
  __asm__ volatile("aes.store x3, 12(%0)" : : "r"(recovered));
}

static void write32(uintptr_t addr, uint32_t val) {
  *(volatile uint32_t *)addr = val;
}

static void write_block(uintptr_t addr, uint8_t *block) {
  uint32_t *w = (uint32_t *)block;
  for (int i = 0; i < 4; i++)
    write32(addr + i * 4, w[i]);
}

uint8_t plaintext[16] = {'H', 'e', 'l', 'l', 'o', ',', ' ', 'W',
                         'o', 'r', 'l', 'd', '!', '0', '0', '0'};
int main(void) {
  uint8_t key[16] = {'c', 'e', 's', 'e', '4', '0', '4', '0',
                     'p', 'a', 's', 's', 'w', 'o', 'r', 'd'};

  uint8_t recovered[16] = {0};
  uint8_t ciphertext[16] = {0};

  aes128_ecb_encrypt(plaintext, key, ciphertext);
  aes128_ecb_decrypt_inplace(recovered);

  uint32_t result = 0xCAFEBABE;
  for (int i = 0; i < 16; i++) {
    if (recovered[i] != plaintext[i]) {
      result = 0xBAAAAAAD;
      break;
    }
  }

  uintptr_t base = 0x0100000 + 0x2000;

  // expected (original plaintext)
  write_block(base + 0x30, plaintext);
  // actual (recovered after decrypt)
  write_block(base + 0x40, recovered);
  // pass/fail
  write32(base + 0x04, result);
  // DEADBEEF
  write32(base + 0x00, 0xDEADBEEF);

  return 0;
}
