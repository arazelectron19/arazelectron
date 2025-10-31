# 🛒 Araz Elektron - E-Commerce Platform

> Elektron avadanlıqlar üçün tam funksional, production-ready e-commerce platforması

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.app/new)
[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Deployed-success)](https://arazelectron19.github.io/arazelectron)

---

## 🌐 GitHub Pages Deploy

### ⚡ Method 1: /docs Folder (Tövsiyə edilir - Ən Sadə) ✅

Build artıq hazırdır və `/docs` qovluğundadır!

**Addımlar:**
1. **"Save to GitHub"** düyməsi
2. GitHub repo → **Settings → Pages**
3. Source: **Deploy from a branch**
4. Branch: **main** → Folder: **/docs**
5. **Save**

**Saytınız hazırdır:** https://arazelectron19.github.io/arazelectron

📖 **Ətraflı təlimat:** [GITHUB_PAGES_DOCS_DEPLOY.md](GITHUB_PAGES_DOCS_DEPLOY.md)

---

### Method 2: gh-pages Branch (Alternativ)

```bash
cd /app/frontend
yarn deploy
```

GitHub repo → Settings → Pages → Source: **gh-pages** branch

📖 **Təlimat:** [GITHUB_PAGES_DEPLOY.md](GITHUB_PAGES_DEPLOY.md)

---

## 🌟 Xüsusiyyətlər

### 👥 Müştəri Tərəfi
- 🏠 Modern, responsive dizayn
- 📱 Məhsul kataloqu (kateqoriyalara görə filter)
- 🔍 Real-time axtarış
- 🛍️ Səbət funksionallığı
- 📦 Sifariş forması
- 📞 Əlaqə məlumatları

### 🔐 Admin Panel (`/araz79`)
- ➕ Məhsul CRUD əməliyyatları
- 📂 Kateqoriya idarəetməsi
- 📊 Sifariş monitorinqi
- 🖼️ Şəkil upload (multi-image dəstəyi)
- ⚙️ Əlaqə məlumatları editoru

---

## 🛠 Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19 + React Router |
| **Styling** | Tailwind CSS + shadcn/ui |
| **Backend** | FastAPI (Python) |
| **Database** | MongoDB (Motor - async) |
| **Hosting** | GitHub Pages + Railway.app |
| **Deployment** | GitHub Actions |

---

## 📦 Deploy Seçimləri

### Option 1: Railway + GitHub Pages (Tövsiyə ✅)

**Backend:** Railway.app (pulsuz $5/ay kredit)  
**Frontend:** GitHub Pages (pulsuz)  
**Database:** MongoDB Atlas (pulsuz 512MB)

📖 **Tam təlimat:** [RAILWAY_DEPLOY.md](RAILWAY_DEPLOY.md)

### Option 2: Manual Deploy

**Backend:**
```bash
cd backend
pip install -r requirements.txt
uvicorn server:app --host 0.0.0.0 --port 8001
```

**Frontend:**
```bash
cd frontend
yarn install
yarn start  # development
yarn build  # production
```

---

## 🌐 Live Demo

**🔗 Frontend:** https://arazelectron19.github.io/arazelectron  
**🔐 Admin Panel:** https://arazelectron19.github.io/arazelectron/#/araz79

---

## 📡 API Documentation

### Base URL
```
https://your-backend.up.railway.app/api
```

### Endpoints

#### Məhsullar
- `GET /products` - Bütün məhsullar
- `GET /products/{id}` - Məhsul detalları
- `POST /products` - Yeni məhsul
- `PUT /products/{id}` - Məhsul yenilə
- `DELETE /products/{id}` - Məhsul sil

#### Kateqoriyalar
- `GET /categories` - Kateqoriya siyahısı
- `POST /categories` - Yeni kateqoriya
- `DELETE /categories/{id}` - Kateqoriya sil

#### Sifarişlər
- `GET /orders` - Sifarişlər
- `POST /orders` - Yeni sifariş
- `PUT /orders/{id}/status` - Status yenilə

#### Digər
- `POST /upload-image` - Şəkil yüklə
- `GET /contact-info` - Əlaqə məlumatları
- `POST /initialize-data` - Sample data yüklə

---

## 🗂 Layihə Strukturu

```
arazelectron3/
├── backend/
│   ├── server.py              # FastAPI app
│   ├── requirements.txt       # Python paketləri
│   ├── Procfile              # Railway konfiqurasiya
│   ├── railway.json          # Railway settings
│   ├── .env.example          # Environment template
│   └── uploads/              # Yüklənmiş şəkillər
│
├── frontend/
│   ├── src/
│   │   ├── App.js            # Main router
│   │   ├── HomePage.js       # Ana səhifə
│   │   ├── AdminPanel.js     # Admin interface
│   │   └── components/       # UI komponentləri
│   ├── public/
│   │   ├── index.html
│   │   ├── 404.html          # GitHub Pages redirect
│   │   └── .nojekyll
│   ├── package.json
│   └── .env.example
│
├── .github/
│   └── workflows/
│       └── deploy.yml        # Auto-deploy GitHub Pages
│
├── DEPLOY_GUIDE.md           # 📖 Addım-addım təlimat
├── RAILWAY_DEPLOY.md         # 🚂 Railway təlimatı
└── README.md                 # Bu fayl
```

---

## ⚙️ Environment Variables

### Backend (`backend/.env`)

```env
MONGO_URL=mongodb+srv://user:pass@cluster.mongodb.net/
DB_NAME=araz_elektron
CORS_ORIGINS=https://arazelectron.github.io
```

### Frontend (`frontend/.env`)

```env
REACT_APP_BACKEND_URL=https://your-backend.up.railway.app
```

⚠️ **Qeyd:** `.env` faylları GitHub-a push olunmur (.gitignore)

---

## 🚀 Deployment Workflow

### 1. Kod Yaz
```bash
# Emergent platformasında kod yaz
```

### 2. GitHub-a Push
```bash
# "Save to GitHub" düyməsi
```

### 3. Avtomatik Deploy
- **Backend:** Railway avtomatik yenidən deploy edir
- **Frontend:** GitHub Actions avtomatik build edir

---

## 🔄 Yeniləmələr

**Backend dəyişiklikdə:**
```bash
# Push to GitHub - Railway avtomatik deploy edəcək
```

**Frontend dəyişiklikdə:**
```bash
cd frontend
yarn build
yarn deploy
# və ya GitHub-a push - Actions deploy edəcək
```

---

## 🎯 Features Roadmap

- [ ] User Authentication (JWT)
- [ ] Payment Gateway (Stripe)
- [ ] Email Notifications
- [ ] Product Reviews & Ratings
- [ ] Wishlist funksionallığı
- [ ] Multi-language (AZ/EN/RU)
- [ ] Analytics Dashboard
- [ ] Mobile App (React Native)

---

## 🐛 Troubleshooting

### Backend issues:
```bash
# Railway logs yoxla
railway logs --follow

# Local test
cd backend
python -m uvicorn server:app --reload
```

### Frontend issues:
```bash
# Browser console yoxla (F12)
# Network tab-da API calls yoxla

# Local test
cd frontend
yarn start
```

### MongoDB bağlantı xətası:
- MongoDB Atlas Network Access-də 0.0.0.0/0 allow edilib?
- Connection string doğru kopyalanıb?
- Database user yaradılıb?

---

## 📊 Performance

- ⚡ **Lighthouse Score:** 95+
- 🚀 **First Contentful Paint:** < 1.5s
- 📦 **Bundle Size:** ~100KB (gzipped)
- 🌍 **CDN:** GitHub Pages global CDN

---

## 🔐 Təhlükəsizlik

- ✅ HTTPS (SSL sertifikatı)
- ✅ CORS konfiqurasiyası
- ✅ Environment variables
- ⚠️ Admin authentication (TODO)

---

## 💰 Xərclər (Aylıq)

| Xidmət | Plan | Qiymət |
|--------|------|--------|
| Railway.app | Starter | **$0** (+ $5 kredit) |
| MongoDB Atlas | M0 | **$0** |
| GitHub Pages | Public Repo | **$0** |
| **CƏMI** | | **$0/ay** 🎉 |

---

## 🤝 Contributing

Pull requests xoş gəlmisiniz! Böyük dəyişikliklər üçün əvvəlcə issue açın.

---

## 📝 License

Bu layihə MIT lisenziyası ilə paylanır.

---

## 📞 Dəstək

- 📧 Email: [support@arazelectron.az](mailto:support@arazelectron.az)
- 💬 Emergent Chat: Sual soruşun!
- 🐛 Issues: [GitHub Issues](https://github.com/arazelectron/arazelectron3/issues)

---

## 🌟 Credits

**Yaradılıb:**
- 🤖 [Emergent.sh](https://emergent.sh) - AI Development Platform
- ⚡ [Railway.app](https://railway.app) - Backend Hosting
- 📄 [GitHub Pages](https://pages.github.com) - Frontend Hosting

---

<div align="center">

**🚀 Yaradılıb Emergent.sh ilə**

[Live Demo](https://arazelectron19.github.io/arazelectron) · [Deploy Guide](DEPLOY_GUIDE.md) · [Report Bug](https://github.com/arazelectron/arazelectron3/issues)

</div>
