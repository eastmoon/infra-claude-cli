# Claude Code with CLI

本專案依據 [Claude Code - Quickstart](https://code.claude.com/docs/en/quickstart) 介紹，建立 Claude Code 操作環境並實務測試。

Claude Code 需使用 Claude 帳號，且訂閱方案需為 Pro、Max、Teams 或 Enterprise 方案或 API 用量計費。

+ 帳號若採用訂閱方案，Claude Code 於 [Claude App](https://claude.com/download) 內使用
	- [Use Claude Code Desktop](https://code.claude.com/docs/en/desktop)
+ 帳號若採用 API 用量計費，Claude Code 可使用 Console
	- 本專案使用 Console 方式執行 Claude Code

## 指令

使用 [devops-cli-framework](https://github.com/eastmoon/devops-cli-framework) 設計專案指令：

+ 啟動開發環境 ```do.bat dev```
+ 執行單句提示 ```do.bat prompt [ask question]```
	- 例如：```do.bat prompt Say hello and tell me what you can help with```
+ 執行計畫檔案 ```do.bat plan [markdown file in 'plan' folder]```
	- 例如：```do.bat plan demo.md```，demo.md 檔案在 [plan](./plan) 目錄中

執行上述指令需於 [devops-cli-framework](https://github.com/eastmoon/devops-cli-framework) 專案執行 ```do pack```，封裝必要映像檔。

## 環境容器

實務完成的容器映像檔參考 [Dockerfile](./conf/docker/copilot-cli)

## 登入帳號

由於開發環境使用 Docker 並啟動單一容器執行 Claude Console，需採用 Claude API 用量計費方式執行。

申請權杖前，用戶需先前儲值確保 API 擁有調用權限：

1. 前往 [Claude Platforms - Billing](https://platform.claude.com/settings/billing)。
2. 選擇 "Buy credits"。
3. 若開啟 Auto-reload（自動補充），當餘額低於某個門檻時，自動購入指定金額的 Credits，避免服務中斷；預設此設定為關閉。

確認用戶儲值完畢，並於 [Limits](https://platform.claude.com/settings/limits) 檢查 Rate limits 為 Tier 1 以上；由於 Claude 憑證快取卡住異常，會出現儲值前申請憑證執行仍會有餘額不足訊息，因此建議先完成儲值。

確認餘額充足後，用戶如下方式產生 API 權杖：

1. 前往 [Claude Platforms - API Keys](https://platform.claude.com/settings/keys)。
2. 選擇 "Create an API key"。
3. 複製 API Key 並妥善保存（這是免費的，但有每分鐘調用次數限制）。

取得權杖後，於本專案執行如下操作：

1. 帳號申請個人存取權杖 ( Personal Access Token、PAT )
2. 將權杖複製至本專案檔案 ```./conf/devops/keys/ANTHROPIC_API_KEY```
3. 執行 ```do.bat dev``` 啟動環境，啟動程序會檢查 ANTHROPIC_API_KEY 檔案並設定相應環境變數給容器
4. 進入容器後，執行 ```claude -p "Say hello and tell me what you can help with"``` 執行簡單詢問是否可以執行。

依據實際測試，執行 ```do prompt``` 或 ```do plan``` 執行費用都是 0.03 USD，若採用最低 5 USD 儲值，僅能執行 166 次；其中最大消費在於 Prompt Cache。

若採用 ```export DISABLE_PROMPT_CACHING=1``` 關閉 Prompt Cache，則會出現 Prompt input，單次執行費用約為 0.02 USD。
