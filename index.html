<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EGO Menu</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: transparent;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .menu-container {
            width: 400px;
            background: #1a1a1a;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.8);
            border: 3px solid transparent;
            background-image: 
                linear-gradient(#1a1a1a, #1a1a1a),
                linear-gradient(180deg, #3b82f6 0%, #1e40af 50%, #1e3a8a 100%);
            background-origin: border-box;
            background-clip: padding-box, border-box;
        }

        .header {
            background: linear-gradient(180deg, #1e3a5f 0%, #152840 100%);
            padding: 50px 20px;
            text-align: center;
            position: relative;
            border-bottom: 1px solid #2a2a2a;
        }

        .logo {
            font-size: 80px;
            font-weight: 900;
            letter-spacing: 8px;
            color: #60a5fa;
            text-shadow: 
                0 0 20px rgba(96, 165, 250, 0.8),
                0 0 40px rgba(96, 165, 250, 0.6),
                0 0 60px rgba(96, 165, 250, 0.4),
                0 0 80px rgba(96, 165, 250, 0.3);
            filter: brightness(1.2);
            font-family: 'Arial Black', sans-serif;
        }

        .menu-title {
            background: #0a0a0a;
            padding: 10px 20px;
            font-size: 13px;
            color: #666666;
            border-bottom: 1px solid #2a2a2a;
            text-transform: capitalize;
        }

        .menu-list {
            list-style: none;
            background: #1a1a1a;
        }

        .menu-item {
            border-bottom: 1px solid #2a2a2a;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .menu-item:hover {
            background: #252525;
        }

        .menu-item.active {
            background: linear-gradient(90deg, #3b82f6 0%, #2563eb 100%);
        }

        .menu-item a {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 20px;
            color: #e0e0e0;
            text-decoration: none;
            font-size: 14px;
        }

        .arrow {
            color: #666666;
            font-size: 20px;
        }

        .menu-item.active .arrow {
            color: #ffffff;
        }

        .footer {
            background: #0a0a0a;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #2a2a2a;
        }

        .footer-left {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #999999;
            font-size: 12px;
        }

        .status-indicator {
            width: 6px;
            height: 6px;
            background: #3b82f6;
            border-radius: 50%;
            box-shadow: 0 0 8px #3b82f6;
        }

        .footer-right {
            color: #666666;
            font-size: 12px;
        }

        .separator {
            color: #444444;
        }
    </style>
</head>
<body>
    <div class="menu-container">
        <div class="header">
            <div class="logo">EGO</div>
        </div>

        <div class="menu-title">Main Menu</div>

        <ul class="menu-list" id="menuList">
            <li class="menu-item active"><a href="#"><span>Player</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Server</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Weapon</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Combat</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Vehicle</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Visual</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Miscellaneous</span><span class="arrow">›</span></a></li>
            <li class="menu-item"><a href="#"><span>Settings</span><span class="arrow">›</span></a></li>
        </ul>

        <div class="footer">
            <div class="footer-left">
                <div class="status-indicator"></div>
                <span>123456</span>
                <span class="separator">|</span>
                <span>3d ago</span>
            </div>
            <div class="footer-right">1/9</div>
        </div>
    </div>

    <script>
        const items = document.querySelectorAll('.menu-item');
        let currentIndex = 0;

        function updateActive() {
            items.forEach((item, index) => {
                item.classList.toggle('active', index === currentIndex);
            });
        }

        // استقبال الأزرار من سكربت Lua
        window.addEventListener('message', (event) => {
            const data = event.data;
            if (!data || !data.action) return;

            if (data.action === "keyPress") {
                const key = data.key.toUpperCase();

                switch (key) {
                    case "ARROWUP":
                        currentIndex = (currentIndex - 1 + items.length) % items.length;
                        updateActive();
                        break;
                    case "ARROWDOWN":
                        currentIndex = (currentIndex + 1) % items.length;
                        updateActive();
                        break;
                    case "ENTER":
                        const selected = items[currentIndex].innerText.trim();
                        console.log(`✅ Selected: ${selected}`);
                        break;
                    case "BACKSPACE":
                        console.log("⌫ Backspace pressed - delete character");
                        break;
                    case "E":
                        console.log("🔹 Pressed E");
                        break;
                    case "Q":
                        console.log("🔹 Pressed Q");
                        break;
                    default:
                        console.log(`⚙️ Unknown key: ${key}`);
                }
            }
        });

        updateActive();
    </script>
</body>
</html>
