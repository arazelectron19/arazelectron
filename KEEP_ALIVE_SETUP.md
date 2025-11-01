# 🔄 Keep-Alive Setup - Railway Backend

Your backend now has automatic keep-alive to prevent Railway from sleeping! ☕

---

## ✅ What's Been Added

### 1. **Health Endpoint** `/api/health`
```javascript
GET /api/health

Response:
{
  "status": "healthy",
  "service": "araz-elektron-backend",
  "timestamp": "2025-11-01T06:38:30.774794"
}
```

### 2. **GitHub Actions Keep-Alive**
- File: `.github/workflows/keepalive.yml`
- Runs: Every 10 minutes
- Action: Pings `/api/health` endpoint
- Prevents: Railway server from sleeping

### 3. **Frontend Retry Logic**
- Exponential backoff: 1s → 2s → 4s
- Max retries: 3 + 2 (total 5 attempts)
- User message: "☕ Server oyaq olur..."
- Timeout: 10 seconds per request

---

## 🚀 Setup Instructions

### Step 1: Deploy Backend to Railway

1. Push to GitHub (code is already committed)
2. Deploy backend on Railway
3. Get your Railway URL: `https://your-app.up.railway.app`

### Step 2: Configure GitHub Actions

After deployment, update the workflow:

**Option A: Use GitHub Secrets (Recommended)**

1. Go to GitHub repo → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `BACKEND_URL`
4. Value: `https://your-app.up.railway.app` (your actual Railway URL)
5. Click "Add secret"

**Option B: Edit Workflow File**

Edit `.github/workflows/keepalive.yml`:
```yaml
BACKEND_URL="https://your-app.up.railway.app"  # Replace with your URL
```

### Step 3: Enable Workflow

1. Go to GitHub repo → Actions tab
2. If disabled, click "Enable workflows"
3. The keep-alive will run automatically every 10 minutes

### Step 4: Manual Test

You can manually trigger the workflow:
1. Go to Actions → Keep Railway Backend Alive
2. Click "Run workflow"
3. Check the logs to verify it's working

---

## 🔍 How It Works

### Railway Sleep Behavior
- Railway free tier puts inactive services to sleep after ~10 minutes
- First request after sleep takes 10-30 seconds to wake up
- Keep-alive prevents this by pinging every 10 minutes

### Frontend Retry Flow
```
1. User visits site
2. Frontend tries to fetch data
3. If fails (server sleeping):
   ├─ Show: "☕ Server oyaq olur..."
   ├─ Retry #1: Wait 1s, try again
   ├─ Retry #2: Wait 2s, try again
   ├─ Retry #3: Wait 4s, try again
   └─ If still fails: Wait 5s, retry 2 more times
4. Success: Load products normally
```

### GitHub Actions Schedule
```yaml
schedule:
  - cron: '*/10 * * * *'  # Every 10 minutes
```

This runs 144 times per day (24 hours × 6 times/hour).

---

## 📊 Monitoring

### Check if Keep-Alive is Working

**Method 1: GitHub Actions Logs**
1. Go to GitHub → Actions
2. Check recent workflow runs
3. Look for ✅ "Backend is alive!" message

**Method 2: Test Health Endpoint**
```bash
curl https://your-app.up.railway.app/api/health
```

Expected response:
```json
{
  "status": "healthy",
  "service": "araz-elektron-backend",
  "timestamp": "2025-11-01T06:38:30.774794"
}
```

**Method 3: Frontend Console**
- Open browser DevTools (F12)
- Go to Console tab
- Look for retry messages: "Retry 1/3 after 1000ms..."

---

## 🎯 Benefits

### Without Keep-Alive:
- ❌ Server sleeps after 10 minutes
- ❌ First user waits 20-30 seconds
- ❌ Poor user experience

### With Keep-Alive:
- ✅ Server stays awake 24/7
- ✅ Fast response times
- ✅ Better user experience
- ✅ Automatic retries if needed

---

## 💰 Cost Impact

**Railway Free Tier:**
- $5 credit per month
- ~500 hours free
- Keep-alive uses minimal resources

**Calculation:**
- GitHub Actions pings: FREE (unlimited for public repos)
- Server CPU usage: <1% per ping
- Network bandwidth: <1KB per ping

**Result:** Keep-alive has ZERO additional cost! 🎉

---

## 🐛 Troubleshooting

### Workflow not running?
1. Check: GitHub repo → Actions → Is enabled?
2. Check: Workflow file syntax (YAML indentation)
3. Check: GitHub Actions are enabled for your account

### Server still sleeping?
1. Verify: `BACKEND_URL` secret is set correctly
2. Check: Railway logs for incoming requests
3. Test: Manually run workflow and check logs

### Frontend shows "Server waking up" for too long?
1. Check: Backend is actually deployed and running
2. Verify: CORS settings allow your frontend domain
3. Test: Health endpoint directly in browser

---

## 🔧 Advanced Configuration

### Change Ping Frequency

Edit `.github/workflows/keepalive.yml`:
```yaml
# Every 5 minutes (more aggressive)
- cron: '*/5 * * * *'

# Every 15 minutes (less frequent)
- cron: '*/15 * * * *'

# Every hour (minimal)
- cron: '0 * * * *'
```

### Adjust Frontend Retry Settings

Edit `HomePage.js`:
```javascript
// More retries
const productsResponse = await fetchWithRetry(`${API}/products`, 5, 1000);

// Longer delays
const productsResponse = await fetchWithRetry(`${API}/products`, 3, 2000);

// Shorter timeout
const response = await axios.get(url, { timeout: 5000 });
```

---

## 📝 Files Modified

```
✅ /app/backend/server.py
   - Added /api/health endpoint

✅ /app/.github/workflows/keepalive.yml
   - New GitHub Actions workflow

✅ /app/frontend/src/HomePage.js
   - Added fetchWithRetry() helper
   - Added exponential backoff logic
   - Added "Server waking up" message
   - Added serverWaking state

✅ /app/docs/
   - Rebuilt with new retry logic
```

---

## 🎉 You're All Set!

Once you:
1. ✅ Push to GitHub
2. ✅ Deploy backend to Railway
3. ✅ Set `BACKEND_URL` secret in GitHub
4. ✅ Deploy frontend to GitHub Pages

Your backend will stay alive 24/7! 🚀

---

**Questions?** Check the logs or ask in chat! 💬
