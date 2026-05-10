const Chat = {
  messages: JSON.parse(localStorage.getItem('jd_chat_messages') || '[]'),
  isAvailable: true,

  init() {
    this.renderMessages();
    this.setupInput();
  },

  setupInput() {
    const input = document.getElementById('chat-input');
    const sendBtn = document.getElementById('chat-send');
    if (!input || !sendBtn) return;

    const send = () => {
      const text = input.value.trim();
      if (!text) return;
      this.sendMessage(text);
      input.value = '';
    };

    sendBtn.addEventListener('click', send);
    input.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') send();
    });
  },

  sendMessage(text) {
    const msg = {
      id: Date.now().toString(),
      text,
      sender: 'user',
      timestamp: new Date().toISOString()
    };
    this.messages.push(msg);
    localStorage.setItem('jd_chat_messages', JSON.stringify(this.messages));
    this.renderMessages();
    this.autoReply(text);
  },

  autoReply(userText) {
    const responses = [
      'Entiendo que estés pasando por una situación difícil. Estamos aquí para apoyarte. ¿Puedes contarme más sobre lo que sucedió?',
      'Lamento mucho que estés experimentando esto. Recuerda que no estás solo/a. ¿Has hablado con alguien de confianza sobre esto?',
      'Gracias por compartir esto con nosotros. Es importante que sepas que el acoso en línea no es tu culpa. ¿Te gustaría saber cómo puedes bloquear al agresor?',
      'Estamos procesando tu información. Mientras tanto, te recomiendo guardar todas las evidencias (capturas de pantalla, mensajes). ¿Necesitas ayuda con algo específico?',
      'Tu seguridad es lo más importante. Si sientes que estás en peligro, no dudes en contactar a las autoridades locales. ¿Quieres que te proporcionemos recursos de ayuda?',
      'Es muy valiente de tu parte buscar ayuda. El primer paso es reconocer la situación. ¿Has considerado hacer una denuncia formal a través de nuestra plataforma?',
      'La plataforma donde ocurrió el acoso tiene herramientas de reporte. ¿Te gustaría que te guiemos en cómo reportar el contenido?'
    ];

    const reply = responses[Math.floor(Math.random() * responses.length)];

    setTimeout(() => {
      const msg = {
        id: Date.now().toString(),
        text: reply,
        sender: 'support',
        timestamp: new Date().toISOString()
      };
      this.messages.push(msg);
      localStorage.setItem('jd_chat_messages', JSON.stringify(this.messages));
      this.renderMessages();
    }, 1000 + Math.random() * 1500);
  },

  renderMessages() {
    const container = document.getElementById('chat-messages');
    if (!container) return;

    if (this.messages.length === 0) {
      container.innerHTML = `
        <div class="empty-state" style="padding:20px">
          <div class="icon">💬</div>
          <h3>Bienvenido al chat de apoyo</h3>
          <p style="font-size:0.9rem">Este es un espacio seguro y anónimo. Un consejero estará contigo en breve. Cuéntanos cómo podemos ayudarte.</p>
        </div>`;
      return;
    }

    container.innerHTML = this.messages.map(m => `
      <div class="chat-msg ${m.sender === 'support' ? 'support' : 'user'}">
        ${m.text}
        <span class="time">${new Date(m.timestamp).toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' })}</span>
      </div>
    `).join('');

    container.scrollTop = container.scrollHeight;
  }
};
