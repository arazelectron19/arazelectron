# 🚂 RAILWAY DEPLOYMENT INSTRUCTIONS

Follow these steps to deploy your backend to Railway.

---

## ✅ Prerequisites

1. **GitHub Account** - Your code should be pushed to GitHub
2. **Railway Account** - Sign up at https://railway.app (free, use GitHub login)
3. **MongoDB Atlas** - Free database at https://mongodb.com/cloud/atlas

---

## 📋 STEP 1: MongoDB Atlas Setup (5 minutes)

### 1.1 Create Account
- Go to: https://mongodb.com/cloud/atlas/register
- Sign up with Google (easiest)

### 1.2 Create Free Cluster
- Click "**Build a Database**"
- Select **M0 (Free)** tier
- Region: **AWS / Frankfurt (eu-central-1)** (closest to you)
- Cluster Name: `araz-elektron`
- Click **Create Cluster** (takes 2-3 minutes)

### 1.3 Create Database User
- Left menu: **Database Access**
- Click "**Add New Database User**"
- Username: `araz_user`
- Password: **Generate strong password** (SAVE THIS!)
- Database User Privileges: **Read and write to any database**
- Click **Add User**

### 1.4 Allow Network Access
- Left menu: **Network Access**
- Click "**Add IP Address**"
- Click "**Allow Access from Anywhere**" (0.0.0.0/0)
- Click **Confirm**

### 1.5 Get Connection String
- Left menu: **Database** → **Connect**
- Click "**Connect your application**"
- Driver: **Python**, Version: **3.11 or later**
- Copy the connection string:
```
mongodb+srv://araz_user:<password>@araz-elektron.xxxxx.mongodb.net/?retryWrites=true&w=majority
```
- **IMPORTANT:** Replace `<password>` with your actual password!

✅ **Save this connection string** - you'll need it for Railway!

---

## 🚂 STEP 2: Railway Deployment (3 minutes)

### 2.1 Login to Railway
- Go to: https://railway.app
- Click "**Login with GitHub**"
- Authorize Railway

### 2.2 Create New Project
- Click "**New Project**"
- Select "**Deploy from GitHub repo**"
- Select repository: `arazelectron19/arazelectron`
- Click "**Deploy Now**"

### 2.3 Configure Service
Railway will detect your backend. If it doesn't:
- Click "**Settings**"
- **Root Directory**: `/backend`
- **Start Command**: `uvicorn server:app --host 0.0.0.0 --port $PORT`
- Click "**Save**"

### 2.4 Add Environment Variables

Click on your service → **Variables** tab → Add these:

```env
MONGO_URL=mongodb+srv://araz_user:YOUR_PASSWORD@araz-elektron.xxxxx.mongodb.net/?retryWrites=true&w=majority

DB_NAME=araz_elektron

CORS_ORIGINS=https://arazelectron19.github.io,http://localhost:3000

SECRET_KEY=araz-elektron-secret-2024-production-key-change-me

PORT=8000
```

**IMPORTANT:** 
- Replace `YOUR_PASSWORD` in MONGO_URL with your actual MongoDB password
- Replace SECRET_KEY with a strong random key

Click "**Add**" for each variable.

### 2.5 Deploy
- Railway will automatically deploy
- Wait 2-3 minutes for deployment

### 2.6 Get Public URL
- Click on your service
- Go to **Settings** → **Networking**
- Click "**Generate Domain**"
- Railway will create a public URL like:
```
araz-elektron-backend.up.railway.app
```

✅ **COPY THIS URL** - this is your backend URL!

---

## 🧪 STEP 3: Test Your Backend

Open in browser:
```
https://araz-elektron-backend.up.railway.app/api/
```

You should see:
```json
{"message":"Araz Elektron - API işləyir!"}
```

If you see this, **your backend is working!** ✅

### Initialize Sample Data
```bash
curl -X POST https://araz-elektron-backend.up.railway.app/api/initialize-data
```

---

## 📝 STEP 4: Give Me Your Backend URL

Once deployed, **copy your Railway URL** and give it to me in this format:

```
https://your-app-name.up.railway.app
```

I will then:
1. ✅ Update frontend to use your backend URL
2. ✅ Rebuild frontend with correct paths
3. ✅ Export to /docs folder
4. ✅ Push to GitHub

---

## 🐛 Troubleshooting

### Backend not starting?
- Check **Deployments** → **View Logs**
- Look for errors

### "ModuleNotFoundError"?
- Ensure `requirements.txt` is correct
- Railway should auto-install dependencies

### "Connection refused" or "Can't connect to MongoDB"?
- Check MONGO_URL is correct
- Check MongoDB Atlas Network Access (0.0.0.0/0)
- Verify database user password

### CORS errors on frontend?
- Verify CORS_ORIGINS includes:
  - `https://arazelectron19.github.io`
  - NO trailing slash!

---

## 💰 Costs

- **MongoDB Atlas M0**: FREE (512MB storage)
- **Railway**: FREE ($5 credit/month, ~500 hours)
- **GitHub Pages**: FREE

**Total: $0/month** 🎉

---

## 🔄 Future Updates

After code changes:

1. **Push to GitHub**: "Save to GitHub" button
2. **Railway auto-deploys**: Automatic in 1-2 minutes
3. **Done!** No manual steps needed

---

## ✅ Ready?

1. ✅ MongoDB Atlas setup
2. ✅ Railway deployment
3. ✅ Test backend API
4. ✅ Copy your Railway URL
5. ✅ Give me the URL → I'll update frontend

---

**Let me know your Railway URL and I'll complete the deployment!** 🚀
