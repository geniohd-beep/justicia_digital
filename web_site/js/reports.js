const Reports = {
  reports: JSON.parse(localStorage.getItem('jd_reports') || '[]'),

  init() {
    this.renderReports();
  },

  submit(data) {
    const report = {
      id: Date.now().toString(),
      anonymousId: 'JD-' + Math.random().toString(36).substring(2, 8).toUpperCase(),
      ...data,
      status: 'pending',
      createdAt: new Date().toISOString()
    };
    this.reports.push(report);
    localStorage.setItem('jd_reports', JSON.stringify(this.reports));
    this.renderReports();
    Notifications.add('Denuncia registrada', `Tu denuncia #${report.anonymousId} ha sido recibida. Le daremos seguimiento.`, 'report');
    return report;
  },

  getUserReports() {
    if (Auth.isLoggedIn()) {
      const user = Auth.getUser();
      return this.reports.filter(r => r.userId === user.id);
    }
    return [];
  },

  getAllReports() {
    return this.reports;
  },

  renderReports() {
    const list = document.getElementById('report-list');
    if (!list) return;
    const userReports = Auth.isLoggedIn() ? this.getUserReports() : [];

    if (userReports.length === 0) {
      list.innerHTML = `
        <div class="empty-state">
          <div class="icon">📋</div>
          <h3>No hay denuncias aún</h3>
          <p>Tus denuncias aparecerán aquí después de registrarlas.</p>
        </div>`;
      return;
    }

    list.innerHTML = userReports.reverse().map(r => `
      <div class="report-item">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px;flex-wrap:wrap;gap:8px">
          <strong>#${r.anonymousId}</strong>
          <span class="status ${r.status}">
            ${r.status === 'pending' ? 'Pendiente' : r.status === 'reviewing' ? 'En revisión' : 'Resuelto'}
          </span>
        </div>
        <p><strong>Tipo:</strong> ${r.type}</p>
        <p>${r.description.substring(0, 120)}${r.description.length > 120 ? '...' : ''}</p>
        <div class="date">${new Date(r.createdAt).toLocaleDateString('es-ES', { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' })}</div>
      </div>
    `).join('');
  },

  renderReportForm() {
    const container = document.getElementById('report-form-container');
    if (!container) return;

    if (!Auth.isLoggedIn()) {
      container.innerHTML = `
        <div class="alert alert-info">
          Para registrar una denuncia, primero <a href="#" onclick="App.navigate('login')" style="font-weight:700">inicia sesión</a> o <a href="#" onclick="App.navigate('register')" style="font-weight:700">regístrate</a>.
        </div>
        <div class="report-card">
          <h3>🔒 Denuncia anónima</h3>
          <p style="color:var(--text-light);margin-bottom:16px">También puedes hacer una denuncia anónima sin registrarte.</p>
          <button class="btn btn-warning" onclick="Reports.showAnonymousForm()">Hacer denuncia anónima</button>
        </div>`;
      return;
    }

    container.innerHTML = `
      <div class="report-card">
        <h3>📝 Nueva denuncia</h3>
        <form id="report-form" onsubmit="return Reports.handleSubmit(event)">
          <div class="form-group">
            <label>Tipo de acoso</label>
            <select name="type" required>
              <option value="">Selecciona una opción</option>
              <option value="Ciberacoso escolar">Ciberacoso escolar</option>
              <option value="Acoso en redes sociales">Acoso en redes sociales</option>
              <option value="Suplantación de identidad">Suplantación de identidad</option>
              <option value="Difusión no consentida">Difusión no consentida</option>
              <option value="Amenazas en línea">Amenazas en línea</option>
              <option value="Discriminación digital">Discriminación digital</option>
              <option value="Otro">Otro</option>
            </select>
          </div>
          <div class="form-group">
            <label>Descripción detallada</label>
            <textarea name="description" placeholder="Describe lo sucedido con el mayor detalle posible..." required></textarea>
          </div>
          <div class="form-group">
            <label>¿Tienes evidencia? (URLs, capturas, etc.)</label>
            <input type="text" name="evidence" placeholder="Opcional - comparte enlaces si tienes">
          </div>
          <div class="form-group">
            <label>Nombre del agresor (si lo conoces)</label>
            <input type="text" name="aggressor" placeholder="Opcional">
          </div>
          <div class="form-row">
            <div class="form-group">
              <label>Fecha del incidente</label>
              <input type="date" name="incidentDate" required>
            </div>
            <div class="form-group">
              <label>Plataforma</label>
              <select name="platform">
                <option value="">Selecciona</option>
                <option value="WhatsApp">WhatsApp</option>
                <option value="Instagram">Instagram</option>
                <option value="Facebook">Facebook</option>
                <option value="TikTok">TikTok</option>
                <option value="Twitter/X">Twitter/X</option>
                <option value="Telegram">Telegram</option>
                <option value="Otra">Otra</option>
              </select>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Enviar denuncia</button>
        </form>
      </div>`;
  },

  handleSubmit(e) {
    e.preventDefault();
    const fd = new FormData(e.target);
    const data = Object.fromEntries(fd.entries());
    data.userId = Auth.getUser().id;

    this.submit(data);
    e.target.reset();
    showAlert('report-alert', 'Denuncia registrada exitosamente. Te contactaremos pronto.', 'success');
    this.renderReports();
    return false;
  },

  showAnonymousForm() {
    const container = document.getElementById('report-form-container');
    container.innerHTML = `
      <div class="report-card">
        <h3>🕵️ Denuncia anónima</h3>
        <p style="color:var(--text-light);margin-bottom:16px">Tu identidad está protegida. No compartas información personal.</p>
        <form id="anon-report-form" onsubmit="return Reports.handleAnonymousSubmit(event)">
          <div class="form-group">
            <label>Tipo de acoso</label>
            <select name="type" required>
              <option value="">Selecciona una opción</option>
              <option value="Ciberacoso escolar">Ciberacoso escolar</option>
              <option value="Acoso en redes sociales">Acoso en redes sociales</option>
              <option value="Suplantación de identidad">Suplantación de identidad</option>
              <option value="Difusión no consentida">Difusión no consentida</option>
              <option value="Amenazas en línea">Amenazas en línea</option>
              <option value="Discriminación digital">Discriminación digital</option>
              <option value="Otro">Otro</option>
            </select>
          </div>
          <div class="form-group">
            <label>Descripción</label>
            <textarea name="description" placeholder="Describe la situación..." required></textarea>
          </div>
          <div class="form-group">
            <label>Plataforma</label>
            <select name="platform">
              <option value="">Selecciona</option>
              <option value="WhatsApp">WhatsApp</option>
              <option value="Instagram">Instagram</option>
              <option value="Facebook">Facebook</option>
              <option value="TikTok">TikTok</option>
              <option value="Twitter/X">Twitter/X</option>
              <option value="Telegram">Telegram</option>
              <option value="Otra">Otra</option>
            </select>
          </div>
          <button type="submit" class="btn btn-warning">Enviar denuncia anónima</button>
        </form>
        <div style="margin-top:16px">
          <button class="btn btn-sm" onclick="Reports.renderReportForm()" style="background:#e0e0e0">← Volver</button>
        </div>
      </div>`;
  },

  handleAnonymousSubmit(e) {
    e.preventDefault();
    const fd = new FormData(e.target);
    const data = Object.fromEntries(fd.entries());
    data.userId = 'anonymous';
    data.aggressor = '';
    data.evidence = '';
    data.incidentDate = '';

    const report = this.submit(data);
    e.target.reset();
    showAlert('report-alert', `Denuncia anónima #${report.anonymousId} registrada. Guarda este código para seguimiento.`, 'success');
    return false;
  }
};
