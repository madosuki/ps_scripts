$bucket_path = $args[0]

$checkver_path = "$bucket_path\bin\checkver.ps1"

if (Test-Path $checkver_path) {
   $result =  &$checkver_path 6>&1

   Write-Output $result

   if ($result.Contains("available")) {
    Invoke-Expression $checkver_path * -u
   }
}