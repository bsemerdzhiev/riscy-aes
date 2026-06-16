#include <stdint.h>

static void aes128_ecb_decrypt_old(uint8_t *ciphertext, uint8_t *key,
                                   uint8_t *recovered) {
  __asm__ volatile("aes.load x0, 0(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.load x1, 4(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.load x2, 8(%0)" : : "r"(ciphertext));
  __asm__ volatile("aes.load x3, 12(%0)" : : "r"(ciphertext));

  __asm__ volatile("aes.load x4, 0(%0)" : : "r"(key));
  __asm__ volatile("aes.load x5, 4(%0)" : : "r"(key));
  __asm__ volatile("aes.load x6, 8(%0)" : : "r"(key));
  __asm__ volatile("aes.load x7, 12(%0)" : : "r"(key));

  /* aes.decrypt.old: opcode=0x6b funct3=011 (old separate decrypt module) */
  __asm__ volatile(".insn r 0x6b, 3, 0, x0, x0, x0");

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

int main(void) {
  uint8_t ciphertext[16] = {0x14, 0x09, 0xA5, 0xFB, 0x1F, 0xF4, 0x4B, 0x71,
                            0xBE, 0xAA, 0x25, 0x2E, 0x0F, 0x08, 0xF9, 0xAA};
  uint8_t expected[16] = {'H', 'e', 'l', 'l', 'o', ',', ' ', 'W',
                          'o', 'r', 'l', 'd', '!', '0', '0', '0'};
  uint8_t key[16] = {'c', 'e', 's', 'e', '4', '0', '4', '0',
                     'p', 'a', 's', 's', 'w', 'o', 'r', 'd'};
  uint8_t plaintext[16] = {0};

  aes128_ecb_decrypt_old(ciphertext, key, plaintext);

  uintptr_t base = 0x0100000 + 0x2000;
  write_block(base + 0x30, expected);
  write_block(base + 0x40, plaintext);
  write32(base + 0x04, 0xCAFEBABE);
  write32(base + 0x00, 0xDEADBEEF);

  return 0;
}
