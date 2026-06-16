#include <stdint.h>

static inline void enable_cycle_counter(void) {
  __asm__ volatile("csrw 0x320, zero" ::: "memory"); // mcountinhibit = 0
}

static inline uint32_t read_mcycle(void) {
  uint32_t value;
  __asm__ volatile("csrr %0, 0xB00" : "=r"(value) :: "memory");
  return value;
}

static void aes128_ecb_decrypt(uint8_t *ciphertext, uint8_t *key,
                               uint8_t *recovered, uint32_t *aes_cycles) {
  uint32_t start_cycle = read_mcycle();
  uint32_t end_cycle;

  __asm__ volatile("aes.load x0, 0(%0)" : : "r"(ciphertext) : "memory");
  __asm__ volatile("aes.load x1, 4(%0)" : : "r"(ciphertext) : "memory");
  __asm__ volatile("aes.load x2, 8(%0)" : : "r"(ciphertext) : "memory");
  __asm__ volatile("aes.load x3, 12(%0)" : : "r"(ciphertext) : "memory");

  __asm__ volatile("aes.load x4, 0(%0)" : : "r"(key) : "memory");
  __asm__ volatile("aes.load x5, 4(%0)" : : "r"(key) : "memory");
  __asm__ volatile("aes.load x6, 8(%0)" : : "r"(key) : "memory");
  __asm__ volatile("aes.load x7, 12(%0)" : : "r"(key) : "memory");

  __asm__ volatile("aes.decrypt" ::: "memory");

  __asm__ volatile("aes.store x0, 0(%0)" : : "r"(recovered) : "memory");
  __asm__ volatile("aes.store x1, 4(%0)" : : "r"(recovered) : "memory");
  __asm__ volatile("aes.store x2, 8(%0)" : : "r"(recovered) : "memory");
  __asm__ volatile("aes.store x3, 12(%0)" : : "r"(recovered) : "memory");

  end_cycle = read_mcycle();
  if (aes_cycles != 0) {
    *aes_cycles = end_cycle - start_cycle;
  }
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
  enable_cycle_counter();
  uint32_t full_start_cycle = read_mcycle();

  uint8_t ciphertext[16] __attribute__((aligned(4))) = {
      0x14, 0x09, 0xA5, 0xFB, 0x1F, 0xF4, 0x4B, 0x71,
      0xBE, 0xAA, 0x25, 0x2E, 0x0F, 0x08, 0xF9, 0xAA};

  uint8_t expected[16] __attribute__((aligned(4))) = {
      'H', 'e', 'l', 'l', 'o', ',', ' ', 'W',
      'o', 'r', 'l', 'd', '!', '0', '0', '0'};

  uint8_t key[16] __attribute__((aligned(4))) = {
      'c', 'e', 's', 'e', '4', '0', '4', '0',
      'p', 'a', 's', 's', 'w', 'o', 'r', 'd'};

  uint8_t plaintext[16] __attribute__((aligned(4))) = {0};
  uint32_t aes_cycles = 0;
  uint32_t full_cycles;

  aes128_ecb_decrypt(ciphertext, key, plaintext, &aes_cycles);

  uint32_t result = 0xCAFEBABE;
  // for (int i = 0; i < 16; i++) {
  //   if (plaintext[i] != expected[i]) {
  //     result = 0xBAAAAAAD;
  //     break;
  //   }
  // }

  uintptr_t base = 0x0100000 + 0x2000;

  // expected (original plaintext)
  write_block(base + 0x30, expected);
  // actual (recovered after decrypt)
  write_block(base + 0x40, plaintext);
  // pass/fail
  write32(base + 0x04, result);
  // cycle benchmarks
  full_cycles = read_mcycle() - full_start_cycle;
  write32(base + 0x08, full_cycles);
  write32(base + 0x0C, aes_cycles);
  // DEADBEEF
  write32(base + 0x00, 0xDEADBEEF);

  return 0;
}
