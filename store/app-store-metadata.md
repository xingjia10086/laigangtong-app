# 來港通 — App Store Connect 填寫資料

一份可直接複製貼上的清單。每項都標明了 App Store Connect 裡的對應欄位與字數上限。

---

## 基本資訊

| 欄位 | 內容 |
|---|---|
| App 名稱 (Name, ≤30) | `來港通` |
| 副標題 (Subtitle, ≤30) | `新來港人士的 App 生活指南` |
| Bundle ID | `com.mengmusanqian.hknewcomerguide` |
| SKU | `hknewcomerguide-001` |
| 主要語言 | 繁體中文（香港） |
| 版本 | 1.0 |
| 主要類別 | 參考 (Reference) |
| 次要類別 | 旅遊 (Travel) |
| 年齡分級 | 4+ |
| 價格 | 免費 |
| 上架地區 | 建議先只選「香港」，之後再擴展 |

> **類別說明**：目錄／指南型應用程式歸「參考」是最貼切的，審核時也較少被質疑定位。若之後想要更多曝光，可把「旅遊」調為主要類別。

---

## 關鍵字 (Keywords, ≤100 字元)

以逗號分隔，**不要加空格**（空格會佔用字元額度）：

```
香港,新移民,新來港,高才通,優才,受養人,單程證,IANG,來港,八達通,港鐵,搵工,租樓,智方便,香港生活,移居香港,港漂,香港攻略
```

> App 名稱與副標題裡的字已自動被索引，所以關鍵字不需要重複「來港通」「指南」。

---

## 宣傳文字 (Promotional Text, ≤170)

可隨時更改、不需重新送審，適合放時效性內容：

```
40 個香港生活必備 App，按你的來港身份分類推薦。每個連結都經人手核實，已停止服務的一律剔除。離線可用，無需註冊。
```

---

## App 描述 (Description, ≤4000)

```
初到香港，最難的往往不是語言，而是不知道該裝什麼 App。

水電煤去哪裡交？颱風天要看哪個警告才知道上不上班？超市怎樣比價？還沒有住址證明可以開戶嗎？小巴不報站又該怎麼辦？

來港通把這些問題整理成一份可以照著做的指南。


【按你的身份，給你不同的清單】

來港的方式不同，要辦的事就完全不同。選擇你的身份，應用程式會列出你落地後最先要處理的事，以及對應要裝的 App：

• 人才計劃（高才通、優才）— 身份證、開戶、搵工三件事互為前置，順序錯了會卡住
• 專才就業（已有僱主）— 重點在租住、通勤與水電煤開通
• 隨行家庭（受養人、帶小朋友）— 入學、家校系統、疫苗紀錄與慳錢工具
• 非本地學生（來港升學、IANG）— 學生八達通、二手市場、圖書館與兼職
• 定居團聚（單程證）— 政府服務、醫療登記與前線工種求職

待辦事項可以逐項勾選，進度會保留，不必怕漏掉。


【40 個 App，11 大分類】

交通出行、飲食外賣、住屋家居、購物慳錢、銀行支付、通訊辦卡、政府服務、醫療健康、求職就業、教育學校、生活資訊。

每一個 App 都寫清楚「新來港人士為什麼需要它」，而不只是一個名單。例如：
• 繳費靈 PPS — 水電煤、差餉、管理費、學費都在這裡交，首次要帶提款卡去便利店登記
• 香港出行易 — 運輸署官方，唯一整合小巴、渡輪、電車實時到站的應用程式
• yuu 與 MoneyBack — 惠康系與百佳系分屬兩個陣營，要兩個都裝才比得到價
• 我的天文台 — 八號風球與黑色暴雨直接決定上不上班、上不上學


【連結全部經過核實】

網上流傳的來港攻略很多已經過時，仍在推薦早已停止服務的應用程式。來港通收錄的每一條連結都經人手核實，確認仍在香港區 App Store 上架；已停止營運的一律剔除，不會讓你白跑一趟。


【簡單、乾淨】

• 完全免費，沒有廣告
• 不需註冊、不需登入
• 不收集任何個人資料
• 離線可以瀏覽，內容全部內置
• 可收藏常用 App，一鍵跳轉 App Store


【聲明】

來港通是獨立製作的資訊指南，與香港特別行政區政府、任何政府部門，或應用程式內提及的任何機構均沒有從屬或認可關係。所有內容僅供一般參考，實際辦理手續時請以官方公佈為準。
```

---

## 審核備註 (App Review Information → Notes)

**這一欄很重要。**目錄型應用程式最常見的拒審理由是 Guideline 4.2 (Minimum Functionality)，主動說明可以大幅降低風險：

```
Thank you for reviewing 來港通 (LaiGangTong).

WHAT THE APP IS
A Traditional Chinese reference guide for people who have just moved to
Hong Kong. It helps them work out which apps they need and in what order
to handle arrival tasks.

NO ACCOUNT NEEDED
There is no sign-in, registration, or paywall. All features are available
immediately on launch. No demo account is required.

WORKS FULLY OFFLINE
All content is bundled inside the app. Browsing, searching, saving
favourites, choosing a profile, and ticking off checklist items all work
with no network connection.

ORIGINAL EDITORIAL CONTENT (re: Guideline 4.2)
This is not a collection of links or a repackaged website. The app
contains original written guidance produced specifically for this app:

- For each of the 40 entries we wrote an explanation of why a newcomer to
  Hong Kong specifically needs it, including practical details that are
  not on the App Store listing (for example: PPS requires an in-person
  first-time registration at a convenience store terminal; Hong Kong's
  two supermarket loyalty schemes are split across rival chains so you
  need both to compare prices).
- Five arrival profiles (talent scheme, employment visa, dependant,
  non-local student, one-way permit) each carry an original ordered
  to-do list explaining task dependencies — for example that you cannot
  open most bank accounts before receiving your HKID, which is why a
  mobile-only virtual bank is suggested as a bridge.
- Checklist progress and favourites are stored locally and persist.
- Every App Store link was manually verified against the Hong Kong
  storefront. Apps that have shut down (HKTaxi, which ceased service in
  April 2025, and Deliveroo, which exited Hong Kong) were deliberately
  excluded even though many published guides still recommend them.

NO AFFILIATION CLAIMED
The app references government and commercial services by name only, for
identification. It uses no third-party logos, icons, or trademarks. The
app description, the in-app content, the support page, and the privacy
policy all state explicitly that it is independent and not affiliated
with or endorsed by the Hong Kong SAR Government or any organisation
mentioned. The icon deliberately avoids the bauhinia emblem for the same
reason.

PRIVACY
No data of any kind is collected, transmitted, or shared. There are no
analytics, no advertising, and no third-party SDKs.

Contact: hi@mengmusanqian.com.cn
```

---

## App 私隱 (App Privacy)

在 App Store Connect → App 私隱，選擇：

- **Data Collection**: `No, we do not collect data from this app`

選了這一項之後不會再有後續問題。這是誠實的答案——應用程式沒有網絡請求、沒有分析工具、沒有第三方 SDK。

隱私政策網址（必填）與支援網址（必填）見下方部署說明。

---

## 其他必答項

| 項目 | 答案 |
|---|---|
| 出口合規 (Export Compliance) | 不會被問。`ITSAppUsesNonExemptEncryption: false` 已寫入 Info.plist |
| 內容版權 | 選「不包含、不顯示或不存取第三方內容」 |
| 廣告識別碼 (IDFA) | 否 |
| 年齡分級問卷 | 全部選「無」／「從不」，結果為 4+ |
| 登入資料 | 勾選 `Sign-in not required` |

---

## 截圖

已產出 4 張 6.9 吋（1320 × 2868）截圖，位於 `store/screenshots/`：

| 檔案 | 內容 |
|---|---|
| `1_picker.png` | 身份選擇頁 |
| `2_talent.png` | 人才計劃的待辦清單與優先安裝 App |
| `3_directory.png` | 全部指南，40 個 App 分 11 類 |
| `4_favorites.png` | 我的收藏 |

已轉為 RGB、去除 alpha 通道（App Store Connect 不接受帶透明通道的截圖）。

> 6.9 吋一組截圖即可覆蓋所有 iPhone 尺寸，不需要另外準備 6.5 吋或 5.5 吋。

---

## 網頁部署

`store/privacy-policy.html` 與 `store/support.html` 需要有公開網址才能填進 App Store Connect。
最快的做法是 GitHub Pages：新建一個公開 repo，把兩個檔案放進去，在 Settings → Pages 啟用，網址會是：

- 私隱政策：`https://<用戶名>.github.io/<repo>/privacy-policy.html`
- 支援網址：`https://<用戶名>.github.io/<repo>/support.html`

或者放到 mengmusanqian.com.cn 自己的網站上。兩個網址都必須能公開打開，審核員會實際點進去看。
