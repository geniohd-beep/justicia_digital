const Auth = {
  users: JSON.parse(localStorage.getItem('jd_users') || '[]'),
  currentUser: JSON.parse(localStorage.getItem('jd_current_user') || 'null'),

  init() {
    if (this.users.length === 0) {
      this.users.push({
        id: 'test-001',
        name: 'Usuario Prueba',
        email: 'prueba@test.com',
        password: '123456',
        avatar: 'U',
        createdAt: new Date().toISOString()
      });
      localStorage.setItem('jd_users', JSON.stringify(this.users));
    }
    this.updateUI();
  },

  register(name, email, password) {
    if (this.users.find(u => u.email === email)) {
      return { success: false, error: 'Este correo ya está registrado.' };
    }
    const user = {
      id: Date.now().toString(),
      name,
      email,
      password,
      avatar: name.charAt(0).toUpperCase(),
      createdAt: new Date().toISOString()
    };
    this.users.push(user);
    localStorage.setItem('jd_users', JSON.stringify(this.users));
    this.currentUser = user;
    localStorage.setItem('jd_current_user', JSON.stringify(user));
    this.updateUI();
    return { success: true };
  },

  login(email, password) {
    const user = this.users.find(u => u.email === email && u.password === password);
    if (!user) {
      return { success: false, error: 'Correo o contraseña incorrectos.' };
    }
    this.currentUser = user;
    localStorage.setItem('jd_current_user', JSON.stringify(user));
    this.updateUI();
    return { success: true };
  },

  logout() {
    this.currentUser = null;
    localStorage.removeItem('jd_current_user');
    this.updateUI();
    App.navigate('home');
  },

  isLoggedIn() {
    return this.currentUser !== null;
  },

  getUser() {
    return this.currentUser;
  },

  updateUI() {
    const authBtns = document.getElementById('auth-buttons');
    const userInfo = document.getElementById('user-info');
    const userName = document.getElementById('user-name');
    const userAvatar = document.getElementById('user-avatar');

    if (this.currentUser) {
      authBtns.style.display = 'none';
      userInfo.classList.add('show');
      userName.textContent = this.currentUser.name;
      userAvatar.textContent = this.currentUser.avatar;
    } else {
      authBtns.style.display = 'flex';
      userInfo.classList.remove('show');
    }
  }
};
