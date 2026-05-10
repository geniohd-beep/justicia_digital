const Notifications = {
  items: JSON.parse(localStorage.getItem('jd_notifications') || '[]'),

  init() {
    this.render();
    this.updateBadge();
  },

  add(title, message, type = 'info') {
    const notif = {
      id: Date.now().toString(),
      title,
      message,
      type,
      read: false,
      timestamp: new Date().toISOString()
    };
    this.items.unshift(notif);
    localStorage.setItem('jd_notifications', JSON.stringify(this.items));
    this.render();
    this.updateBadge();
  },

  markAsRead(id) {
    const item = this.items.find(n => n.id === id);
    if (item) {
      item.read = true;
      localStorage.setItem('jd_notifications', JSON.stringify(this.items));
      this.render();
      this.updateBadge();
    }
  },

  markAllRead() {
    this.items.forEach(n => n.read = true);
    localStorage.setItem('jd_notifications', JSON.stringify(this.items));
    this.render();
    this.updateBadge();
  },

  unreadCount() {
    return this.items.filter(n => !n.read).length;
  },

  updateBadge() {
    const count = this.unreadCount();
    const badge = document.getElementById('notif-badge');
    if (!badge) return;
    if (count > 0) {
      badge.textContent = count;
      badge.style.display = 'flex';
    } else {
      badge.style.display = 'none';
    }
  },

  render() {
    const container = document.getElementById('notif-list');
    if (!container) return;

    if (this.items.length === 0) {
      container.innerHTML = `
        <div class="empty-state">
          <div class="icon">🔔</div>
          <h3>Sin notificaciones</h3>
          <p>Aquí aparecerán las actualizaciones de tus denuncias y recursos.</p>
        </div>`;
      return;
    }

    const icons = {
      report: '📋',
      info: 'ℹ️',
      alert: '⚠️',
      success: '✅'
    };

    container.innerHTML = this.items.map(n => `
      <div class="notif-item ${n.read ? '' : 'unread'}" onclick="Notifications.markAsRead('${n.id}')">
        <div class="notif-icon" style="background:${n.type === 'alert' ? '#fbe9e7' : n.type === 'success' ? '#e8f5e9' : '#e3f2fd'}">
          ${icons[n.type] || 'ℹ️'}
        </div>
        <div class="notif-content">
          <h4>${n.title}</h4>
          <p>${n.message}</p>
        </div>
        <div class="notif-time">${this.formatTime(n.timestamp)}</div>
      </div>
    `).join('');
  },

  formatTime(timestamp) {
    const now = new Date();
    const date = new Date(timestamp);
    const diff = (now - date) / 1000;

    if (diff < 60) return 'Ahora';
    if (diff < 3600) return `${Math.floor(diff / 60)}m`;
    if (diff < 86400) return `${Math.floor(diff / 3600)}h`;
    return date.toLocaleDateString('es-ES', { day: 'numeric', month: 'short' });
  }
};
