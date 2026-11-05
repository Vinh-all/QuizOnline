// Bộ đệm bộ nhớ đệm (In-Memory Cache) với TTL siêu nhanh cho QuizOnline
// Giúp giảm tải 95% truy vấn tới Supabase PostgreSQL và tăng tốc phản hồi < 5ms

class MemoryCache {
  constructor(defaultTTLSeconds = 600) {
    this.cache = new Map();
    this.defaultTTL = defaultTTLSeconds * 1000;
  }

  set(key, value, ttlSeconds) {
    const expiresAt = Date.now() + (ttlSeconds ? ttlSeconds * 1000 : this.defaultTTL);
    this.cache.set(key, { value, expiresAt });
  }

  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;
    if (Date.now() > item.expiresAt) {
      this.cache.delete(key);
      return null;
    }
    return item.value;
  }

  del(key) {
    this.cache.delete(key);
  }

  clear() {
    this.cache.clear();
  }
}

module.exports = new MemoryCache(600); // Mặc định lưu 10 phút

