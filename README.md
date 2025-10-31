# 🛒 Araz Elektron - E-Commerce Platform

Elektron avadanlıqlar üçün tam funksional e-commerce platforması.

## 🌟 Xüsusiyyətlər

### 👥 İstifadəçi Tərəfi
- 🏠 Responsive ana səhifə
- 📱 Məhsul kataloqu (kateqoriyalara görə filtrasiya)
- 🔍 Məhsul axtarışı
- 🛍️ Səbət funksionallığı
- 📦 Sifariş forması
- 📞 Əlaqə məlumatları

### 🔐 Admin Panel (`/araz79`)
- ➕ Məhsul əlavə et/düzəlt/sil
- 📂 Kateqoriya idarəetməsi
- 📊 Sifariş idarəetməsi
- 🖼️ Şəkil yükləmə
- ⚙️ Əlaqə məlumatlarını redaktə et

## 🚀 Texnologiyalar

**Frontend:**
- ⚛️ React 19
- 🎨 Tailwind CSS
- 🧩 shadcn/ui komponentləri
- 🔄 React Router (HashRouter)
- 📡 Axios

**Backend:**
- 🐍 FastAPI (Python)
- 🍃 MongoDB (Motor - async driver)
- 🔐 CORS konfiqurasiyası
- 📤 File upload dəstəyi

## 🌐 GitHub Pages Deploy

### Sürətli Başlanğıc

**1️⃣ Kodları GitHub-a push edin:**
- Emergent platformasında **"Save to GitHub"** düyməsini klikləyin
- Repo seçin: `arazelectron/arazelectron3`
- Branch: `main` və ya `master`
- **PUSH TO GITHUB** düyməsinə basın

**2️⃣ GitHub Pages aktivləşdirin:**
- GitHub repo Settings → Pages
- Source: **gh-pages** branch seçin
- Save

**3️⃣ Deploy edin:**
```bash
cd /app/frontend
yarn deploy
```

**4️⃣ Saytınız hazırdır! 🎉**
```
https://arazelectron.github.io/arazelectron3
```

📖 **Ətraflı təlimat:** [GITHUB_PAGES_DEPLOY.md](GITHUB_PAGES_DEPLOY.md)

## 📦 Quraşdırma

### Backend
```bash
cd /app/backend
pip install -r requirements.txt
sudo supervisorctl restart backend
```

### Frontend
```bash
cd /app/frontend
yarn install
sudo supervisorctl restart frontend
```

## 📡 API Endpointləri

### Məhsullar
- `GET /api/products` - Bütün məhsullar
- `POST /api/products` - Yeni məhsul əlavə et
- `PUT /api/products/{id}` - Məhsul yenilə
- `DELETE /api/products/{id}` - Məhsul sil

### Kateqoriyalar
- `GET /api/categories` - Kateqoriya siyahısı
- `POST /api/categories` - Yeni kateqoriya

### Sifarişlər
- `GET /api/orders` - Sifarişləri gör
- `POST /api/orders` - Yeni sifariş yarat

## 🎯 Admin Panel

URL-in sonuna `/araz79` əlavə edin:
- **Local:** http://localhost:3000/#/araz79
- **GitHub Pages:** https://arazelectron.github.io/arazelectron3/#/araz79

## 🗂 Struktur

```
/app/
├── backend/           # FastAPI backend
├── frontend/          # React frontend
├── arazelectron2/     # Backup klon
├── backend_backup/    # Köhnə backend backup
└── frontend_backup/   # Köhnə frontend backup
```

## 📝 Environment Variables

**Backend (.env):**
```env
MONGO_URL="mongodb://localhost:27017"
DB_NAME="araz_elektron"
CORS_ORIGINS="*"
```

**Frontend (.env):**
```env
REACT_APP_BACKEND_URL=http://localhost:8001
```

## ⚙️ Serverləri İdarə Et

```bash
# Hər ikisini restart et
sudo supervisorctl restart all

# Backend restart
sudo supervisorctl restart backend

# Frontend restart
sudo supervisorctl restart frontend

# Status yoxla
sudo supervisorctl status

# Logları gör
tail -f /var/log/supervisor/backend.*.log
tail -f /var/log/supervisor/frontend.*.log
```

---

**🚀 Yaradılıb Emergent.sh ilə**
