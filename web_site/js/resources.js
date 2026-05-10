const Resources = {
  data: [
    {
      id: 1,
      title: 'Guía para identificar el ciberacoso',
      description: 'Aprende a reconocer las señales de alerta del acoso en línea y cómo actuar ante cada situación.',
      category: 'guide',
      tag: 'Guía',
      image: 'linear-gradient(135deg, #1a237e, #0d47a1)',
      icon: '🔍',
      url: '#'
    },
    {
      id: 2,
      title: 'Cómo proteger tu privacidad en redes sociales',
      description: 'Configuración de privacidad paso a paso para proteger tu información en las principales plataformas.',
      category: 'guide',
      tag: 'Guía',
      image: 'linear-gradient(135deg, #0d47a1, #1976d2)',
      icon: '🛡️',
      url: '#'
    },
    {
      id: 3,
      title: 'Derechos digitales: lo que dice la ley',
      description: 'Conoce tus derechos en el entorno digital y las leyes que protegen a las víctimas de ciberacoso.',
      category: 'article',
      tag: 'Artículo',
      image: 'linear-gradient(135deg, #3949ab, #5c6bc0)',
      icon: '⚖️',
      url: '#'
    },
    {
      id: 4,
      title: 'Pasos a seguir si eres víctima de ciberacoso',
      description: 'Guía práctica de acción inmediata: desde guardar evidencias hasta buscar ayuda profesional.',
      category: 'guide',
      tag: 'Guía',
      image: 'linear-gradient(135deg, #00bcd4, #26c6da)',
      icon: '📋',
      url: '#'
    },
    {
      id: 5,
      title: 'Salud mental y bienestar digital',
      description: 'Consejos para cuidar tu salud mental en el entorno digital y manejar el estrés del acoso en línea.',
      category: 'article',
      tag: 'Artículo',
      image: 'linear-gradient(135deg, #4caf50, #66bb6a)',
      icon: '🧠',
      url: '#'
    },
    {
      id: 6,
      title: 'Cómo apoyar a alguien que sufre ciberacoso',
      description: 'Si conoces a alguien que está pasando por esta situación, aquí te decimos cómo puedes ayudar.',
      category: 'video',
      tag: 'Video',
      image: 'linear-gradient(135deg, #ff5722, #ff7043)',
      icon: '🤝',
      url: '#'
    },
    {
      id: 7,
      title: 'Ciberseguridad para jóvenes',
      description: 'Consejos prácticos para navegar de forma segura y evitar situaciones de riesgo en internet.',
      category: 'article',
      tag: 'Artículo',
      image: 'linear-gradient(135deg, #7b1fa2, #9c27b0)',
      icon: '🔐',
      url: '#'
    },
    {
      id: 8,
      title: 'Líneas de ayuda y contacto de emergencia',
      description: 'Directorio actualizado de líneas de ayuda, orientación legal y apoyo psicológico disponibles.',
      category: 'guide',
      tag: 'Guía',
      image: 'linear-gradient(135deg, #e65100, #ff6f00)',
      icon: '📞',
      url: '#'
    },
    {
      id: 9,
      title: 'Testimonios de superación',
      description: 'Historias reales de personas que superaron el ciberacoso y reconstruyeron su bienestar digital.',
      category: 'video',
      tag: 'Video',
      image: 'linear-gradient(135deg, #00838f, #00acc1)',
      icon: '💪',
      url: '#'
    }
  ],

  init() {
    this.render();
  },

  render() {
    const grid = document.getElementById('resources-grid');
    if (!grid) return;

    grid.innerHTML = this.data.map(r => `
      <div class="resource-card">
        <div class="resource-img" style="background: ${r.image}">
          <div style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-size:3rem">${r.icon}</div>
          <span class="resource-tag ${r.category}">${r.tag}</span>
        </div>
        <div class="resource-body">
          <h3>${r.title}</h3>
          <p>${r.description}</p>
          <button class="btn btn-primary btn-sm" onclick="Resources.openResource(${r.id})">Ver recurso</button>
        </div>
      </div>
    `).join('');
  },

  openResource(id) {
    const resource = this.data.find(r => r.id === id);
    if (!resource) return;

    const modal = document.getElementById('resource-modal');
    const body = document.getElementById('resource-modal-body');
    if (!modal || !body) return;

    body.innerHTML = `
      <span class="modal-close" onclick="document.getElementById('resource-modal').classList.remove('show')">&times;</span>
      <div style="text-align:center;margin-bottom:20px">
        <div style="font-size:4rem;margin-bottom:16px">${resource.icon}</div>
        <h2>${resource.title}</h2>
        <span class="resource-tag ${resource.category}" style="position:static;display:inline-block;margin-bottom:16px">${resource.tag}</span>
      </div>
      <p style="font-size:1rem;line-height:1.6;margin-bottom:20px;color:var(--text-light)">${resource.description}</p>
      <p style="font-size:0.9rem;line-height:1.6;margin-bottom:20px">
        Este contenido está diseñado para brindarte información útil y herramientas prácticas. 
        Si estás enfrentando una situación de ciberacoso, recuerda que no estás solo/a. 
        Busca apoyo en personas de confianza y utiliza los recursos de denuncia disponibles en nuestra plataforma.
      </p>
      <button class="btn btn-primary" onclick="document.getElementById('resource-modal').classList.remove('show')">Cerrar</button>
    `;

    modal.classList.add('show');
  }
};

document.addEventListener('click', (e) => {
  if (e.target.classList.contains('modal-overlay')) {
    e.target.classList.remove('show');
  }
});
