const App = {
  currentPage: 'home',

  init() {
    Auth.init();
    this.setupRouting();
    this.setupMobileMenu();
    this.navigate('home');
    this.setupDefaultNotifications();
  },

  setupRouting() {
    document.querySelectorAll('[data-page]').forEach(el => {
      el.addEventListener('click', (e) => {
        e.preventDefault();
        const page = el.dataset.page;
        this.navigate(page);
      });
    });

    window.addEventListener('hashchange', () => {
      const page = location.hash.replace('#', '') || 'home';
      this.navigate(page);
    });
  },

  setupMobileMenu() {
    const toggle = document.getElementById('mobile-toggle');
    const navLinks = document.getElementById('nav-links');
    if (toggle && navLinks) {
      toggle.addEventListener('click', () => {
        navLinks.classList.toggle('show');
      });
      document.querySelectorAll('.nav-links a').forEach(a => {
        a.addEventListener('click', () => navLinks.classList.remove('show'));
      });
    }
  },

  setupDefaultNotifications() {
    if (Notifications.items.length === 0) {
      Notifications.add('Bienvenido a Justicia Digital', 'Estamos aquí para ayudarte. Explora nuestros recursos y servicios.', 'info');
      Notifications.add('Línea de ayuda disponible', 'Si necesitas apoyo inmediato, visita la sección de chat.', 'alert');
    }
  },

  navigate(page) {
    this.currentPage = page;
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('[data-page]').forEach(a => a.classList.remove('active'));

    const target = document.getElementById(`page-${page}`);
    if (target) {
      target.classList.add('active');
    }

    document.querySelectorAll(`[data-page="${page}"]`).forEach(a => a.classList.add('active'));

    location.hash = page;

    switch (page) {
      case 'login':
        this.renderLogin();
        break;
      case 'register':
        this.renderRegister();
        break;
      case 'denuncias':
        Reports.renderReportForm();
        Reports.renderReports();
        break;
      case 'chat':
        Chat.init();
        break;
      case 'recursos':
        Resources.init();
        break;
      case 'notificaciones':
        Notifications.render();
        break;
    }
  },

  renderLogin() {
    const container = document.getElementById('login-container');
    if (!container) return;

    if (Auth.isLoggedIn()) {
      container.innerHTML = `
        <div class="form-container" style="text-align:center">
          <div style="font-size:3rem;margin-bottom:16px">👋</div>
          <h2>Ya has iniciado sesión</h2>
          <p style="color:var(--text-light);margin-bottom:20px">Bienvenido/a de nuevo, ${Auth.getUser().name}.</p>
          <button class="btn btn-primary" onclick="App.navigate('home')">Ir al inicio</button>
        </div>`;
      return;
    }

    container.innerHTML = `
      <div class="form-container">
        <h2>Iniciar sesión</h2>
        <div id="login-alert"></div>
        <form onsubmit="return App.handleLogin(event)">
          <div class="form-group">
            <label>Correo electrónico</label>
            <input type="email" name="email" placeholder="tu@correo.com" required>
          </div>
          <div class="form-group">
            <label>Contraseña</label>
            <input type="password" name="password" placeholder="••••••••" required>
          </div>
          <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
        <div class="form-footer">
          ¿No tienes cuenta? <a onclick="App.navigate('register')">Regístrate aquí</a>
        </div>
      </div>`;
  },

  renderRegister() {
    const container = document.getElementById('register-container');
    if (!container) return;

    if (Auth.isLoggedIn()) {
      container.innerHTML = `
        <div class="form-container" style="text-align:center">
          <div style="font-size:3rem;margin-bottom:16px">✅</div>
          <h2>Ya tienes una cuenta</h2>
          <p style="color:var(--text-light);margin-bottom:20px">Estás registrado/a como ${Auth.getUser().name}.</p>
          <button class="btn btn-primary" onclick="App.navigate('home')">Ir al inicio</button>
        </div>`;
      return;
    }

    container.innerHTML = `
      <div class="form-container">
        <h2>Crear cuenta</h2>
        <div id="register-alert"></div>
        <form onsubmit="return App.handleRegister(event)">
          <div class="form-group">
            <label>Nombre completo</label>
            <input type="text" name="name" placeholder="Tu nombre" required>
          </div>
          <div class="form-group">
            <label>Correo electrónico</label>
            <input type="email" name="email" placeholder="tu@correo.com" required>
          </div>
          <div class="form-group">
            <label>Contraseña</label>
            <input type="password" name="password" placeholder="Mínimo 6 caracteres" minlength="6" required>
          </div>
          <div class="form-group">
            <label>Confirmar contraseña</label>
            <input type="password" name="confirm" placeholder="Repite la contraseña" required>
          </div>
          <button type="submit" class="btn btn-primary">Crear cuenta</button>
        </form>
        <div class="form-footer">
          ¿Ya tienes cuenta? <a onclick="App.navigate('login')">Inicia sesión</a>
        </div>
      </div>`;
  },

  handleLogin(e) {
    e.preventDefault();
    const fd = new FormData(e.target);
    const { email, password } = Object.fromEntries(fd.entries());
    const result = Auth.login(email, password);
    if (result.success) {
      showAlert('login-alert', 'Sesión iniciada correctamente.', 'success');
      setTimeout(() => App.navigate('home'), 800);
    } else {
      showAlert('login-alert', result.error, 'error');
    }
    return false;
  },

  handleRegister(e) {
    e.preventDefault();
    const fd = new FormData(e.target);
    const data = Object.fromEntries(fd.entries());
    if (data.password !== data.confirm) {
      showAlert('register-alert', 'Las contraseñas no coinciden.', 'error');
      return false;
    }
    const result = Auth.register(data.name, data.email, data.password);
    if (result.success) {
      showAlert('register-alert', 'Cuenta creada exitosamente.', 'success');
      setTimeout(() => App.navigate('home'), 800);
    } else {
      showAlert('register-alert', result.error, 'error');
    }
    return false;
  }
};

function showAlert(containerId, message, type = 'info') {
  const container = document.getElementById(containerId);
  if (!container) return;
  container.innerHTML = `<div class="alert alert-${type}">${message}</div>`;
  setTimeout(() => container.innerHTML = '', 5000);
}

document.addEventListener('DOMContentLoaded', () => App.init());
