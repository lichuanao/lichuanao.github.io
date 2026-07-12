# push.ps1 - 博客一键推送（已配全局代理，自动走 7890）
$blogDir = "C:\Users\lica\.qclaw\workspace-ua58rsb93veqtxl7\blog"
$env:Path += ";C:\Program Files\Git\cmd"
Set-Location $blogDir

$msg = $args[0]
if (-not $msg) { $msg = "更新博客 " + (Get-Date -Format "yyyy-MM-dd HH:mm") }

git add -A
git commit -m $msg

$maxRetry = 8
for ($i = 1; $i -le $maxRetry; $i++) {
    Write-Host "尝试推送 ($i/$maxRetry)..." -ForegroundColor Cyan
    git push
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ 推送成功！稍等 1-2 分钟访问博客" -ForegroundColor Green
        exit 0
    }
    Write-Host "⚠️ 失败，$i 秒后重试..." -ForegroundColor Yellow
    Start-Sleep -Seconds $i
}
Write-Host "❌ 多次失败：请确认代理(Clash)已开启，再重跑本脚本" -ForegroundColor Red
exit 1
