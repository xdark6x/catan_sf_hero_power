# Sci-Fi Hero Powers for Catan - Voting Platform

A community voting platform for sci-fi themed hero powers for Catan, featuring real-time vote tracking and duplicate prevention.

## 🚀 Live Demo

**[Vote Now: https://xdark6x.github.io/catan_sf_hero_power/](https://xdark6x.github.io/catan_sf_hero_power/)**

## ✨ Features

- 🗳️ **Community Voting**: Vote on 40+ unique sci-fi hero powers
- 🎨 **Dual Categories**: Separate voting for image quality and rule design
- 🔒 **Duplicate Prevention**: One vote per category per session
- 📊 **Real-time Statistics**: Live vote counts and user statistics
- 📱 **Mobile Responsive**: Works perfectly on all devices
- 🎮 **Sci-Fi Themed**: Immersive design matching the theme
- ⚡ **Real-time Updates**: Powered by Supabase for instant results

## 🛠️ Technical Stack

- **Frontend**: Vanilla HTML/CSS/JavaScript
- **Backend**: Supabase (PostgreSQL)
- **Hosting**: GitHub Pages
- **Styling**: Custom CSS with gradients and animations

## 📋 Setup Instructions

### 1. GitHub Pages Deployment

1. **Upload Files**: Ensure `index.html` is in the repository root
2. **Enable Pages**: Go to Settings > Pages in your GitHub repository
3. **Configure Source**: 
   - Source: "Deploy from a branch"
   - Branch: `main`
   - Folder: `/ (root)`
4. **Wait**: GitHub will build and deploy (1-2 minutes)
5. **Access**: Your site will be available at `https://<username>.github.io/<repository>/`

### 2. Supabase Configuration

1. **Create Project**: Sign up at [supabase.com](https://supabase.com) and create a new project
2. **Run SQL Setup**: Copy and run the contents of `supabase_setup.sql` in your Supabase SQL Editor
3. **Get Credentials**: 
   - Go to Settings > API
   - Copy your Project URL and anon public key
   - Update `index.html` with your credentials (if different)

### 3. Verification Steps

1. **Test Voting**: Open your live site and cast a few votes
2. **Check Database**: Go to Supabase > Table Editor > votes to see new entries
3. **Test Prevention**: Try voting twice for the same power (should be blocked)
4. **Mobile Test**: Verify the site works on mobile devices

## 📊 Database Schema

```sql
CREATE TABLE votes (
    id UUID PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE,
    power_name TEXT NOT NULL,
    vote_type TEXT CHECK (vote_type IN ('image', 'rules')),
    vote_value INTEGER CHECK (vote_value IN (-1, 1)),
    session_id TEXT NOT NULL
);
```

## 🎮 Hero Powers Included

40 unique sci-fi themed powers including:
- Quantum Harvester
- Temporal Flux  
- Nanoswarm Constructor
- Asteroid Miner
- Warp Conduit
- And 35 more...

Each power features:
- Custom AI-generated artwork
- Balanced game mechanics
- Thematic sci-fi descriptions

## 🔧 Customization

### Adding New Powers
1. Add entries to the `powers` array in `index.html`
2. Ensure image URLs are publicly accessible
3. Follow the existing format: `{name, image, description}`

### Styling Changes
- Modern CSS with custom properties
- Sci-fi color scheme (blues, purples, teals)
- Gradient backgrounds and hover effects
- Mobile-first responsive design

### Vote Prevention Options
- Session-based (current): Uses localStorage + session IDs
- IP-based: Would require server-side implementation
- User accounts: Would require authentication system

## 📈 Analytics & Monitoring

The platform tracks:
- Total votes per category
- Individual power scores
- User vote counts per session
- Vote submission timestamps

## 🔒 Security Features

- Row Level Security (RLS) enabled
- Anonymous user policies
- Input validation and sanitization
- XSS protection via proper escaping
- Session-based duplicate prevention

## 🚀 Performance

- Lightweight vanilla JavaScript
- Optimized image loading with fallbacks
- Efficient database queries with indexes
- Responsive grid layout
- Smooth animations and transitions

## 📱 Browser Support

- ✅ Chrome/Chromium (recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ Mobile browsers

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Test thoroughly on multiple devices
4. Submit a pull request

## 📄 License

Open source - feel free to use and modify for your own Catan variants!

---

**Happy Voting! May the best powers win! 🎲✨**